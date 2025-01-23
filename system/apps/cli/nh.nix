{...}: {
  programs.nh = {
    enable = true;
    flake = "/home/TheHyperZtar/.config/nixos";
    clean = {
      enable = true;
    };
  };
}
