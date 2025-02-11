{...}: {
  fileSystems = {
    "/run/media/TheHyperZtar/THZ-SSD" = {
      device = "/dev/disk/by-label/THZ-SSD";
      fsType = "btrfs";
      options = ["noatime" "nofail"];
    };
  };
}
