{ pkgs, ... }:
{
  environment.defaultPacakges = with pkgs; [
    inetutils
    iputils
    nmap
    psmisc
  ];
}