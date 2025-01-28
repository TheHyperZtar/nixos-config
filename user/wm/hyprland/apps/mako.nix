{config, lib, pkgs, ...}:
let
  makoOpacity = lib.toHexString (
    ((builtins.ceil (config.stylix.opacity.popups * 100)) * 255) / 100
  );
in
{
  home.packages = [pkgs.libnotify];
  services.mako = {
    enable = true;
    backgroundColor = "${config.lib.stylix.colors.base00} + makoOpacity";
    borderColor = "${config.lib.stylix.colors.base0C}";
    textColor = "${config.lib.stylix.colors.base05}";
    progressColor = "over ${config.lib.stylix.colors.base02}";
    font = "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
    extraConfig = ''
      [urgency=low]
      background-color=${config.lib.stylix.colors.base00}${makoOpacity}
      border-color=${config.lib.stylix.colors.base0C}
      text-color=${config.lib.stylix.colors.base0A}
      [urgency=high]
      background-color=${config.lib.stylix.colors.base00}${makoOpacity}
      border-color=${config.lib.stylix.colors.base0C}
      text-color=${config.lib.stylix.colors.base08}
    '';
  };
}
