{ config, pkgs, ... }:

{
  virtualisation = {
    docker.enable = true;
    lxd.enable = true;
    libvirtd = {
      enable = true;
      onBoot = "ignore";
    };
  };
  users = {
    users.wuger = {
      extraGroups = [ "lxd" ];
    };
  };
  networking.firewall.trustedInterfaces = [ "virbr0" ];
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose
    virt-manager
  ];
}

