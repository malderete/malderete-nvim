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

    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)      -- go to implementation
    keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)          -- go to definition
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)         -- go to declaration
    keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)          -- show all reference
    keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)                -- show documentation

    keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.bug.rename()<CR>", opts)      -- smart rename

    keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)        -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)        -- jump to next diagnostic in buffer

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
