return {
    'ThePrimeagen/harpoon',   
    branch = "harpoon2",
    config = function() 
        local harpoon = require('harpoon')

        harpoon:setup()

        vim.keymap.set('n', '<leader>a', function() harpoon:list().append() end)
        vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        --vim.keymap.set('n', '<C-1>', function() harpoon:list().select(1) end)
    end
}
