{ pkgs, ... }:
{
  environment.defaultPacakges = with pkgs; [
    bind
    inetutils
    iputils
    nmap
    psmisc
  ];
}