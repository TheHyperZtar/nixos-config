{...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        sw = ''sh -c "cd ~/.config/nixos;git add *;git commit -a;git push;nh os switch"'';
        up = ''sh -c "cd ~/.config/nixos;nix flake update;git add *;git commit -a;git push;nh os switch"'';
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
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
