{ pkgs, ... }:

{
  home.username = "utku";
  home.homeDirectory = "/home/utku";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    yq-go
    tree
    htop
    just
    gh
    lazygit
    nil
    nixfmt
  ];

  # WSL interop: hand URLs to the default Windows browser.
  home.sessionVariables.BROWSER = "explorer.exe";

  programs.git = {
    enable = true;
    settings = {
      user.name = "Halil Utku Demirtaş";
      user.email = "114352159+Urthella@users.noreply.github.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rerere.enabled = true;
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 50000;
    shellAliases = {
      g = "git";
      lg = "lazygit";
      hms = "home-manager switch --flake ~/dotfiles-nix#utku";
    };
  };

  programs.starship.enable = true;
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
  programs.bat.enable = true;
  programs.eza.enable = true;

  # Pairs with github:Urthella/nix-devshells: cd into a repo, get its toolchain.
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings.theme = "tokyonight";
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 50000;
  };
}
