function table.deepcopy(og)
    local cpy = {}
    for k, v in pairs(og) do
        if type(v) == "table" then
            v = table.deepcopy(v)
        end
        cpy[k] = v
    end
    return cpy
end
