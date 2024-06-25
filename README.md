# My dotfiles

This repository contains my Mac dotfiles for `zsh`, `tmux`, `alacritty`, and `nvim`.

If you plan to use these it'll be worthwhile to check back every once in a while for changes.

## Installation

### Clone the repository into your home directory:

```sh
git clone https://github.com/haozhei/dotfiles.git ~/
```

### Install required plugins:

#### Terminal

- Install Meslo LG Nerd Font:

```sh
brew install font-meslo-lg-nerd-font
```

- Install Powerlevel10k and configure:

```sh
brew install powerlevel10k
p10k configure
```

If you want the Alacritty themes, check out [this repository](https://github.com/alacritty/alacritty-theme)!

#### Neovim

- Install Node.js for `tsserver` and `pyright`:

```sh
brew install node
```

> [!IMPORTANT]  
> My clangd setup is very silicon-specific; you will probably need to change it in `lsp-config.lua`.  
> If you want to use Vulkan, get the Mac SDK [here](https://vulkan.lunarg.com/sdk/home) and emplace back `VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME` into your extensions.

#### Tmux

- Install Tmux Plugin Manager (TPM):

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- Install Tmux plugins:

Press `Ctrl-a` then `I` (capital i) inside tmux to install plugins.

