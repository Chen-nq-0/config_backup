{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot = {
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    kernelParams = [
      "zswap.enabled=1"
      "zswap.compressor=zstd"
      "zswap.max_pool_percent=20"
      "zswap.shrinker_enabled=1"
    ];
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5f732f47-f0e7-4e90-bc85-7b789605c047";
    fsType = "xfs";
    options = [
      "noatime"
    ];
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/C565-B616";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
