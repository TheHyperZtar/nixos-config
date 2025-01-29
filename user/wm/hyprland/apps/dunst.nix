{pkgs, ...}: {
  home.packages = [pkgs.libnotify];
  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "(10, 50)";
        dmenu = "rofi -dmenu";
        corner_radius = 10;
      };
    };
  };
}

