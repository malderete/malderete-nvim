local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    -- packer can manage itself
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- themes
    use("catppuccin/nvim")
    use("folke/tokyonight.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- nice icons
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- indent guides
    use("lukas-reineke/indent-blankline.nvim")

    -- fuzzy finding w/ telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })        -- fuzzy finder

    -- autocompletion
    use("hrsh7th/nvim-cmp")   -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path")   -- source for file system paths

    -- snippets
    use("L3MON4D3/LuaSnip")             -- snippets engine
    use("saadparwaiz1/cmp_luasnip")     -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- LSP servers, linters and formmaters
    use("williamboman/mason.nvim")           -- managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- closes some gaps between mason.nvim and lspconfig

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")                     -- configure language servers
    use("hrsh7th/cmp-nvim-lsp")                      -- for autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- better LSP UIs
    use("onsails/lspkind.nvim")                      -- vs-code like icons for autocompletion

    -- Symbols list based on LSP
    use("simrat39/symbols-outline.nvim")

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- manage special comments such as "TODO", "FIXME"
    use("folke/todo-comments.nvim")

    -- add, delete, change surroundings
    use({ "kylechui/nvim-surround", tag = "*" })

    use({ 'lewis6991/gitsigns.nvim' })

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
