return {
    {
        "sahlte/timed-highlight.nvim",
        opts = {
            highlight_timeout_ms = 2500,
        },
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>n", ui.nav_next)
            vim.keymap.set("n", "<leader>p", ui.nav_prev)

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>r", mark.rm_file)

            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function()
                ui.nav_file(1)
            end)
            vim.keymap.set("n", "<C-j>", function()
                ui.nav_file(2)
            end)
            vim.keymap.set("n", "<C-k>", function()
                ui.nav_file(3)
            end)
            vim.keymap.set("n", "<C-l>", function()
                ui.nav_file(4)
            end)
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        keys = {
            {
                "<leader>dg",
                "<CMD>Telescope diagnostics<CR>",
                desc = "Open telescope diagnostics",
            },
        },
        config = function()
            local telescope = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
            vim.keymap.set("n", "<C-p>", telescope.git_files, {})
            vim.keymap.set("n", "<leader>ps", function()
                telescope.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            require("telescope").setup({
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    },
                },
            })
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },
}
