{ config, pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = false;
    settings = {
      main = {
        font = "Berkeley Mono:size=12";
        # dpi-aware = "yes";
        line-height = 16;
        pad = "16x16";
        # vertical-letter-offset = "4px";
        shell = "fish";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        background="191724";
        foreground="e0def4"; 
        regular0="26233a";  # black (Overlay)
        regular1="eb6f92";  # red (Love)
        regular2="31748f";  # green (Pine)
        regular3="f6c177";  # yellow (Gold)
        regular4="9ccfd8";  # blue (Foam)
        regular5="c4a7e7";  # magenta (Iris)
        regular6="ebbcba";  # cyan (Rose)
        regular7="e0def4";  # white (Text)

        bright0="6e6a86";   # bright black (Overlay)
        bright1="eb6f92";   # bright red (Love)
        bright2="31748f";   # bright green (Pine)
        bright3="f6c177";   # bright yellow (Gold)
        bright4="9ccfd8";   # bright blue (Foam)
        bright5="c4a7e7";   # bright magenta (Iris)
        bright6="ebbcba";   # bright cyan (Rose)
        bright7="e0def4";   # bright white (Text)
      };

    };
  };
}
