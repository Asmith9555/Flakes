{ config, lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "rose_pine_dawn";
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };
}
