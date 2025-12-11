{
  description = "Salar's unified NixOS/nix-darwin/home-manager config (nixos-unified + Lix)";

  inputs = {
    # Main Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";


    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    # Lix main (non-flake tarball)
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    # Lix NixOS module
    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module.git?ref=refs/heads/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # flake-parts (used internally by nixos-unified.lib.mkFlake)
    flake-parts.url = "github:hercules-ci/flake-parts";

    # nixos-unified: the brains of the operation
    nixos-unified.url = "github:srid/nixos-unified";

    # nvf: Neovim config framework
    nvf = {
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # Let nixos-unified handle flake-parts + autowiring of modules/flake/*
  outputs =
    inputs:
    inputs.nixos-unified.lib.mkFlake {
      inherit inputs;
      # this will be passed as `root` to all flake-parts modules
      root = ./.;
    };
}
