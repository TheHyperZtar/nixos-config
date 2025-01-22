{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };
      input-field = [
        {
          size = "300, 60";
          position = "0, -47";
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(${config.lib.stylix.colors.base05})";
          inner_color = "rgb(${config.lib.stylix.colors.base02})";
          outer_color = "rgb(${config.lib.stylix.colors.base0C})";
          outline_thickness = 4;
          placeholder_text = ''<span foreground="##${config.lib.stylix.colors.base05}"><i>󰌾 Logged in as </i><span foreground="##${config.lib.stylix.colors.base0C}">$USER</span></span>'';
          hide_input = false;
          check_color = "rgb(${config.lib.stylix.colors.base0C})";
          fail_color = "rgb(${config.lib.stylix.colors.base08})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(${config.lib.stylix.colors.base0A})";
        }
      ];
      background = [
        {
          path = "~/Pictures/Wallpapers/Saul\ Goodman.png";
          blur_passes = 0;
          blur_size = 0;
          color = "rgb(${config.lib.stylix.colors.base00})";
        }
      ];
      image = [
        {
          path = "~/Pictures/User\ Pictures/TheHyperZtar.png";
          size = 100;
          border_color = "rgb(${config.lib.stylix.colors.base0C})";
          rounding = -1;
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        {
          text = "$TIME12";
          color = "rgb(${config.lib.stylix.colors.base05})";
          font_size = 90;
          font_family = "${config.stylix.fonts.monospace.name}";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = ''cmd[update:43200000] date +"%A, %d %B %Y"'';
          color = "rgb(${config.lib.stylix.colors.base05})";
          font_size = 25;
          font_family = "${config.stylix.fonts.monospace.name}";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];
    };
  };
}
