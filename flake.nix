{
  description = "Brandon's Helix configuration module";

  # We only need the inputs to get access to `config.lib.importTOML`
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Can be any channel
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    # This module now correctly provides settings to the `programs.helix` options
    homeManagerModules.default = { config, ... }: {
      programs.helix = {
        # This reads your config.toml and puts its contents into the right place
        settings = config.lib.importTOML ./config.toml;
        
        # This does the same for your languages.toml
        languages = config.lib.importTOML ./languages.toml;
      };
    };
  };
}
