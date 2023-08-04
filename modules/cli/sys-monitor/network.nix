{pkgs, ...}: {
  home.packages = with pkgs; [
    bind
    inetutils
    iputils
    nmap
    psmisc
  ];
}
