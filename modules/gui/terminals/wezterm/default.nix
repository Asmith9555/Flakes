{
  programs.wezterm = {
    enable = true;
    colorSchemes = {
      foreground = "e0def4";
      background = "#191824";
      cursor_bg = "#524f67";
      cursor_border = "524f67";
      cursor_fg = "e0def4";
      selection_bg = "#2a283e";
      selection_fg = "e0def4";
      ansi = [
          "#26233a"
          "#eb6f92"
          "#31748f"
          "f6c177"
          "9ccfd8"
          "c4a7e7"
          "ebbcba"
          "e0def4"
      ];
      brights = [
          "#6e6a86"
          "#eb6f92"
          "#31748f"
          "f6c177"
          "9ccfd8"
          "c4a7e7"
          "ebbcba"
          "e0def4"
      ];
      tab_bar = {
          background = "#191824";
      };
    };
    extraConfig = ''
       -- Pull in the wezterm API
      local wezterm = require 'wezterm'

      local config = {}
      config = wezterm.config_builder()

      config.use_fancy_tab_bar = false
      config.tab_bar_at_bottom = true
      config.hide_tab_bar_if_only_one_tab = true

      config.use_cap_height_to_scale_fallback_fonts = true;
      config.font = wezterm.font "Berkeley Mono"
      config.line_height = 1.5
      config.font_size = 14.5

      config.background = {
        source = {
          Color = "#191724",
        },
        width = '100%',
        height = '100%',
        opacity = 0.85
      }

      wezterm.on('toggle-background', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if not overrides.background then
          overrides.background = {}
        else
          overrides.background = nil
        end
        window:set_config_overrides(overrides)
      end)

      config.keys = {
        {
          key = 'I',
          mods = 'CTRL',
          action = wezterm.action.EmitEvent 'toggle-background',
        },
      }

      return config
    '';
  };
}