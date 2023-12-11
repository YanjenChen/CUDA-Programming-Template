# Must import torch before importing any custom C++ extension
import torch
from src import example
from src import gelu

print(f"Hello World! {example.add(4, 5)}!")
example.cudaAdd()

device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
print(device)
x = torch.tensor([1, 2, 3], dtype=torch.float32).to(device)
print(x)
print(gelu.forward(x))
