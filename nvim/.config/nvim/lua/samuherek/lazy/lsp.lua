return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		require("mason").setup({})
		-- vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
		require("lspconfig").dartls.setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"rust_analyzer",
				"lua_ls",
				"htmx",
				"html",
				"pyright",
				"gopls",
				"templ",
				"clangd",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["rust_analyzer"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.rust_analyzer.setup({
						settings = {
							checkOnSave = { command = "clippy" },
						},
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set({ "n", "v" }, "<C-A>", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<C-S>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
			end,
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- TODO: change to something else. I use C-Space for alfred
				["<C-y>"] = cmp.mapping.complete(),
				-- This is the old defaults from the git repo
				--['<C-b>'] = cmp.mapping.scroll_docs(-4),
				--['<C-f>'] = cmp.mapping.scroll_docs(4),
				--['<C-e>'] = cmp.mapping.abort(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
