vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
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
	callback = function()
		toggle_quickfix()
	end,
})

local win_maximizer_active = false;
local win_maximizer_view = {};

local function win_maximizer_toggle()
    if win_maximizer_active then
        vim.fn.winrestview(win_maximizer_view)
        vim.cmd("wincmd =")
        win_maximizer_active = false
    else
        win_maximizer_view = vim.fn.winsaveview()
        vim.cmd("wincmd _ | wincmd |")
        win_maximizer_active= true
    end
end

vim.keymap.set("n", "<C-w>f", "", {
    noremap = true,
    silent = true,
    callback = win_maximizer_toggle
})
