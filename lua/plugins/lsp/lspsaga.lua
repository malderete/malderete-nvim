return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        {"nvim-tree/nvim-web-devicons", lazy = true }
    },
    opts = {
        lightbulb = {
            sign = false,  -- Do not show it in the line number column
            virtual_text = true,
        },
        definition = {
            keys = {
                edit = "<CR>",
            },
        },
        outline = {
            keys = {
                jump = "<CR>",
            },
        },
        finder = {
            default = "def+ref",
            keys = {
                toggle_or_open = "<CR>",
                vsplit = "v",
                close = "q",
            }
        },
    },
}
