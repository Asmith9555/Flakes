{ pkgs, ... }:
{
  virtualisation = {
    lxd.enable = true;
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
  };
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}