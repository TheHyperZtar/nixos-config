{...}: {
  services = {
    displayManager.defaultSession = "hyprland";
    xserver.displayManager.lightdm = {
      enable = true;
      gtk = {
        enable = true;
      };
    };
  };
}
