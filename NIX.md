# Nix Commands

- `nix build .#myEnv`
  - Create pkg & GC root
- `nix develop .`
  - Create dev shell
	- direnv (.envrc) should trigger this automatically with correct deps set up
