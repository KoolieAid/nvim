return {
    "nvim-tree/nvim-web-devicons",
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
            }

            alpha.setup(dashboard.opts)
        end,
    },
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = true,
    },
    {
        "nanozuki/tabby.nvim",
        config = function()
            require("tabby.tabline").use_preset("active_wins_at_tail", {
                lualine_theme = "auto",
            })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
}
