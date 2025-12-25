{ flake, ... }:
{
    imports = [
    flake.inputs.nvf.nixosModules.default
    flake.inputs.mango.nixosModules.mango
    ./core
    ./desktop
    ./hardware
    ./cli
    ./gui
    ];
  }
