local aerial_ok, aerial = pcall(require, "aerial")
if not aerial_ok then
	return
end

aerial.setup({
    highlight_hovered_item = true,
    show_guides = true,
})
