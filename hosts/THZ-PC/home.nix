{pkgs, ...}: {
  home.username = "TheHyperZtar";
  home.homeDirectory = "/home/TheHyperZtar";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  imports = [./../../user];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "video/mp4" = ["mpv.desktop"];
        "video/x-matroska" = ["mpv.desktop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/flac" = ["mpv.desktop"];
        "application/pdf" = ["firefox.desktop"];
        "text/plain" = ["nvim.desktop"];
      };
      associations = {
        added = {
          "text/plain" = ["codium.desktop"];
        };
      };
    };
  };
  programs.htop.enable = true;

  programs.yt-dlp.enable = true;

  home.packages = with pkgs; [
    bottles
    cmatrix
    gimp
    handbrake
    hunspell
    hunspellDicts.es-mx
    libreoffice-fresh
    lua
    maestral-gui
    piper
    pipes
    playerctl
    qalculate-gtk
    qbittorrent
    r2modman
    vscodium
    wev
    yt-dlg
    zapzap
  ];
}
