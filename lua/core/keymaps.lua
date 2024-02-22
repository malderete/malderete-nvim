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
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h") -- left
keymap.set("n", "<C-j>", "<C-w>j") -- down
keymap.set("n", "<C-k>", "<C-w>k") -- up
keymap.set("n", "<C-l>", "<C-w>l") -- right

-- tab management
keymap.set("n", "<leader>tt", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab


----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Explore Files toggle" }) -- toggle open file explorer with current file selected

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })                           -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find in files" })                         -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })            -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })                            -- list open buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List help tags" })                        -- list available help tags
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })                         -- find in GIT commits
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })                           -- list GIT status per file
keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git blame current line" }) -- toggle current line blame
keymap.set("n", "<leader>ts", "<cmd>TodoTelescope keywords=TODO,FIXME<cr>", { desc = "List Tasks" })              -- list todo-comments

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary
