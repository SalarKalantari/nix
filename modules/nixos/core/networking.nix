# modules/nixos/core/networking.nix
{ lib, pkgs, ... }:
{
  # networking.useDHCP = lib.mkDefault true;

  networking = {
    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 443 80 ];
    };

  };
  services.openssh.enable = true;

  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    openvpn
    openfortivpn
    sshpass
  ];

}

