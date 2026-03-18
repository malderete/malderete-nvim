## Intro
This repository holds **my personal** configuration for [Nvim](https://neovim.io/).

It contains plugins and configuration that I find useful. All plugins are managed with [Lazy.nvim](https://github.com/folke/lazy.nvim).

> [!important]
> This is NOT intended to be a nvim distribution or a generic framework.


## Plugins
It contains several plugins, grouped by categories.

- Editor
    - [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
    - [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
    - [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
    - [vladdoster/remember.nvim](https://github.com/vladdoster/remember.nvim)
    - [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
    - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

- LSP (Language Server Protocol)
    - [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
    - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
    - [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
    - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

- DAP (Debugging Adapter Protocol)
    - [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

- Navigation & Search
    - [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)
    - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
    - [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

- UI (User Interface)
    - [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
    - [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
    - [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)
    - [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
    - [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    - [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)


## Dependencies
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [gcc](https://gcc.gnu.org/)
- [make](https://www.gnu.org/software/make/)
- [tree-sitter-cli](https://www.npmjs.com/package/tree-sitter-cli)


## Installation

> [!important]
> If you have a previous version which used [Packer](https://github.com/wbthomason/packer.nvim), it is *highly* recommended to remove Packer first.
```shell
$ rm -rf ~/.local/share/nvim/site/pack/packer
```

```bash
$ # Clone the repository
$ git clone https://github.com/malderete/malderete-nvim.git ~/projects/malderete-nvim
$ # Link ~/.config/nvim to ~/projects/malderete-nvim
$ ln -s ~/projects/malderete-nvim ~/.config/nvim
```



## LSP shortcuts
I decided to use LSP for all languages. This allows using the same shortcuts regardless of the programming language.
When an LSP client attaches to a buffer, the following shortcuts become available:
- `gf`: Show definition and references
- `gi`: List implementations
- `gd`: Go to definition
- `gD`: Go to declaration (it is usually not implemented by all LSP servers)
- `K`: Show documentation for the current symbol
- `,o`: Show symbols
- `cf`: code format (only available if LSP server provide the capability)
- `,ca`: See available code actions
- `,rn`: Smart rename
- `,d`: List diagnostics
- `[d`, Jump to previous diagnostic in buffer
- `]d`, Jump to next diagnostic in buffer
- `,ss`, Search symbols in buffer


## Useful shortcuts for navigation
- `,ef`: Toggle file explorer with current file selected
- `,ff`: Fuzzy find files within current working directory, respects .gitignore
- `,fs`: Fuzzy find string in current working directory
- `,fc`: Find string under cursor in current working directory
- `,fb`: List open buffers
- `,fh`: List available help tags
- `,gc`: Find Git commits using Telescope
- `,gs`: List Git status per file
- `,ts`: Find todo comments (TODO, FIXME)


## Others
- `,rs`: Restart LSP server
