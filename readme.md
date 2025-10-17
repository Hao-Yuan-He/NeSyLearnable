# A Learnability Analysis on Neuro‑Symbolic Learning

This repository contains reproducible experiments for "A Learnability Analysis on Neuro‑Symbolic Learning" (NeurIPS 2025).


## Requirements

- Nix is used to install dependencies and bootstrap the environment.
- A Git client and internet access (the setup clones the `A3BL` repo).
- Optional: a GPU with recent CUDA drivers for faster training.

If you don't have Nix, install it first: https://nixos.org/download.html


## Setup (Nix)

Start the prepared development shell. It will:
- Clone `A3BL` if not already present.
- Create a Python virtual environment in `.venv` using `uv`.
- Install Python dependencies from `requirements.txt` and install `A3BL` in editable mode.

```bash
nix-shell enviroments.nix
```

Once inside the shell, the virtual environment is automatically activated.


## Logging (Weights & Biases)

By default, runs log to Weights & Biases (`wandb`). Log in or switch to offline:

```bash
wandb login        # authenticate
wandb offline      # disable online logging (optional)
```


## Quickstart

Run the prepared scripts from within the Nix shell:

- Addition (MNIST addition task)

```bash
bash addition.sh
```

- Aggregated modular addition (two moduli)

```bash
bash aggregated_addition_mod.sh
```

- BDD‑OIA (symbolic reasoning with BDDs)

```bash
bash bdd_oia.sh
```

Each script runs both methods:
- `ABL` — the abductive learning method.
- `A3BL` — a variant of ABL, which consider the ambiguity during the abduction process, details ref to [A3BL](https://github.com/Hao-Yuan-He/A3BL).

You can edit the scripts to change hyperparameters (e.g., `--epochs`, `--digit_size`, `--mod1`, `--mod2`, `--topk`).


## Notes on BDD‑OIA Dataset

`bdd_oia.sh` expects a `dataset.zip` in `A3BL/examples/bdd_oia/dataset` and uses `unzip` to extract it. If `dataset.zip` is not present, please follow the instructions in `A3BL/examples/bdd_oia` to obtain the dataset. Ensure `unzip` is available on your system.


## Derived Constraint Satisfaction Problem (DCSP)

We provide an example DCSP file:

```bash
python DCSP_example.py
```

Using the DCSP framework, you can examine the learnability of a neuro‑symbolic task, or evaluate whether two unlearnable tasks can become learnable when combined.


## Tips & Troubleshooting

- Always run the experiment scripts inside the Nix shell so they use the prepared `.venv`.
- The setup installs `torch` and `torchvision`; GPU acceleration is used if available.
- If `A3BL` already exists locally, the setup will skip cloning; update it manually if needed.
- To exit the Nix shell: `exit`.


## Citation

If you use the code of this repo or `A3BL`, please consider to cite me. 

```biblatex
@inproceedings{he2025AnalysisOnNeSy,
  address     = {San Diego, CA, USA},
  author      = {Hao-Yuan He and Ming Li},
  booktitle   = {Advances in Neural Information Processing Systems 38},
  title       = {A Learnability Analysis on Neuro-Symbolic Learning},
  year        = {2025}
}


@inproceedings{he2024a3bl,
  address = {Vienna, Austria},
  author = {He, Hao-Yuan and Sun, Hui and Xie, Zheng and Li, Ming},
  booktitle = {Proceedings of The 41st International Conference on Machine Learning},
  pages = {18019--18042},
  publisher = {PMLR},
  title = {Ambiguity-Aware Abductive Learning},
  volume = {235},
  year = {2024}
}
```

## Acknowledgements

This repository orchestrates experiments using the external `A3BL` project (https://github.com/Hao-Yuan-He/A3BL) and additional utilities contained here.
