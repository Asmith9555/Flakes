{pkgs, ...}: {
  home.packages = with pkgs; [
    julia
    vala
    R
    gleam
    zig
    terraform
    docker-compose
    ocaml
    go
    cue
    dart
  ];
}
