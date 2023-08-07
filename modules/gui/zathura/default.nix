{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      # Open document in fit-width mode by default
      set adjust-open "best-fit"

      # One page per row by default
      set pages-per-row 1

      #stop at page boundries
      set scroll-page-aware "true"
      set scroll-full-overlap 0.01
      set scroll-step 100

      #zoom settings
      set zoom-min 10
      set guioptions ""

      # zathurarc-dark

      set font "Berkeley Mono 15"
      set statusbar-h-padding		10
      set statusbar-v-padding		10

      set selection-notification	"true"

      set render-loading "false"
      set scroll-step 50

      set selection-clipboard clipboard

      ### Themes
      
      ## Rose-Pine
      set default-bg                  "#191724"
      set default-fg                  "#e0def4"

      set statusbar-fg                "#e0def4"
      set statusbar-bg                "#555169"

      set inputbar-bg                 "#6e6a86"
      set inputbar-fg                 "#ebbcba"

      set notification-bg             "#e0def4"
      set notification-fg             "#555169"

      set notification-error-bg       "#f6c177"
      set notification-error-fg       "#555169"

      set notification-warning-bg     "#ebbcba"
      set notification-warning-fg     "#555169"

      set highlight-color             "#ebbcba"
      set highlight-active-color      "#eb6f92"

      set completion-bg               "#6e6a86"
      set completion-fg               "#ebbcba"

      set completion-highlight-fg     "#26233a"
      set completion-highlight-bg     "#ebbcba"

      set recolor-lightcolor          "#191724"
      set recolor-darkcolor           "#e0def4"

      set recolor                     "false"
      set recolor-keephue             "false"

      ## Rose-Pine-Moon
      # set default-bg                  "#232136"
      # set default-fg                  "#e0def4"

      # set statusbar-fg                "#e0def4"
      # set statusbar-bg                "#59546d"

      # set inputbar-bg                 "#817c9c"
      # set inputbar-fg                 "#232136"

      # set notification-bg             "#817c9c"
      # set notification-fg             "#232136"

      # set notification-error-bg       "#817c9c"
      # set notification-error-fg       "#ea9a97"

      # set notification-warning-bg     "#817c9c"
      # set notification-warning-fg     "#f6c177"

      # set highlight-color             "#3e8fb0"
      # set highlight-active-color      "#9ccfd8"

      # set completion-bg               "#817c9c"
      # set completion-fg               "#9ccfd8"

      # set completion-highlight-fg     "#e0def4"
      # set completion-highlight-bg     "#9ccfd8"

      # set recolor-lightcolor          "#232136"
      # set recolor-darkcolor           "#e0def4"

      # set recolor                     "false"
      # set recolor-keephue             "false"
      ## Rose-Pine-Dawn
      # set default-bg                  "#faf4ed"
      # set default-fg                  "#575279"

      # set statusbar-fg                "#9893a5"
      # set statusbar-bg                "#fffaf3"

      # set inputbar-bg                 "#6e6a86"
      # set inputbar-fg                 "#faf4ed"

      # set notification-bg             "#6e6a86"
      # set notification-fg             "#faf4ed"

      # set notification-error-bg       "#6e6a86"
      # set notification-error-fg       "#ea9d34"

      # set notification-warning-bg     "#6e6a86"
      # set notification-warning-fg     "#ea9d34"

      # set highlight-color             "#b4637a"
      # set highlight-active-color      "#d7827e"

      # set completion-bg               "#6e6a86"
      # set completion-fg               "#d7827e"

      # set completion-highlight-fg     "#575279"
      # set completion-highlight-bg     "#d7827e"

      # set recolor-lightcolor          "#faf4ed"
      # set recolor-darkcolor           "#575279"

      # set recolor                     "false"
      # set recolor-keephue             "false"
    '';
  };
}
