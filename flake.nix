{
  description = "The most basic configuration";

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
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixos";
    };
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

  outputs = { self, nixpkgs, home, nixos-hardware, digga,  ... } @ inputs:
    digga.lib.mkFlake {
      inherit self inputs;

      supportedSystems = [ "x86_64-linux" ];
      channelsConfig.allowUnfree = true;
      channels.nixos = {
        imports = [ (digga.lib.importOverlays ./overlays) ];
        overlays = [
          ./pkgs/default.nix
          # agenix.overlays.default
          # deploy.overlay
          # (self: super: { deploy = { inherit (nixos) deploy-rs; lib = super.deploy-rs.lib; }; })
        ];
      };

      nixos = {
        hostDefaults = {
          system = "x86_64-linux";
          channelName = "nixos";
          imports = [ (digga.lib.importExportableModules ./modules) ];
          modules = [
            # agenix.nixosModules.age
            home.nixosModules.home-manager
          ];
        };
      };
      imports = [ (digga.lib.importHosts ./hosts) ];

      importables = rec {
        profiles = digga.lib.rakeLeaves ./profiles;
        suites = with builtins; let explodeAttrs = set: map (a: getAttr a set) (attrNames set); in
        with profiles; rec {
          base = (explodeAttrs core) ++ [ vars ];
          thinkpad = [ hardware.thinkpad hardware.nvidia ] ++ (explodeAttrs services);
          full-cli = 
            (explodeAttrs cli.archive) ++ (explodeAttrs cli.download) ++ 
            (explodeAttr cli.search) ++ (explodeAttr cli.editor) ++ 
            (explodeAttr cli.music) ++ (explodeAttr cli.style) ++ 
            (explodeAttr cli.dev) ++ (explodeAttr cli.sys-monitor) ++ (explodeAttr cli.shell);
          chaos =  base ++ thinkpad ++ full-cli ++ (explodeAttrs gui) ++ (explodeAttr desktop.wayland);
        };
      };

      hosts = {
        chaos = [ nixos-hardware.nixosModules.lenovo-thinkpad-p51 ];
      };

      devshell = ./shell;

      homeConfigurations = digga.lib.mkHomeConfigurations self.nixosConfigurations;

      # deploy.nodes = digga.lib.mkDeployNodes self.nixosConfigurations {
        # najdorf = {
        #   profilesOrder = [ "system" "sweenu" ];
        #   profiles.system.sshUser = "root";
        #   profiles.sweenu = {
        #     user = "sweenu";
        #     sshUser = "root";
        #     path = deploy.lib.x86_64-linux.activate.home-manager self.homeConfigurations."sweenu@najdorf";
        #   };
        # };
        # grunfeld = {
        #   profiles.system.sshUser = "root";
        # };
      # };

      # herculesCI = {
      #   ciSystems = [ "x86_64-linux" ];
      # };
    };
}
