{
  description = "Terraform Provider for Kong Gateway";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
  utils.lib.eachDefaultSystem (system:
  let

    pkgs = import nixpkgs { inherit system; };

  in {
    devShell = pkgs.mkShell {
      buildInputs = with pkgs; [
        gitAndTools.gitFull
        gnupg
        go
        goreleaser
        vim
      ];
    };
  });
}
