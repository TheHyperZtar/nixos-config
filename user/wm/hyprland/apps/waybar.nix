{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.override {withMediaPlayer = true;};
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        spacing = 2;
        output = ["Sceptre Tech Inc Sceptre M24 0x00000001" "Lenovo Group Limited LEN-A3/V1-E 0x00000001"];
        modules-left = ["group/shortcuts" "hyprland/workspaces"];
        modules-center = ["clock" "custom/spotify"];
        modules-right = ["battery" "backlight" "pulseaudio" "custom/clipboard" "custom/dunst" "tray" "custom/powermenu"];
        "custom/apps" = {
          format = "";
          on-click = "sleep 0.1 ; rofi -show drun -show-icons";
          tooltip = false;
        };
        "custom/wallpaper" = {
          format = "";
          on-click = "waypaper";
          on-click-middle = "pkill waybar;waybar &";
          tooltip = false;
        };
        "custom/filemanager" = {
          format = "";
          on-click = "nemo";
          tooltip = false;
        };
        "custom/browser" = {
          format = "󰈹";
          on-click = "firefox";
          tooltip = false;
        };
        "custom/steam" = {
          format = "";
          on-click = "steam";
          tooltip = false;
        };
        "custom/spotify" = {
          exec = "waybar-mediaplayer.py --player spotify";
          format = "{}";
          return-type = "json";
          on-click = "playerctl -p spotify play-pause";
          on-scroll-up = "playerctl -p spotify next";
          on-scroll-down = "playerctl -p spotify previous";
          tooltip = false;
        };
        "custom/update" = {
          format = "";
          on-click = "kitty -e nh os switch";
          on-click-right = "kitty -e nh os switch --upgrade";
          on-click-middle = "kitty -e nh clean all";
          tooltip = false;
        };
        "custom/clipboard" = {
          format = "󱉥";
          on-click = "sleep 0.1 && cliphist list | rofi -dmenu -no-show-icons -p Clipboard -theme ~/.config/rofi/config-long.rasi| cliphist decode | wl-copy";
          on-click-right = "sleep 0.1 && cliphist list | rofi -dmenu -no-show-icons -p Clipboard -theme ~/.config/rofi/config-long.rasi| cliphist delete";
          on-click-middle = "sleep 0.1 && cliphist wipe";
          tooltip = false;
        };
        "custom/dunst" = {
          exec = "waybar-dunst";
          interval = 1;
          tooltip = false;
          on-click = "dunstctl set-paused toggle";
          on-click-right = "dunstctl history-pop";
        };
        "custom/swaync" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='#${config.lib.stylix.colors.base08}'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='#${config.lib.stylix.colors.base08}'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='#${config.lib.stylix.colors.base08}'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='#${config.lib.stylix.colors.base08}'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
        "custom/powermenu" = {
          format = "󰐥";
          on-click = "wlogout";
          tooltip = false;
        };
        "group/shortcuts" = {
          orientation = "horizontal";
          modules = [
            "custom/apps"
            "custom/wallpaper"
            "custom/filemanager"
            "custom/browser"
            "custom/steam"
          ];
          drawer = {
            transition-duration = 500;
          };
        };
        "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
          ];
        };
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        "cpu" = {
          format = " {usage}%";
          on-click = "kitty -e btop";
          tooltip = false;
        };
        "memory" = {
          format = "/  {}%";
          on-click = "kitty -e btop";
        };
        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = false;
        };
        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = ["" "" "" "" ""];
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          max-volume = 150;
          on-click = "pavucontrol";
        };
        "clock" = {
          on-click-middle = "wpctl set-volume @DEFAULT_SINK@ 150% ; mpv --fs --video-scale-x=3.2 --video-scale-y=2 --no-input-cursor --no-input-builtin-bindings /home/TheHyperZtar/Videos/Videoclips/Tiktok/Jonkler.mp4 ; wpctl set-volume @DEFAULT_SINK@ 70%";
          format = "{:%I:%M %p}";
          format-alt = "{:%d %B, %Y - %I:%M %p}";
          tooltip = true;
          tooltip-format = "<big>{:%I:%M %p}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            format = {
              today = "<span color='#${config.lib.stylix.colors.base0F}'><b><u>{}</u></b></span>";
            };
            mode = "month";
          };
        };
        "tray" = {
          spacing = 10;
        };
      };
    };
    style = ''
      #waybar {
        font-family: "${config.stylix.fonts.monospace.name}", "Symbols Nerd Font Mono";
        font-size: ${builtins.toString config.stylix.fonts.sizes.desktop}px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base0C};
        background-color: #${config.lib.stylix.colors.base00};
        border-bottom-right-radius: 10px;
        border-bottom-left-radius: 10px;
      }
      button {
        all: unset;
        padding: 0px 10px;
        border-radius: 0px;
        margin-left: 2px;
        margin-right: 2px;
      }
      button:hover {
        border-bottom: 3px solid #${config.lib.stylix.colors.base04};
      }
      button.active {
        border-bottom: 3px solid #${config.lib.stylix.colors.base0C};
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #tray,
      #custom-swaync,
      #custom-dunst,
      #custom-wallpaper,
      #custom-spotify,
      #custom-apps,
      #custom-filemanager,
      #custom-steam,
      #custom-browser,
      #custom-update,
      #custom-clipboard,
      #custom-powermenu,
      #mpd {
        padding-left: 10px;
        padding-right: 10px;
      }
      #workspaces {
        padding-right: 10px;
      }
      #custom-powermenu {
        color: #${config.lib.stylix.colors.base08};
      }
      #memory {
        padding-left: 0px;
      }
      tooltip {
        background-color: #${config.lib.stylix.colors.base00};
        border: none;
        border-radius: 10px;
      }
      tooltip decoration {
        box-shadow: none;
      }
      tooltip decoration:backdrop {
        box-shadow: none;
      }
      tooltip label {
        color: #${config.lib.stylix.colors.base0C};
        font-family: "${config.stylix.fonts.monospace.name}";
        font-weight: bold;
        font-size: ${builtins.toString config.stylix.fonts.sizes.desktop}px;
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 0px;
        padding-bottom: 5px;
      }
    '';
  };
}
