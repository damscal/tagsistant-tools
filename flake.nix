{
  description = "Tagsistant-tools - Tools to enhance tagsistant usage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "tagsistant-tools";
          version = "0.1.1";
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin/tagsistant-command.d
            cp command/tagsistant-tools $out/bin/tagsistant-tools
            cp command/.tagsistant-command.d/* $out/bin/tagsistant-command.d/
            chmod +x $out/bin/tagsistant-tools
            chmod -R +x $out/bin/tagsistant-command.d/
            
            substituteInPlace $out/bin/tagsistant-tools \
              --replace 'commandDirectory=''${HOME}/.tagsistant-command.d/' "commandDirectory=$out/bin/tagsistant-command.d/"
          '';
        };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/tagsistant-tools";
        };
      }
    );
}