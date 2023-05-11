{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ]
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = import ./. { inherit pkgs; };
        formatter = pkgs.nixpkgs-fmt;
      }) // {
    overlays.default = import ./overlay.nix;
  };
}
