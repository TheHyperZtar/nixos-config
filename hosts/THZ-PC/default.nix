{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./../../system
    inputs.home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 0;
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 5;
      };
    };
  };

  networking = {
    hostName = "THZ-PC";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  time.timeZone = "America/Mazatlan";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    keyMap = "la-latin1";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    blueman.enable = true;
    libinput.enable = true;
    flatpak.enable = true;
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [pkgs.hplip];
    };
    udev.packages = [pkgs.android-udev-rules];
  };

  security = {
    polkit.enable = true;
  };

  users = {
    mutableUsers = false;
    users.TheHyperZtar = {
      isNormalUser = true;
      extraGroups = ["adbusers" "gamemode" "input" "kvm" "libvirtd" "networkmanager" "wheel"];
      createHome = true;
      home = "/home/TheHyperZtar";
      hashedPassword = "$y$j9T$UTThLy4gBH4NE6cHK0EfM.$D9tNhSRbTZFxiDLH5qUKsQdmr683rt/9B8g8QZlKQXD";
      shell = pkgs.zsh;
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "backup";
    users."TheHyperZtar" = {
      imports = [./home.nix];
      home.stateVersion = config.system.nixos.release;
    };
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
    nano.enable = false;
    nh = {
      enable = true;
      flake = "/home/TheHyperZtar/.config/nixos";
      clean = {
        enable = true;
      };
    };
    zsh.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = ["SDL_ttf-2.0.11"];
    };
  };
  system.stateVersion = config.system.nixos.release;
  environment.systemPackages = with pkgs; [gparted];
}
