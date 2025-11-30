# modules/darwin/core/nix-lix.nix
{ flake, ... }: {
  imports = [ flake.inputs.lix-module.nixosModules.default ];
}

