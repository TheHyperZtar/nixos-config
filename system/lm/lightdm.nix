{...}: {
  services = {
    displayManager.defaultSession = "hyprland";
    xserver.displayManager.lightdm = {
      enable = false;
    };
  };
}
