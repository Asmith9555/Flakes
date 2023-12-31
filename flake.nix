{
  description = "The most basic configuration";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      hyprpicker.url = "github:hyprwm/hyprpicker";
      hypr-contrib.url = "github:hyprwm/contrib";
      flake-utils.url = "github:numtide/flake-utils";
      joshuto.url = "github:kamiyaa/joshuto";
      discord-overlay.url = "github:InternetUnexplorer/discord-overlay";
      spicetify-nix.url = "github:the-argus/spicetify-nix";
      firefox-addons = {
        url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      hyprsome = {
        url = "github:sopa0/hyprsome";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            flake-utils.follows = "flake-utils";
        };
      };
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, flake-utils, ... }:
    let
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
          inherit nixpkgs self inputs;
        }
      );
    };
}
