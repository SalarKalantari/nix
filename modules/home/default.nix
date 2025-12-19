{ flake, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
    imports = [
    ./core
    ./cli
    ./gui
    ./desktop
    flake.inputs.nvf.homeManagerModules.default
    ];
  }
