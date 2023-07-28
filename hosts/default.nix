{ system, self, nixpkgs, inputs, user, ... }:

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
    specialArgs = { inherit inputs user; };
    modules = [
      ./laptop/wayland
      #./laptop/x11
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.hyprland.nixosModules.default
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./laptop/wayland/home.nix)
              #(import ./laptop/x11/home.nix)
            ] ++ [
              inputs.hyprland.homeManagerModules.default
              inputs.stylix.homeManagerModules.stylix
            ];
          };
        };
        nixpkgs = {
          overlays =
            (import ../overlays)
              ++ [
              self.overlays.default
              inputs.picom.overlays.default
              inputs.joshuto.overlays.default
              inputs.go-musicfox.overlays.default
            ];
        };
      }
    ];
  };

}
