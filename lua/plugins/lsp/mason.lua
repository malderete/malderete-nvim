local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
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
        "gopls",
        "pylsp",
        "clangd",
        "bashls",
        "lua_ls",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = false,
})
