{pkgs, ...}: {
  home.packages = with pkgs; [
    jql
    yq
    xsv
  ];
}
