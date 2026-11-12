{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    (import ./default.nix {inherit pkgs inputs;})
  ];
}
