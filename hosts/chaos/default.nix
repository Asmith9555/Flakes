{ config, suites, pkgs, ... }:

{
  imports = suites.chaos;

  home-manager.users."${config.vars.username}" = {
    home.sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    };
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "resume_offset=225501184" ];
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a0f16a26-422f-459b-a3a1-ca49bb20d83b";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/4D53-E42E";
      fsType = "vfat";
    };
  };

  swapDevices = [
    {
      device = "/var/swapfile";
      size = 1024 * 64;
    }
  ];

  time.timeZone = config.vars.timezone;

  i18n.defaultLocale = "en_US.UTF-8";
  
}