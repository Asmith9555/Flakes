{ config, pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
    };        
    spiceUSBRedirection.enable = true; 
  };
  programs.dconf.enable = true;
  services = {
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;
  };
  environment.systemPackages = with pkgs; [
    virt-manager
    virtiofsd
  ];
}

