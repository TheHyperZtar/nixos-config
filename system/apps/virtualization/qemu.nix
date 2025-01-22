{...}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      onShutdown = "shutdown";
    };
    spiceUSBRedirection.enable = true;
  };
  programs.virt-manager.enable = true;
}
