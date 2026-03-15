{
  description = "CLI tool to import JSON secrets from a directory into Akeyless via API";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoTool = (import "${substrate}/lib/go-tool.nix").mkGoTool;
    in {
      packages.default = mkGoTool pkgs {
        pname = "json-secret-importer";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-3CZyy7yQk4c8Q5FICNWJpR3/DyN8UVzI1uGFXfsCXcI=";
        description = "CLI tool to import JSON secrets from a directory into Akeyless via API";
        homepage = "https://github.com/pleme-io/json-secret-importer";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
