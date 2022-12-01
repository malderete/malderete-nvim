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

    if packer_bootstrap then
        require("packer").sync()
    end
end)
