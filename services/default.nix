{
  imports = [
    ./cloudflared.nix
    ./cups.nix
    ./pipewire.nix
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.cloudflare-warp.enable = true;
  # services.tailscale.enable = true;
  services.fprintd.enable = true;
}
