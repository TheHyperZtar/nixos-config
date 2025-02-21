{...}: {
  programs.beets = {
    enable = true;
    settings = {
      plugins = [];
      directory = "~/MusicTest";
      import = {
        copy = true;
        write = true;
        unmatched = "~/MusicTest/Miscellaneous";
      };
      paths = {
        default = "$albumartist/$album/$title";
        miscellaneous = "Miscellaneous/$albumartist/$album/$title";
      };
      replace = {
        "_" = "∕";
      };
    };
  };
}
      
