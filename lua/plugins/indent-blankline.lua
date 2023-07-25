local setup, indent_blankline = pcall(require, "indent_blankline")
if not setup then
    return
end

indent_blankline.setup({
    char = "│",
    filetype_exclude = {
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
    show_trailing_blankline_indent = false,
    show_current_context = false,
})
