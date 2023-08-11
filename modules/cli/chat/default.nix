{ pkgs, ... }:
{
  home.packages = with pkgs; [
    profanity
    libsignal-protocol-c
  ];
}