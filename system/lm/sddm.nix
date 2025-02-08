{pkgs, ...}: {
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = false;
      package = [pkgs.kdePackages.sddm];
    };
    autoLogin = {
      enable = true;
      user = "TheHyperZtar";
    };
    defaultSession = "hyprland";
  };
}
