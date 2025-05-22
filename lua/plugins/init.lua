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
    {
        "KoolieAid/pastevim.nvim",
        cmd = "Pastevim",
        opts = {
            api_key = require("config.secrets").pastebin_key,
            expiry = "10M",
        },
    },
    {
        "m4xshen/hardtime.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        -- Allows free viewing with mouse when just reviewing code
        opts = {
            disable_mouse = false,
            disabled_keys = {
                ["<Up>"] = false,
                ["<Down>"] = false,
            }
        },
    },
}
