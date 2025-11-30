# configurations/darwin/mbp-m1/default.nix
{ flake, pkgs, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  # Pull in your dendritic Darwin module tree
  imports = [
    self.darwinModules.default
  ];

  ## Basic nix-darwin boilerplate

  # Same idea as NixOS's networking.hostName
  networking.hostName = "MacBookPro";

  # Required by nix-darwin; *not* the same type as NixOS.
  # Run `darwin-rebuild changelog` once to see the recommended value
  # and then pin it here (often 4 or 5).
  system.stateVersion = 6;

  # Target architecture
  nixpkgs.hostPlatform = "aarch64-darwin";

  # nix-daemon etc – this is standard nix-darwin config
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.salar = {
    home = "/Users/salar";
    shell = pkgs.zsh;
  };

  # You can put more macOS-specific stuff here later:
  #   system.defaults, fonts, services, etc.
}

