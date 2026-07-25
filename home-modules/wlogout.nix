{ assets, ... }:

{
  programs.wlogout = {
    enable = true;
  };
  xdg.configFile."wlogout".source = toString (assets.configFiles + "/wlogout");
}
