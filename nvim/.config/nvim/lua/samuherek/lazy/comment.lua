return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		-- Not sure if this should/can live here or not.
		-- but it works so let's keep it for now
		vim.filetype.add({
			extension = {
				templ = "templ",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "templ",
			callback = function()
				vim.bo.commentstring = "// %s"
			end,
		})
	end,
}
