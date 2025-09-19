return {
	{
		"nvimdev/dashboard-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "doom",
			config = {
				header = {
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
				},
                center = {
                    -- New File
                    {
                        icon = "\t\t",
                        icon_hl = "DashboardIcon",
                        desc = "New File",
                        desc_hl = "DashboardDesc",
                        key = "n",
                        key_map = "SPC n n",
                        key_format = "\t\t%s",
                        action = "enew",
                    },
                    -- Find file
                    {
                        icon = "󰈞\t\t",
                        icon_hl = "DashboardIcon",
                        desc = "Find File",
                        desc_hl = "DashboardDesc",
                        key = "f",
                        key_map = "SPC f f",
                        key_format = "\t\t%s",
                        action = "Telescope find_files",
                    },
                    -- Find String
                    {
                        icon = "\t\t",
                        icon_hl = "DashboardIcon",
                        desc = "Find String",
                        desc_hl = "DashboardDesc",
                        key = "s",
                        key_map = "SPC p s",
                        key_format = "\t\t%s",
                        action = "Telescope live_grep",
                    },
                    -- Open File explorer
                    {
                        icon = "\t\t",
                        icon_hl = "DashboardIcon",
                        desc = "Open File Explorer",
                        desc_hl = "DashboardDesc",
                        key = "e",
                        key_map = "SPC p v",
                        key_format = "\t\t%s",
                        action = "Oil",
                    },
                    -- Open Lazy
                    {
                        icon = "\t\t",
                        icon_hl = "DashboardIcon",
                        desc = "Open Lazy",
                        desc_hl = "DashboardDesc",
                        key = "l",
                        key_map = "SPC l",
                        key_format = "\t\t%s",
                        action = "Lazy",
                    },
                    -- Close Neovim
                    {
                        icon = "\t\t",
                        icon_hl = "DashboardIcon",
                        desc = "Close Neovim",
                        desc_hl = "DashboardDesc",
                        key = "q",
                        key_map = "SPC q",
                        key_format = "\t\t%s",
                        action = "q",
                    },
                },
			},
		},
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
        event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sections = {
				lualine_x = {
					"%S", -- What you're currently typing
                    "lsp_status",
					"fileformat",
					"filetype",
				},
			},
		},
	},
	{
		"nanozuki/tabby.nvim",
        event = "TabNew",
		config = function()
			require("tabby.tabline").use_preset("active_wins_at_tail", {
				lualine_theme = "auto",
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
}
