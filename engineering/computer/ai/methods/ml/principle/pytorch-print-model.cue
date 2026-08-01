package principle

pytorch_print_model: {
  content: #"""
    We can print the structure of a model in Pytorch by using `print(model)`
    here `model` is an instance of a class derived from `nn.Module`. For example,
    we can print the structure of `SoftmaxRegression` defined in
    #link("https://github.com/AshGreyG/Obsino/tree/master/engineering/computer/ai/methods/ml/src/regression/softmax-regression-simple.py")[softmax-regression-simple.py].

    ```text
    SoftmaxRegression(
      (flatten): Flatten(start_dim=1, end_dim=-1)
      (linear): Linear(in_features=784, out_features=10, bias=True)
    )
    ```

    This method can be used to learn any kind of complicated models.
  """#
  related: [
    "specific/softmax-regression"
  ]
}