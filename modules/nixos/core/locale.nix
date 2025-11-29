# modules/nixos/core/locale.nix
{ ... }:
{
  time.timeZone = "Asia/Tehran";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
  };

  console.keyMap = "us";
}

