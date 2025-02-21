{...}: {
  programs.beets = {
    enable = true;
    settings = {
      directory = "~/Music";
      import = {
        copy = true;
        write = true;
      };
      plugins = ["fetchart"];
      paths = {
        default = "$albumartist/$album/$title";
      };
      replace = {
        "'/'" = "∕";
      };
    };
  };
}
      
