return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6", -- or use latest
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = { preview_width = 0.6 },
					},
					file_ignore_patterns = { "node_modules", ".git/" },
					sorting_strategy = "ascending",
				},
			})
		end,
	},
}
