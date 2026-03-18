return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        ts = require("nvim-treesitter")
        ts.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },
        })
        languages = {
            "json",
            "javascript",
            "yaml",
            "html",
            "css",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "c",
            "cpp",
            "go",
            "puppet",
            "python",
        }
        -- Install some languages by default
        ts.install(languages)

         -- Treesitter features for installed languages must be enabled manually
        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                -- Enable native Neovim treesitter highlighting
                vim.treesitter.start()
            end,
        })
    end,
}
