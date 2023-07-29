{ config, pkgs, user, ... }:

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
    users.${user} = {
      extraGroups = [ "lxd" ];
    };
    groups.docker.members = [ "${user}" ]  
    groups.libvirtd.members = [ "${user}" ];
  };
  networking.firewall.trustedInterfaces = [ "virbr0" ];
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose
    virt-manager
  ];
}

