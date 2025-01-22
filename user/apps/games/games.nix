{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    ringracers
    srb2
  ];
}
