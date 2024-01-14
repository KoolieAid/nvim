require("custom.remap")

-- Changes the shell from Command Prompt to Powershell only if nvim instance is in Windows
if vim.loop.os_uname().sysname ~= 'Windows_NT' then return end
vim.opt.shell = 'powershell'
vim.opt.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
vim.opt.shellxquote = ''
