return {
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        keys = {
            {
                "<leader>gs",
                desc = "Open Git status",
            },
        },
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "InsertEnter",
        config = true,
    },
}
