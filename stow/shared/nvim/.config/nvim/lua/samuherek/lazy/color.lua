return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			local palette = {
				base = "#1b1921",
				surface = "#1f1e2a",
				overlay = "#252239",
				muted = "#6e6a86",
				subtle = "#908caa",
				text = "#e0def4",

				love = "#eb6f92",
				gold = "#f6c177",
				rose = "#ebbcba",
				-- pine = "#31748f",
				pine = "#476a78",
				foam = "#9ccfd8",
				iris = "#c4a7e7",

				highlight_low = "#21202e",
				highlight_med = "#403d52",
				highlight_high = "#524f67",
			}

			require("rose-pine").setup({
				disable_background = false,
				disable_italics = true,
				palette = {
					main = palette,
				},
				highlight_groups = {
					["@constant.go"] = { fg = "text" },
					-- LUA
					["@lsp.type.property.lua"] = { fg = "text" },
					-- GO
					["@lsp.type.namespace.go"] = { fg = "text" },
					-- So that string values in HTML tags are whiteish instead
					["@string.special"] = { fg = "gold" },
				},
			})

			vim.cmd("colorscheme rose-pine-main")
		end,
	},
}
