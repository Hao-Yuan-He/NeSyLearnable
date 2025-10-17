let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    python313Packages.torchvision
    git
    uv
  ];


  shellHook = ''
    if [ ! -d A3BL ]; then
      echo "Cloning A3BL repository..."
      git clone https://github.com/Hao-Yuan-He/A3BL.git --depth 1
    fi

    if [ ! -d .venv ]; then
      echo "Creating Python venv with uv (system site-packages)..."
      uv venv .venv
    fi

    source .venv/bin/activate
    echo "Installing ablkit into venv via uv ..."
    uv pip install -i https://mirror.nju.edu.cn/pypi/web/simple -r requirements.txt

    uv pip install -e A3BL
   '';
}