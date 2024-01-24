return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("habamax")
		end,
	},
	"nvim-tree/nvim-web-devicons",
	{
		"tamton-aquib/staline.nvim",
		config = function()
			require("staline").setup({

				sections = {
					left = {
						" ",
						"right_sep_double",
						"-mode",
						"left_sep_double",
						" ",
						"right_sep",
						"-file_name",
						"left_sep",
						" ",
						"right_sep_double",
						"-branch",
						"left_sep_double",
						" ",
					},
					mid = { "lsp" },
					right = {
						"right_sep",
						"-cool_symbol",
						"left_sep",
						" ",
						"right_sep",
						"- ",
						"-lsp_name",
						"- ",
						"left_sep",
						"right_sep_double",
						"-line_column",
						"left_sep_double",
						" ",
					},
				},

				defaults = {
					fg = "#986fec",
					cool_symbol = " ඞ ",
					left_separator = "",
					right_separator = "",
					-- line_column = "%l:%c [%L]",
					true_colors = true,
					line_column = "[%l:%c]  %p%% ",
					-- font_active = "bold"
				},
				mode_colors = {
					n = "#181a23",
					i = "#181a23",
					ic = "#181a23",
					c = "#181a23",
					v = "#181a23", -- etc
				},
			})
			require("stabline").setup({})
		end,
	},
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
}
