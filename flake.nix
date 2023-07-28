{
  description = "The most basic configuration";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      hyprpicker.url = "github:hyprwm/hyprpicker";
      hypr-contrib.url = "github:hyprwm/contrib";
      flake-utils.url = "github:numtide/flake-utils";
      picom.url = "github:yaocccc/picom";
      joshuto.url = "github:kamiyaa/joshuto";
      go-musicfox.url = "github:go-musicfox/go-musicfox";
      stylix.url = "github:danth/stylix";
      hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, flake-utils, ... }:
    let
      user = "wuger";
      selfPkgs = import ./pkgs;
    in
    flake-utils.lib.eachSystem [ "x86_64-linux" ]
      (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };
        in
        {
          devShells = {
            #run by `nix devlop` or `nix-shell`(legacy)
            default = import ./shell.nix { inherit pkgs; };
          };
        }
      )
    // {
      overlays.default = selfPkgs.overlay;
      nixosConfigurations = (
        # NixOS configurations
        import ./hosts {
          # Imports ./hosts/default.nix
          system = "x86_64-linux";
          inherit nixpkgs self inputs user;
        }
      );
    };
}
