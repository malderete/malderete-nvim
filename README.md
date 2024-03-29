## Dependencies
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [make](https://www.gnu.org/software/make/)


## Installation
```bash
$ # Clone the repository
$ git clone https://github.com/malderete/malderete-nvim.git ~/projects/malderete-nvim
$ # Link ~/.config/nvim to ~/projects/malderete-nvim
$ ln -s ~/projects/malderete-nvim ~/.config/nvim
```


## LSP shortcuts
I decided to use LSP for all languages. This allows, for example, to use exactly the same shortcuts no matter what language we are working on.
When a LSP client is attached to the current buffer it attaches the following shortcuts:
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
- `,gc`: Find Git commits using Telescode
- `,gs`: List Git status per file
- `,ts`: Find todo comments (TODO, FIXME)


## Others
- `,rs`: Restart LSP server
