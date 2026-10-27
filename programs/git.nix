{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    gh
    github-desktop
  ];
}
