local sorround_status, sorround = pcall(require, "nvim-surround")
if not sorround_status then
    return
end

sorround.setup({})
