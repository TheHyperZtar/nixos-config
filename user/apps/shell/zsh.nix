{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = "fastfetch -c /home/TheHyperZtar/.config/fastfetch/small.jsonc";
    shellAliases = {
      ll = "ls -l";
      switch = "nh os switch";
      update = "nh os switch -u";
      cd = "z";
    };
    oh-my-zsh = {
      enable = true;
      theme = "nanotech";
      plugins = [
        "git"
        "sudo"
      ];
    };
  };
}
