{pkgs, ...}: {
  environment.defaultPackages = with pkgs; [
    bind
    inetutils
    iputils
    nmap
    psmisc
  ];
}
