{pkgs, ...}: {
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;
  xdg.mimeApps = {
    defaultApplications = {
      "image/jpeg" = ["org.gnome.Loupe.desktop"];
      "image/png" = ["org.gnome.Loupe.desktop"];
      "image/gif" = ["org.gnome.Loupe.desktop"];
      "image/bmp" = ["org.gnome.Loupe.desktop"];
      "inode/directory" = ["nemo.desktop"];
    };
  };
  home.packages = with pkgs; [
    brightnessctl
    font-manager
    grim
    hyprpicker
    loupe
    lxqt.lxqt-policykit
    nemo-with-extensions
    nemo-fileroller
    pavucontrol
    slurp
    swww
    system-config-printer
    waypaper
  ];
}
