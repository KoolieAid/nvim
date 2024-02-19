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
                        icon = " ",
                        icon_hl = "DashboardIcon",
                        desc = "New File",
                        desc_hl = "DashboardDesc",
                        key = "n",
                        key_map = "SPC n n",
                        key_format = "%s",
                        action = "enew",
                    },
                    -- Find file
                    {
                        icon = " 󰈞 ",
                        icon_hl = "DashboardIcon",
                        desc = "Find File",
                        desc_hl = "DashboardDesc",
                        key = "f",
                        key_map = "SPC f f",
                        key_format = "%s",
                        action = "Telescope find_files",
                    },
                    -- Find String
                    {
                        icon = "  ",
                        icon_hl = "DashboardIcon",
                        desc = "Find String",
                        desc_hl = "DashboardDesc",
                        key = "s",
                        key_map = "SPC p s",
                        key_format = "%s",
                        action = "Telescope live_grep",
                    },
                    -- Open File explorer
                    {
                        icon = " ",
                        icon_hl = "DashboardIcon",
                        desc = "Open File Explorer",
                        desc_hl = "DashboardDesc",
                        key = "e",
                        key_map = "SPC p v",
                        key_format = "%s",
                        action = "Oil",
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
					"%S",
					"fileformat",
					"filetype",
				},
			},
		},
	},
	{
		"nanozuki/tabby.nvim",
        event = "VeryLazy",
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
}
