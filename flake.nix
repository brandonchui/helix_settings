{
  description = "Brandon's Helix configuration";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    homeManagerModules.default = { config, ... }: {
      home.file.".config/helix" = {
        source = ./config;
        recursive = true;
      };
    };
  };
}