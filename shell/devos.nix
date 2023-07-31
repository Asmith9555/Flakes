{
  pkgs,
  extraModulesPath,
  inputs,
  lib,
  ...
}: let
  inherit
    (pkgs)
    agenix
    alejandra
    cachix
    editorconfig-checker
    nixUnstable
    nodePackages
    shfmt
    treefmt
    nvfetcher-bin
    nixos-generators
    ;

  pkgWithCategory = category: package: {inherit package category;};
  dev = pkgWithCategory "dev";
  formatter = pkgWithCategory "linter";
in {
  imports = ["${extraModulesPath}/git/hooks.nix" ./hooks];

  packages = [
    alejandra
    nodePackages.prettier
    shfmt
    editorconfig-checker
  ];

  commands =
    [
      (dev nixUnstable)
      (dev agenix)
      {
        category = "dev";
        name = nvfetcher-bin.pname;
        help = nvfetcher-bin.meta.description;
        command = "cd $PRJ_ROOT/pkgs; ${nvfetcher-bin}/bin/nvfetcher -c ./sources.toml $@";
      }

      (formatter treefmt)
    ]
    ++ lib.optionals (!pkgs.stdenv.buildPlatform.isi686) [
      (dev cachix)
    ]
    ++ lib.optionals (pkgs.stdenv.hostPlatform.isLinux && !pkgs.stdenv.buildPlatform.isDarwin) [
      (dev nixos-generators)
      (dev inputs.deploy.packages.${pkgs.system}.deploy-rs)
    ];
}