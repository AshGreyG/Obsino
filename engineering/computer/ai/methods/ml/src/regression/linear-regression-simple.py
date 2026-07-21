import numpy as np
import torch

from torch import nn
from torch.utils import data
from typing import Tuple


TRAINING_DATA_SIZE = 1000
BATCH_SIZE = 32
LEARNING_RATE = 0.03
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

def load_array(
    data_arrays:
    Tuple[torch.Tensor, torch.Tensor],
    batch_size: int,
    is_train: bool = True
) -> data.DataLoader:
    dataset = data.TensorDataset(*data_arrays)
    return data.DataLoader(dataset, batch_size, shuffle=is_train)

def main() -> None:
    true_w = torch.tensor([3, -3.4])
    true_b = 4.2
    features, labels = synthetic_data(true_w, true_b, TRAINING_DATA_SIZE)
    data_iter = load_array((features, labels), BATCH_SIZE)

    net = nn.Sequential(nn.Linear(2, 1))
    linear_layer = net[0]
    assert isinstance(linear_layer, nn.Linear)
    # make sure pyright not to raise error
    linear_layer.weight.data.normal_(0, 0.01)
    linear_layer.bias.data.fill_(0)
    loss = nn.MSELoss()
    trainer = torch.optim.SGD(net.parameters(), lr=LEARNING_RATE)

    for epoch in range(EPOCHS):
        for X, y in data_iter:
            l = loss(net(X), y)
            trainer.zero_grad()
            l.backward()
            trainer.step()
        l = loss(net(features), labels)
        print("[-] epoch: ", epoch + 1, " loss: ", float(l))

if __name__ == "__main__":
    main()