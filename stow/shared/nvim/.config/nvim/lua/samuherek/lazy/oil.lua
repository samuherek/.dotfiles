-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local o = require("oil")

	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = o.get_current_dir(bufnr)

	if not dir then
		return vim.api.nvim_buf_get_name(0)
	end

	vim.api.nvim_set_hl(0, "OilWinbarPrefixModified", {
		fg = "#e5c07b",
		bold = true,
	})

	local prefix
	if vim.bo.modified then
		prefix = "%#OilWinbarPrefixModified#oil:// %*"
	else
		prefix = "oil:// %*"
	end

	dir = dir:gsub("^/", "")
	dir = dir:gsub("/$", "")
	dir = dir:gsub("/", " > ")

	return prefix .. dir
end

return {
	{
		"stevearc/oil.nvim",
		dependencies = {},
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		opts = {
			columns = {
				"permissions",
				"size",
				"mtime",
			},
			view_options = {
				show_hidden = true,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
		},
	},

	{
		"benomahony/oil-git.nvim",
		dependencies = {
			"stevearc/oil.nvim",
		},
	},
}
