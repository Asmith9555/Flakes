{
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix # Firefox settings.
    ./style.nix # Firefox styling.
    ./extensions.nix # Firefox extensions.
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableFirefoxStudies = true;
        DisablePocket = true;
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DRM_DEVICE = "/dev/dri/card0";
   };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}