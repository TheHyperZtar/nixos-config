{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./Wario.png;
    cursor = {
      package = pkgs.catppuccin-cursors.mochaTeal;
      name = "catppuccin-mocha-teal-cursors";
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
    };
    homeManagerIntegration = {
      autoImport = false;
      followSystem = false;
    };
    polarity = "dark";
    targets = {
      console.enable = true;
      grub.enable = true;
    };
  };
  fonts.packages = [pkgs.nerd-fonts.symbols-only pkgs.corefonts];
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };
}
