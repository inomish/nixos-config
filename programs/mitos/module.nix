{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (import ./default.nix {inherit pkgs inputs;})

    
    # Go
    gopls
    golangci-lint-langserver

    # Rust
    clippy
    rust-analyzer
    rustc

    # Slint
    slint-lsp

    # Nix
    nixd
    alejandra

    # Web
    svelte-language-server
    typescript-language-server
    eslint
    vscode-langservers-extracted
    tailwindcss-language-server

    # Config formats
    yaml-language-server
    yamlfmt

    docker-language-server
    dockerfmt
    docker-compose-language-service
  ];
}
