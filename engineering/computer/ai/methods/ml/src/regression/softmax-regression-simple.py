import torch
import json

from torch import Tensor, nn
from torch.utils.data import DataLoader
from torchvision import datasets, transforms
from typing import Tuple, List, Any, Dict
from matplotlib import pyplot as plt

BATCH_SIZE = 256
LEARNING_RATE = 0.1
EPOCHS = 10

INPUTS_DIMENSION = 28 * 28
OUTPUT_DIMENSION = 10

DATA_PATH = "assets/data"
RESULT_JSON_PATH = "assets/output/result-simple.json"

DEVICE = torch.device(
    "cuda" if torch.cuda.is_available() else "cpu"
)

def get_dataloader() -> Tuple[DataLoader, DataLoader]:
    transform = transforms.ToTensor()

    train_dataset = datasets.FashionMNIST(
        root=DATA_PATH,
        train=True,
        transform=transform,
        download=True,
    )

    test_dataset = datasets.FashionMNIST(
        root=DATA_PATH,
        train=False,
        transform=transform,
        download=True,
    )

    train_loader = DataLoader(
        train_dataset,
        batch_size=BATCH_SIZE,
        shuffle=True,
    )

    test_loader = DataLoader(
        test_dataset,
        batch_size=BATCH_SIZE,
        shuffle=False,
    )

    return train_loader, test_loader

class SoftmaxRegression(nn.Module):
    def __init__(self):
        super().__init__()
        self.flatten = nn.Flatten()
        self.linear = nn.Linear(INPUTS_DIMENSION, OUTPUT_DIMENSION)

    def forward(self, x: Tensor) -> Tensor:
        x = self.flatten(x)
        logits = self.linear(x)
        return logits

def train_one_epoch(
    model: nn.Module,
    dataloader: DataLoader,
    optimizer: torch.optim.Optimizer,
    loss_function: nn.CrossEntropyLoss,
) -> Tuple[float, float]:
    model.train()
    total_loss = 0
    total_correct = 0
    total_samples = 0

    for images, labels in dataloader:
        images = images.to(DEVICE)
        labels = labels.to(DEVICE)

        # forward
        logits = model(images)
        loss = loss_function(logits, labels)
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        # statistics
        total_loss += (loss.item() * labels.size(0))
        predictions = logits.argmax(dim=1)
        total_correct += (predictions == labels).sum().item()

        total_samples += labels.size(0)

    return (
        total_loss / total_samples,
        total_correct / total_samples
    )

@torch.no_grad()
def evaluate(model: nn.Module, dataloader: DataLoader) -> float:
    model.eval()
    correct = 0
    total = 0
    for images, labels in dataloader:
        images = images.to(DEVICE)
        labels = labels.to(DEVICE)
        logits = model(images)
        predictions = logits.argmax(dim=1)
        correct += (predictions == labels).sum().item()
        total += labels.size(0)

    return correct / total

def train() -> None:
    train_loader, test_loader = get_dataloader()
    model = SoftmaxRegression()
    model = model.to(DEVICE)
    loss_function = nn.CrossEntropyLoss()
    optimizer = torch.optim.SGD(model.parameters(), lr=LEARNING_RATE)
    history = []

    for epoch in range(EPOCHS):
        train_loss, train_accuracy = train_one_epoch(
            model,
            train_loader,
            optimizer,
            loss_function,
        )

        test_accuracy = evaluate(model, test_loader)

        print(
            f"[+] Epoch {epoch + 1}/{EPOCHS}",
            f"loss={train_loss:.4f}",
            f"train_accuracy={train_accuracy:.4f}",
            f"test_accuracy={test_accuracy:.4f}",
        )
        history.append({
            "epoch": epoch + 1,
            "loss": train_loss,
            "train_accuracy": train_accuracy,
            "test_accuracy": test_accuracy
        })

    with open(RESULT_JSON_PATH, "w", encoding="utf-8") as f:
        json.dump(history, f, indent=2, ensure_ascii=False)

def draw_result() -> None:
    # plot loss

    with open(RESULT_JSON_PATH, "r", encoding="utf-8") as f:
        history: List[Dict[str, Any]] = json.load(f)

    fig, ax = plt.subplots(figsize=(6,4))
    ax.plot(
        [iteration["epoch"] for iteration in history],
        [iteration["loss"] for iteration in history],
        color="green",
        linewidth=1,
        alpha=0.6
    )
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Loss")
    ax.set_title("Training Error")
    ax.grid(True)
    fig.savefig("loss_curve.png", dpi=500)
    ax.clear()
    fig.clear()
    plt.close()

    # plot accuracy

    fig, ax = plt.subplots(figsize=(6,4))
    ax.plot(
        [iteration["epoch"] for iteration in history],
        [iteration["train_accuracy"] for iteration in history],
        color="blue",
        linewidth=1,
        alpha=0.6,
        label="Train Accuracy"
    )
    ax.plot(
        [iteration["epoch"] for iteration in history],
        [iteration["test_accuracy"] for iteration in history],
        color="red",
        linewidth=1,
        alpha=0.6,
        label="Test Accuracy"
    )
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Accuracy")
    ax.set_title("Train / Test Accuracy")
    ax.legend()
    ax.grid(True)
    fig.savefig("accuracy.png", dpi=500)
    plt.close()

def main() -> None:
    draw_result()

if __name__ == "__main__":
    main()
