{inputs, ...}: {
  imports = [inputs.nixcord.homeManagerModules.nixcord];
  programs.nixcord = {
    enable = true;
    config = {
      frameless = true;
      plugins = {
        fakeNitro.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        viewIcons.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
      };
    };
  };
}
