local tokyonight_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_ok then
	return
end

-- Configure and enable
tokyonight.setup({
  style = "night",
  dim_inactive = true,
  lualine_bold = true,

})

vim.cmd("colorscheme tokyonight")
