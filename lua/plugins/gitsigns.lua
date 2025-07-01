return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = true, -- Inline git blame
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 500,
					ignore_whitespace = false,
				},
				on_attach = function(bufnr)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					map("n", "]c", require("gitsigns").next_hunk, "Next Git Hunk")
					map("n", "[c", require("gitsigns").prev_hunk, "Prev Git Hunk")
					map("n", "<leader>gs", require("gitsigns").stage_hunk, "Stage Hunk")
					map("n", "<leader>gr", require("gitsigns").reset_hunk, "Reset Hunk")
					map("n", "<leader>gb", require("gitsigns").blame_line, "Blame Line")
					map("n", "<leader>gS", require("gitsigns").stage_buffer, "Stage Buffer")
				end,
			})
		end,
	},
}
