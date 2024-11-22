local ufo_status, nvim_ufo = pcall(require, "ufo")
if not ufo_status then
    return
end

-- Using ufo provider need remap `zR` and `zM`
vim.keymap.set('n', 'zR', nvim_ufo.openAllFolds, { desc = "Fold Open all" })
vim.keymap.set('n', 'zM', nvim_ufo.closeAllFolds, { desc = "Fold Close all" })

nvim_ufo.setup()
