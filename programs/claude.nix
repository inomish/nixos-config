{
  lib,
  pkgs,
  flakeConfig,
  ...
}: let
  skillsDir = ./claude/skills;
  skillFiles = lib.filesystem.listFilesRecursive skillsDir;
  relPath = file: lib.removePrefix "${toString skillsDir}/" (toString file);

  skills = map (file: {
    name = ".claude/skills/${relPath file}";
    value = {
      source = file;
      type = "copy";
      permissions = "0644";
    };
  }) skillFiles;
in {
  environment.systemPackages = with pkgs; [
    claude-code
    python3
  ];

  hjem.users."${flakeConfig.username}".files =
    {
      ".claude/settings.json" = {
        source = ./claude/settings.json;
        type = "copy";
        permissions = "0644";
      };
    }
    // builtins.listToAttrs skills;
}
