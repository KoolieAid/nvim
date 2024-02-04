return {
    -- Autocompletion engine, adds the completion floating window
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },

    -- The point of where I got no damn clue of what I'm doing
    -- Source engine of snippets, gets the sources from snippet repositories and displays in nvim-cmp
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            -- Collection of snippets / Repository of snippets
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- Bridge of snippets and autocompletion engine, autocompletes based on snippet
    {
        "saadparwaiz1/cmp_luasnip",
        event = "InsertEnter",
    },
    -- Bridge of autocompletion and LSPs, acts like LuaSnip, but the sources are from language servers
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter",
    },
    -- Copilot, autocompletion engine that uses AI to generate code
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },
}
