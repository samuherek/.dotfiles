return {
    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive',
    -- 'github/copilot.nvim',
    'folke/zen-mode.nvim',
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    }
    -- 'sbdchd/neoformat',
    -- 'jparise/vim-graphql',
}
