import torch

def main() -> None:
    A = torch.arange(20).reshape(4, 5)
    print(A.T)
    # transpose
    B = A.clone()
    print(A * B)
    # hadamard product of two matrices, its different from multiplication of two
    # matrices
    C = torch.arange(20).reshape(2, 2, 5)
    print(C)
    print(C.sum(axis=[0]))
    # reduction along the axis 0 (the outer dimension)
    print(C.sum(axis=[1]))
    # reduction along the axis 1
    print(C.sum(axis=[2]))
    # reduction along the axis 2
    print(C.sum(axis=[0], keepdim=True))
    # reduction along the axis 0 but keep dimension
    D = torch.arange(20).reshape(5, 4)
    print(A @ D)
    # multiplication of two 4 × 5 and 5 × 4 matrices
    vec = torch.arange(3, dtype=torch.float32)
    print(torch.norm(vec))
    # 2.2361


if __name__ == "__main__":
    main()