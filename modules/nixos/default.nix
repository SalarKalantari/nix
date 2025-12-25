{ flake, ... }:
{
    imports = [
    flake.inputs.nvf.nixosModules.default
    flake.inputs.mango.nixosModules.default
    ./core
    ./desktop
    ./hardware
    ./cli
    ./gui
    ];
  }
