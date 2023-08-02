{
  suites,
  pkgs,
  config,
  ...
}: {
  ### root password is empty by default ###
  imports = suites.chaos;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a0f16a26-422f-459b-a3a1-ca49bb20d83b";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4D53-E42E";
    fsType = "vfat";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/98abe15d-d710-440a-b797-cab327200c77";}
  ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [];
    kernelModules = [ "kvm-intel" ];
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    kernelParams = [
      "quiet"
      "splash"
      # "nvidia-drm.modeset=1"
    ];
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
      kernelModules = [];
    };
  };

  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  time.timeZone = "America/Chicago";
}
