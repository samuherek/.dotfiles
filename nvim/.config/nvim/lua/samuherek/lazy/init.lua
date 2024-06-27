return {
    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive',
    {
        'sbdchd/neoformat',
        config = function()
            vim.api.nvim_create_augroup('fmt', { clear = true })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = 'fmt',
                pattern = '*',
                command = 'undojoin | Neoformat'
            })
        end
    },
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
