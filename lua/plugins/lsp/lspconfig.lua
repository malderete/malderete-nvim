return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        cmp_nvim_lsp = require("cmp_nvim_lsp")

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
            }
        }

        -- enable keybinds only for when LSP server available
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

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- LSP servers configuration
        local servers = {
            bashls = {},
            clangd = {},
            puppet = {},
            terraformls = {},
            ts_ls = {},
            gopls = {
                settings = {
                    gopls = {
                        analyses = { unusedparams = true },
                        staticcheck = true,
                    },
                },
            },
            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = { enabled = false },
                            pyflakes = { enabled = false },
                            mccabe = { enabled = false },
                            flake8 = { enabled = true },
                        },
                        configurationSources = { "flake8" },
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            },
        }

        for name, opts in pairs(servers) do
            vim.lsp.config(name, vim.tbl_extend("force", opts, {
                capabilities = capabilities,
                on_attach = on_attach,
            }))
            vim.lsp.enable(name)
        end
  end,
}
