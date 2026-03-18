return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {"<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git blame current line" } },
    },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "󰐊" },
            topdelete = { text = "~" },
            changedelete = { text = "┆" },
        },
    },
}
