{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = {
      pkgs ? nixpkgs,
      function,
    }:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-macos"
        "aarch64-linux"
        "aarch64-darwin"
      ]
      (system:
        function {
          pkgs = import pkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              #inputs.something.overlays.default
            ];
          };
          inherit system;
        });
  in {
    packages = forAllSystems {
      function = {
        pkgs,
        system,
      }: {
        dev = pkgs.writeShellApplication {
          name = "Amazelm dev server";
          runtimeInputs = with pkgs; [nodePackages.live-server elmPackages.elm entr process-compose];
          text = ''
            process-compose
          '';
        };
      };
    };

    devShells = forAllSystems {
      function = {
        pkgs,
        system,
      }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            elmPackages.elm
            elmPackages.elm-format
          ];

          shellHook = ''
            alias e=exit
            alias nvim="nix run github:ElrohirGT/ConfigurationFiles#vim"
          '';
        };
      };
    };
  };
}
