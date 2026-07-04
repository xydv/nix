{ pkgs, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./system
    ./home/manager.nix
    ./services
    ./programs
    ./hardware
  ];

  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.pam.services = {
    login.fprintAuth = false;
    kde.fprintAuth = false;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.aditya = {
    isNormalUser = true;
    description = "aditya";
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  environment.systemPackages = with pkgs; [
    inputs.pano-scrobbler.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    cloudflare-warp
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
    andika
    agave
  ];
}
