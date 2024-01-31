{ pkgs, ... }:
{
  home.packages = with pkgs; [
    marksman
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
