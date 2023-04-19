{...}: {
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages = builtins.attrValues {
        inherit (inputs'.nobbz.packages) nil alejandra;
        inherit (pkgs) nodejs yarn;
      };
    };
  };
}
