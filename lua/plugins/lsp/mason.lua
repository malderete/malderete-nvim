return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    cmd = "Mason",
    event = "VeryLazy",
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_dap = require("mason-nvim-dap")

        -- Mason Core
        mason.setup({
            log_level = vim.log.levels.ERROR,
            providers = {
                "mason.providers.client" -- To avoid corporate network configurations
            },
        })

        -- Bridge for LSP
        mason_lspconfig.setup({
            ensure_installed = {
                "pylsp",
                "clangd",
                "bashls",
                "lua_ls",
            },
            automatic_installation = false,
        })

        -- Bridge for DAP
        mason_dap.setup({
            ensure_installed = {
                "python",
                "codelldb",
            },
            automatic_installation = false,
            handlers = {},
        })
  end,
}
