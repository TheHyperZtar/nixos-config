{...}: {
  programs.beets = {
    enable = true;
    settings = {
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
      
