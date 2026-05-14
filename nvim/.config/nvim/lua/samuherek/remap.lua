vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "netwr Explorer" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Ctrl+d and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Ctrl+u and center" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without indent" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")

local function toggle_quickfix()
	local quickfix_open = false
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win.quickfix == 1 then
			quickfix_open = true
			break
		end
	end

	if quickfix_open then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
		for _, win in ipairs(windows) do
			if win["quickfix"] == 1 then
				vim.api.nvim_set_current_win(win.winid)
				break
			end
		end
	end
end

vim.keymap.set("n", "<leader>qe", "", {
	noremap = true,
	silent = true,
	desc = "Toggle quickfix errors",
	callback = function()
		vim.diagnostic.setqflist({
			severity = vim.diagnostic.severity.ERROR,
			open = true,
		})
		-- vim.cmd("copen")
		local windows = vim.fn.getwininfo()
		for _, win in ipairs(windows) do
			if win["quickfix"] == 1 then
				vim.api.nvim_set_current_win(win.winid)
				break
			end
		end
	end,
})

vim.keymap.set("n", "<leader>qw", "", {
	noremap = true,
	silent = true,
	desc = "Toggle quickfix warnings",
	callback = function()
		vim.diagnostic.setqflist({
			severity = vim.diagnostic.severity.WARN,
			open = true,
		})
		-- vim.cmd("copen")
		local windows = vim.fn.getwininfo()
		for _, win in ipairs(windows) do
			if win["quickfix"] == 1 then
				vim.api.nvim_set_current_win(win.winid)
				break
			end
		end
	end,
})

vim.keymap.set("n", "<leader>qt", "", {
	noremap = true,
	silent = true,
	desc = "Toggle quickfix",
	callback = function()
		toggle_quickfix()
	end,
})

local win_maximizer_active = false
local win_maximizer_view = {}

local function win_maximizer_toggle()
	if win_maximizer_active then
		vim.fn.winrestview(win_maximizer_view)
		vim.cmd("wincmd =")
		win_maximizer_active = false
	else
		win_maximizer_view = vim.fn.winsaveview()
		vim.cmd("wincmd _ | wincmd |")
		win_maximizer_active = true
	end
end

vim.keymap.set("n", "<leader>wf", "", {
	noremap = true,
	silent = true,
	desc = "Toggle window maximizer",
	callback = win_maximizer_toggle,
})

-- Split and focus on new split
vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>l", { desc = "Window :vsp and focus" })
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>j", { desc = "Window :sp and focus" })

-- Move around lint errors with looping in a buffer
vim.keymap.set("n", "<leader>n", function()
	vim.diagnostic.goto_next({ wrap = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>p", function()
	vim.diagnostic.goto_prev({ wrap = true })
end, { desc = "Previous diagnostic" })

-- Reloading neovim config from within the opened session
vim.keymap.set("n", "<leader>so", function()
	local reload = require("plenary.reload").reload_module
	reload("samuherek")
	dofile(vim.env.MYVIMRC)
	print("Config reloaded")
end, { desc = "Reload config" })
