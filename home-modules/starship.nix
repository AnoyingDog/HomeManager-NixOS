{ assets, ... }:

{
  programs.starship = {
      enable = true;
      enableFishIntegration = true;
  };

  xdg.configFile."starship.toml".source = toString (assets.configFiles + "/starship.toml");
}
