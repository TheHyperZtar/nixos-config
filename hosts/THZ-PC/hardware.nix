{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    supportedFilesystems = ["ntfs" "exfat" "ext4" "fat32" "btrfs"];
    tmp.cleanOnBoot = true;
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod"];
    kernelModules = ["kvm-intel"];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/THZ-NixOS";
      fsType = "btrfs";
      options = ["subvol=@" "noatime"];
    };

    "/home" = {
      device = "/dev/disk/by-label/THZ-NixOS";
      fsType = "btrfs";
      options = ["subvol=@home" "noatime"];
    };

    "/nix" = {
      device = "/dev/disk/by-label/THZ-NixOS";
      fsType = "btrfs";
      options = ["subvol=@nix" "noatime"];
    };

    "/var/log" = {
      device = "/dev/disk/by-label/THZ-NixOS";
      fsType = "btrfs";
      options = ["subvol=@log" "noatime"];
    };

    "/swap" = {
      device = "/dev/disk/by-label/THZ-NixOS";
      fsType = "btrfs";
      options = ["subvol=@swap" "noatime"];
    };

    "/boot" = {
      device = "/dev/disk/by-label/THZ-BOOT";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8 * 1024;
    }
  ];

  systemd.tpm2.enable = false;

  services = {
    xserver = {
      videoDrivers = ["amdgpu" "i915"];
    };
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    amdgpu = {
      legacySupport.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
