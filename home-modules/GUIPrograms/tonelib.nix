{ pkgs, lib, ... }:

{

  xdg.desktopEntries.tonelib-gfx = {
    name = "ToneLib-GFX (PipeWire)";
    genericName = "ToneLib-GFX";
    exec = "pw-jack ${lib.getExe pkgs.tonelib-gfx}";
    icon = "tonelib-gfx";
    terminal = false;
    categories = [ "AudioVideo" "Music" ];
  };


  xdg.desktopEntries.tonelib-metal = {
    name = "ToneLib-Metal (PipeWire)";
    genericName = "ToneLib-Metal";
    exec = "pw-jack ${lib.getExe pkgs.tonelib-metal}";
    icon = "tonelib-metal";
    terminal = false;
    categories = [ "AudioVideo" "Music" ];
  };
}
