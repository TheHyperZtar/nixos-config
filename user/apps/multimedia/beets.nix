{...}: {
  programs.beets = {
    enable = true;
    setting = {
      id3v23 = false;
      replace = {
        "/" = "∕";
      };
      plugins = ["fetchart"];
      fetchart = {
        sources = ["beetcamp coverart itunes amazon"];
        high_resolution = true;
      };
    };
  };
}
      
