return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = true,
    dependencies = {
        --- Uncomment the two plugins below if you want to manage the language servers from neovim
        --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },
    config = function()
        local lsp = require('lsp-zero')
        require('lspconfig').lua_ls.setup({})

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'rust_analyzer', 'clangd', 'omnisharp', 'omnisharp_mono' },
            handlers = {
                lsp.default_setup,
            }
        })
    end
}
