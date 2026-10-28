{
  description = "Utku's home-manager config for NixOS-WSL and Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    # User-agnostic module, for home-manager inside NixOS (see nixos-wsl-dev).
    homeModules.default = ./home.nix;

    # Standalone home-manager on any Linux.
    homeConfigurations.utku = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home.nix
        {
          home.username = "utku";
          home.homeDirectory = "/home/utku";
        }
      ];
    };
  };
}
