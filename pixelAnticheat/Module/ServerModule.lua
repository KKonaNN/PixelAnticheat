Events = {}
IsWhitelisted = {}
PixelTop = RegisterNetEvent
PixelTop2 = TriggerEvent
PixelTop3 = RegisterServerEvent
KirKhar = TriggerClientEvent

TriggerClientEvent = function(X1,X2,...)
    KirKhar('AddForWhitelistClient',X2,X1)
    return KirKhar(X1,X2,...)
end

RegisterNetEvent = function(...)
    PixelTop2('AddToTABLEServerNet', ...)
    IsWhitelisted[...] = false
    return PixelTop(...)
end
RegisterServerEvent = function(...)
    PixelTop2('AddToTABLEServerEvent', ...)
    IsWhitelisted[...] = false
    return PixelTop3(...)
end
TriggerEvent = function(...)
    local a = tostring(...)
    PixelTop2('AddForWhitelistServer', a)
    return PixelTop2(...)
end
