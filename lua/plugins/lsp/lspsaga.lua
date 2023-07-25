local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    definition = {
        keys = {
            edit = "<CR>",
        },
    },
    outline = {
        keys = {
            jump = "<CR>",
        },
    },
    finder = {
        default = "def+ref",
        keys = {
            toggle_or_open = "<CR>",
            vsplit = "v",
            close = "q",
        }
    }
})
