{config, pkgs, ...}: {
  home.packages = [pkgs.libnotify];
  services.dunst = {
    enable = true;
    iconTheme = {
      name = config.stylix.iconTheme.dark;
      package = config.stylix.iconTheme.package;
      size = "64x64";
    };
    settings = {
      global = {
        width = "(0, 500)";
        offset = "(20, 20)";
        dmenu = "rofi -dmenu -p Dunst -config ~/.config/rofi/config-long.rasi";
        corner_radius = 10;
        min_icon_size = 64;
      };
    };
  };
}

