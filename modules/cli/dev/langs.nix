{pkgs, ...}: {
  home.packages = with pkgs; [
    julia
    vala
    zig
    terraform
    ocaml
    go
    cuelsp
    dart
  ];
}
