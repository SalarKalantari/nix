{ flake, ... }:
{
    imports = [
    flake.inputs.nvf.nixosModules.default
    ./core
    ./desktop
    ./hardware
    ./cli
    ./gui
    ];
  }
