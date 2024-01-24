return {
	-- File explorer
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
				"size",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name)
					return vim.startswith(name, ".") and name ~= "../"
				end,
			},
		},
	},
	{
		"notjedi/nvim-rooter.lua",
		config = true,
	},
}
