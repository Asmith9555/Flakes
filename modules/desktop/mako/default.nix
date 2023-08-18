{ pkgs, ... }:
{
  programs.mako = {
    enable = true;
    extraConfig = ''
      background-color=#191724
      border-size=0
      font=Berkeley Mono 12
      icon-path=${pkgs.rose-pine-icon-theme}/share/icons/rose-pine
      margin=12
      progress-color=over #ebbcba
      text-color=#e0def4
    '';
  };
}