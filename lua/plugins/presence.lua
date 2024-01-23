return {
    'andweeb/presence.nvim',
    -- lazy = true,
    config = function()
        require('presence').setup({
            neovim_image_text = "neovim btw",
        })
    end
}
