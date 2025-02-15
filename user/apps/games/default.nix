{lib, ...}: {
  imports = [
    ./games.nix
    ./emulators.nix
  ];

  programs = {
    mangohud = {
      enable = true;
      settings = {
        gpu_stats = true;
        gpu_temp = true;
        gpu_load_change = true;
        gpu_load_value = "50,90";
        gpu_text = "GPU";
        gpu_list = 1;
        gpu_mem_temp = true;
        vram = true;
        cpu_stats = true;
        cpu_temp = true;
        cpu_load_change = true;
        core_load_change = true;
        cpu_load_value = "50,90";
        cpu_text = "CPU";
        ram = true;
        fps = true;
        fps_color_change = true;
        frame_timing = 0;
        round_corners = 8;
        no_display = true;
        toggle_hud = "Shift_R+F12";
        toggle_logging = "Shift_L+F2";
        upload_log = "F5";
        font_size = lib.mkForce 20;
        background_alpha = lib.mkForce 0.2;
      };
    };
  };
}
