return {
    {
        "sahlte/timed-highlight.nvim",
        keys = { "/", "?", "*", "#" },
        opts = {
            highlight_timeout_ms = 2500,
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        keys = {
            { "<leader>n", desc = "Open next file" },
            { "<leader>p", desc = "Open previous file" },
            { "<leader>a", desc = "Add file to harpoon" },
            { "<leader>r", desc = "Remove file from harpoon" },
            { "<C-e>",     desc = "Toggle quick menu" },
            { "<C-h>",     desc = "Navigate to file 1" },
            { "<C-j>",     desc = "Navigate to file 2" },
            { "<C-k>",     desc = "Navigate to file 3" },
            { "<C-l>",     desc = "Navigate to file 4" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local harpoon = require("harpoon")
            -- Required for harpoon2
            harpoon:setup()

            -- Might not need these, since <leader>p delays due to Oil and telescope "pf pv"
            -- vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)
            -- vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)

            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<C-j>", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<C-k>", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<C-l>", function()
                harpoon:list():select(4)
            end)
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            {
                "<leader>dg",
                "<CMD>Telescope diagnostics<CR>",
                desc = "Open telescope diagnostics",
            },
            {
                "<leader>pf",
                "<CMD>Telescope find_files<CR>",
                desc = "Find files",
            },
            {
                "<C-p>",
                "<CMD>Telescope git_files<CR>",
                desc = "Find git files",
            },
            {
                "<leader>ps",
                desc = "Grep string",
            },
            {
                "<leader>hh",
                "<CMD>Telescope help_tags<CR>",
                desc = "Find help tags",
            },
        },
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ps", function()
                telescope.live_grep()
            end)

            local actions = require("telescope.actions")

            require("telescope").setup({
                pickers = { colorscheme = { enable_preview = true } },
                defaults = {
                    mappings = {
                        n = { ["<C-c>"] = actions.close },
                        i = { ["<C-c>"] = { "<Esc>", type = "command" } },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
            -- Unsure why this doesn't work when tested
            -- require("telescope").load_extension("csharpls_definition")
        end,
    },
    {
        "mbbill/undotree",
        keys = {
            {
                "<leader>u",
                "<CMD>UndotreeToggle<CR>",
                desc = "Open undo tree",
            },
        },
    },
    -- `gc motion` to comment and `gcc` to comment current line
}
