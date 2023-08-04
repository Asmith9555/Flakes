{pkgs, ...}: {
  # virtualisation = {
  #   lxd.enable = true;
  #   # spiceUSBRedirection.enable = true;
  #   libvirtd = {
  #     enable = true;
  #     onBoot = "ignore";
  #   };
  # };
  programs.dconf.enable = true;
  # networking.firewall.trustedInterfaces = [ "virbr0" ];
  # environment.systemPackages = with pkgs; [
  #   virt-manager
  # ];
}
