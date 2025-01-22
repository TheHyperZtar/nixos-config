{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
      adblock
      volumePercentage
    ];
    enabledCustomApps = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.apps; [
    ];
  };
}
