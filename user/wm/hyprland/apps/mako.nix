{pkgs, ...}: {
  home.packages = [pkgs.libnotify];
  services.mako = {
    enable = true;
    borderRadius = 10;
    borderSize = 3;
    defaultTimeout = 10000;
  };
}
