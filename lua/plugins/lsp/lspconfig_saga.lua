local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)                         -- show definition, references
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)          -- go to implementation
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)                -- go to definition
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)          -- go to declaration
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                       -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)                 -- see outline on right hand side
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)            -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                 -- smart rename
    keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>", opts)           -- list diagnostics
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)           -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)           -- jump to next diagnostic in buffer
    keymap.set("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- go to specific symbol

    if client.server_capabilities.documentFormattingProvider then
        keymap.set("n", "cf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LSP servers configuration
local util = require("lspconfig/util")

lspconfig["gopls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

lspconfig["pylsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                mccabe = { enabled = false },
                flake8 = { enabled = true },
            },
            configurationSources = { 'flake8' },
        },
    },
})

lspconfig["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["puppet"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["terraformls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})
