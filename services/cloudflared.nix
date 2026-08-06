{
  services.cloudflared = {
    enable = false;
    tunnels = {
      "thinkpad" = {
        credentialsFile = "/home/aditya/.cloudflared/a3a0512b-6c48-44f9-b760-15d6cf7d1232.json";
        default = "http_status:404";
        ingress = {
          "thinkpad.aditya.stream" = {
            service = "http://localhost:3000";
          };
        };
      };
    };
  };
}
