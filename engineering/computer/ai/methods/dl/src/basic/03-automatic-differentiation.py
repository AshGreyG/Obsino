import torch

def f(a: torch.Tensor) -> torch.Tensor:
    b = a * 2
    while b.norm() < 1000:
        b = b * 2
    if b.sum() > 0:
        return b
    else:
        return 100 * b

def main() -> None:
    x = torch.arange(4, dtype=torch.float32)
    x.requires_grad_(True)
    print(x.grad)
    # None
    y: torch.Tensor = 2 * torch.dot(x, x)
    print(y)
    # tensor(28., grad_fn=<MulBackward0>)
    y.backward()
    print(x.grad)
    # tensor([ 0.,  4.,  8., 12.])
    print(x.grad == 4 * x)
    # tensor([True, True, True, True])

    # By default, pytorch will accumulate the values of gradients, if we want to
    # calculate another function, we need to set gradients to 0
    x.grad.zero_()
    y = x.sum()
    y.backward()
    print(x.grad)
    # tensor([1., 1., 1., 1.])

    a = torch.randn(size=(), requires_grad=True)
    d = f(a)
    d.backward()
    print(a.grad)
    print(a)
    print(d)
    print(a.grad == d / a)

if __name__ == "__main__":
    main()