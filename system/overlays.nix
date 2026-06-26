{ inputs, ... }:

{
  nixpkgs.overlays = [
    # inputs.ytm-player.overlays.default
    (final: prev:
      let
        unstable-pkgs = import inputs.nixpkgs-unstable {
          system = prev.stdenv.hostPlatform.system;
          config.allowUnfree = true;
          config.allowUnsupportedSystem = true;
        };
      in
      {
        inherit (unstable-pkgs) pear-desktop;
        unstable = unstable-pkgs;
      }
    )
  ];
}
