{pkgs, ...}: {
  environment.defaultPackages = with pkgs; [
    jql
    yq
    xsv
  ];
}
