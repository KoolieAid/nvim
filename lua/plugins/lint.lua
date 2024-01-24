local formatters = {
    "stylua",
    "rustfmt",
}

local diagnostics = {}

local completions = {
    "spell",
}

local function append_to_source(plugin, source, type, list)
    for _, v in ipairs(list) do
        table.insert(source, plugin.builtins[type][v])
    end
end

return {
    {
        "nvimtools/none-ls.nvim",
        name = "null-ls",
        config = function()
            local null_ls = require("null-ls")
            local source_list = {}

            append_to_source(null_ls, source_list, "formatting", formatters)
            append_to_source(null_ls, source_list, "diagnostics", diagnostics)
            append_to_source(null_ls, source_list, "completion", completions)

            null_ls.setup({
                sources = source_list,
            })

            -- null_ls.setup({
            -- 	sources = {
            -- 		null_ls.builtins.formatting.stylua,
            -- 		null_ls.builtins.formatting.rustfmt,
            -- 		-- null_ls.builtins.diagnostics.rustfmt,
            -- 		null_ls.builtins.completion.spell,
            -- 	},
            -- })
        end,
    },
}
