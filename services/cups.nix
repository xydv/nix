{ pkgs, ... }:

{
  services.printing.enable = true;
  services.printing.cups-pdf.enable = true;
  services.printing.drivers = with pkgs; [ hplip canon-cups-ufr2 ];
}
