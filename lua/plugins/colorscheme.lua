return {
	{
		"folke/tokyonight.nvim",
		lazy = false, --load on startup
		priority = 1000, --load before other plugins
		config = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("tokyonight-night") --you can change to 'tokyonight-day' etc.

			vim.cmd([[
      highlight Normal       guibg=#000000
      highlight NormalNC     guibg=#000000
      highlight SignColumn   guibg=#000000
      highlight VertSplit    guibg=#000000
      highlight LineNr       guibg=#000000
    ]])
		end,
	},
}
