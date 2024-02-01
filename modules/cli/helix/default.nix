{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Dap
    lldb
    # Rust Lint
    dprint
    # MD
    marksman
    # Postgresql
    pgformatter
    # Terraform
    terraform-ls
    #Docker
    docker-compose-language-service
    # C/C#
    clangd
    # Cmake
    cmake-language-server
    # Cue
    cuelsp
    # Clojure
    clojure-lsp
    # Python
    pylsp
    # Vala
    vala-language-server
    # OCaml
    ocamllsp
    # Go
    gopls
    delve
    # TSX/JSX
    vscode-langservers-extracted
    typescript
    nodePackages_latest.typescript-language-server
    # Yaml
    yaml-language-server
    # Nix
    nil
    # TOML
    taplo
    # Rust
    rust-analyzer
    # Rust Libraries
    slint-lsp
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "rose_pine";
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };
}
