{
  config,
  pkgs,
  ...
}: {
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchExternalPower = "suspend-then-hibernate";
    lidSwitchDocked = "ignore";
    extraConfig = ''
      HandlePowerKey=lock
      LidSwitchIgnoreInhibited=no
    '';
  };
  services.tlp = {
    enable = true;
    settings = {
      USB_AUTOSUSPEND = 0;
    };
  };
  environment.systemPackages = with pkgs; [
    powertop
  ];
  powerManagement.powertop.enable = true;
  systemd.sleep.extraConfig = "HibernateDelaySec=2h";
}
