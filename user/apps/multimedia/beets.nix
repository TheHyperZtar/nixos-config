{...}: {
  programs.beets = {
    enable = true;
    settings = {
      plugins = ["mbsync" "fetchart"];
      directory = "~/Music";
      import = {
        copy = true;
        write = true;
        unmatched = "~/Music/Miscellaneous";
      };
      paths = {
        default = "$albumartist/$album/$title";
      };
      replace = {
        "_" = "∕";
      };
      mbsync = {
        metadata = ["artist" "album" "albumartist" "title" "track" "year"];
        save_album_art = true;
      };
    };
  };
}
      
