vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

local samuherek = vim.api.nvim_create_augroup("samuherek", {})

vim.api.nvim_create_autocmd('LSPAttach', {
    group = samuherek,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    end
})

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
            if win['quickfix'] == 1 then
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
        vim.diagnostic.setqflist()
        vim.cmd("copen")
        local windows = vim.fn.getwininfo()
        for _, win in ipairs(windows) do
            if win['quickfix'] == 1 then
                vim.api.nvim_set_current_win(win.winid)
                break
            end
        end
    end
})

vim.keymap.set("n", "<leader>qt", "", {
    noremap = true,
    silent = true,
    callback = function()
        toggle_quickfix()
    end
})

