{pkgs, ...}: {
  home = {
    username = "TheHyperZtar";
    homeDirectory = "/home/TheHyperZtar";
    packages = with pkgs; [
      bottles
      gimp
      hunspell
      hunspellDicts.es-mx
      libreoffice-fresh
      maestral-gui
      picard
      piper
      qalculate-gtk
      zapzap
    ];
  };
  programs = {
    home-manager.enable = true;
    htop.enable = true;
  };
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
}
