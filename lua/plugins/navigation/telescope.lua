return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
        { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List help tags" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
        { "<leader>ts", "<cmd>TodoTelescope keywords=TODO,FIXME<cr>", desc = "List Tasks" },
    },
    opts = function()
        local actions = require("telescope.actions")

        return {
            defaults = {
                prompt_prefix = "🔭 ",
                selection_caret = "  ",
                layout_config = {
                    horizontal = {
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            pickers = {
                live_grep = { only_sort_text = true },
                grep_string = { only_sort_text = true },
                find_files = { follow = true, hidden = true },
            },
        }
    end,
    config = function()
        require("telescope").load_extension("fzf")
    end,
}
