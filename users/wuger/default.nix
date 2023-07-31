{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) wuger; };
  users.users.wuger = {
    hashedPassword = "$6$VxuEIVkoVItq2fN7$dsS878W2yBZxvmNoiKY5B2ESARpraVEUfaQ4.6Q5xIRs1v7H6iWnN/vwtiPa8B1QHpdWpqMd3uFoy4x/Um4m./";
    isNormalUser = true;
    extraGroups = [ "wheel" ]
      ++ pkgs.lib.optional config.virtualisation.libvirtd.enable "libvirtd"
      ++ pkgs.lib.optional config.networking.networkmanager.enable "networkmanager"
      ++ pkgs.lib.optional config.programs.light.enable "video";
  };
}