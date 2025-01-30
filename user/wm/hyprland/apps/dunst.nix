{config, pkgs, ...}:
let
  waybar-dunst = pkgs.writeShellScriptBin "waybar-dunst" ''
    COUNT=$(dunstctl count waiting)
    ENABLED=󰂚
    DISABLED=󰂛
    if [ $COUNT != 0 ]; then DISABLED=" $COUNT"; fi
    if dunstctl is-paused | grep -q "false" ; then echo $ENABLED; else echo $DISABLED; fi
  '';
in
{
  home.packages = [pkgs.libnotify waybar-dunst];
  services.dunst = {
    enable = true;
    iconTheme = {
      name = config.stylix.iconTheme.dark;
      package = config.stylix.iconTheme.package;
    };
    settings = {
      global = {
        width = "(0, 500)";
        offset = "(20, 20)";
        dmenu = "rofi -dmenu -no-show-icons -p Dunst -config ~/.config/rofi/config-long.rasi";
        corner_radius = config.wayland.windowManager.hyprland.settings.decoration.rounding;
        min_icon_size = 64;
        max_icon_size = 64;
      };
    };
  };
}

