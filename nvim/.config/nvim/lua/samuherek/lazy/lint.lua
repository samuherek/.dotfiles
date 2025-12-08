return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters.requiredfield = {
			cmd = "go",
			stdin = true,
			stream = "both",
			ignore_exitcode = true,
			args = {
				"vet",
				"-vettool=/Users/beatbox/third-party/requiredfield/requiredfield",
				"./...",
			},
			-- parser = function(output, _)
			-- 	print("===== RAW OUTPUT FROM VETOOL =====")
			-- 	vim.print(output)
			-- 	return {}
			-- end,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "requiredfield",
				severity = vim.diagnostic.severity.ERROR,
			}),
		}

		lint.linters_by_ft = {
			go = { "requiredfield" },
		}

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
