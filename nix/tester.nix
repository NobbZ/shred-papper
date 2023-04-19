{inputs, ...}: let
  inherit (inputs.filter.lib) filter inDirectory matchExt;
in {
  perSystem = {config, ...}: {
    dream2nix.inputs.self = {
      source = filter {
        root = "${inputs.self}";
        include = [
          (inDirectory "src")
          (inDirectory "test")
          "package.json"
          "yarn.lock"
          "tsconfig.json"
        ];
      };

      projects.tester = {
        name = "tester";
        subsystem = "nodejs";
        translator = "yarn-lock";
        subsystemInfo.nodejs = 18;
      };
    };

    packages.tester = config.dream2nix.outputs.self.packages.tester;
  };
}
