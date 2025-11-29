# modules/flake/root.nix
{ inputs, root, ... }:

{
  # Systems this flake supports
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];


  # IMPORTANT: pull in nixos-unified's flake module *once*,
  # then your own flake modules.
  imports = [
    inputs.nixos-unified.flakeModules.default
    inputs.nixos-unified.flakeModules.autoWire
  ];

}

