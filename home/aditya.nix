{ pkgs, lib, ... }:

{
  home.username = "aditya";
  home.homeDirectory = "/home/aditya";
  home.stateVersion = "25.11";

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      modifier = "Mod4";
      input = {
        "type:touchpad" = {
          tap = "enabled";
          tap_button_map = "lrm";
          natural_scroll = "enabled";
        };
      };
      menu = "${pkgs.bemenu}/bin/bemenu-run";
      keybindings = lib.mkOptionDefault {
        "Mod4+d" = "exec ${pkgs.bemenu}/bin/bemenu-run";
      };
      output = {
        "*" = { scale = "1.25"; };
      };
    };
  };

  home.packages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withMoonlight = true;
    })
    unstable.pear-desktop
    unstable.cloudflared
    unstable.telegram-desktop
    unstable.zed-editor
    unstable.antigravity
    ente-desktop
    mpv
    kdePackages.kdenlive
    helix
    bruno
    devenv
    nixd
    bemenu
  ];

  xdg.configFile."pipewire/pipewire.conf.d/99-input-denoising.conf".text = ''
    context.modules = [
    {   name = libpipewire-module-filter-chain
        args = {
            node.description =  "noise cancelling source"
            media.name =  "noise cancelling source"
            filter.graph = {
                nodes = [
                    {
                        type = ladspa
                        name = rnnoise
                        plugin = librnnoise_ladspa
                        label = noise_suppressor_mono
                        control = {
                            "VAD Threshold (%)" = 97.0
                            "VAD Grace Period (ms)" = 50
                            "Retroactive VAD Grace (ms)" = 0
                        }
                    }
                ]
            }
            audio.rate = 48000
            audio.position = ["MONO"]
            capture.props = {
                node.name =  "capture.rnnoise_source"
                node.passive = true
                audio.rate = 48000
                audio.channels = 1
            }
            playback.props = {
                node.name =  "rnnoise_source"
                media.class = Audio/Source
                audio.channels = 1
            }
        }
    }
    ]
  '';

  imports = [
    ./programs
  ];
}
