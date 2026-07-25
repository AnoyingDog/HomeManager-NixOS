{ pkgs, assets, ... }:

{
  home.packages = [ 
    pkgs.rofi
    pkgs.rofi-emoji
  ];
  home.file.".config/rofi/config.rasi".source = toString (assets.configFiles + "/rofi/config.rasi");
}
