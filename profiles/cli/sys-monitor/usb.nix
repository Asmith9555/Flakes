{pkgs, ...}: {
  environment.defaultPackages = with pkgs; [
    pciutils
    usbutils
  ];
}
