
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
              mode = "2560x1440";
              scale = 1.0;
              position = "0,0";
            }
            {
              criteria = "eDP-1";
              status = "enable";
              mode = "1920x1080";
              scale = 1.0;
              position = "320,1440";
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
