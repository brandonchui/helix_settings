{
  description = "Helix Config";
  
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }: {

    nixosModules.default = { config, pkgs, ... }: {
      xdg.configFile."helix" = {
        source = ./config;
        recursive = true;
      };
    };
  };
}