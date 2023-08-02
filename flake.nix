{
  description = "A highly structured configuration database.";

  inputs = {
    # Track channels with commits tested and built by hydra
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    ## Nixos Flakes
    digga.url = "github:divnix/digga";
    digga.inputs.nixpkgs.follows = "nixos";
    digga.inputs.nixlib.follows = "nixos";
    digga.inputs.home-manager.follows = "home";
    digga.inputs.deploy.follows = "deploy";

    home.url = "github:nix-community/home-manager/release-23.05";
    home.inputs.nixpkgs.follows = "nixos";

    deploy.url = "github:serokell/deploy-rs";
    deploy.inputs.nixpkgs.follows = "nixos";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixos";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixos";
    };
    
    ## Applications
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-contrib.url = "github:hyprwm/contrib";
  };

  outputs = {
    self,
    digga,
    nixos,
    home,
    nixos-hardware,
    nur,
    agenix,
    deploy,
    nixpkgs,
    ...
  } @ inputs:
    digga.lib.mkFlake
    {
      inherit self inputs;

      channelsConfig = {allowUnfree = true;};

      channels.nixos = {
        imports = [(digga.lib.importOverlays ./overlays)];
        overlays = [
          ./pkgs/default.nix
          nur.overlay
          agenix.overlay
        ];
      };

      nixos = {
        hostDefaults = {
          system = "x86_64-linux";
          channelName = "nixos";
          imports = [(digga.lib.importExportableModules ./modules)];
          modules = [
            # digga.nixosModules.bootstrapIso
            # digga.nixosModules.nixConfig
            home.nixosModules.home-manager
            agenix.nixosModules.age
            inputs.hyprland.nixosModules.default
          ];
        };

        imports = [(digga.lib.importHosts ./hosts)];
        hosts = {
          thinkpad = {
            modules = [nixos-hardware.nixosModules.lenovo-thinkpad-p51];
          };
        };
        importables = rec {
          profiles =
            digga.lib.rakeLeaves ./profiles
            // {
              users = digga.lib.rakeLeaves ./users;
            };
          suites = with builtins; let
            explodeAttrs = set: map (a: getAttr a set) (attrNames set);
          in
            with profiles; rec {
              base = [
                core.base
                users.root
              ];
              thinkpad = [
                hardware.nvidia
                hardware.laptop
              ];
              chaos =
                base
                ++ thinkpad
                ++ (explodeAttrs cli)
                ++ (explodeAttrs desktop.wayland)
                ++ (explodeAttrs services)
                ++ [users.wuger];
            };
        };
      };

      home = {
        modules = [
          inputs.hyprland.homeManagerModules.default
        ];
        importables = rec {
          profiles = digga.lib.rakeLeaves ./users/profiles;
          suites = with builtins; let
            explodeAttrs = set: map (a: getAttr a set) (attrNames set);
          in
            with profiles; rec {
              base = explodeAttrs core;
              chaos =
                base
                ++ (explodeAttrs cli)
                ++ (explodeAttrs gui)
                ++ (explodeAttrs services)
                ++ (explodeAttrs desktop.wayland);
            };
        };
        users = {
          wuger = {suites, ...}: {
            imports = suites.chaos;
            home.stateVersion = "23.05";
          };
        };
      };

      devshell = ./shell;

      # TODO: similar to the above note: does it make sense to make all of
      # these users available on all systems?
      homeConfigurations = digga.lib.mkHomeConfigurations self.nixosConfigurations;

      deploy.nodes = digga.lib.mkDeployNodes self.nixosConfigurations {};
    };
}
