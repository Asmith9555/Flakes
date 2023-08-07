{ self, nixpkgs, inputs, ... }:

let
  lib = nixpkgs.lib;
in
{
  thinkpad = lib.nixosSystem {
    # Laptop profile
    system = "x86_64-linux";
    specialArgs = { inherit inputs ; };
    modules = [
      ./thinkpad
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.hyprland.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.wuger = {
            imports = [
              (import ./thinkpad/home.nix)
            ] ++ [
              inputs.spicetify-nix.homeManagerModules.default
            ];
          };
        };
        nixpkgs = {
          overlays =
            (import ../overlays)
              ++ [
              self.overlays.default
              inputs.discord-overlay.overlays.default
              inputs.joshuto.overlays.default
            ];
        };
      }
    ];
  };

}
