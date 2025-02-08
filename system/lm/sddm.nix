{pkgs, ...}: {
  environment.systemPackages = [pkgs.sddm-astronaut];
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = false;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
    };
    autoLogin = {
      enable = true;
      user = "TheHyperZtar";
    };
    defaultSession = "hyprland";
  };
}
