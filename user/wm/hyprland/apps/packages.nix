{pkgs, ...}: {
  services.blueman-applet.enable = true;
  home.packages = with pkgs; [
    font-manager
    grim
    nemo-with-extensions
    nemo-fileroller
    pavucontrol
    slurp
    swww
    system-config-printer
    waypaper
  ];
}
