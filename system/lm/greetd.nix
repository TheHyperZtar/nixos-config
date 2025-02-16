{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "source /home/TheHyperZtar/.nix-profile/etc/profile.d/hm-session-vars.sh; Hyprland";
        user = "TheHyperZtar";
      };
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
