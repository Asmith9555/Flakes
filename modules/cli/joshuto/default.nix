{ pkgs, config, ... }:
{
  programs.joshuto = {
    enable = true;
    package = pkgs.joshuto;
    settings = {
      numbered_command = false;

      use_trash = false;
      watch_files = true;
      xdg_open = false;
      xdg_open_fork = false;
      display = {
        # default, hsplit
        mode = "default";
        automatically_count_files = false;
        collapse_preview = true;
        # ratios for parent view (optional), current view and preview
        column_ratio = [
          2 
          3 
          5
        ];
        scroll_offset = 6;
        show_borders = true;
        show_hidden = false;
        show_icons = true;
        tilde_in_titlebar = true;
        # none, absolute, relative
        line_number_style = "none";
        sort = {
        # lexical, mtime, natural
          method = "natural";
          case_sensitive = false;
          directories_first = true;
          reverse = false;
        };
      };
      preview = {
        max_preview_size = 2097152; # 2MB
        preview_script = "~/.config/joshuto/preview_file.sh";
      };
      tab.home_page = "home";
    };
    keymap = builtins.fromTOML (builtins.readFile ./config/keymap.toml);
    mimetype = builtins.fromTOML (builtins.readFile ./config/mimetype.toml);
    theme = builtins.fromTOML (builtins.readFile ./config/theme.toml);
  };
  home = {
    packages = with pkgs; [
      atool
      file
      xlsx2csv
      odt2txt
      mupdf
      pandoc
    ];
    file = {
      ".config/joshuto/on_preview_removed.sh".source = ./config/on_preview_removed.sh;
      ".config/joshuto/on_preview_shown".source = ./config/on_preview_shown;
      ".config/joshuto/preview_file.sh".source = ./config/preview_file.sh;
    };
  };
}
