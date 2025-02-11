{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [pkgs.swappy];
    file.".config/swappy/config".text = ''
      [Default]
      save_dir=~/Pictures/Screenshots
      save_filename_format=screenshot-%Y%m%d-%H%M%S.png
      show_panel=false
      line_size=5
      text_size=${builtins.toString config.stylix.fonts.sizes.desktop}
      text_font=${config.stylix.fonts.sansSerif.name}
      paint_mode=brush
      early_exit=false
      fill_shape=false
    '';
  };
}
