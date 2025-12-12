# overlays/dwl.nix
final: prev:

let
  dwlSrc = prev.fetchFromGitHub {
    owner = "SalarKalantari";
    repo  = "dwl";
    rev   = "236074301be54547f7da3563f178dda664a27191";
    hash  = "sha256-/kHLv8dSM/6ZQcghffeCyGySB1sX2lRgx8gFwzkldsU=";
  };

  dwlbSrc = prev.fetchFromGitHub {
    owner = "SalarKalantari";
    repo  = "dwlb";
    rev   = "83d0070f2a14c1fbe5aa14ca31098dcea01df89b";
    hash  = "sha256-+lpYB5zvdH9WhlNmThrp3daoxh6mzEEA4uMSgFY0ADU=";
  };
in
{
  dwl = prev.dwl.overrideAttrs (old: {
    pname   = "dwl-salar";
    version = "git-2025-11-25";
    # Keep existing buildInputs and add wlroots (0.19.x)
    buildInputs = (old.buildInputs or []) ++ [ prev.wlroots_0_19 ];

    src = dwlSrc;
  });

  dwlb = prev.dwlb.overrideAttrs (old: {
    pname   = "dwlb-salar";
    version = "git-2025-11-25";

    src = dwlbSrc;
  });
}

