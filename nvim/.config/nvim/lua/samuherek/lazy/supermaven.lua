return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})

		vim.keymap.set("n", "<leader>as", function()
			local api = require("supermaven-nvim.api")
			api.toggle()
			if api.is_running() then
				print("Supermaven is running")
			else
				print("Supermaven is stopped")
			end
		end, { desc = "Toggle supermaven" })
	end,
}
