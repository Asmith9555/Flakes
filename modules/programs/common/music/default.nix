{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      mpc-cli
      go-musicfox
    ];
  };
  programs = {
    ncmpcpp = {
      enable = true;
    };
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
    };
  };
}
