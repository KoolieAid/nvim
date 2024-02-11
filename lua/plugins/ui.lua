-- Copied from https://github.com/goolord/alpha-nvim/blob/main/lua/alpha/themes/dashboard.lua
--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

return {
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

			dashboard.section.buttons.val = {
				button("e", "  New file", "<cmd>enew <CR>"),
				button("SPC p f", "󰈞  Find file", "<leader>pf"),
				button("SPC p s", "󰈬  Find word", "<leader>ps"),
				button("Ctrl e", "  Open harpoon list", "<C-e>"),
				button("` 0", "  Open last session", "`0"),
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
        config = function()
            vim.o.showcmdloc = "statusline"
            require("lualine").setup({
                sections = {
                    lualine_x = {
                        "%S",
                        "fileformat",
                        "filetype",
                    },
                },
            })
        end,
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
		-- Notifications
		"folke/noice.nvim",
		event = "CmdLineEnter",
        config = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
