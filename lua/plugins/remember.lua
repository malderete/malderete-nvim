local remember_setup, remember = pcall(require, "remember")
if not remember_setup then
    return
end


remember.setup({})
