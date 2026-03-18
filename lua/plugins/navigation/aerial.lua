return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {"<leader>ss", "<cmd>AerialToggle<cr>", { desc = "Show Symbols toggle" } },
    },
    opts = {
        highlight_on_hover = true,
        show_guides = true,
    },
}
