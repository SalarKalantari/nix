
{ ... }:
{
  services.kanshi = {
    enable = true;

    # NEW format (replaces `profiles = { ... }`)
    settings = [
      {
        profile = {
          name = "docked";
          outputs = [
            {
              criteria = "ASUSTek COMPUTER INC PA279CRV T3LMSB000149";
              status = "enable";
              mode = "3840x2160";
              scale = 1.5;
              position = "1920,0";
            }
            {
              criteria = "eDP-1";
              status = "enable";
              mode = "1920x1080";
              scale = 1.0;
              position = "0,720";
            }
          ];
        };
      }

      {
        profile = {
          name = "undocked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              mode = "1920x1080";
              scale = 1.0;
              position = "0,0";
            }
          ];
        };
      }
    ];
  };
}
