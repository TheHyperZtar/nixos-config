{lib, ...}: {
  imports = [
    ./games.nix
    ./emulators.nix
  ];

  home.sessionVariables = lib.mkForce {
    ESDE_APPDATA_DIR = ".es-de";
    MANGOHUD = 1;
    MANGOHUD_DLSYM=1;
  };

  programs = {
    mangohud = {
      enable = true;
      enableSessionWide = true;
      settings = {
        legacy_layout = false;
        gpu_stats = true;
        gpu_load_change = true;
        gpu_load_value = "50,90";
        gpu_text = "GPU";
        cpu_stats = true;
        cpu_temp = true;
        cpu_load_change = true;
        core_load_change = true;
        cpu_load_value = "50,90";
        cpu_text = "CPU";
        ram = true;
        fps = true;
        frametime = true;
        no_display = true;
        position = "top-left";
        round_corners = 8;
        toggle_hud = "Shift_R+F12";
        toggle_logging = "Shift_L+F2";
        upload_log = "F5";
        font_size = lib.mkForce 20;
        background_alpha = lib.mkForce "0.2";
      };
    };
  };
}
