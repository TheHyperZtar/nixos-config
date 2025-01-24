{...}: {
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      wireplumber = {
        enable = true;
        extraConfig = {
          "99-disable-suspend" = {
            "monitor.alsa.rules" = [
              {
                matches = [
                  {
                    "node.name" = "~alsa_input.*";
                  }
                  {
                    "node.name" = "~alsa_output.*";
                  }
                ];
                actions = {
                  update-props = {
                    "session.suspend-timeout-seconds" = 0;
                    "dither.method" = "wannamaker3";
                    "dither.noise" = 2;
                  };
                };
              }
            ];
            "monitor.bluez.rules" = [
              {
                matches = [
                  {
                    "node.name" = "~bluez_input.*";
                  }
                  {
                    "node.name" = "~bluez_output.*";
                  }
                ];
                actions = {
                  update-props = {
                    "session.suspend-timeout-seconds" = 0;
                    "dither.method" = "wannamaker3";
                    "dither.noise" = 2;
                  };
                };
              }
            ];
          };
        };
      };
    };
  };
}
