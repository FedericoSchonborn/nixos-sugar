{ pkgs ? import <nixpkgs> { } }: pkgs.lib.makeScope pkgs.newScope (self: with self; {
  sugar-artwork = callPackage ./packages/sugar-artwork { };
})
