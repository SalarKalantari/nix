{ ... }:
{
  programs.gemini-cli = {
    enable = true;
    settings = {
      theme = "Default";
      vimMode = true;
      preferredEdittor = "nvim";
      autoAccept =  true;
    };
  };
}
