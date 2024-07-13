local installed_lsps = require("config.lsp").installed

local default_lsp_cfg = require("config.lsp").default_cfg

local specific_cfg = require("config.lsp").opts

local function attach_lsp_keymaps()

    -- Enable inlay hints
    vim.lsp.inlay_hint.enable()

    -- Use LspAttach autocommand to only map the following keys
    -- after a language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end,
    })
end

return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = "InsertEnter",
        config = true,
        opts = {
            ensure_installed = installed_lsps,
        },
        dependencies = {
            "williamboman/mason.nvim",
            config = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufAdd" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason_cfg = require("mason-lspconfig")
            mason_cfg.setup_handlers({
                function(ls)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    local opts = table.deepcopy(default_lsp_cfg)
                    opts.capabilities = capabilities

                    if specific_cfg[ls] then
                        local cfg = specific_cfg[ls]
                        for k, v in pairs(cfg) do
                            opts[k] = v
                        end
                    end

                    require("lspconfig")[ls].setup(opts)
                end,
            })

            attach_lsp_keymaps()
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        keys = { "<leader>ca", desc = "Code actions" },
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
