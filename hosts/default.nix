{ system, self, nixpkgs, inputs, user, theme, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    # Laptop profile
    inherit system;
    specialArgs = { inherit inputs user theme; };
    modules = [
      ./laptop/wayland
      #./laptop/x11
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.hyprland.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs user theme; };
          users.${user} = {
            imports = [
              (import ./laptop/wayland/home.nix)
              #(import ./laptop/x11/home.nix)
            ] ++ [
              # inputs.hyprland.homeManagerModules.default
            ];
          };
        };
        nixpkgs = {
          overlays =
            (import ../overlays)
              ++ [
              self.overlays.default
              inputs.picom.overlays.default
              inputs.discord-overlay.overlays.default
              inputs.joshuto.overlays.default
            ];
        };
      }
    ];
  };

}
