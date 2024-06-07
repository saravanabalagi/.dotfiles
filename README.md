## Quickstart

### Install dependencies

1. fonts

    - Download Jetbrains Mono Nerd font from [here](https://www.nerdfonts.com/font-downloads) and install it
    - Set the terminal font to Jetbrains Mono Nerd font
      - For vscode, prepend `"JetBrainsMonoNL NFP"` to `editor.fontFamily`
      - For macOS, import the included [Mocha terminal profile](assets/Mocha.terminal)
      - For other terminals, set the same font using GUI or config file as appropriate

2. tpm 

Clone the repo to `~/.tmux/plugins/tpm`:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

1. Other dependencies:
   
   - stow
   - fzf
   - zoxide

If brew is available, you can install the dependencies using:

```sh
brew install stow fzf zoxide
```

<details>
<summary>Alternative installation via conda</summary>

If brew is not available, you can use conda:

```
conda create -n sys python=3.9
conda activate sys
conda install -c conda-forge stow fzf zoxide
ln -s $(which tmux) ~/.local/bin
ln -s $(which zoxide) ~/.local/bin
ln -s $(which fzf) ~/.local/bin

# Add ~/.local/bin to PATH
# before shell integrations
# i.e. eval fzf and zoxide
```

Note that removing the conda environment `sys` will invalidate the symlinks.
</details>

### Clone repo and symlink

Finally symlink the dotfiles to the home directory:

```sh
git clone https://github.com/saravanabalagi/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Move or remove existing dotfiles, if any
mv ~/.zshrc ~/.zshrc.bak
mv ~/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf.bak

# Symlink the dotfiles
stow .
```

### Enjoy

- Open a new terminal session and enjoy the new setup.

## Troubleshooting

- If tmux config is not loaded, press `prefix` `I` (by default it is `Ctrl+B` `I`) to install plugins. Use `tmux kill-server` to stop and restart tmux, if necessary.

## References and Acknowledgements

- Dreams of Autonomy | [Youtube](https://www.youtube.com/watch?v=y6XCebnB9gs)
- Catppuccin Theme | [Website](https://catppuccin.com)
- Nerd Fonts | [Website](https://www.nerdfonts.com/)
- Jetbrains Mono Font | [Website](https://www.jetbrains.com/lp/mono/)
- Tmux Plugin Manager | [Github](https://github.com/tmux-plugins/tpm)
