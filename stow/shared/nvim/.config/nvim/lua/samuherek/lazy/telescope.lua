local ignore_dirs = { "target", "node_modules", ".git" }

return {
	"nvim-telescope/telescope.nvim",
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
		end, { desc = "Grep string" })

		local function current_directory()
			if vim.bo.filetype == "oil" then
				return require("oil").get_current_dir()
			end

			return vim.fn.expand("%:p:h")
		end

		vim.keymap.set("n", "<leader>tds", function()
			local dir = current_directory()
			if dir == nil then
				vim.notify("Could not determine directory", vim.log.levels.ERROR)
				return
			end

			builtin.grep_string({
				cwd = dir,
				search = vim.fn.input("Grep dir > "),
			})
		end, { desc = "Grep current directory" })

		-- vim.keymap.set("n", "<leader>fp", function()
		-- 	builtin.live_grep()
		-- end, { desc = "Grep project" })

		-- vim.api.nvim_create_user_command("GrepDir", function()
		-- 	local dir
		--
		-- 	if vim.bo.filetype == "oil" then
		-- 		dir = require("oil").get_current_dir(0)
		-- 	else
		-- 		dir = vim.fn.expand("%:p:h")
		-- 	end
		--
		-- 	if not dir then
		-- 		vim.notify("Could not determine directory", vim.log.levels.ERROR)
		-- 		return
		-- 	end
		--
		-- 	builtin.grep_string({
		-- 		cwd = dir,
		-- 		search = vim.fn.input("Grep dir > "),
		-- 	})
		-- end, { desc = "Grep directory" })

		-- COMMENT: this is old stuff that worked in the netrw plugin but not in oil
		-- vim.api.nvim_create_user_command("GrepDir", function()
		-- 	local dir = vim.fn.expand("%:p")
		-- 	builtin.grep_string({ cwd = dir, search = vim.fn.input("Grep dir > ") })
		-- end, { desc = "Grep directory" })

		vim.keymap.set("n", "<leader>tr", builtin.lsp_references, { desc = "References" })
		vim.keymap.set("n", "<leader>te", builtin.lsp_document_symbols, { desc = "Document symbols" })
		vim.keymap.set("n", "<leader>tw", builtin.grep_string, { desc = "Word" })
		vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Help" })
	end,
}
