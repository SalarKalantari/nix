# modules/darwin/core/revision.nix
{ flake, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  system.configurationRevision =
    self.rev or self.dirtyRev or null;
}

