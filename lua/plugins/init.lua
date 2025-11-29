return {
    {
        dir = "~/nvim_plugins/neovibe.nvim",
        dev = true,
        name = "neovibe.nvim",
        cmd = "Vibe",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            key = require("config.secrets").ai_key,
            model = "openrouter::deepseek/deepseek-r1:free",
            timeout = 25000,
        },
    },
    -- File explorer
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        event = "VimEnter",
        keys = {
            {
                "<leader>pv",
                "<CMD>Oil<CR>",
                desc = "Open Oil file explorer",
            },
        },
        opts = {
            default_file_explorer = true,
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
        opts = {
            highlight = "DiagnosticHint",
            filetypes_to_ignore = { "netrw", "oil", "dashboard" },
            merge_messages = true,
            messages = {
                "Yea, I don't think this works.",
                "You probably should double check this. yikes.",
                "YIKES...",
                "I feel like there's a better way",
                "Did you even account for the edge case?",
                "ngl, ur so wrong for this.",
            },
        },
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
