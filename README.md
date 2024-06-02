## Quickstart

### Install dependencies

- tpm 
- stow
- fzf
- zoxide

For tpm, simply clone the repo to `~/.tmux/plugins/tpm`:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

For stow, fzf, zoxide, you can use brew:

```
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

```
git clone https://github.com/saravanabalagi/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
mv ~/.zshrc ~/.zshrc.bak
stow .
```
