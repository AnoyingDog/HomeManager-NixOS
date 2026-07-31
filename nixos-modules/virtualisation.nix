{ pkgs, ... }: 

{
  virtualisation = {
    waydroid.enable = true;
    waydroid.package = pkgs.waydroid-nftables;

    docker.enable = true;

    libvirtd.enable = true;
  };
}
