Events = {}
IsWhitelisted = {}
PixelTop = RegisterNetEvent
PixelTop2 = TriggerEvent
PixelTop3 = TriggerServerEvent
print("^1Pixel Module ^2Loaded !")

RegisterNetEvent = function(...)
    IsWhitelisted[...] = false
    PixelTop2('AddToTABLEClient', ...)
    return PixelTop(...)
end

TriggerEvent = function(...)
    local a = tostring(...)
    PixelTop2('AddForWhitelistClient', a)
    return PixelTop2(...)
end

TriggerServerEvent = function(...)
    local a = tostring(...)
    PixelTop3('AddForWhitelistServer', a)
    return PixelTop3(...)
end
