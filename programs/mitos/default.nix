{
  pkgs,
  inputs,
}:
inputs.wrapper-modules.lib.wrapPackage [
  {inherit pkgs;}
  {
    package = inputs.mitos.packages.${pkgs.stdenv.hostPlatform.system}.default;
    env.MITOS_CONFIG_DIR = ./config;
  }
]
