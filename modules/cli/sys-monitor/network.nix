{pkgs, ...}: {
  home.packages = with pkgs; [
    bind
    bmon
    inetutils
    iputils
    nmap
    psmisc
  ];
}
