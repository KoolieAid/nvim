return {
    installed = {
        "rust_analyzer",
        "clangd",
        "csharp_ls",
        "lua_ls",
    },
    -- The default configuration for the installed LSPs.
    default_cfg = {},
    -- Custom configuration to be injected to default_cfg for the specified LSPs.
    opts = {
        rust_analyzer = {},
    },
}
