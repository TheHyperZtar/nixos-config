{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    #thunar = {
    #  enable = true;
    #  plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-dropbox-plugin thunar-media-tags-plugin thunar-volman ];
    #};
    #xfconf.enable = true;
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

  programs.nm-applet.enable = true;

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };
}
