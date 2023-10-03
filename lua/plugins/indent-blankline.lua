local setup, indent_blankline = pcall(require, "ibl")
if not setup then
    return
end

indent_blankline.setup({
    indent = {
        char = "│",
    },
    exclude = {
        filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
        },
    },
    scope = {
        enabled = true,
    },
})
