from typing import Tuple, Generator, Iterable
from matplotlib import pyplot as plt

import torch
import random
import numpy as np


TRAINING_DATA_SIZE = 1000
BATCH_SIZE = 10
LEARNING_RATE = 0.01
EPOCHS = 30

def synthetic_data(
    w: torch.Tensor,
    b: float,
    num_examples: int = 200
) -> Tuple[torch.Tensor, torch.Tensor]:
    X = torch.normal(0, 1, (num_examples, len(w)))
    y = X @ w + b
    y += torch.normal(0, 0.01, y.shape)

    return X, y.reshape((-1, 1))

def data_iter(
    batch_size: int,
    features: torch.Tensor,
    labels: torch.Tensor
) -> Generator[Tuple[torch.Tensor, torch.Tensor], None, None]:
    num_examples = len(features)
    indices = list(range(num_examples))
    # random shuffle input training data
    random.shuffle(indices)

    for i in range(0, num_examples, batch_size):
        batch_indices = torch.tensor(
            indices[i:min(i + batch_size, num_examples)]
        )
        yield features[batch_indices], labels[batch_indices]

def linear_regression(X: torch.Tensor, w: torch.Tensor, b: torch.Tensor) -> torch.Tensor:
    return X @ w + b

def squared_loss(y_hat: torch.Tensor, y: torch.Tensor) -> torch.Tensor:
    return (y_hat - y.reshape(y_hat.shape)) ** 2 / 2

def sgd(params: Iterable[torch.Tensor], learning_rate: float, batch_size: int):
    with torch.no_grad():
        for param in params:
            param -= learning_rate * param.grad / batch_size
            param.grad.zero_()

def main() -> None:
    print("[-] Generating synthetic data")
    true_w = torch.tensor([3, 3.4])
    true_b = 4.2
    fig, axes = plt.subplots(1, 2, figsize=(12, 5))
    features, labels = synthetic_data(true_w, true_b, TRAINING_DATA_SIZE)

    print("[+] features:", features.shape, ",label:", labels.shape)
    print("[-] Saving synthetic data into plot")
    axes[0].scatter(
        features[:,0].detach().numpy(),
        labels.detach().numpy(),
        alpha=0.5,
        s=10
    )
    axes[0].set_xlabel("Feature 1 (x₁)")
    axes[0].set_ylabel("Label (y)")
    axes[0].set_title(f"Feature 1 vs Label (True weight: {true_w[0]:.1f})")
    axes[0].grid(True, alpha=0.3)

    axes[1].scatter(
        features[:, 1].detach().numpy(),
        labels.detach().numpy(),
        alpha=0.5, s=10
    )
    axes[1].set_xlabel("Feature 2 (x₂)")
    axes[1].set_ylabel("Label (y)")
    axes[1].set_title(f"Feature 2 vs Label (True weight: {true_w[1]:.1f})")
    axes[1].grid(True, alpha=0.3)

    w = torch.normal(0, 0.01, size=(2,1), requires_grad=True)
    b = torch.zeros(1, requires_grad=True)
    net = linear_regression
    loss = squared_loss

    print("[-] Begin to run training epochs")
    for epoch in range(EPOCHS):
        for X, y in data_iter(BATCH_SIZE, features, labels):
            l = loss(net(X, w, b), y)
            l.sum().backward()
            sgd([w, b], LEARNING_RATE, BATCH_SIZE)
        with torch.no_grad():
            train_l = loss(net(features, w, b), labels)
            average_loss = train_l.mean()
            print("[-] epoch ", epoch + 1, ": loss", float(average_loss))

    print("[+] ", true_w - w.reshape(true_w.shape))
    print("[+] ", true_b - b)
    print("[+] Training completed")

    plot_x = np.linspace(-2, 3, 100)
    axes[0].plot(plot_x, plot_x * w[0].item() + b[0].item(), color="red", alpha=0.8)
    axes[1].plot(plot_x, plot_x * w[1].item() + b[0].item(), color="red", alpha=0.8)

    plt.savefig("linear-regression.svg", format="svg")

if __name__ == "__main__":
    main()