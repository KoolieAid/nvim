local lsp = require('lsp-zero')
require('lspconfig').lua_ls.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'rust_analyzer', 'clangd', 'csharp_ls', 'omnisharp_mono', 'omnisharp' },
	handlers = {
		lsp.default_setup,
	}
})
