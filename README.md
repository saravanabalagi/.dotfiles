## Quickstart

### 1. Install dependencies

1. tmux

   Install tmux and make sure to check it's version using `tmux -V`. If the version is less than 3.2, then install the latest version. For brew:

   ```sh
   brew install tmux
   ```

2. fonts

   - Download Jetbrains Mono Nerd font from [here](https://www.nerdfonts.com/font-downloads) and install it
   - Set the terminal font to Jetbrains Mono Nerd font
      - For vscode, prepend `"JetBrainsMonoNL NFP"` to `editor.fontFamily`
      - For macOS, import the included [Mocha terminal profile](assets/Mocha.terminal)
      - For other terminals, set the same font using GUI or config file as appropriate

3. tpm 

   Clone the repo to `~/.tmux/plugins/tpm`:

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

4. Other dependencies:
    
   - stow
   - fzf
   - zoxide

   With brew:

   ```sh
   brew install stow fzf zoxide
   ```

<details>
<summary>Alternative installation via conda</summary>

If brew is not available, you can use [conda](https://docs.anaconda.com/miniconda/miniconda-install/). 

To keep the required dependencies isolation from other installations, creata a new sys environment and install the dependencies as follows:

```sh
# Creata and activate conda environment
conda create -n sys python=3.12
conda activate sys

# Install pacakges
conda install -c conda-forge tmux ncurses
conda install -c conda-forge stow fzf zoxide

# To make bins available systemwide
ln -s $(which tmux) ~/.local/bin
ln -s $(which stow) ~/.local/bin
ln -s $(which zoxide) ~/.local/bin
ln -s $(which fzf) ~/.local/bin
```

Note that removing the conda environment `sys` will invalidate the symlinks.
</details>

### 2. Clone repo and symlink

Finally symlink the dotfiles to the home directory:

```sh
git clone https://github.com/saravanabalagi/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Move or remove existing dotfiles, if any
mv ~/.zshrc ~/.zshrc.bak
mv ~/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf.bak

# Symlink the dotfiles
stow .

# Update ~/.zshrc after cloning
# add conda init, path updates, etc. at the end
```

### 3. First time install

- Open a new terminal session and run `tmux`
- Press `prefix` `I` (by default it is `Ctrl+b` `I`; note the caps `I`) to install plugins
- Use `tmux kill-server` to stop and restart tmux, if necessary

## References and Acknowledgements

- Dreams of Autonomy | [Youtube](https://www.youtube.com/watch?v=y6XCebnB9gs)
- Catppuccin Theme | [Website](https://catppuccin.com)
- Nerd Fonts | [Website](https://www.nerdfonts.com/)
- Jetbrains Mono Font | [Website](https://www.jetbrains.com/lp/mono/)
- Tmux Plugin Manager | [Github](https://github.com/tmux-plugins/tpm)
