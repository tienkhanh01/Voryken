local scripts = {
    "https://raw.githubusercontent.com/tienkhanh01/Loader/refs/heads/main/loader.lua",
    "https://codes.voryken.com/raw/iupos6"
}

for _, url in ipairs(scripts) do
    task.spawn(function()
        local ok, err = pcall(function()
            local source = game:HttpGet(url)
            local fn = loadstring(source)

            if not fn then
                error("No se pudo compilar: " .. url)
            end

            fn()
        end)

        if not ok then
            warn("[Loader Error] " .. tostring(err))
        end
    end)
end
