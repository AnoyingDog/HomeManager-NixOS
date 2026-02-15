{ config, pkgs, ... }:

let
# Cursor configuration - change these variables to switch themes
cursorTheme = "BreezeX-RosePine";
cursorPackage = pkgs.rose-pine-cursor;
cursorSize = 24;
in
{
# Install cursor theme
  home.packages = [ cursorPackage ];

# Set cursor theme for the home environment
  home.pointerCursor = {
    name = cursorTheme;
    package = cursorPackage;
    size = cursorSize;

# Enable for both GTK and X11
    gtk.enable = true;
    x11.enable = true;
  };

# GTK 2.0 configuration
  gtk = {
    enable = true;

    gtk2.extraConfig = ''
      gtk-cursor-theme-name="${cursorTheme}"
      gtk-cursor-theme-size=${toString cursorSize}
    '';

# GTK 3.0 and 4.0 configuration
    gtk3.extraConfig = {
      gtk-cursor-theme-name = cursorTheme;
      gtk-cursor-theme-size = cursorSize;
    };

    gtk4.extraConfig = {
      gtk-cursor-theme-name = cursorTheme;
      gtk-cursor-theme-size = cursorSize;
    };
  };

# Qt configuration using qt5ct/qt6ct
  qt = {
    enable = true;
    platformTheme.name = "qtct";  # Use qt5ct/qt6ct for configuration
      style.name = "kvantum";  # Optional: Kvantum theme engine
  };

# Set environment variables for cursor theme
  home.sessionVariables = {
# Xcursor settings
    XCURSOR_THEME = cursorTheme;
    XCURSOR_SIZE = toString cursorSize;

# Additional variables for compatibility
    XCURSOR_PATH = "${config.home.homeDirectory}/.icons:${config.home.homeDirectory}/.local/share/icons:/usr/share/icons";
  };

# Create .icons directory and symlink the cursor theme
  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
      Comment=Default Cursor Theme
      Inherits=${cursorTheme}
  '';

# Ensure cursor theme is available in local icons directory
  home.activation.linkCursorTheme = config.lib.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p $HOME/.icons
    $DRY_RUN_CMD ln -sf ${cursorPackage}/share/icons/* $HOME/.icons/
                                                       '';

# Optional: Configure cursor for specific applications

# For Electron apps (VSCode, Discord, etc.)
home.file.".config/electron-flags.conf".text = ''
--enable-features=UseOzonePlatform
--ozone-platform=wayland
--cursor-theme=${cursorTheme}
'';

# For Wayland compositors (if using Wayland)
wayland.windowManager.hyprland = {
# Uncomment if using Hyprland
enable = true;
settings = {
env = [
"XCURSOR_THEME,${cursorTheme}"
"XCURSOR_SIZE,${toString cursorSize}"
];
};
};

# For XFCE (if using XFCE)
xfconf.settings = {
# Uncomment if using XFCE
# "xsettings" = {
#   "Gtk/CursorThemeName" = cursorTheme;
#   "Gtk/CursorThemeSize" = cursorSize;
# };
};
}
