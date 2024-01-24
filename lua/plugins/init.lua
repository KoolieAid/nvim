return {
    -- File explorer
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
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
            })
        end,
    },
    {
        "notjedi/nvim-rooter.lua",
        config = true,
    },
}
