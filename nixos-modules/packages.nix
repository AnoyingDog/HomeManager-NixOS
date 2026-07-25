{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
      playerctl
      brightnessctl
      fanctl
      ethtool
      linuxPackages.cpupower

      waydroid-helper

      jack2
      pipewire
      wireplumber
      alsa-utils
      pipewire.jack

  ];
}
