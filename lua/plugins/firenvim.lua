return {
    {
        "glacambre/firenvim",
        lazy = not vim.g.started_by_firenvim,
        cond = vim.g.started_by_firenvim,
        build = vim.fn["firenvim#install"],
    },
}
