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
        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
        "image/gif" = ["org.gnome.Loupe.desktop"];
        "image/bmp" = ["org.gnome.Loupe.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/x-matroska" = ["mpv.desktop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/flac" = ["mpv.desktop"];
        "inode/directory" = ["nemo.desktop"];
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
    loupe
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
