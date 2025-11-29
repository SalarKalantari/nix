# modules/flake/darwin.nix
{ ... }:
{
  # When you add Macs, you can do something like:
  # let
  #   inherit (inputs.nixos-unified.lib) mkMacosSystem;
  #   mkDarwinHost = hostName: system:
  #     mkMacosSystem
  #       { home-manager = true; username = "salar"; }
  #       {
  #         nixpkgs.hostPlatform = system;
  #         imports = [
  #           (root + "/configurations/darwin/${hostName}")
  #         ];
  #       };
  # in {
  #   flake.darwinConfigurations."my-mac" =
  #     mkDarwinHost "my-mac" "aarch64-darwin";
  # }
}

