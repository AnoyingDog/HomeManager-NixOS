{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "AnoyingDog";
    userEmail = "AnoyingDog@users.noreply.github.com";
    extraConfig = {
      credential.helper = "!gh auth git-credential";
    };
  };
}
