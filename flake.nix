{
  description = "The most basic configuration";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
    extra-substituters = [
      "https://nrdxp.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # Nixos
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOs/nixos-hardware/master";
    # Nixos Flakes
    digga = {
      url = "github:divnix/digga";
      inputs = {
        nixpkgs.follows = "nixos";
        nixlib.follows = "nixos";
        home-manager.follows = "home";
        deploy.follows = "deploy";
      };
    };
    deploy = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixos";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixos";
    };
    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "nixos";
    };
    # Home-Manager
    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };      
    # Applications
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypr-contrib.url = "github:hyprwm/contrib";
  };

  outputs = { self, digga, nixos, nixpkgs, home, nixos-hardware, nur, agenix, nvfetcher, deploy, ... } @ inputs:
    digga.lib.mkFlake {
      inherit self inputs;

      supportedSystems = [ "x86_64-linux" ];
      channelsConfig.allowUnfree = true;

      channels.nixos = {
        imports = [ (digga.lib.importOverlays ./overlays) ];
        overlays = [];
      };

      lib = import ./lib {lib = digga.lib // nixos.lib;};

      sharedOverlays = [
        (final: prev: {
          __dontExport = true;
          lib = prev.lib.extend (lfinal: lprev: {
            our = self.lib;
          });
        })

        nur.overlay
        agenix.overlay
        nvfetcher.overlay

        (import ./pkgs)
      ];

      nixos = {
        hostDefaults = {
          system = "x86_64-linux";
          channelName = "nixos";
          imports = [ (digga.lib.importExportableModules ./modules) ];
          modules = [
            agenix.nixosModules.age
            digga.nixosModules.bootstrapIso
            digga.nixosModules.nixConfig
            home.nixosModules.home-manager
          ];
        };
        imports = [(digga.lib.importHosts ./hosts/nixos)];
        hosts = {
          thinkpad = { modules = [ nixos-hardware.nixosModules.lenovo-thinkpad-p51 ]; };
        };
        importables = rec {
          profiles =
            digga.lib.rakeLeaves ./profiles
            // {
              users = digga.lib.rakeLeaves ./users;
            };
          suites = with builtins; let explodeAttrs = set: map (a: getAttr a set) (attrNames set); in
          with profiles; rec {
            ## System Suites
            base = (explodeAttrs core) ++ [ users.root ];
            thinkpad = base ++ [ hardware.laptop hardware.nvidia ];
            ## Full Suites
            chaos =  thinkpad ++ cachix ++ (explodeAttrs services) ++ (explodeAttrs cli) 
                    ++ (explodeAttrs desktop.wayland) ++ [ users.wuger ];
          };
        };
      };

      home = {
        imports = [(digga.lib.importExportableModules ./users/modules)];
        modules = [];
        importables = rec {
          profiles = digga.lib.rakeLeaves ./users/profiles;
          suites = with builtins; let explodeAttrs = set: map (a: getAttr a set) (attrNames set); in
          with profiles; rec {
            chaosHome = (explodeAttr desktop.wayland) ++ (explodeAttr gui) ++ (explodeAttr services) ++ (explodeAttr cli);
          };
        };
        users = {
          wuger = {suites, ...}: {
            imports = suites.chaosHome;
            home.stateVersion = "23.05";
          };
        };
      };

      devshell = ./shell;

      homeConfigurations = digga.lib.mkHomeConfigurations self.nixosConfigurations;

      deploy.nodes = digga.lib.mkDeployNodes self.nixosConfigurations {};
    };
}
