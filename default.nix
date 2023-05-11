{ pkgs ? import <nixpkgs> { } }: pkgs.lib.makeScope pkgs.newScope (self: with self; {
  sugar-artwork = callPackage ./packages/sugar-artwork { };
  sugar-datastore = callPackage ./packages/sugar-datastore { };
  sugar-toolkit-gtk3 = callPackage ./packages/sugar-toolkit-gtk3 { };
})
