{ pkgs-old, assets, ... }:

{
  home.packages = [
    pkgs-old.neofetch
  ];
  xdg.configFile."neofetch".source = toString (assets.configFiles + "/neofetch");
}
