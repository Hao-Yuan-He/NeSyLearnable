#! /usr/bin/env bash

cd A3BL/examples/mnist_add

# ABL 
python main.py  --method abl --epochs 10 --digit_size 1 --dataset MNIST  

# A3BL 
python main.py  --method a3bl --epochs 10 --digit_size 1 --dataset MNIST  --topk 16
