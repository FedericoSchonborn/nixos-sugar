{ pkgs ? import <nixpkgs> { } }: with pkgs; {
  sugar = lib.recurseIntoAttrs (callPackage ./packages { });
}
