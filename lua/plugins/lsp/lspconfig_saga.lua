local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local lsp_mappings = {
    n = {
        ["gf"] = { "<cmd>Lspsaga finder<cr>", "Find definition, references" },
        ["gi"] = { "<cmd>Telescope lsp_implementations<cr>", "Go to Implementation" },
        ["gd"] = { "<cmd>Lspsaga peek_definition<cr>", "Go to Definition" },
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declaration" },
        ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Show documentation form the word under the cursor" },
        ["<leader>o"] = { "<cmd>Lspsaga outline<cr>", "Outline on right hand side" },
        ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Actions" },
        ["<leader>rn"] = { "<cmd>Lspsaga rename<cr>", "Rename" },
        ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostic Previous" },
        ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostic Next" },
        ["<leader>ss"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Show Symbols" }
    }
}
-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    for mode_name, maps in pairs(lsp_mappings) do
        for keymap, cmd_data in pairs(maps) do
            local opts = { noremap = true, silent = true, buffer = bufnr, desc = cmd_data[2] }
            vim.keymap.set(mode_name, keymap, cmd_data[1], opts)
        end
    end

    if client.server_capabilities.documentFormattingProvider then
        local opts = { noremap = true, silent = true, buffer = bufnr, desc = "Code Format" }
        vim.keymap.set("n", "cf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
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

-- General languages
local languages = {
    "bashls",
    "clangd",
    "puppet",
    "terraformls",
    "ts_ls",
}

for _, lang in ipairs(languages) do
    vim.lsp.config(lang,{
        capabilities = capabilities,
        on_attach = on_attach,
    })
    vim.lsp.enable(lang)
end

-- Customization per language
vim.lsp.config("gopls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})
vim.lsp.enable("gopls")

vim.lsp.config("pylsp", {
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
vim.lsp.enable("pylsp")

vim.lsp.config("lua_ls", {
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
vim.lsp.enable("lua_ls")
