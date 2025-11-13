local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local mason_dap_status, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_status then
    return
end

mason.setup({
    log_level = vim.log.levels.ERROR,
    providers = {
        "mason.providers.client" -- To avoid corporate network configurations
    },
})

mason_lspconfig.setup({
    ensure_installed = {
        "pylsp",
        "clangd",
        "bashls",
        "lua_ls",
    },
    automatic_installation = false,
})

mason_dap.setup({
    ensure_installed = {
        "python",
        "codelldb",
    },
    automatic_installation = false,
    -- auto-configure DAP
    handlers = {},
})
