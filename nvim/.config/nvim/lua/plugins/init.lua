return {
    -- Telescope plugin
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Rose pine color theme
    {
        'rose-pine/neovim',
        disable_italics = true,
        name = 'rose-pine',
        -- variant = 'moon',
        -- dark_variant = 'moon',
        -- groups = {
            --   comment = 'muted',
            --}
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = function()
                pcall(require('nvim-treesitter.install').update {with_sync = true})
            end,
            dependencies = {
                'nvim-treesitter/nvim-treesitter-textobjects',
            }
        },
        'L3MON4D3/LuaSnip',
        'nvim-treesitter/playground',
        'ThePrimeagen/harpoon',
        'mbbill/undotree',
        'tpope/vim-fugitive',
        'sbdchd/neoformat',
        'prettier/vim-prettier',
        'jparise/vim-graphql',
        {
            -- Set lualine as statusline
            'nvim-lualine/lualine.nvim',
            -- See `:help lualine.txt`
            opts = {
                options = {
                    icons_enabled = false,
                    theme = 'onedark',
                    component_separators = '|',
                    section_separators = '',
                },
            },
        },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            dependencies = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},             -- Required
                {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
}
