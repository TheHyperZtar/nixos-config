{pkgs, ...}: {
  home.packages = [pkgs.libnotify];
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = "(0, 500)";
        offset = "(20, 20)";
        dmenu = "rofi -dmenu";
        corner_radius = 10;
      };
    };
  };
}

