{pkgs, ...}: {
  home.packages = [pkgs.libnotify];
  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "(15, 15)";
        dmenu = "rofi -dmenu";
        corner_radius = 10;
      };
    };
  };
}

