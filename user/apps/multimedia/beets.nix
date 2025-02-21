{...}: {
  programs.beets = {
    enable = true;
    settings = {
      plugins = ["mbsync" "fetchart"];
      directory = "~/Music";
      import = {
        copy = true;
        write = true;
      };
      paths = {
        default = "$albumartist/$album/$title";
      };
      replace = {
        "_" = "∕";
      };
    };
  };
}
      
