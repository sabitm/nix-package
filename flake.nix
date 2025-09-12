{
  description = "Collection of nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ nixpkgs, ... }:
  let
    # Supported systems
    systems = [ "x86_64-linux" ];
    allSystems = nixpkgs.lib.genAttrs systems;
  in
  {
    packages = allSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        code-cursor = pkgs.code-cursor;
        zed-editor = pkgs.zed-editor;
      }
    );
  };
}
