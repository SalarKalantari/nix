# overlays/dwl.nix
final: prev:

let
  dwlSrc = prev.fetchFromGitHub {
    owner = "SalarKalantari";
    repo  = "dwl";
    rev   = "717e3b33e767470627619d5e068f3cb75cd1d2f1";
    hash  = "sha256-HnbwRGgkb4S7lTweQ2MvgDKWm1HZsCGxT7PvYJa4CJY=";
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

