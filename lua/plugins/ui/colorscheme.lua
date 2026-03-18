return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night",
        dim_inactive = true,
        lualine_bold = true,
    },
    config = function(_, opts)
        require('tokyonight').setup(opts)
        vim.cmd.colorscheme("tokyonight-night")
    end,
}
