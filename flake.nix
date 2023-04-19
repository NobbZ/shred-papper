{
  inputs = {
    nobbz.url = "github:nobbz/nixos-config";

    nixpkgs.follows = "nobbz/nixpkgs";
    parts.follows = "nobbz/parts";

    filter.url = "github:numtide/nix-filter";

    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.all-cabal-json.follows = "nixpkgs";
  };

  outputs = {parts, ...} @ inputs:
    parts.lib.mkFlake {inherit inputs;} {
      debug = true;
      systems = ["x86_64-linux" "aarch64-linux"];

      imports = [inputs.dream2nix.flakeModuleBeta ./nix/shell.nix ./nix/tester.nix];

      perSystem = {
        pkgs,
        inputs',
        ...
      }: {
        formatter = inputs'.nobbz.formatter;
      };
    };
}
