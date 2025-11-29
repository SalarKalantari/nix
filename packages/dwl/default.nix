# packages/dwl/default.nix
{ lib, stdenv, fetchFromGitHub, pkg-config
, wayland, libxkbcommon, pixman, ... }:

stdenv.mkDerivation rec {
  pname = "dwl-salar";
  version = "git-2025-11-25";

  src = fetchFromGitHub {
    owner = "SalarKalantari";
    repo  = "dwl";
    # pin this to a real commit:
    rev    = "2fbf81918032e0f02d4e034cb4f93ca036016f65";
    sha256 = "05imfrkdsh2q0n322yiky6kns09pfzz58l270b4k3m6r6zb6byfw";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs       = [ wayland libxkbcommon pixman ];

  installPhase = ''
    mkdir -p $out/bin
    cp dwl $out/bin/

    mkdir -p $out/share/dwl
    if [ -d ./examples ]; then
      cp -r examples/* $out/share/dwl/
    fi
  '';
}

