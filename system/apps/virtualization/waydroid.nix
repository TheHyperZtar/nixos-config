{pkgs, inputs, ...}: {
  imports = [inputs.nur.modules.nixos.default];
  virtualisation.waydroid.enable = true;
  environment.systemPackages = [pkgs.nur.repos.ataraxiasjel.waydroid-script];
}
