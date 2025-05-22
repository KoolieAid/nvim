require("config.remap")
require("config.lazy")

-- Changes the shell from Command Prompt to Powershell only if nvim instance is in Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.opt.shell = "powershell"
    vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
    vim.opt.shellxquote = ""
end

if vim.g.neovide then
    require("config.neovide")
end

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end,
})
