{ pkgs ? import <nixpkgs> { } }: with pkgs; lib.makeScope newScope (self: with self; {
  sugar = callPackage ./sugar { };
  sugar-artwork = callPackage ./sugar-artwork { };
  sugar-datastore = callPackage ./sugar-datastore { };
  sugar-toolkit-gtk3 = callPackage ./sugar-toolkit-gtk3 { };
})
