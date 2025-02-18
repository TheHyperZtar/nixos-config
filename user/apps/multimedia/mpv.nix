{
  pkgs,
  config,
  ...
}: {
  programs.mpv = {
    enable = true;
    config = {
      profile = "high-quality";
      ao = "pulse";
      vo = "gpu-next";
      scale-antiring = 0.6;
      dither-depth = 8;
      screenshot-format = "png";
      screenshot-dir = "~/Pictures/Screenshots/MPV";
      screenshot-template = "%F-%p-%n";
      slang = "eng,en";
      alang = "jpn,ja";
      deband = "yes";
      osc = "no";
    };
    scripts = with pkgs; [mpvScripts.modernz mpvScripts.thumbfast];
    scriptOpts = {
      modernz = {
        seekbarfg_color = "#${config.lib.stylix.colors.base0C}";
        hover_effect_color = "#${config.lib.stylix.colors.base0C}";
        title = "\${media-title}";
        scalewindowed = 1.0;
        window_controls = "no";
      };
    };
  };
}
