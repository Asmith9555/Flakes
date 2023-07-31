{
  config,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      home.sessionVariables = {
        NIX_PATH = config.environment.sessionVariables.NIX_PATH
      };
      xdg.configFile."nix/registry.json".text =
        config.environment.etc."nix/registry.json".text;
    }
  ];
}