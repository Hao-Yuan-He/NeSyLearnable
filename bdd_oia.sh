#! /usr/bin/env bash

cd A3BL/examples/bdd_oia/dataset

unzip dataset.zip

cd .. 

# ABL 
python main.py  --method abl --epochs 2 

# A3BL 
python main.py  --method a3bl --epochs 2 
