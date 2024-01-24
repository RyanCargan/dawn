{
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Define the packages required
        packages = with pkgs; [
          gcc
          libffi
        ];

        # Create a development shell
        devEnv = pkgs.mkShell {
          buildInputs = packages;

          shellHook = ''
            # Customize the shell prompt
            PS1="\[\033[1;34m\](nix-flake) \[\033[0m\]$PS1"
          '';
        };
      in
      {
        devShell = devEnv;

        packages = {
          myEnv = devEnv;
        };
      });
}
