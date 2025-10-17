#! /usr/bin/env bash

cd A3BL/examples/aggregated_mod_addition

# ABL 
python main.py  --method abl --epochs 10 --digit_size 1 --dataset MNIST  --mod1 2 --mod2 3

# A3BL 
python main.py  --method a3bl --epochs 10 --digit_size 1 --dataset MNIST  --mod1 2 --mod2 3 --topk 16
