{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./nixos.png;
        type = "kitty-direct";
        height = 20;
        width = 40;
        padding = {
          top = 5;
        };
      };
      display = {
        separator = " -> ";
      };
      modules = [
        {
          type = "custom";
          format = "{#90}┌────────────────────────────────────────────────────────────┐";
        }
        {
          type = "title";
          keyWidth = 10;
        }
        {
          type = "custom";
          format = "{#90}└────────────────────────────────────────────────────────────┘";
        }
        {
          type = "custom";
          format = " {#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39}       {#38}  {#37}  {#36}  {#35}  {#34}  {#33}  {#32}  {#31}  {#90} ";
        }
        {
          type = "custom";
          format = "{#90}┌────────────────────────────────────────────────────────────┐";
        }
        {
          type = "os";
          key = " OS";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = "│ ├";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "│ ├󰏖";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "│ └";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = " WM";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = "│ ├󰧨";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "│ ├󰀻";
          keyColor = "blue";
        }
        {
          type = "wallpaper";
          key = "│ ├󰸉";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "│ └";
          keyColor = "blue";
        }
        {
          type = "host";
          key = " PC";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = "│ ├";
          keyColor = "green";
        }
        {
          type = "gpu";
          key = "│ ├󰍛";
          keyColor = "green";
        }
        {
          type = "disk";
          key = "│ ├";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "│ ├󰑭";
          keyColor = "green";
        }
        {
          type = "swap";
          key = "│ ├󰓡";
          keyColor = "green";
        }
        {
          type = "display";
          key = "│ ├󰍹";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = "│ └";
          keyColor = "green";
        }
        {
          type = "sound";
          key = " SND";
          keyColor = "cyan";
        }
        {
          type = "player";
          key = "│ ├󰥠";
          keyColor = "cyan";
        }
        {
          type = "media";
          key = "│ └󰝚";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = "{#90}└────────────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = " {#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39}       {#38}  {#37}  {#36}  {#35}  {#34}  {#33}  {#32}  {#31}  {#90} ";
        }
      ];
    };
  };
  home.file.".config/fastfetch/nixos.png".source = ./nixos.png;
  home.file.".config/fastfetch/small.jsonc".text = ''
    {
      "logo": {
      "source": "~/.config/fastfetch/nixos.png",
      "type": "kitty-direct",
      "height": 6,
        "width": 12,
     },
      "display": {
        "separator": "->   ",
        "color": {
          "separator": "red"
        }
      },
      "modules": [
        {
          "key": "Distro      ",
          "type": "os"
        },
        {
          "key": "Shell       ",
          "type": "shell"
        },
        {
          "key": "Terminal    ",
          "type": "terminal"
        },
        {
          "key": "Display     ",
          "type": "display"
        },
        {
          "key": "Memory      ",
          "type": "memory"
        }
      ]
    }
  '';
}
