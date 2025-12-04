# modules/nixos/core/security.nix
{ ... }:
{
  # Basic hardening defaults; tune over time
  # security.lockKernelModules = false;
  security = {
    sudo = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
      };
    pam.services.waylock = {
        text = ''
        auth      include   login
        account   include   login
        password  include   login
        session   include   login
        '';
      };
    };

  #
  # services.openssh = {
  #   # You already enable SSH in networking module.
  #   permitRootLogin = "no";
  #   passwordAuthentication = false;    # if you’re comfortable with keys only
  # };
}

