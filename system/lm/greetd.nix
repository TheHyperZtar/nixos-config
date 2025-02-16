{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "Hyprland";
        user = "TheHyperZtar";
      };
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
