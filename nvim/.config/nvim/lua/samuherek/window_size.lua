-- Check if the layout is currently centered
local is_centered = false

-- Function to set up the centered Neovim layout
local function centered_vim()
    if not is_centered then
        -- Set Neovim columns to 100
        vim.opt.columns = 100

        -- Vertical split
        vim.cmd('vsplit')

        -- Move to the right window
        vim.cmd('wincmd l')

        -- Resize the left window to 25 columns
        vim.cmd('vertical resize 25')

        is_centered = true
    else
        -- Reset Neovim columns to the default full width
        vim.opt.columns = vim.o.columns

        -- Close the left vertical split
        vim.cmd('wincmd h')
        vim.cmd('q')

        is_centered = false
    end
end

-- Bind the function to the <F2> key
vim.api.nvim_set_keymap('n', '', ':lua centered_vim()<CR>', { noremap = true, silent = true })

-- You can also add the auto-centering on VimEnter if you like:
-- vim.cmd('autocmd VimEnter * lua centered_vim()')
