import torch

def main():
    x = torch.arange(12)
    print(x)
    # tensor([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11])
    print(x.shape)
    # torch.Size([12])
    print(x.numel())
    # 12
    X = x.reshape(3, 4)
    print(X)
    # tensor([[ 0,  1,  2,  3],
    #         [ 4,  5,  6,  7],
    #         [ 8,  9, 10, 11]])
    zero = torch.zeros((2, 3, 4))
    print(zero)
    # tensor([[[0., 0., 0., 0.],
    #          [0., 0., 0., 0.],
    #          [0., 0., 0., 0.]],
    #
    #         [[0., 0., 0., 0.],
    #          [0., 0., 0., 0.],
    #          [0., 0., 0., 0.]]])
    Y = torch.tensor([[2, 1, 4, 5], [1, 2, 3, 4], [3, 2, 1, 6]])
    print(torch.cat((X, Y), dim=0))
    # tensor([[ 0,  1,  2,  3],
    #         [ 4,  5,  6,  7],
    #         [ 8,  9, 10, 11],
    #         [ 2,  1,  4,  5],
    #         [ 1,  2,  3,  4],
    #         [ 3,  2,  1,  6]])
    print(torch.cat((X, Y), dim=1))
    # tensor([[ 0,  1,  2,  3,  2,  1,  4,  5],
    #         [ 4,  5,  6,  7,  1,  2,  3,  4],
    #         [ 8,  9, 10, 11,  3,  2,  1,  6]])
    print(torch.sum(Y))
    # tensor(34)
    broadcasting_X = torch.arange(3).reshape((3, 1))
    broadcasting_Y = torch.arange(2).reshape((1, 2))
    print(broadcasting_X + broadcasting_Y)
    # tensor([[0, 1],
    #         [1, 2],
    #         [2, 3]])

    print(id(Y))  # 139619299773136
    Y = Y + X
    print(id(Y))  # 139619299773008
    Y[:] = Y + X
    print(id(Y))  # 139619299773008


if __name__ == "__main__":
    main()
