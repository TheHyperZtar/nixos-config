{...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "30x50";
        dmenu = "rofi -dmenu";
        corner_radius = 10;
      };
    };
  };
}

