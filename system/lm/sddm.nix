{pkgs, ...}: {
  environment.systemPackages = [pkgs.sddm-sugar-dark];
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = false;
      package = pkgs.kdePackages.sddm;
      theme = "sugar-dark";
    };
    autoLogin = {
      enable = true;
      user = "TheHyperZtar";
    };
    defaultSession = "hyprland";
  };
}
