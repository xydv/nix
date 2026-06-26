{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = ["crimson-theme"];
    userSettings = {
      ui_font_size = 20;
      ui_font_family = "Agave";
      buffer_font_size = 20;
      buffer_font_family = "Agave";
      autosave = {
        after_delay = { milliseconds = 1000; };
      };
      colorize_brackets = true;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      project_panel = {
        diagnostic_badges = true;
        dock = "right";
      };
      collaboration_panel = {
        dock = "right";
      };
      outline_panel = {
        dock = "right";
      };
      git_panel = {
        dock = "right";
      };
      theme = {
        mode = "system";
        light = "Crimson Light";
        dark = "Crimson Dark";
      };
      lsp = {
        rust-analyzer = {
          binary = {
            path = lib.getExe pkgs.rust-analyzer;
          };
        };
      };
    };
  };
}
