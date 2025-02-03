{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./Wario.png;
    cursor = {
      name = "catppuccin-mocha-teal-cursors";
      package = pkgs.catppuccin-cursors.mochaTeal;
      size = 24;
    };
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts-cjk-serif;
      };
      sizes = {
        terminal = 14;
        desktop = 16;
        popups = 14;
      };
    };
    iconTheme = {
      enable = true;
      dark = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "teal";
      };
    };
    polarity = "dark";
    targets = {
      btop.enable = true;
      cava = {
        enable = true;
        rainbow.enable = true;
      };
      dunst.enable = true;
      firefox = {
        enable = true;
        firefoxGnomeTheme.enable = true;
        profileNames = ["TheHyperZtar"];
      };
      fzf.enable = true;
      gtk = {
        enable = true;
        flatpakSupport.enable = true;
      };
      kitty = {
        enable = true;
        variant256Colors = true;
      };
      mangohud.enable = true;
      nixcord.enable = true;
      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };
      qt.enable = true;
      spicetify.enable = true;
      vscode.enable = true;
      yazi.enable = true;
    };
  };
}
