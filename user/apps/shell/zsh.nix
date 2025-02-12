{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      sw = "git add *;git commit -a;git push;nh os switch";
      up = "nix flake update --flake ~/.config/nixos;git add *;git commit -a;git push;nh os switch";
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
