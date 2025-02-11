{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./apps/kitty.nix
    ./apps/cliphist.nix
    ./apps/dunst.nix
    ./apps/hyprlock.nix
    ./apps/waybar.nix
    ./apps/wlogout
    ./apps/rofi.nix
    ./apps/swappy.nix
    ./apps/packages.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "MOZ_ENABLE_WAYLAND,1"
      ];
      monitor = [
        ",highres,auto,1"
        "desc:Sceptre Tech Inc Sceptre M24 0x00000001,1920x1080@165,0x0,1"
        "desc:Samsung Electric Company SAMSUNG,1920x1080@60,0x-1080,1,mirror,desc:Sceptre Tech Inc Sceptre M24 0x00000001"
        "desc:Lenovo Group Limited LEN-A3/V1-E 0x00000001,1440x900@60,0x0,1"
      ];
      exec-once = [
        "hyprctl setcursor ${builtins.toString config.stylix.cursor.size}"
        "lxqt-policykit-agent"
        "swww-daemon -f xrgb"
        "maestral_qt"
      ];
      input = {
        kb_layout = "latam";
        follow_mouse = 1;
        numlock_by_default = false;
        touchpad = {
          disable_while_typing = false;
          natural_scroll = false;
        };
      };
      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        resize_on_border = true;
        layout = "master";
        "col.active_border" = "rgb(${config.lib.stylix.colors.base0C})";
        "col.inactive_border" = "rgb(${config.lib.stylix.colors.base05})";
      };
      decoration = {
        rounding = 10;
        dim_special = 0.0;
        shadow = {
          enabled = false;
        };
        blur = {
          enabled = false;
          size = 2;
          passes = 3;
          new_optimizations = true;
        };
      };
      animations = {
        enabled = true;
        animation = [
          "windows, 1, 5, default"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 5, default"
          "workspaces, 1, 5, default"
        ];
      };
      misc = {
        disable_hyprland_logo = true;
      };
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
        new_on_top = true;
        mfact = 0.5;
      };
      bind = [
        "SUPER, RETURN, exec, kitty"
        "SUPER, Q, killactive"
        "SUPER, F, fullscreen"
        "SUPER SHIFT, F, fullscreen, 1"
        "SUPER, E, exec, nemo"
        "SUPER, W, exec, firefox"
        "SUPER, R, exec, rofi -show drun -show-icons"
        "SUPER SHIFT, R, exec, rofimoji --use-icons -a copy --max-recent 10 --skin-tone light --no-frecency"
        "SUPER SHIFT CTRL, R, exec, cliphist list | rofi -dmenu -no-show-icons -p Clipboard -config ~/.config/rofi/config-long.rasi| cliphist decode | wl-copy"
        "SUPER, P, exec, wlogout"
        ''SUPER, S, exec, grim -g "$(slurp -d)" - | ${pkgs.imagemagick}/bin/magick - -shave 1x1 PNG:- | wl-copy''
        ''SUPER SHIFT, S, exec, grim -g "$(slurp -d)" - | ${pkgs.imagemagick}/bin/magick - -shave 1x1 PNG:- | swappy -f -''
        "SUPER, D, exec, vesktop||discord"
        "SUPER, Z, exec, zapzap"
        "SUPER, M, exec, spotify"
        "SUPER, C, exec, hyprpicker -a"
        "SUPER, T, togglefloating,"
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER, Tab, workspace, e+1"
        "SUPER SHIFT, Tab, workspace, e-1"
        ", XF86PowerOff, exec, wlogout"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl -p spotify play-pause"
        ", XF86AudioPlay, exec, playerctl -p spotify play-pause"
        ", XF86AudioNext, exec, playerctl -p spotify next"
        ", XF86AudioNext, exec, playerctl -p spotify next"
      ];
      binde = [
        "SUPER, KP_ADD, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        "SUPER, KP_SUBTRACT, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        "SUPER SHIFT, KP_ADD, exec, brightnessctl set +5%"
        "SUPER SHIFT, KP_SUBTRACT, exec, brightnessctl set 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessDown, exec, brightnessctl set +5%"
      ];
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };
}
