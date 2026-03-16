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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "tool";
    pname = "json-secret-importer";
    vendorHash = "sha256-3CZyy7yQk4c8Q5FICNWJpR3/DyN8UVzI1uGFXfsCXcI=";
    description = "CLI tool to import JSON secrets from a directory into Akeyless via API";
    homepage = "https://github.com/pleme-io/json-secret-importer";
  };
}
