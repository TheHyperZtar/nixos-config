{pkgs, ...}: {
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;
  home.packages = with pkgs; [
    brightnessctl
    font-manager
    grim
    hyprpicker
    nemo-with-extensions
    nemo-fileroller
    pavucontrol
    slurp
    swww
    system-config-printer
    waypaper
  ];
}
