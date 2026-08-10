return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.add({ { "<leader>t", group = "Telescope..." } })
		wk.add({ { "<leader>q", group = "Quickfix..." } })
		wk.add({ { "<leader>a", group = "AI..." } })
		wk.add({ { "<leader>w", group = "Window..." } })
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		delay = function(ctx)
			return ctx.plugin and 0 or 1000
		end,
		icons = {
			mappings = false, -- disable the font icons
			breadcrumb = "»",
			separator = "➜",
			group = "+",
			ellipsis = "…",
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
