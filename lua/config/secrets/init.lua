local status, val = pcall(require, "config.secrets.values")

if not status then
    return {}
end

return val
