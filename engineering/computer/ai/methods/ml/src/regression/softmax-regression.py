from __future__ import annotations

import torch
import torchvision
import os

from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence
from matplotlib import pyplot as plt
from torch import Tensor
from torch.utils import data
from torchvision import transforms

os.environ.setdefault("MPLCONFIGDIR", "/tmp/matplotlib")

DATALOADER_WORKERS = 4
BATCH_SIZE = 256
DIMENSION_INPUTS = 28 * 28
DIMENSION_OUTPUT = 10
LEARNING_RATE = 0.1
EPOCHS = 10

Batch = tuple[Tensor, Tensor]
DataLoader = data.DataLoader[Batch]


@dataclass(frozen=True)
class SoftmaxRegressionParams:
    weights: Tensor
    bias: Tensor

@dataclass(frozen=True)
class EpochMetrics:
    loss: float
    accuracy: float

def get_fashion_mnist_labels(indices: Sequence[int]) -> list[str]:
    labels = [
        "t-shirt",
        "trouser",
        "pullover",
        "dress",
        "coat",
        "sandal",
        "shirt",
        "sneaker",
        "bag",
        "ankle boot",
    ]
    return [labels[int(i)] for i in indices]

def load_data_fashion_mnist(batch_size: int = BATCH_SIZE) -> tuple[DataLoader, DataLoader]:
    trans = transforms.ToTensor()
    mnist_train = torchvision.datasets.FashionMNIST(
        root="assets/data",
        train=True,
        transform=trans,
        download=True,
    )
    mnist_test = torchvision.datasets.FashionMNIST(
        root="assets/data",
        train=False,
        transform=trans,
        download=True,
    )

    print(
        "[+] Loaded Fashion-MNIST:",
        len(mnist_train),
        "training samples and",
        len(mnist_test),
        "test samples",
    )

    train_iter: DataLoader = data.DataLoader(
        mnist_train,
        batch_size=batch_size,
        shuffle=True,
        num_workers=DATALOADER_WORKERS,
    )
    test_iter: DataLoader = data.DataLoader(
        mnist_test,
        batch_size=batch_size,
        shuffle=False,
        num_workers=DATALOADER_WORKERS,
    )
    return train_iter, test_iter

def init_params(device: torch.device) -> SoftmaxRegressionParams:
    weights = torch.normal(
        0,
        0.01,
        size=(DIMENSION_INPUTS, DIMENSION_OUTPUT),
        device=device,
        requires_grad=True,
    )
    bias = torch.zeros(DIMENSION_OUTPUT, device=device, requires_grad=True)
    return SoftmaxRegressionParams(weights=weights, bias=bias)

def softmax(logits: Tensor) -> Tensor:
    # input `logits` is in (batch_size, num_classes) dimension, and the value is
    # the raw value in logits is not possibility, it's the raw score

    # minus the maximum value, the exponential won't explode
    shifted_logits = logits - logits.max(dim=1, keepdim=True).values
    exp_logits = torch.exp(shifted_logits)
    # normalization, sum along with the second dimension (num_classes)
    partition = exp_logits.sum(dim=1, keepdim=True)
    return exp_logits / partition

def net(inputs: Tensor, params: SoftmaxRegressionParams) -> Tensor:
    # flatten the input, drop the space information
    flat_inputs = inputs.reshape((-1, DIMENSION_INPUTS))
    logits = flat_inputs @ params.weights + params.bias
    return softmax(logits)

def cross_entropy(y_hat: Tensor, labels: Tensor) -> Tensor:
    batch_indices = torch.arange(y_hat.shape[0], device=y_hat.device)
    predicted_probabilities = y_hat[batch_indices, labels]
    # y_hat[batch_indices, labels] will return the predicted probabilities
    # tensor, only when y[labels] = 1 the term is not zero
    return -torch.log(predicted_probabilities).mean()

def accuracy(y_hat: Tensor, labels: Tensor) -> float:
    predictions = y_hat.argmax(dim=1)
    correct = (predictions == labels).type(torch.float32).sum()
    return float(correct / labels.numel())

def sgd(params: Iterable[Tensor], learning_rate: float) -> None:
    with torch.no_grad():
        for param in params:
            grad = param.grad
            if grad is None:
                continue
            else:
                param -= learning_rate * grad
                grad.zero_()

def train_epoch(
    train_iter: DataLoader,
    params: SoftmaxRegressionParams,
    device: torch.device,
    learning_rate: float = LEARNING_RATE,
) -> EpochMetrics:
    total_loss = 0.0
    total_accuracy = 0.0
    total_examples = 0

    for inputs, labels in train_iter:
        inputs = inputs.to(device)
        labels = labels.to(device)

        y_hat = net(inputs, params)
        loss = cross_entropy(y_hat, labels)
        loss.backward()
        sgd((params.weights, params.bias), learning_rate)

        batch_size = labels.numel()
        total_loss += loss.item() * batch_size
        total_accuracy += accuracy(y_hat, labels) * batch_size
        total_examples += batch_size

    return EpochMetrics(
        loss=total_loss / total_examples,
        accuracy=total_accuracy / total_examples,
    )

def evaluate_accuracy(
    data_iter: DataLoader,
    params: SoftmaxRegressionParams,
    device: torch.device,
) -> float:
    total_accuracy = 0.0
    total_examples = 0

    with torch.no_grad():
        for inputs, labels in data_iter:
            inputs = inputs.to(device)
            labels = labels.to(device)
            batch_size = labels.numel()

            total_accuracy += accuracy(net(inputs, params), labels) * batch_size
            total_examples += batch_size

    return total_accuracy / total_examples

def train(epochs: int = EPOCHS, learning_rate: float = LEARNING_RATE) -> None:
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    train_iter, test_iter = load_data_fashion_mnist()
    params = init_params(device)
    history = []

    for epoch in range(epochs):
        train_metrics = train_epoch(train_iter, params, device, learning_rate)
        test_accuracy = evaluate_accuracy(test_iter, params, device)
        print(
            f"[-] epoch {epoch + 1:02d}: "
            f"loss={train_metrics.loss:.4f}, "
            f"train_acc={train_metrics.accuracy:.4f}, "
            f"test_acc={test_accuracy:.4f}",
        )
        history.append({
            "epoch": epoch,
            "loss": train_metrics.loss,
            "train_accuracy": train_metrics.accuracy,
            "test_accuracy": test_accuracy
        })

    plt.plot(
        [iteration["epoch"] for iteration in history],
        [iteration["loss"] for iteration in history]
    )
    plt.show()

def main() -> None:
    train()

if __name__ == "__main__":
    main()
