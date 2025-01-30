{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../../apps/terminal/kitty.nix
    ./apps/cliphist.nix
    ./apps/dunst.nix
    ./apps/hyprlock.nix
    #./apps/mako.nix
    ./apps/waybar.nix
    ./apps/wlogout
    ./apps/rofi.nix
    ./apps/swappy.nix
    #./apps/swaync.nix
    ./apps/packages.nix
  ];
  xdg = {
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
      config = {
        common.default = ["gtk"];
        hyprland.default = ["gtk" "hyprland"];
      };
    };
  };

  dconf.settings = {
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "kitty";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$mainMod" = "SUPER";
      env = [
        "NIXOS_XDG_OPEN_USE_PORTAL,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "WLR_NO_HARDWARE_CURSORS,1"
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
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        resize_on_border = true;
        layout = "master";
        "col.active_border" = "rgb(${config.lib.stylix.colors.base0C})";
        "col.inactive_border" = "rgb(${config.lib.stylix.colors.base05})";
      };
      debug = {
        suppress_errors = true;
        disable_logs = false;
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
          "windows, 1, 0, default"
          "windowsIn, 1, 7, default"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      misc = {
        disable_hyprland_logo = true;
        vfr = true;
        vrr = true;
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
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, E, exec, nemo"
        "$mainMod, W, exec, firefox"
        "$mainMod, R, exec, rofi -show drun -show-icons"
        "$mainMod, D, exec, rofimoji --use-icons -a copy --max-recent 10 --skin-tone light --no-frecency"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, P, exec, wlogout"
        ", XF86PowerOff, exec, wlogout"
        ''$mainMod, S, exec, grim -g "$(slurp -d)" - | ${pkgs.imagemagick}/bin/magick - -shave 1x1 PNG:- | wl-copy''
        '', PRINT, exec, grim -g "$(slurp -d)" - | ${pkgs.imagemagick}/bin/magick - -shave 1x1 PNG:- | swappy -f -''
        ''$mainMod, PRINT, exec, grim -g "$(slurp -d)" - | ${pkgs.imagemagick}/bin/magick - -shave 1x1 PNG:- | wl-copy''
        "$mainMod SHIFT, B, exec, pkill waybar;waybar"
        "$mainMod SHIFT, D, exec, cliphist list | rofi -dmenu -no-show-icons -p Clipboard -config ~/.config/rofi/config-long.rasi| cliphist decode | wl-copy"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
        "$mainMod SHIFT, left, resizeactive, -100 0"
        "$mainMod SHIFT, right, resizeactive, 100 0"
        "$mainMod SHIFT, up, resizeactive, 0 -100"
        "$mainMod SHIFT, down, resizeactive, 0 100"
        "$mainMod SHIFT, H, resizeactive, -100 0"
        "$mainMod SHIFT, J, resizeactive, 0 100"
        "$mainMod SHIFT, K, resizeactive, 0 -100"
        "$mainMod SHIFT, L, resizeactive, 100 0"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, Tab, workspace, e+1"
        "$mainMod SHIFT, Tab, workspace, e-1"
      ];
      binde = [
        "$mainMod, KP_ADD, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        "$mainMod, KP_SUBTRACT, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        "$mainMod SHIFT, KP_ADD, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
        "$mainMod SHIFT, KP_SUBTRACT, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
