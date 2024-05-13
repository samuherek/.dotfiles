return {
    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive',
    {
        "NoahTheDuke/vim-just",
        ft = { "just" },
    },
    'folke/zen-mode.nvim',
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    }
    -- 'sbdchd/neoformat',
    -- 'jparise/vim-graphql',
}
