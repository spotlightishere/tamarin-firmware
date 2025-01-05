{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            cmake
            gcc-arm-embedded
          ];
        };

        formatter = pkgs.nixpkgs-fmt;
      }));
}
