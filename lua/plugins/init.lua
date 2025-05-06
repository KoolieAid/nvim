return {
    -- File explorer
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        keys = {
            {
                "<leader>pv",
                "<CMD>Oil<CR>",
                desc = "Open Oil file explorer",
            },
        },
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
        cmd = "Rooter",
    },
    {
        "NotAShelf/syntax-gaslighting.nvim",
        event = { "BufRead", "BufAdd" },
        config = true,
    },
}
