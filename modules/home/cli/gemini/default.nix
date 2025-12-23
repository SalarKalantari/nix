{ ... }:
{
  programs.gemini-cli = {
    enable = true;
    settings = {
      tools = {
        autoAccept =  true;
      };
      ui = {
        theme = "Default";
      };
      general = {
        vimMode = true;
      };
      preferredEdittor = "nvim";
      security = {
        auth = {
          selectedType = "oauth-personal";
        };
      };
    };
  };
}
