{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = false;
    pulse.enable = true;
    extraLadspaPackages = [ pkgs.rnnoise-plugin.ladspa ];
  };
  services.pulseaudio.enable = false;
}
