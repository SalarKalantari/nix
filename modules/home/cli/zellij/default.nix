{ ... }:
{
  programs.zellij = {
      enable = true;
      # enableZshIntegration = true;
      attachExistingSession = true;
      settings = {
          theme = "tokyo-night-dark";
        };
    };

  }
