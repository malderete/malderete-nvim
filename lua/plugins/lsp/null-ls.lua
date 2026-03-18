return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        -- Grupo para formateo automático (evita duplicados al re-cargar)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            -- setup formatters & linters
            sources = {
                --  to disable file types use
                --  --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                formatting.prettier,
                formatting.stylua,
                diagnostics.puppet_lint,
                formatting.puppet_lint,
                formatting.clang_format,
            },
            -- to setup format on save        
            on_attach = function(current_client, bufnr)
                if current_client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                async = false,
                                filter = function(client)
                                    --  only use null-ls for formatting instead of lsp server
                                    return client.name == "null-ls"
                                end,
                                bufnr = bufnr,
                            })
                        end,
                    })
                end
            end,
        })
  end,
}
