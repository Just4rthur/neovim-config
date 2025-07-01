return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- lazy-load on insert mode
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true, -- enable treesitter integration
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			})

			-- Optional: integrate with nvim-cmp for auto-pair on completion
			local cmp_status, cmp = pcall(require, "cmp")
			if cmp_status then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
}
