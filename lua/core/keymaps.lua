-- set leader key to space
vim.g.mapleader = ","

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "//", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window

keymap.set("n", "<leader>tt", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab


----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>") -- toggle open file explorer with current file selected

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")              -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")               -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")             -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")                 -- list open buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")               -- list available help tags
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")             -- find in GIT commits
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")              -- list GIT status per file
keymap.set("n", "<leader>ts", "<cmd>TodoTelescope keywords=TODO,FIXME<cr>") -- list todo-comments

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
