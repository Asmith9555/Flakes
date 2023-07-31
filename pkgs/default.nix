final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) {};
  # then, call packages with `final.callPackage`
  let
      dirContents = builtins.readDir ../pkgs;
      genPackage = name: {
        inherit name;
        value = final.callPackage (../pkgs + "/${name}") { };
      };
      names = builtins.attrNames dirContents;
    in
    builtins.listToAttrs (map genPackage names);
}
