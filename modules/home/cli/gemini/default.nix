{ ... }:
{
  programs.gemini-cli = {
    enable = true;
    settings = {
      ui = {
        theme = "Default";
      };
      general = {
        vimMode = true;
      };
      preferredEdittor = "nvim";
      tools = {
        autoAccept =  true;
      };
      security = {
        auth = {
          selectedType = "oauth-personal";
        };
      };
    };
  };
}
