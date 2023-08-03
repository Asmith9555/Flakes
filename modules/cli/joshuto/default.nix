{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      atool
      file
      xlsx2csv
      odt2txt
      mutool
      pandoc
    ];
  };
  home.file.".config/joshuto".source = ./config;
  programs.joshuto = {
    enable = true;
    package = pkgs.joshuto;
    settings = {
      numbered_command = false;

      use_trash = false;
      watch_files = true;
      xdg_open = true;
      xdg_open_fork = false;
      display = {
        # default, hsplit
        mode = "default";
        automatically_count_files = false;
        collapse_preview = true;
        # ratios for parent view (optional), current view and preview
        column_ratio = [2, 3, 5];
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
    keymap = {
      default_view = {
        keymap = [
          { keys = ["L"], command = "cursor_move_page_middle" },
          { keys = ["M"], command = "cursor_move_page_end" },

          { keys = ["["], command = "parent_cursor_move_up" },
          { keys = ["]"], command = "parent_cursor_move_down" },

          { keys = ["c", "d"], command = ":cd " },
          { keys = ["d", "d"], command = "cut_files" },
          { keys = ["y", "y"], command = "copy_files" },
          { keys = ["y", "n"], command = "copy_filename" },
          { keys = ["y", "."], command = "copy_filename_without_extension" },
          { keys = ["y", "p"], command = "copy_filepath" },
          { keys = ["y", "d"], command = "copy_dirpath" },

          { keys = ["y", "l"], command = "symlink_files --relative=false" },
          { keys = ["y", "L"], command = "symlink_files --relative=true" },

          { keys = ["delete"], command = "delete_files" },
          { keys = ["d", "D"], command = "delete_files" },

          { keys = ["p", "p"], command = "paste_files" },
          { keys = ["p", "o"], command = "paste_files --overwrite=true" },

          { keys = ["a"], command = "rename_append" },
          { keys = ["A"], command = "rename_prepend" },

          { keys = ["m", "t"], command = ":touch " },

          { keys = [" "], command = "select --toggle=true" },
          { keys = ["t"], command = "select --all=true --toggle=true" },
          { keys = ["V"], command = "toggle_visual" },

          { keys = ["w"], command = "show_tasks --exit-key=w" },
          { keys = ["b", "b"], command = "bulk_rename" },
          { keys = ["="], command = "set_mode" },

          { keys = [":"], command = ":" },
          { keys = [";"], command = ":" },

          { keys = ["m", "t"], command = ":touch " },
          { keys = ["m", "k"], command = ":mkdir " },
          { keys = ["c", "w"], command = ":rename " },

          { keys = ["/"], command = ":search " },
          { keys = ["|"], command = ":search_inc " },
          { keys = ["\\"], command = ":search_glob " },
          { keys = ["f"], command = "search_fzf" },
          { keys = ["F"], command = "subdir_fzf" },

          { keys = ["n"], command = "search_next" },
          { keys = ["N"], command = "search_prev" },

          { keys = ["s", "r"], command = "sort reverse" },
          { keys = ["s", "l"], command = "sort lexical" },
          { keys = ["s", "m"], command = "sort mtime" },
          { keys = ["s", "n"], command = "sort natural" },
          { keys = ["s", "s"], command = "sort size" },
          { keys = ["s", "e"], command = "sort ext" },

          { keys = ["m", "s"], command = "linemode size" },
          { keys = ["m", "m"], command = "linemode mtime" },
          { keys = ["m", "M"], command = "linemode sizemtime" },

          { keys = ["g", "r"], command = "cd /" },
          { keys = ["g", "c"], command = "cd ~/.config" },
          { keys = ["g", "d"], command = "cd ~/Downloads" },
          { keys = ["g", "e"], command = "cd /etc" },
          { keys = ["g", "h"], command = "cd ~/" },
          { keys = ["g", "f"], command = "cd ~/Flakes" },
          { keys = ["?"], command = "help" },

          # `Shift + s` enter shell 
          { keys = ["S"], command = "shell fish" },
          #youtube-dl 
          { keys = ["y", "a"], command = ":shell yt-dlp -x --audio-format mp3" },
          { keys = ["y", "v"], command = ":shell yt-dlp -x -ic" },
        ];
      };
      task_view = {
        keymap = [
          { keys = ["arrow_up"], command = "cursor_move_up" },
          { keys = ["arrow_down"], command = "cursor_move_down" },
          { keys = ["home"], command = "cursor_move_home" },
          { keys = ["end"], command = "cursor_move_end" },

          { keys = ["j"], command = "cursor_move_down" },
          { keys = ["k"], command = "cursor_move_up" },
          { keys = ["g", "g"], command = "cursor_move_home" },
          { keys = ["G"], command = "cursor_move_end" },

          { keys = ["w"], command = "show_tasks" },
          { keys = ["escape"], command = "show_tasks" },
        ];
      };
      help_view = {
        keymap = [
          { keys = ["arrow_up"], command = "cursor_move_up" },
          { keys = ["arrow_down"], command = "cursor_move_down" },
          { keys = ["home"], command = "cursor_move_home" },
          { keys = ["end"], command = "cursor_move_end" },

          { keys = ["j"], command = "cursor_move_down" },
          { keys = ["k"], command = "cursor_move_up" },
          { keys = ["g", "g"], command = "cursor_move_home" },
          { keys = ["G"], command = "cursor_move_end" },

          { keys = ["w"], command = "show_tasks" },
          { keys = ["escape"], command = "show_tasks" },
        ];
      }; 
    };
    mimetype = {
      class = {
        audio_default = [
          { command = "mpv", args = [
            "--",
          ] },
          { command = "mediainfo", confirm_exit = true },
        ];

        image_default = [
          { command = "qimgv", args = [
            "--",
          ], fork = true, silent = true },
          { command = "krita", args = [
            "--",
          ], fork = true, silent = true },
          { command = "exiftool", confirm_exit = true },
          { command = "swappy", args = [
            "-f",
          ], fork = true },
        ];

        video_default = [
          { command = "mpv", args = [
            "--",
          ], fork = true, silent = true },
          { command = "mediainfo", confirm_exit = true },
          { command = "mpv", args = [
            "--mute",
            "on",
            "--",
          ], fork = true, silent = true },
        ];

        text_default = [
          { command = "micro" },
          { command = "gedit", fork = true, silent = true },
          { command = "bat", args = [
            "--paging=always",
          ] },
        ];

        reader_default = [{ command = "evince", fork = true, silent = true }];

        libreoffice_default = [{ command = "libreoffice", fork = true, silent = true }];
      };
      extension = {
      ## image formats
        avif.inherit = "image_default";
        bmp.inherit = "image_default";
        gif.inherit = "image_default";
        heic.inherit = "image_default";
        jpeg.inherit = "image_default";
        jpe.inherit = "image_default";
        jpg.inherit = "image_default";
        pgm.inherit = "image_default";
        png.inherit = "image_default";
        ppm.inherit = "image_default";
        webp.inherit = "image_default";

        svg.app_list = [
          { command = "inkview", fork = true, silent = true },
          { command = "inkscape", fork = true, silent = true },
        ];
        tiff.app_list = [
          { command = "qimgv", fork = true, silent = true },
          { command = "krita", fork = true, silent = true },
        ];

        ## audio formats
        flac.inherit = "audio_default";
        m4a.inherit = "audio_default";
        mp3.inherit = "audio_default";
        ogg.inherit = "audio_default";
        wav.inherit = "audio_default";

        ## video formats
        avi.inherit = "video_default";
        av1.inherit = "video_default";
        flv.inherit = "video_default";
        mkv.inherit = "video_default";
        m4v.inherit = "video_default";
        mov.inherit = "video_default";
        mp4.inherit = "video_default";
        ts.inherit = "video_default";
        webm.inherit = "video_default";
        wmv.inherit = "video_default";

        ## text formats
        build.inherit = "text_default";
        c.inherit = "text_default";
        cmake.inherit = "text_default";
        conf.inherit = "text_default";
        cpp.inherit = "text_default";
        css.inherit = "text_default";
        csv.inherit = "text_default";
        cu.inherit = "text_default";
        ebuild.inherit = "text_default";
        eex.inherit = "text_default";
        env.inherit = "text_default";
        ex.inherit = "text_default";
        exs.inherit = "text_default";
        go.inherit = "text_default";
        h.inherit = "text_default";
        hpp.inherit = "text_default";
        hs.inherit = "text_default";
        html.inherit = "text_default";
        ini.inherit = "text_default";
        java.inherit = "text_default";
        js.inherit = "text_default";
        json.inherit = "text_default";
        kt.inherit = "text_default";
        lua.inherit = "text_default";
        log.inherit = "text_default";
        md.inherit = "text_default";
        micro.inherit = "text_default";
        ninja.inherit = "text_default";
        py.inherit = "text_default";
        rkt.inherit = "text_default";
        rs.inherit = "text_default";
        scss.inherit = "text_default";
        sh.inherit = "text_default";
        srt.inherit = "text_default";
        svelte.inherit = "text_default";
        toml.inherit = "text_default";
        tsx.inherit = "text_default";
        txt.inherit = "text_default";
        vim.inherit = "text_default";
        xml.inherit = "text_default";
        yaml.inherit = "text_default";
        yml.inherit = "text_default";

        # archive formats
        7z.app_list = [
          { command = "7z", args = [
            "x",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        bz2.app_list = [
          { command = "tar", args = [
            "-xvjf",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        gz.app_list = [
          { command = "tar", args = [
            "-xvzf",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        tar.app_list = [
          { command = "tar", args = [
            "-xvf",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        tgz.app_list = [
          { command = "tar", args = [
            "-xvzf",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        rar.app_list = [
          { command = "unrar", args = [
            "x",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        xz.app_list = [
          { command = "tar", args = [
            "-xvJf",
          ], confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];
        zip.app_list = [
          { command = "unzip", confirm_exit = true },
          { command = "file-roller", fork = true, silent = true },
        ];

        # misc formats
        aup.app_list = [{ command = "audacity", fork = true, silent = true }];

        m3u.app_list = [
          { command = "micro" },
          { command = "mpv" },
          { command = "gedit", fork = true, silent = true },
          { command = "bat", confirm_exit = true },
        ];

        odt.inherit = "libreoffice_default";
        odf.inherit = "libreoffice_default";
        ods.inherit = "libreoffice_default";
        odp.inherit = "libreoffice_default";

        doc.inherit = "libreoffice_default";
        docx.inherit = "libreoffice_default";
        xls.inherit = "libreoffice_default";
        xlsx.inherit = "libreoffice_default";
        ppt.inherit = "libreoffice_default";
        pptx.inherit = "libreoffice_default";
        pdf.inherit = "reader_default";
        kra.app_list = [{ command = "krita", fork = true, silent = true }];
        kdenlive.app_list = [{ command = "kdenlive", fork = true, silent = true }];
        tex.app_list = [
          { command = "micro" },
          { command = "gedit", fork = true, silent = true },
          { command = "bat", confirm_exit = true },
          { command = "pdflatex" },
        ];
        torrent.app_list = [{ command = "transmission-gtk" }];
      };
      mimetype = {
        application.subtype.octet-stream.inherit = "video_default";
        text.inherit = "text_default";
        video.inherit = "video_default";
      };
    }
  };
}
