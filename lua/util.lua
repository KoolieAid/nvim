table.deepcopy = vim.deepcopy

function Cli_exists(...)
    for _, c in ipairs(...) do
        if type(c) ~= "string" then
            return nil, "Argument needs to be a string"
        end

        local out = os.execute(c .. " --version")
        if out == 0 then
            return true, c
        end
    end
    return false, nil
end
