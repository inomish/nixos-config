{
  flakeConfig,
  pkgs,
  ...
}: let
  fish-helix = pkgs.fetchFromGitHub {
    owner = "nomoruni";
    repo = "fish-helix";
    rev = "baa556bbfdd2cd91945a86a010e5c222b6cffa4f";
    hash = "sha256-Vje+GIaC/PlBCWPNtR8wdPMvhYiJHEXopMyqt4rpEQI=";
  };
in {
  programs.fish = {
    enable = true;

    promptInit = ''
      function fish_prompt
        set_color 81A1C1
        echo -n (prompt_pwd --dir-length=0)" "
        set_color 88C0D0
        echo -n "❯"
        set_color normal
        echo -n " "
      end 

      function hx
        if test -n "$TMUX"
          command ms $argv
        else
          tmux new-session ms
        end
      end

      function fish_mode_prompt
      end

      set -p fish_function_path ${fish-helix}/functions
      set -g fish_key_bindings fish_helix_key_bindings

      bind -M default l forward-char

      set fish_greeting
    '';
  };

  environment = {
    sessionVariables = {
      NH_FLAKE = "${flakeConfig.flakePath}#${flakeConfig.networking.hostName}";
      EDITOR = "ms";
    };
  };
}
