local ignore_dirs = { "target", "node_modules", ".git" }

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", function()
			local find_cmd = { "rg", "--files", "--no-ignore", "--hidden" }
			for _, dir in pairs(ignore_dirs) do
				table.insert(find_cmd, "--glob")
				table.insert(find_cmd, "!" .. dir)
			end
			builtin.find_files({
				find_command = find_cmd,
			})
		end)
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ts", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.api.nvim_create_user_command("GrepDir", function()
			local dir = vim.fn.expand("%:p")
			builtin.grep_string({ cwd = dir, search = vim.fn.input("Grep dir > ") })
		end, {})
		vim.keymap.set("n", "<leader>tr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>te", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>tw", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
	end,
}
