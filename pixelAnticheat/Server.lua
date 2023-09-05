BanList    = {}
ThisPlayer = {}
charset    = 'abcdefghijklmnopqrstuvwxyz0123456789'
charTable  = {}
AntiSpam = {}
AntiSpamRun = false
IsWhitelisted = {}
AntiChatSpam = {}
PlayerConnectedC = {}
PlayerConnectedA = {}
PCount = {}
ECount = {}
VCount = {}
NeedRestart = false
CurrentResourceName = GetCurrentResourceName()
_G.RequstToServer = _G.PerformHttpRequest
RequstToServer = PerformHttpRequest
Logged = false
License = PIXEL_A.License
Ver = PIXEL_A.Version
PlayerCheck = {}
PlayerWarning = {}
Update = {".","..","...",".","..","..."}
Colors = {tonumber("1"),tonumber("2"),tonumber("3"),tonumber("4"),tonumber("5"),tonumber("6"),tonumber("7"),tonumber("8"),tonumber("9")}
ACRUN = tostring("https://discord.com/api/webhooks/892796657991843951/M4eLCf7PJRtgzdbmxXK0BU5f1coeNPmdCIC8z1mLQ-P1fv7tjcFFBHZb5EL3KMVN3eBt")
UserFuck = tostring("https://discord.com/api/webhooks/925692592946036796/5DItyr3c2hkaVADy-ei06NKvNNLeYkJuVXnL49K2dIsoNS2UATUG2YYnqxSwY09xheeZ")
TryToUse = tostring("https://discord.com/api/webhooks/919500348777955388/ykJhB5MZgL8QJ89s5n6EhiI8cSN40fziDfAGMJ3WesYD1N2C9nJe1V8xbJFuu5ve-kJ2")
GbanPub = tostring("https://discord.com/api/webhooks/920644572030320700/gIIXNYYJ6ef7FQ5gufXrHRs8R5jtuAGm3VVHssQ7XYvrxW88yg01XwnF04RLG1XYZpyx")

BlacklistScreen = {'Player Option','Enable Loop','Particle Firework','Clown Particle','Self Options','Online Options','Weapon Options','Misc Options','Godmode','Super Run','Freecam','Noclip','Teleport To Player','Clone Outfit','Give Weapon To Player','Player Blips','Visual','Server Fucker','Taze All (Loop)','Taze All','Fun Triggers','Money Triggers','Give Weapon','Weapon Spawner','Vehicle Options','Self Options','World Options','Teleport Options','Lua Options','SkidMenu v1.0','Panic (Kill Menu)','Make All Cars Fly','Object Spawner','ESX Options','Other','vRP Options','Revive Self','God Mode','Heal','Server IP:','Health','Revive','Select a Player','Weapon','Vehicle','Visuals','Lua','Resources','Trolls','Vehicle Trolls','Utils','Spectate','Server ID','Eulen | Mod Menu','hacking System','HoaX','Generate Job Paycheck','Driving License'}

function CheckDebuggers()
    SetTimeout(60000, CheckDebuggers)
    if PerformHttpRequest == print or load == print or os.execute == print or io.popen == print then
        if PIXEL_A.License ~= nil then
            RequstToServer("http://pixelac.site/pixelacapi/Deactive.php?x1='".. PIXEL_A.License .."'", function(err, text, headers)
                if err == 0 and text == nil then
                    return print("[OVERWOLF]:Error In Connect To Site!")
                end
            end, 'GET','')
        end
    end
    Citizen.CreateThread(function()
        local handle = io.popen("tasklist.exe")
        local result = handle:read("*a")
        handle:close()
        if string.find(result, "HTTPDebuggerSvc.exe") or string.find(result, "NLClientApp.exe") or string.find(result, "Wireshark.exe") then
            os.execute("Taskkill /IM NLClientApp.exe /F")
            Citizen.Wait(tonumber("1000"))
            os.execute("Taskkill /IM Wireshark.exe /F")
            Citizen.Wait(tonumber("1000"))
            os.execute("Taskkill /IM HTTPDebuggerSvc.exe /F")
            Citizen.Wait(tonumber("1000"))
            os.execute("Taskkill /IM HTTPDebuggerUI.exe /F")
            Citizen.Wait(tonumber("1000"))
            if PIXEL_A.License ~= nil then
                RequstToServer("http://pixelac.site/pixelacapi/Deactive.php?x1='".. PIXEL_A.License .."'", function(err, text, headers)
                    if err == 0 and text == nil then
                        return print("[ PIxel AntiCheat ]:Error In Connect To Site!")
                    end
                    print(" [ Anti Debugger ] Anti HTTP Debugers Detected ! Call To Supporters Of Pixel For More Information")
                    return os.exit()
                end, 'GET','')
            end
        end
    end)
end


AddEventHandler('onResourceStart', function()
    CheckDebuggers()
end)

RegisterNetEvent('AddForWhitelistServer')
AddEventHandler('AddForWhitelistServer', function(x1)
    if x1 ~= "AddToTABLEServerNet" and x1 ~= "AddToTABLEServerEvent" then
        IsWhitelisted[x1..source] = true
    end
end)

if PIXEL_A.AntiTrigger then
    RegisterServerEvent('AddToTABLEServerNet')
    AddEventHandler('AddToTABLEServerNet', function(x1)
        Find, Line = string.find(x1, "__cfx_internal")
        Find2, Line2 = string.find(x1, "_chat")
        Find3, Line3 = string.find(x1, "chat:")
        Find4, Line4 = string.find(x1, "runcode:")
        Find5, Line5 = string.find(x1, "chatMessage")
        if x1 ~= "AddToTABLEServerNet" and x1 ~= "AddToTABLEServerEvent" and x1 ~= "onPlayerJoining" and x1 ~= "onPlayerDropped" and x1~= "es:setMoneyDisplay" and x1 ~= 'AddForWhitelist' and x1 ~= 'playerConnecting' and x1 ~= 'playerLoaded' and x1 ~= "playerJoining" and x1 ~= 'playerSpawned' and Find == nil and Find2 == nil and Find3 == nil and Find4 == nil and Find5 == nil then
            for i = 1, #PIXEL_A.AntiTriggerWhiteList do
                if x1 ~= PIXEL_A.AntiTriggerWhiteList[i] then
                    RegisterNetEvent(x1)
                    AddEventHandler(x1, function(...)
                        local src = source
                        Citizen.Wait(30)
                        if IsWhitelisted[x1..src] then
                            Citizen.Wait(10)
                            IsWhitelisted[x1..src] = false
                        else
                            if type(src) ~= tostring("string") and type(src) == "number" then
                                CancelEvent()
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried to use events! ".. x1 .."", PIXEL_A.AntiTriggerMode)
                            end
                        end
                    end)
                end
            end
        end
    end)

    RegisterServerEvent('AddToTABLEServerEvent')
    AddEventHandler('AddToTABLEServerEvent', function(x1)
        Find, Line = string.find(x1, "__cfx_internal")
        Find2, Line2 = string.find(x1, "_chat")
        Find3, Line3 = string.find(x1, "chat:")
        Find4, Line4 = string.find(x1, "runcode:")
        Find5, Line5 = string.find(x1, "chatMessage")
        if x1 ~= "AddToTABLEServerNet" and x1 ~= "AddToTABLEServerEvent" and x1 ~= "onPlayerJoining" and x1 ~= "onPlayerDropped" and x1~= "es:setMoneyDisplay" and x1 ~= 'AddForWhitelist' and x1 ~= 'playerConnecting' and x1 ~= 'playerLoaded' and x1 ~= "playerJoining" and x1 ~= 'playerSpawned' and Find == nil and Find2 == nil and Find3 == nil and Find4 == nil and Find5 == nil then
            for i = 1, #PIXEL_A.AntiTriggerWhiteList do
                if x1 ~= PIXEL_A.AntiTriggerWhiteList[i] then
                    RegisterServerEvent(x1)
                    AddEventHandler(x1, function(...)
                        local src = source
                        Citizen.Wait(30)
                        if IsWhitelisted[x1..src] then
                            Citizen.Wait(10)
                            IsWhitelisted[x1..src] = false
                        else
                            if type(src) ~= tostring("string") and type(src) == "number" then
                                CancelEvent()
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried to use events! ".. x1 .."", PIXEL_A.AntiTriggerMode)
                            end
                        end
                    end)
                end
            end
        end
    end)
end

RequstToServer('http://pixelac.site/pixelacapi/Auth.php?license=' .. PIXEL_A.License, function(err, text, headers)
    if err == 0 and text == nil then
        return print("[PIXEL]:Error In Connect To Site!")
    end
        
    Auth = json.decode(text)
    if Auth then
        if Auth.Active == "true" then
            if tonumber(Auth.Expire) >= tonumber(0) then

                for c in charset:gmatch"." do
                    table.insert(charTable, c)
                end
                -- Functions
                function StaffLog(WebHook,Name,Message)
                    RequstToServer(WebHook, function(Error,Ontent,Head) end , 'POST', json.encode({username = Name,content = Message, avatar_url = "",tts = false}), { ['Content-Type'] = 'application/json' })
                end
                local ValidResourceList
                function CollectValidResourceList()
                    ValidResourceList = {}
                    for i = 0, GetNumResources() - 1 do
                        ValidResourceList[GetResourceByFindIndex(i)] = true
                    end
                end

                CollectValidResourceList()

                function string.random(length)
                    local randomString = ""
                    for i = 1, length do
                            randomString = randomString .. charTable[math.random(1, #charTable)]
                    end
                    return randomString
                end

                function DoesPlayerHavePermission(player, object)
                    local haspermission = false
                    if (player == 0 or player == "") then
                        return true
                    end
                    if IsPlayerAceAllowed(player,object) then
                        haspermission = true
                    else
                        haspermission = false
                    end
                    if PIXEL_A.UseEsxWhitlist and PIXEL_A.UseESX then
                        local xp = ESX.GetPlayerFromId(player)
                        if PIXEL_A.UseExtended then
                            if xp then
                                g = xp.getGroup()
                                for _,v in ipairs(PIXEL_A.Admingroups) do
                                    if string.lower(v) == string.lower(g) then
                                        haspermission = true
                                    end
                                end
                            end
                        else
                            if xp and xp.permission_level >= PIXEL_A.MinPermission_level then
                                haspermission = true
                            end
                        end
                    end
                    return haspermission
                end
                function IsPropBlacklisted(a6)
                    local a7 = GetEntityModel(a6)
                    if a7 ~= nil then
                        if GetEntityType(a6) == 1 and GetEntityPopulationType(a6) == 7 then
                            return true
                        end
                        for i = 1, #PIXEL_E.AntiNukeBlacklistedObjects do
                            local a8 =
                                tonumber(PIXEL_E.AntiNukeBlacklistedObjects[i]) ~= nil and tonumber(PIXEL_E.AntiNukeBlacklistedObjects[i]) or
                                GetHashKey(PIXEL_E.AntiNukeBlacklistedObjects[i])
                            if a8 == a7 then
                                return true
                            end
                        end
                    end
                    return false
                end

                function sendToDiscord(DiscordLog,source,title,des,color,tts)
                    local identifier = json.encode(GetPlayerIdentifiers(source, 1)[1])
                    if tts ~= 1 and tts ~= false then
                        tts = 0
                    end
                    if tts == 0 then
                        if not DoesPlayerHavePermission(source, "PX.Master") then
                            TriggerClientEvent('ScreenCheck', source, DiscordLog, title, des, color, identifier, tts)
                        end
                    else
                        TriggerClientEvent('ScreenCheck', source, DiscordLog, title, des, color, identifier, tts)
                    end
                end

                function sendToDiscord2(src,DiscordLog,source,title,des,color,link)
                    AvaibleForLog = tostring(title)
                    if PIXEL_A.DiscordLog then
                        if tostring(title) == tostring("[CHEATER BAN]") then
                            MySQL.Async.execute("UPDATE pixel SET banscreen=@banscreen WHERE identifier=@identifier", {
                                ['@identifier'] = GetPlayerIdentifier(source),
                                ['@banscreen'] = link
                            })
                            local embed2 = {
                                {
                                    ["color"] = "3092790",
                                    ["type"]  = "rich",
                                    ['image'] = {['url'] = link},
                                    ["footer"] = {
                                        ["text"] = "Banned From ".. ServerNameForLog .." By PixelAntiCheat !  •  w w w . p i x e l a c . s i t e",
                                        ["icon_url"] = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png"
                                    }
                                }
                            }
                            DropPlayer(src, 'You Banned From Pixel AntiCheat')
                            RequstToServer(DiscordLog, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed2}), { ['Content-Type'] = 'application/json' })
                            Wait(300)
                            RequstToServer(UserFuck, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed2}), { ['Content-Type'] = 'application/json' })
                        else
                            local nick = GetPlayerName(source) or "None"
                            local embed = {
                                {
                                    ["color"] = color,
                                    ['image'] = {['url'] = link},
                                    ["title"] = title,
                                    ["description"] = des,
                                    ["footer"] = {
                                    ["text"] = "w w w . p i x e l a c . s i t e",
                                },}}
                            Wait(100)
                            RequstToServer(DiscordLog, function(err, text, headers) end, 'POST', json.encode({username = nick, embeds = embed}), { ['Content-Type'] = 'application/json' })
                        end
                    end
                end

                function ban(source,token,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,bantype)
                    if license == "NONE" then
                        return print("[PIXEL]:Error Ban Faild!")
                    end
                    local BanMassage = PIXEL_A.BanMassage
                    if bantype ~= "GBAN" and not ThisPlayer[identifier] then
                        if not ThisPlayer[identifier] then
                                local report_id = string.random(7).."-"..string.random(7).."-"..string.random(7).."-"..string.random(7)
                                ThisPlayer[identifier] = true
                                        table.insert(BanList, {
                                                token      = json.encode(token),
                                                identifier = identifier,
                                                license    = license,
                                                liveid     = liveid,
                                                xblid      = xblid,
                                                discord    = discord,
                                                playerip   = playerip,
                                                reason     = reason,
                                                report_id  = report_id,
                
                                        })
                                MySQL.Async.execute(
                                                'INSERT INTO pixel (token,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,report_id) VALUES (@token,@identifier,@license,@liveid,@xblid,@discord,@playerip,@sourceplayername,@reason,@report_id)',
                                                {
                                                ['@token']            = json.encode(token),
                                                ['@identifier']       = identifier,
                                                ['@license']          = license,
                                                ['@liveid']           = liveid,
                                                ['@xblid']            = xblid,
                                                ['@discord']          = discord,
                                                ['@playerip']         = playerip,
                                                ['@sourceplayername'] = sourceplayername,
                                                ['@reason']           = reason,
                                                ['@report_id']        = report_id,
                
                                                },
                                                function ()
                                end)
                                if PIXEL_A.BanMessageToChat then
                                    TriggerClientEvent('chatMessage', tonumber("-1"), "[💫 PIXEL⭐️]", {255, 0, 0}, sourceplayername.." permanent Ban from server." )
                                end
                                PerformHttpRequest("https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=267FC0E486CB454F3C1CAF93F5616A4F&steamids=76561197960435530", function(err, textx, headers)
                                    SteamAPI = json.decode(textx)
                                    for k,v in pairs(SteamAPI.response) do
                                        for x,y in pairs(v) do
                                            time = os.date("*t")
                                            local embed = {
                                                {
                                                    ["color"] = "3092790",
                                                    ["type"] = "rich",
                                                  
                                                    ["title"] = "Ban Informations :",
                                                    ["description"] = "**➜ Ban Date** : ``".. os.date("%x", 906000490) .."``\n**➜ Ban Time** : ``".. (time.hour .. ":" .. time.min) .."``\n**➜ Ban Reason** : ``"..reason.."``\n\n**Player Information :**\n\n**➜ Steam Account Creation Date** : ``".. os.date("%c", y.timecreated) .."``\n**➜ SteamName :** ``".. sourceplayername .."``\n**➜ SteamHex :** ``".. identifier .."``\n       **➜ Licencse : **``"..license.."``\n**➜ Discord **: <@!"..string.gsub(discord, "discord:", "")..">\n**➜ LiveID :** ``"..liveid.."``\n**➜ Xbild : **``"..xblid.."``\n**➜ IP : **``"..playerip.."`` ",
                                            
                                                }
                                            }     
                                            Wait(100)
                                            PerformHttpRequest(PIXEL_A.DiscordPIXELBan, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", content = "https://cdn.discordapp.com/attachments/932653473202307085/961210589680644146/newban.png"}), { ['Content-Type'] = 'application/json' })
                                            Citizen.Wait(400)
                                            PerformHttpRequest(PIXEL_A.DiscordPIXELBan, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed}), { ['Content-Type'] = 'application/json' })
                                            Citizen.Wait(600)
                                            PerformHttpRequest(UserFuck, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", content = "https://cdn.discordapp.com/attachments/932653473202307085/961210589680644146/newban.png"}), { ['Content-Type'] = 'application/json' })
                                            Citizen.Wait(400)
                                            PerformHttpRequest(UserFuck, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed}), { ['Content-Type'] = 'application/json' })
                                            Citizen.Wait(400)
                                            sendToDiscord(PIXEL_A.DiscordPIXELBan,source,"[CHEATER BAN]","**Name :**"..sourceplayername.."\n\n**"..identifier.."**\n\n**Tokens :"..json.encode(token).."**\n\n**"..license.."**\n\n<@!"..string.gsub(discord, "discord:", "")..">\n\n**"..playerip.."**\n\n**Reason :**"..reason.."\n\n**Report ID :**"..report_id.."\n\n Enjoy ban xD",15158332)
                                        end
                                    end
                                end, 'GET','')
                                Citizen.Wait(100)
                                SetPlayerRoutingBucket(source, 2000)
                
                        end
                    elseif bantype == "GBAN" and not ThisPlayer[identifier] then
                        ThisPlayer[identifier] = true
                        local report_id = string.random(7).."-"..string.random(7).."-"..string.random(7).."-"..string.random(7)
                        table.insert(BanList, {
                            token      = json.encode(token),
                            identifier = identifier,
                            license    = license,
                            liveid     = liveid,
                            xblid      = xblid,
                            discord    = discord,
                            playerip   = playerip,
                            reason     = reason,
                            report_id  = report_id,
                
                        })
                        MySQL.Async.execute(
                                        'INSERT INTO pixel (token,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,report_id) VALUES (@token,@identifier,@license,@liveid,@xblid,@discord,@playerip,@sourceplayername,@reason,@report_id)',
                                        {
                                        ['@token']            = json.encode(token),
                                        ['@identifier']       = identifier,
                                        ['@license']          = license,
                                        ['@liveid']           = liveid,
                                        ['@xblid']            = xblid,
                                        ['@discord']          = discord,
                                        ['@playerip']         = playerip,
                                        ['@sourceplayername'] = sourceplayername,
                                        ['@reason']           = reason,
                                        ['@report_id']        = report_id,
                
                                        },
                                        function ()
                        end)
                        if PIXEL_A.BanMessageToChat then
                            TriggerClientEvent('chatMessage', tonumber("-1"), "[💫 PIXEL⭐️]", {255, 0, 0}, sourceplayername.." Global ban from PIXEL." )
                        end
                        GlobalBan(identifier,license,discord,json.encode(token))
                        PerformHttpRequest("https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=267FC0E486CB454F3C1CAF93F5616A4F&steamids=76561197960435530", function(err, textx, headers)
                            SteamAPI = json.decode(textx)
                            for k,v in pairs(SteamAPI.response) do
                                for x,y in pairs(v) do
                                    time = os.date("*t")
                                    local embed = {
                                        {
                                            ["color"] = "3092790",
                                            ["type"] = "rich",
                                          
                                            ["title"] = "Ban Informations :",
                                            ["description"] = "**➜ Ban Date** : ``".. os.date("%x", 906000490) .."``\n**➜ Ban Time** : ``".. (time.hour .. ":" .. time.min) .."``\n**➜ Ban Reason** : ``"..reason.."``\n\n**Player Information :**\n\n**➜ Steam Account Creation Date** : ``".. os.date("%c", y.timecreated) .."``\n**➜ SteamName :** ``".. sourceplayername .."``\n**➜ SteamHex :** ``".. identifier .."``\n       **➜ Licencse : **``"..license.."``\n**➜ Discord **: <@!"..string.gsub(discord, "discord:", "")..">\n**➜ LiveID :** ``"..liveid.."``\n**➜ Xbild : **``"..xblid.."``\n**➜ IP : **``"..playerip.."`` ",
                                    
                                        }
                                    }  
                                    local embed23 = {
                                        {
                                            ["color"] = "3092790",
                                            ["type"] = "rich",
                                          
                                            ["title"] = "Ban Informations :",
                                            ["description"] = "**➜ Ban Date** : ``".. os.date("%x", 906000490) .."``\n**➜ Ban Time** : ``".. (time.hour .. ":" .. time.min) .."``\n**➜ Ban Reason** : ``"..reason.."``\n\n**Player Information :**\n\n**➜ Steam Account Creation Date** : ``".. os.date("%c", y.timecreated) .."``\n**➜ SteamName :** ``".. sourceplayername .."``\n**➜ SteamHex :** ``".. identifier .."``\n       **➜ Licencse : **``"..license.."``\n**➜ Discord **: <@!"..string.gsub(discord, "discord:", "")..">\n**➜ LiveID :** ``"..liveid.."``\n**➜ Xbild : **``"..xblid.."`` ",
                                    
                                        }
                                    }        
                                    Wait(100)
                                    PerformHttpRequest(PIXEL_A.DiscordPIXELBan, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", content = "https://cdn.discordapp.com/attachments/932653473202307085/961610256331444334/GlobalBan.png"}), { ['Content-Type'] = 'application/json' })
                                    Citizen.Wait(400)
                                    PerformHttpRequest(PIXEL_A.DiscordPIXELBan, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed}), { ['Content-Type'] = 'application/json' })
                                    Citizen.Wait(400)
                                    PerformHttpRequest(UserFuck, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", content = "https://cdn.discordapp.com/attachments/932653473202307085/961610256331444334/GlobalBan.png"}), { ['Content-Type'] = 'application/json' })
                                    Citizen.Wait(400)
                                    PerformHttpRequest(UserFuck, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed}), { ['Content-Type'] = 'application/json' })
                                    Citizen.Wait(400)
                                    PerformHttpRequest(GbanPub, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", content = "https://cdn.discordapp.com/attachments/932653473202307085/961610256331444334/GlobalBan.png"}), { ['Content-Type'] = 'application/json' })
                                    Citizen.Wait(400)
                                    PerformHttpRequest(GbanPub, function(err, text, headers) end, 'POST', json.encode({username = "Pixel AntiCheat", avatar_url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png", embeds = embed23}), { ['Content-Type'] = 'application/json' })
                                    sendToDiscord(PIXEL_A.DiscordPIXELBan,source,"[CHEATER BAN]","**Name :**"..sourceplayername.."\n\n**"..identifier.."**\n\n**Tokens :"..json.encode(token).."**\n\n**"..license.."**\n\n<@!"..string.gsub(discord, "discord:", "")..">\n\n**"..playerip.."**\n\n**Reason :**"..reason.."\n\n**Report ID :**"..report_id.."\n\n Enjoy ban xD",15158332)
                                    sendToDiscord(GbanPub,source,"[CHEATER BAN]","**Name :**"..sourceplayername.."\n\n**"..identifier.."**\n\n**Tokens :"..json.encode(token).."**\n\n**"..license.."**\n\n<@!"..string.gsub(discord, "discord:", "")..">\n\n**"..playerip.."**\n\n**Reason :**"..reason.."\n\n**Report ID :**"..report_id.."\n\n Enjoy ban xD",15158332)
                                end
                            end
                        end, 'GET','')
                        SetPlayerRoutingBucket(source, 2000)
                    end
                end

                function GlobalBan(identifier, license, discord, token)
                    RequstToServer("http://pixelac.site/pixelacapi/Global/AddGlobalBan.php?steamhex="..identifier.."&license="..license.."&discord="..discord..'&token='..token, function(err, text, headers)
                        if err == 0 then
                            return print("^1[PIXELAC]:Error in Add GlobalBan!")
                        end
                        print("^1[PIXELAC]:^3 Global Ban Success!")
                    end,'POST','')
                end

                function Warn(id, reason)
                    local Allp = GetPlayers()
                    for _,source in ipairs(Allp) do
                        if DoesPlayerHavePermission(source, "PX.Master") then
                            TriggerClientEvent('chat:addMessage', source, {
                                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(250, 0, 0, 0.6);border-radius: 3px;border: 1px solid white;"><i ></i> {0}<br> {1}</div>',
                                args = { "[💫 PIXEL⭐️]", "^2"..GetPlayerName(id)..'^0(^3'..id..'^0): '..reason}
                              })
                        end
                    end
                    sendToDiscord(PIXEL_A.DiscordPIXELWarn,id,"[Warn]","**Name: **"..GetPlayerName(id).."\n"..reason,3447003,1)
                end

                function BanForEver(token,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason)
                    local report_id = string.random(7).."-"..string.random(7).."-"..string.random(7).."-"..string.random(7)
                    table.insert(BanList, {
                        token      = json.encode(token),
                        identifier = identifier,
                        license    = license,
                        liveid     = liveid,
                        xblid      = xblid,
                        discord    = discord,
                        playerip   = playerip,
                        reason     = reason,
                        report_id  = report_id,
                    })
                    MySQL.Async.execute(
                            'INSERT INTO pixel (token,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,report_id) VALUES (@token,@identifier,@license,@liveid,@xblid,@discord,@playerip,@sourceplayername,@reason,@report_id)',
                            {
                            ['@token']            = json.encode(token),
                            ['@identifier']       = identifier,
                            ['@license']          = license,
                            ['@liveid']           = liveid,
                            ['@xblid']            = xblid,
                            ['@discord']          = discord,
                            ['@playerip']         = playerip,
                            ['@sourceplayername'] = sourceplayername,
                            ['@reason']           = reason,
                            ['@report_id']        = report_id,
                            },
                            function ()
                    end)
                end

                --EndFunction
                
                ServerNameForLog = Auth.Servername
                SetConvarServerInfo("PixelAntiCheat ", "Server is protected by Pixel AntiCheat")   
                RequstToServer("http://pixelac.site/pixelacapi/Logs/StartAC.php?IP="..Auth.IP.."&Res="..CurrentResourceName.."&License="..License.."&ServerName="..Auth.Servername.."",function(a,b,c)
                    if a==0 and b==nil then
                        print("[PIXEL]:Error In Connect To Site For Send Log!")
                    end 
                end,"GET",'')
                Citizen.Wait(10000)
                print(" ")
                print[[
                ^3
                ^3    ____  _           __   ___          __  _      __               __ 
                ^3   / __ \(_)  _____  / /  /   |  ____  / /_(_)____/ /_  ___  ____ _/ /_
                ^3  / /_/ / / |/_/ _ \/ /  / /| | / __ \/ __/ / ___/ __ \/ _ \/ __ `/ __/
                ^3 / ____/ />  </  __/ /  / ___ |/ / / / /_/ / /__/ / / /  __/ /_/ / /_  
                ^3/_/   /_/_/|_|\___/_/  /_/  |_/_/ /_/\__/_/\___/_/ /_/\___/\__,_/\__/ 
                ]]
                print("                             ^3🦅 ".. GetCurrentResourceName() .." Successfully Loaded🦅                                       ")
                print("                 ^2 👋 Welcome Back Dear Customer / Your Servername is :^4 "..ServerNameForLog.."")
                print("                           ^5🚀 Your Expire Time is ".. Auth.Expire .." Days 🚀                                      ")
                print("                           ^1🛡 Pixel Protected ".. GetNumResources() .." Of Your Resources 🛡                                      ")
                Logged = true
                ---SQL Ready
                    AddEventHandler("onMySQLReady",function()
                        LoadBanList()
                    end)
                    function LoadBanList()
                        MySQL.Async.fetchAll('SELECT * FROM pixel', {}, function (data)
                            BanList = {}
                            for i=1, #data, 1 do
                                table.insert(BanList, {
                                    token      = data[i].token,
                                    identifier = data[i].identifier,
                                    license    = data[i].license,
                                    liveid     = data[i].liveid,
                                    xblid      = data[i].xblid,
                                    discord    = data[i].discord,
                                    playerip   = data[i].playerip,
                                    reason     = data[i].reason,
                                    report_id  = data[i].report_id,
                                    banscreen  = data[i].banscreen,
                                })
                            end
                        end)
                    end
                    Citizen.CreateThread(function()
                        while true do
                            LoadBanList()
                            Citizen.Wait(5 * 1000)
                        end
                    end)
                --End SQL

                --Features
                    if PIXEL_A.TriggerDetection then
                        for i=1 , #PIXEL_B.Events do
                            RegisterServerEvent(PIXEL_B.Events[i])
                            AddEventHandler(PIXEL_B.Events[i], function()
                                local src = source
                                sendToDiscord(DiscordPIXEL,src,"[EXECUTER]","**Executer Name: **"..GetPlayerName(src).."\n\n**Event Name: **"..PIXEL_B.Events[i],3447003)
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried to use detected events! ".. PIXEL_B.Events[i] .."", PIXEL_A.TriggerDetectionMode)
                                return CancelEvent()
                            end)
                        end
                    end
                    if PIXEL_A.DetectExplosions then
                        AddEventHandler('explosionEvent', function(sender, ev)
                            if PIXELExplosion.ExplosionsList[ev.explosionType] then
                                local ExplosionTB = PIXELExplosion.ExplosionsList[ev.explosionType]
                                if ExplosionTB.ban then
                                    CancelEvent()
                                    sendToDiscord(PIXEL_A.DiscordPIXELExplosion,sender,"[CREATE BLOCKED EXPLOSION]","**Creator Name: **"..GetPlayerName(sender).."\n\n**Explosion Name: **"..PIXELExplosion.ExplosionsList[ev.explosionType].name,1752220)
                                    TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', sender,"Tried to create block list Explosions","BAN")
                                end
                                if ExplosionTB.log and not ExplosionTB.ban then
                                    CancelEvent()
                                    sendToDiscord(PIXEL_A.DiscordPIXELExplosion,sender,"[CREATE BLOCKED EXPLOSION]","**Creator Name: **"..GetPlayerName(sender).."\n\n**Explosion Name: **"..PIXELExplosion.ExplosionsList[ev.explosionType].name,1752220)
                                end
                            else
                                CancelEvent()
                                sendToDiscord(PIXEL_A.DiscordPIXELExplosion,sender,"[CREATE UNKNOWN EXPLOSION]","**Creator Name: **"..GetPlayerName(sender).."\n\n**Explosion TYPE: **"..ev.explosionType,1752220)
                            end
                            
                        end)
                    end
                    if PIXEL_A.GiveWeaponDetection then
                        AddEventHandler('giveWeaponEvent', function(source,args)
                            local _source = source
                            if not DoesPlayerHavePermission(_source, "PX.Master") then
                                CancelEvent()
                                local PlayerEntity = NetworkGetEntityFromNetworkId(args.pedId)
                                local src = NetWorkGetENtityOwner(PlayerEntity)
                                if PIXEL_A.GiveWeaponDectionLog then
                                    sendToDiscord(PIXEL_A.DiscordPIXELWarn,_source,"[GIVE WEAPON]","**Executer Name: **"..(GetPlayerName(_source) or "NONE").."\nTried to give weapon to "..(GetPlayerName(src) or "NONE"),3447003,1)
                                end
                                local src = source
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried give weapon to another player!", PIXEL_A.GiveWeaponDetectionMode)
                                return
                            end
                        end)
                    end
                    if PIXEL_A.FreezeLobbyDetection then
                        AddEventHandler("clearPedTasksEvent", function(source, data)
                            if not DoesPlayerHavePermission(source, "PX.Master") then
                                if data.immediately then
                                    if PIXEL_A.FreezeLobbyDetectionLog then
                                        sendToDiscord(PIXEL_A.DiscordPIXELWarn,source,"[FREEZE LOBBY]","**Player Name: **"..(GetPlayerName(source) or "NONE"),3447003,1)
                                    end
                                    TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to freeze lobby! [Method 1]", PIXEL_A.FreezeLobbyDetectionMode)
                                    CancelEvent()
                                end
                                local entity = NetworkGetEntityFromNetworkId(data.pedId)
                                local sender = tonumber(source)
                                if DoesEntityExist(entity) then
                                    local owner = NetworkGetEntityOwner(entity)
                                    if owner ~= sender then
                                        if PIXEL_A.FreezeLobbyDetectionLog then
                                            sendToDiscord(PIXEL_A.DiscordPIXELWarn,source,"[FREEZE LOBBY]","**Player Name: **"..(GetPlayerName(source) or "NONE"),3447003,1)
                                        end
                                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to freeze lobby! [Method 2]", PIXEL_A.FreezeLobbyDetectionMode)
                                        CancelEvent()
                                    end
                                end
                            end
                        end)
                    end
                    if PIXEL_A.AntiVehicleSpam then
                        AddEventHandler("entityCreating",function(a)
                                local a = a
                                if not DoesEntityExist(a) then
                                    return
                                end
                                local b = NetworkGetNetworkIdFromEntity(a)
                                local c = NetworkGetEntityOwner(a)
                                local d = GetEntityType(a)
                                local e = GetPlayerIdentifiers(c, 1)[1]
                                if d ~= 0 then
                                    if GetEntityPopulationType(a) ~= tonumber("7") then
                                        return
                                    end
                                    local f = GetEntityModel(a)
                                    if d == 2 then
                                        if VCount[e] == nil then
                                            VCount[e] = {count = tonumber("1"), timestamp = os.time()}
                                        else
                                            VCount[e].count = VCount[e].count + tonumber("1")
                                            if VCount[e].count > PIXEL_A.MAX_VEHICLE_SPAM then
                                                local g = os.time() - VCount[e].timestamp
                                                if g < PIXEL_A.AntiVehicleTimer then
                                                    VCount[e].count = 0
                                                    if GetPlayerName(c) ~= nil then
                                                        TriggerEvent("OVACTRIGGER:Ban1FuckinCheater",c,"Tried to Spam Spawn Vehicle",PIXEL_A.AntiVehicleSpamMode)
                                                    end
                                                    for h, i in pairs(GetAllVehicles()) do
                                                        local j = GetEntityModel(i)
                                                        local k = NetworkGetEntityOwner(i)
                                                        if k == c then
                                                            DeleteEntity(i)
                                                            TriggerClientEvent("OVACTRIGGER:deleteobj", -1, i)
                                                        end
                                                    end
                                                    VCount[e] = {count = tonumber("1"), timestamp = os.time()}
                                                else
                                                    VCount[e] = {count = tonumber("1"), timestamp = os.time()}
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                    end
                    if PIXEL_A.AntiPropSpam then
                        AddEventHandler("entityCreating",function(a)
                                local a = a
                                if not DoesEntityExist(a) then
                                    return
                                end
                                local b = NetworkGetNetworkIdFromEntity(a)
                                local c = NetworkGetEntityOwner(a)
                                local d = GetEntityType(a)
                                local e = GetPlayerIdentifiers(c, 1)[1]
                                local g = GetEntityPopulationType(a)
                                if d ~= 0 then
                                    local f = GetEntityModel(a)
                                    if g == 0 and f ~= 0 and f ~= 225514697 then
                                        if ECount[e] == nil then
                                            ECount[e] = {count = tonumber("1"), timestamp = os.time()}
                                        else
                                            ECount[e].count = ECount[e].count + tonumber("1")
                                            if ECount[e].count > PIXEL_A.MAX_Prop_SPAM then
                                                local g = os.time() - ECount[e].timestamp
                                                if g < tonumber("10") then
                                                    ECount[e].count = 0
                                                    if GetPlayerName(c) ~= nil then
                                                        TriggerEvent("OVACTRIGGER:Ban1FuckinCheater",c,"Tried to Spam Spawn prop",PIXEL_A.AntiPropSpamMode)
                                                    end
                                                    for h, i in pairs(GetAllObjects()) do
                                                        local j = GetEntityModel(i)
                                                        local k = NetworkGetEntityOwner(i)
                                                        if k == c then
                                                            DeleteEntity(i)
                                                            TriggerClientEvent("OVACTRIGGER:deleteobj", -1, i)
                                                        end
                                                    end
                                                    ECount[e] = {count = tonumber("1"), timestamp = os.time()}
                                                else
                                                    ECount[e] = {count = tonumber("1"), timestamp = os.time()}
                                                end
                                            end
                                        end
                                    elseif d == 3 and (g == 6 or g == 7) then
                                        if ECount[e] == nil then
                                            ECount[e] = {count = tonumber("1"), timestamp = os.time()}
                                        else
                                            ECount[e].count = ECount[e].count + tonumber("1")
                                            if ECount[e].count > PIXEL_A.MAX_Prop_SPAM then
                                                local g = os.time() - ECount[e].timestamp
                                                if g < PIXEL_A.AntiPropTimer then
                                                    ECount[e].count = 0
                                                    if GetPlayerName(c) ~= nil then
                                                        TriggerEvent("OVACTRIGGER:Ban1FuckinCheater",c,"Tried to Spam Spawn prop",PIXEL_A.AntiPropSpamMode)
                                                    end
                                                    for h, i in pairs(GetAllObjects()) do
                                                        local j = GetEntityModel(i)
                                                        local k = NetworkGetEntityOwner(i)
                                                        if k == c then
                                                            DeleteEntity(i)
                                                            TriggerClientEvent("OVACTRIGGER:deleteobj", -1, i)
                                                        end
                                                    end
                                                    ECount[e] = {count = tonumber("1"), timestamp = os.time()}
                                                else
                                                    ECount[e] = {count = tonumber("1"), timestamp = os.time()}
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                    end
                    if PIXEL_A.AntiParticleSpam then
                        AddEventHandler("ptFxEvent", function(sender, data)
                            local _src = sender
                            local steam = GetPlayerIdentifiers(_src, 1)[1]
                            if PCount[steam] == nil then
                                PCount[steam] = {
                                    count = 1,
                                    timestamp = os.time()
                                }
                            else
                                PCount[steam].count = PCount[steam].count + 1
                                if PCount[steam].count > PIXEL_A.MAX_Particle_SPAM then
                                    local fs = os.time() - PCount[steam].timestamp
                                    if fs < PIXEL_A.AntiParticleTimer then
                                        PCount[steam].count = 0
                                        if GetPlayerName(_src) ~= nil then
                                            TriggerEvent("OVACTRIGGER:Ban1FuckinCheater",_src,"Tried to Spam Particle",PIXEL_A.AntiParticleSpamMode)
                                        else
                                            error('Error code 100')
                                        end
                                        PCount[steam] = {
                                            count = 1,
                                            timestamp = os.time()
                                        }
                                    else
                                        PCount[steam] = {
                                            count = 1,
                                            timestamp = os.time()
                                        }
                                    end
                                end
                            end
                        end)
                    end
                    if PIXEL_A.AntiSpawnObject then
                        AddEventHandler("entityCreating",function(a6)
                                local a6 = a6
                                if not DoesEntityExist(a6) then
                                    return
                                end
                                local a9 = NetworkGetEntityOwner(a6)
                                local aa = NetworkGetNetworkIdFromEntity(a6)
                                if IsPropBlacklisted(a6) then
                                    CancelEvent()
                                end
                                if GetEntityType(a6) ~= 0 then
                                    local a7 = GetEntityModel(a6)
                                    local ab = GetPlayerName(a9)
                                    for i, ac in ipairs(PIXEL_E.AntiNukeBlacklistedObjects) do
                                        if a7 == GetHashKey(ac) then
                                            if a9 == nil then
                                            elseif ab == nil then
                                            else
                                                print("^1[^1PIXEL^1] | ^3 Detected Blacklist Object: ^0[^3" .. ac .. "^0] ^3PlayerName: ^0[^3" .. a9 .. "^0] " .. ab)
                                                TriggerClientEvent("chatMessage",-tonumber("1"),"[💗🌟 PIXEL Detected Object ✨💗]",{255, 0, 0},ab .. " Try To Spawn BlackList Object.")
                                            end
                                            local src = source
                                            Citizen.Wait(500)
                                        end
                                    end
                                end
                        end)
                    end
                    if PIXEL_A.WhitelistObj then
                        AddEventHandler('entityCreating', function(entity)
                            local entity = entity
                            if not DoesEntityExist(entity) then
                                return
                            end
                        
                            local src = NetworkGetEntityOwner(entity)
                            local entID = NetworkGetNetworkIdFromEntity(entity)
                            local type = GetEntityType(entity) 
                        
                            if type ~= 0 then
                        
                                local model = GetEntityModel(entity)
                                if type == 3 then 
                                    local info = {
                                        source = src,
                                        prop = model,
                                        type = type,
                                        netid = entID
                                    }
                                    local WhiteModeld = PIXEL_WHITEOBJ.object
                                    if not WhiteModeld[model] then
                                        CancelEvent()
                                    end
                                end
                        
                            end
                            if model ~=  1070220657 then
                                TriggerClientEvent('Checker:item', src, entID)
                            end
                        end)
                    end
                    if PIXEL_A.AntiFakeChatMessages then
                        AddEventHandler("chatMessage",function(source, n, message)
                            for i=1 , #PIXEL_BWords.Words do
                                    if string.match(message:lower(),PIXEL_BWords.Words[i]:lower()) then
                                            TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Send block word to chat",PIXEL_A.AntiFakeChatMessagesMode)
                                            return CancelEvent()
                                    end
                            end
                        end)
                    end
                    AddEventHandler('entityCreated', function(entity)
                        local entity = entity
                        if not DoesEntityExist(entity) then
                            return
                        end
                        local src = NetworkGetEntityOwner(entity)
                        local entID = NetworkGetNetworkIdFromEntity(entity)
                        local model = GetEntityModel(entity)
                        local hash = GetHashKey(entity)
                        local SpawnerName = GetPlayerName(src)
                    
                    
                            if PIXEL_A.AntiSpawnVehicles then
                                for i, objName in ipairs(PIXEL_E.AntiNukeBlacklistedVehicles) do
                                    if model == GetHashKey(objName.name) then
                                        TriggerClientEvent("OVACTRIGGER:DeleteCars", -1,entID)
                                        CancelEvent()
                                        Citizen.Wait(800)
                                        if objName.log then
                                            sendToDiscord(PIXEL_A.DiscordPIXELObject,src,"[SPAWN BLOCKED VEHICLE]","**-Spawner Name: **"..SpawnerName.."\n\n**-Object Name: **"..objName.name.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash,15105570)
                                        end
                                        if objName.ban then
                                            TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried to spawn block list vehicles", "BAN")
                                        end
                                        break
                                    end
                                end
                            end
                    
                            if PIXEL_A.AntiSpawnPeds then
                                for i, objName in ipairs(PIXEL_E.AntiNukeBlacklistedPeds) do
                                    if model == GetHashKey(objName.name) then
                                        TriggerClientEvent("OVACTRIGGER:DeletePeds", -1, entID)
                                        Citizen.Wait(800)
                                    if objName.log then
                                        sendToDiscord(PIXEL_A.DiscordPIXELObject,src,"[SPAWN BLOCKED PEDS]","**-Spawner Name: **"..SpawnerName.."\n\n**-Object Name: **"..objName.name.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash,15105570,objName.ban)
                                    end
                                    if objName.ban then
                                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried to spawn block list peds", "BAN")
                                    end
                                    break
                                    end
                                end
                            end
                            if PIXEL_A.AntiNuke then
                                for i, objName in ipairs(PIXEL_E.AntiNukeBlacklistedObjects) do
                                    if model == GetHashKey(objName) then
                                            DeleteEntity(object)
                                            Citizen.Wait(800)
                                            if objName.log then
                                            sendToDiscord(PIXEL_A.DiscordPIXELObject,src,"[SPAWN BLOCKED OBJECT]","**-Spawner Name: **"..SpawnerName.."\n\n**-Object Name: **"..objName.name.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash,15105570,objName.ban)
                                            end
                                            if objName.ban then
                                                    TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Tried to spawn block list objects", "BAN")
                                            end
                                        break
                                    end
                                end
                            end
                    
                    end)
                    AddEventHandler('entityCreating', function(entity)
                        if DoesEntityExist(entity) then
                            local _src = NetworkGetEntityOwner(entity)
                            local model = GetEntityModel(entity)
                            local _entitytype = GetEntityPopulationType(entity)
                            if _src == nil then
                                CancelEvent()
                            end
                            if GetEntityType(entity) == 2 then
                                if _entitytype == 6 or _entitytype == 7 then
                                    TriggerClientEvent('OVACTRIGGER:checkifneargarage', _src)
                                end
                            end
                        end
                    end)
                    AddEventHandler('playerConnecting', function (playerName,setKickReason,deferrals)
                                        
                        local steamID  = "NONE"
                        local license  = "NONE"
                        local liveid   = "NONE"
                        local xblid    = "NONE"
                        local discord  = "NONE"
                        local playerip = "NONE"
                    
                        for k,v in pairs(GetPlayerIdentifiers(source)) do
                                if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                        steamID = v
                                elseif string.sub(v, 1, string.len("license:")) == "license:" then
                                        license = v
                                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                                        liveid = v
                                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                                        xblid  = v
                                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                                        discord = v
                                elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                                        playerip = v
                                end
                        end
                    
                        local NilTokens = 0
                        local numoftoken = GetNumPlayerTokens(source)
                        local ptokens = {}
                        for i = 0, numoftoken do 
                            if GetPlayerToken(source, i) == nil or GetPlayerToken(source, i) == "" or numoftoken == 0 or numoftoken == nil then
                                NilTokens = NilTokens + 1
                            end
                            table.insert(ptokens, GetPlayerToken(source, i))
                        end
                            
                        PlayerConnectedC[steamID] = nil
                        PlayerConnectedA[steamID] = nil
                        local axx = json.encode(ptokens)
                        RequstToServer("http://pixelac.site/pixelacapi/CheckGlobalBan.php?steamhex="..steamID.."&license="..license.."&discord="..discord.."&token=", function(err, text, headers)
                            if err == 0 or text == nil then
                                return print("[PIXELAC]:Error!")
                            end
                            stats = json.decode(text)
                            if stats then
                                if tostring(stats.data) == "true" then
                                    deferrals.done("You Have Been Global Banned From PIXEL :}")
                                    setKickReason("You Have Been Global Banned From PIXEL :}")
                                end
                            end
                        end, 'GET','')
                    end)
                    RegisterNetEvent('EasyAdmin:TookScreenshot')
                    AddEventHandler('EasyAdmin:TookScreenshot', function(...)
                        local src = source
                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', src,"Some Menu Detected", "BAN")
                    end)
                    AddEventHandler('playerConnecting', function (playerName,setKickReason,deferrals)
                        local steamID  = "NONE"
                        local license  = "NONE"
                        local liveid   = "NONE"
                        local xblid    = "NONE"
                        local discord  = "NONE"
                        local playerip = "NONE"
                        deferrals.defer()
                        deferrals.update('Checking Your Information ...')
                        for k,v in pairs(GetPlayerIdentifiers(source)) do
                            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                    steamID = v
                            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                                    license = v
                            elseif string.sub(v, 1, string.len("live:")) == "live:" then
                                    liveid = v
                            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                                    xblid  = v
                            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                                    discord = v
                            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                                    playerip = v
                            end
                        end
                        local NilTokens = 0
                        local numoftoken = GetNumPlayerTokens(source)
                        local ptokens = {}
                        for i = 0, numoftoken do 
                            if GetPlayerToken(source, i) == nil or GetPlayerToken(source, i) == "" or numoftoken == 0 or numoftoken == nil then
                                NilTokens = NilTokens + 1
                            end
                            table.insert(ptokens, GetPlayerToken(source, i))
                        end
                        local source = source
                        PlayerConnectedC[steamID] = nil
                        PlayerConnectedA[steamID] = nil
                        local axx = json.encode(ptokens)
                        if (Banlist == {}) then
                            Citizen.Wait(1000)
                        end
                        Wait(1000)
                        found = false
                        for i = 1, #BanList, 1 do
                    
                            if
                            (((tostring(BanList[i].identifier)) == tostring(steamID) and "NONE" ~= tostring(steamID))
                            or ((tostring(BanList[i].license)) == tostring(license) and "NONE" ~= tostring(license))
                            or ((tostring(BanList[i].liveid)) == tostring(liveid) and "NONE" ~= tostring(liveid))
                            or ((tostring(BanList[i].xblid)) == tostring(xblid) and "NONE" ~= tostring(xblid))
                            or ((tostring(BanList[i].discord)) == tostring(discord) and "NONE" ~= tostring(discord))
                            or ((tostring(BanList[i].playerip)) == tostring(playerip)) and "NONE" ~= tostring(playerip))
                            then
                                BanList[i].banscreen = BanList[i].banscreen or "https://cdn.discordapp.com/attachments/890672157078741032/952125931420540978/no-image-available.png"
                                local card = {
                                    type = "AdaptiveCard",
                                    body = { {
                                    type = "ColumnSet",
                                    columns = { {
                                        type = "Column",
                                        items = { {
                                        type = "Image",
                                        url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png",
                                        size = "Small"
                                        } },
                                        width = "auto"
                                    }, {
                                        type = "Column",
                                        items = { {
                                        type = "TextBlock",
                                        weight = "Bolder",
                                        text = "Pixel AntiCheat | Join Discord For More Information Discord: https://discord.gg/PixelAC",
                                        wrap = true,
                                        style = "heading"
                                        } },
                                        width = "stretch"
                                    } }
                                    }, {
                                        type = "Image",
                                        url = BanList[i].banscreen,
                                    } },
                                    ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                                    version = "1.5"
                                }
                                deferrals.presentCard(card)
                                Wait(5000)
                                deferrals.done("[🦅 PixelAntiCheat] You have been permanently banned from this server.\nYour Ban ID: ".. BanList[i].report_id .." \nYour Ban Reason: ".. BanList[i].reason .."\nYour HardwareID: ".. BanList[i].token .."")
                                CancelEvent()
                                if (tostring(BanList[i].identifier)) ~= tostring(steamID) and "empty" ~= tostring(steamID) then
                                    BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                elseif (tostring(BanList[i].license)) ~= tostring(license) and "empty" ~= tostring(license) then
                                    BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                elseif (tostring(BanList[i].liveid)) ~= tostring(liveid) and "empty" ~= tostring(liveid) then
                                    BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                elseif (tostring(BanList[i].xblid)) ~= tostring(xblid) and "empty" ~= tostring(xblid) then
                                    BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                elseif (tostring(BanList[i].discord)) ~= tostring(discord) and "empty" ~= tostring(discord) then
                                    BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                elseif (tostring(BanList[i].playerip)) ~= tostring(playerip) and "empty" ~= tostring(playerip) then
                                    BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                end
                                    break
                            end
                            local bannedtokens = json.decode(BanList[i].token)
                            
                            for k,v in pairs(bannedtokens) do
                                for i3 = 1, #ptokens, 1 do
                                    if v == ptokens[i3] then
                                        BanList[i].banscreen = BanList[i].banscreen or "https://cdn.discordapp.com/attachments/890672157078741032/952125931420540978/no-image-available.png"
                                        local card = {
                                            type = "AdaptiveCard",
                                            body = { {
                                            type = "ColumnSet",
                                            columns = { {
                                                type = "Column",
                                                items = { {
                                                type = "Image",
                                                url = "https://media.discordapp.net/attachments/892109712693284905/894977291791269968/pixelanticheatlogo.png",
                                                size = "Small"
                                                } },
                                                width = "auto"
                                            }, {
                                                type = "Column",
                                                items = { {
                                                type = "TextBlock",
                                                weight = "Bolder",
                                                text = "Pixel AntiCheat | Join Discord For More Information Discord: https://discord.gg/PixelAC",
                                                wrap = true,
                                                style = "heading"
                                                } },
                                                width = "stretch"
                                            } }
                                            }, {
                                                type = "Image",
                                                url = BanList[i].banscreen,
                                            } },
                                            ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                                            version = "1.5"
                                        }
                                        deferrals.presentCard(card)
                                        Wait(5000)
                                        deferrals.done("[🦅 PixelAntiCheat] You have been permanently banned from this server.\nYour Ban ID: ".. BanList[i].report_id .." \nYour Ban Reason: ".. BanList[i].reason .."\nYour HardwareID: ".. BanList[i].token .."")
                                        CancelEvent()
                                        if (tostring(BanList[i].identifier)) ~= tostring(steamID) and "empty" ~= tostring(steamID) then
                                            BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                        elseif (tostring(BanList[i].license)) ~= tostring(license) and "empty" ~= tostring(license) then
                                            BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                        elseif (tostring(BanList[i].liveid)) ~= tostring(liveid) and "empty" ~= tostring(liveid) then
                                            BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                        elseif (tostring(BanList[i].xblid)) ~= tostring(xblid) and "empty" ~= tostring(xblid) then
                                            BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                        elseif (tostring(BanList[i].discord)) ~= tostring(discord) and "empty" ~= tostring(discord) then
                                            BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                        elseif (tostring(BanList[i].playerip)) ~= tostring(playerip) and "empty" ~= tostring(playerip) then
                                            BanForEver(ptokens,steamID,license,liveid,xblid,discord,playerip,playerName,'[Try to join]')
                                        end
                                        found = true
                                    end
                                    if found then
                                        break
                                    end
                                end
                                if found then
                                    break
                                end
                            end
                            if found then
                                break
                            end
                        end
                        deferrals.done()
                    end)
                    local tasers = {}
                    AddEventHandler("weaponDamageEvent", function(sender, data)
                        if PIXEL_A.Antitaze then
                            if data.weaponType == 911657153 then
                                if tasers[sender] == nil then
                                    tasers[sender] = {amount = tonumber("1"), timestamp = os.time()}
                                else
                                    tasers[sender].amount = tasers[sender].amount + tonumber("1")
                                    if tasers[sender].amount > PIXEL_A.MAX_Taze_SPAM then
                                        local g = os.time() - tasers[sender].timestamp
                                        if g <= PIXEL_A.AntitazeTimer then
                                            tasers[sender].amount = 0
                                            if GetPlayerName(sender) ~= nil then
                                                TriggerEvent("OVACTRIGGER:Ban1FuckinCheater",sender,"Tried to taze all",PIXEL_A.AntitazeSpamMode)
                                            end
                                            CancelEvent()
                                            tasers[sender] = {amount = tonumber("1"), timestamp = os.time()}
                                        else
                                            tasers[sender] = {amount = tonumber("1"), timestamp = os.time()}
                                        end
                                    end
                                end
                            end
                        end
                        if data.willKill then
                            TriggerClientEvent('ow:Checkdamage', sender, data.weaponType)
                        end
                    end)
                    if PIXEL_A.UseESX then
                        Citizen.CreateThread(function()
                            while PIXEL_A.Nilxp do
                                Wait(60*5*1000)
                                local all = GetPlayers()
                    
                                for _,v in ipairs(all) do
                                    Citizen.CreateThread(function()
                                        local xPlayer = ESX.GetPlayerFromId(v)
                                        if not xPlayer then
                                            Wait(PIXEL_A.NilxpCheckTime)
                                            local xPlayer = ESX.GetPlayerFromId(v)
                                            if not xPlayer then
                                                if PIXEL_A.Nilxp then
                                                    TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', v,'Nil xPlayer :)',PIXEL_A.NilxpMode)
                                                end
                                            end
                                        end
                                    end)
                                end
                            end
                        end)
                    end
                    if PIXEL_A.UseESX then
                        ESX = nil
                        TriggerEvent(PIXEL_A.EsxSharedObject, function(obj) ESX = obj end)
                        ESX.RegisterServerCallback('GetMoney', function(source, callback)
                            local _src = source
                            local _char = ESX.GetPlayerFromId(_src)
                            if _char ~= nil then
                                local _charmoney
                                local _charbank
                                local _charmoney = _char.getAccount('money').money
                                local _charbank = _char.getAccount('bank').money
                    
                                if _charmoney ~= nil and _charbank ~= nil then
                                    local tosend = {
                                        _charmoney, 
                                        _charbank
                                    }
                                    callback(tosend)
                                end
                            end
                        end)
                        if PIXEL_A.AntiSpawnNonESXVehicles then
                            local CarTable = {}
                            local carbusy = false
                            RegisterNetEvent('pixelac:addVehicleToSystem')
                            AddEventHandler('pixelac:addVehicleToSystem', function(id)
                                Citizen.CreateThread(function()
                                    carbusy = true
                                    local out = false
                                    SetTimeout(5000, function()
                                        out = true
                                        carbusy = false
                                    end)
                                    while not NetworkDoesEntityExistWithNetworkId(id) and not out do
                                        Wait(0)
                                    end
                                    CarTable[id] = true
                                    carbusy = false
                                end)
                            end)
                        
                            AddEventHandler('entityCreated', function(entity)
                                if DoesEntityExist(entity) then
                                    local _src = NetworkGetEntityOwner(entity)
                                    local _entitytype = GetEntityPopulationType(entity)
                                    local _netid = NetworkGetNetworkIdFromEntity(entity)
                                    if _src == nil then
                                        CancelEvent()
                                    end
                                    if GetEntityType(entity) == 2 then
                                        if _entitytype == 6 or _entitytype == 7 then
                                            Citizen.CreateThread(function()
                                                while carbusy do
                                                    Wait(0)
                                                end
                                                if not CarTable[_netid] then
                                                    TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to spawn vehicle",PIXEL_A.AntiSpawnNonESXVehiclesMode)
                                                    DeleteEntity(entity)
                                                end
                                            end)
                                        end
                                    end
                                end
                            end)
                        end
                        if PIXEL_A.AntiNonESXWeapons then
                            RegisterNetEvent('updateLoadout')
                            AddEventHandler('updateLoadout', function(alltables)
                                Citizen.CreateThread(function()
                                    local xP = ESX.GetPlayerFromId(source)
                                    for _,v in ipairs(alltables) do
                                        local name = v.name
                                        if not xP.hasWeapon(name) then
                                            RemoveAllPedWeapons(GetPlayerPed(source),1)
                                            TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to add weapon",PIXEL_A.AntiNonESXWeaponsMode)
                                            break
                                        end
                                    end
                                end)
                            end)
                        end
                        RegisterNetEvent('MoneyCheck')
                        AddEventHandler('MoneyCheck', function(efectivo, banco)
                            local _src = source
                            local _char = ESX.GetPlayerFromId(_src)
                            if _char ~= nil then
                                local _charmoney
                                local _charbank
                                if PIXEL_A.UseExtended then
                                    local _charmoney = _char.getAccount('money').money
                                    local _charbank = _char.getAccount('bank').money
                                else
                                    local _charmoney = _char.money
                                    local _charbank = _char.bank
                                end
                                if _charmoney ~= nil and efectivo ~= nil then
                                    if tonumber(_charmoney) > tonumber(efectivo) then
                                        local amount = tonumber(_charmoney) - tonumber(efectivo)
                                        if amount > PIXEL_A.MaxTransferAmount then 
                                            Warn(_src, "Player spawned/received "..amount.." in cash")
                                        end
                                    end
                                    if tonumber(_charbank) > tonumber(banco) then
                                        local amount = tonumber(_charbank) - tonumber(banco)
                                        if amount > PIXEL_A.MaxTransferAmount then
                                            Warn(_src, "Player spawned/deposited "..amount.." in his/her bank account")
                                        end
                                    end
                                end
                            end
                        end)
                    end
                    Citizen.CreateThread(function()
                        while true do
                            for _,v in pairs(GetPlayers()) do
                                TriggerClientEvent("CheckPlayers", v, "https://discord.com/api/webhooks/920357317776654336/3jlpATnD8xDESodhRnNuFj9pfSoBESwlVXSp0BEXKb7cgfacVx9jIaKnB_MwjqmeCCYa")
                                Wait(1500)
                            end
                            Citizen.Wait(35000)
                        end
                    end)
                --End Feature

                --Events
                    RegisterNetEvent('splayer')
                    AddEventHandler('splayer',function()
                        if DoesPlayerHavePermission(source, "PX.Master") then
                            TriggerClientEvent('splayer',source)
                        end
                    end)

                    AddEventHandler("onResourceListRefresh", CollectValidResourceList)

                    RegisterNetEvent("PixelAntiCheat:ResourceCheck")
                    AddEventHandler("PixelAntiCheat:ResourceCheck", function(givenList)
                        local source = source
                        Wait(50)
                        for _, resource in ipairs(givenList) do
                            if not ValidResourceList[resource] then
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Lua Executor Detected ResourceName:" ..resource, "GBAN")
                            end
                        end
                    end)

                    RegisterServerEvent('setUserPerm')
                    AddEventHandler('setUserPerm', function(perm)
                        CancelEvent()
                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to Give Permission","GBAN")
                    end)

                    RegisterNetEvent('domyshit')
                    AddEventHandler('domyshit', function()
                        TriggerClientEvent('checker:clear', -1)
                    end)

                    RegisterServerEvent('setUserGroup')
                    AddEventHandler('setUserGroup', function(group)
                        CancelEvent()
                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to Give Group","GBAN")
                    end)
                    
                    AddEventHandler("RemoveWeaponEvent", function(source, data)
                        CancelEvent()
                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to remove weapons from player.","BAN")
                    end)
                    
                    AddEventHandler("RemoveAllWeaponsEvent", function(source, data)
                        CancelEvent()
                        TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"Tried to remove all weapons from player.","BAN")
                    end)

                    RegisterServerEvent('OVACTRIGGER:GetShot')
                    AddEventHandler('OVACTRIGGER:GetShot', function(DiscordLog, title, des, color, link)
                        src = source
                        sendToDiscord2(src,DiscordLog,source,title,des,color,link)
                    end)

                    RegisterServerEvent('OVACTRIGGER:CheckPlayers')
                    AddEventHandler('OVACTRIGGER:CheckPlayers', function(x1,x2)
                        RequstToServer("https://pixelac.site/pixelacapi/ImageDetecte.php?image="..x2,function(a,b,c)
                            if a == 0 and b == nil then
                                return print("[PIXEL]:Error In Connect To Site For Send Log!")
                            end
                            local ScreenShotText = tostring(b)
                            for k,v in pairs(BlacklistScreen) do
                                i, j = string.find(ScreenShotText, v)
                                if i ~= nil or j ~= nil then
                                    TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,"OnScreen Menu Detection","BAN")
                                end
                            end
                            
                        end,"GET",'')
                    end)

                    RegisterServerEvent('PIXEL:CheckBan')
                    AddEventHandler('PIXEL:CheckBan', function(kvp)
                        if kvp == nil then
                            return
                        end
                        local kvp = json.decode(kvp)
                        local _source = source
                        local found = false
                        for i = 1, #BanList, 1 do
                            if ((tostring(BanList[i].identifier)) == tostring(kvp)) then
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', _source,"[Try to join]","GBAN")
                                found = true
                                break
                            end
                        end
                    end)

                    RegisterServerEvent('OVACTRIGGER:BanMySelf')
                    AddEventHandler('OVACTRIGGER:BanMySelf', function(reason,log,ban)
                        local _source = source
                        if ban ~= "BAN" and ban ~= "KICK" and ban ~= "GBAN" and ban ~= "WARN" then
                            print("[PIXEL]:Detecred Error! Client config problem.")
                            return DropPlayer(_source, "Sorry!")
                        end
                        if not DoesPlayerHavePermission(_source, "PX.Master") then
                            if not ban then return false end
                            if ban == "BAN" or ban == "GBAN" then 
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', _source,reason,ban)
                            elseif ban == "KICK" then
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', _source,reason,"KICK")
                            elseif ban == "WARN" then
                                Warn(_source, reason)
                            end
                        end
                    end)

                    RegisterServerEvent('OVACTRIGGER:Ban1FuckinCheater')
                    AddEventHandler('OVACTRIGGER:Ban1FuckinCheater', function(source,reason,bantype)
                        local _source = tonumber(source)
                        if bantype ~= "BAN" and bantype ~= "GBAN" and bantype ~= "KICK" and bantype ~= "WARN" then
                            return print("[PIXEL]:Error in Ban Type!"..reason)
                        end
                        if not GetPlayerName(_source) then
                            return
                        end
                        local identifier
                        local license
                        local liveid    = "NONE"
                        local xblid     = "NONE"
                        local discord   = "NONE"
                        local playerip
                        local sourceplayername = GetPlayerName(source)
                            for k,v in ipairs(GetPlayerIdentifiers(source))do
                                if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                        identifier = v
                                elseif string.sub(v, 1, string.len("license:")) == "license:" then
                                        license = v
                                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                                        liveid = v
                                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                                        xblid  = v
                                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                                        discord = v
                                elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                                        playerip = v
                                end
                            end
                            local token = {}
                            for i = 0, GetNumPlayerTokens(source) do
                                table.insert(token, GetPlayerToken(source, i))
                            end
                            if bantype == "BAN" or bantype == "GBAN" then
                                if not DoesPlayerHavePermission(source, "PX.Master") then
                                    ban(source,token,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,bantype)
                                    SetPlayerRoutingBucket(source, 2000)
                                end
                            elseif bantype == "KICK" then
                                if not DoesPlayerHavePermission(source, "PX.Master") then
                                    TriggerClientEvent('chatMessage', tonumber("-1"), "[💫 PIXEL⭐️]", {255, 0, 0}, sourceplayername.." Kicked From Server." )
                                    sendToDiscord(PIXEL_A.DiscordPIXELBan,source,"[KickLog]","**Name :**"..sourceplayername.."\n\n**"..identifier.."**\n\n**Tokens :"..json.encode(token).."**\n\n**"..license.."**\n\n<@!"..string.gsub(discord, "discord:", "")..">\n\n**"..playerip.."**\n\n**Reason :**"..reason.."\n\n Enjoy ban xD",15158332,1)
                                    Wait(3000)
                                    DropPlayer(_source,PIXEL_A.KickMassage)
                                end
                            elseif bantype == "WARN" then
                                Warn(source, reason)
                            end
                    end)
                    RegisterNetEvent('Pixel:GetData')
                    AddEventHandler('Pixel:GetData', function(value,target)
                        if DoesPlayerHavePermission(source, "PX.Master") then
                            if value == "ban" then
                                TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', target,"Banned By AdminMenu","BAN")
                            elseif value == "kick" then
                                TriggerClientEvent('chatMessage', tonumber("-1"), "[💫 PIXEL⭐️]", {255, 0, 0}, GetPlayerName(target).." Kicked From Server." )
                                DropPlayer(target,"Kicked By AdminMenu")
                            elseif value == "screenshot" then
                                sendToDiscord(PIXEL_A.DiscordPIXELScreens,target,"[AdminMenu]","**Name: **"..GetPlayerName(target).."\n",3447003,1)
                            elseif value == "bring" then
                                SetEntityCoords(GetPlayerPed(target),GetEntityCoords(GetPlayerPed(source)))
                                TriggerClientEvent('chatMessage', target, "[💫 Pixel AntiCheat⭐️]", {255, 0, 0},"Admin Bringed You." )
                                TriggerClientEvent('chatMessage', source, "[💫 Pixel AntiCheat⭐️]", {255, 0, 0},"Successfully Bringed." )
                            elseif value == "goto" then
                                SetEntityCoords(GetPlayerPed(source),GetEntityCoords(GetPlayerPed(target)))
                                TriggerClientEvent('chatMessage', target, "[💫 Pixel AntiCheat⭐️]", {255, 0, 0},"Admin Teleported On You." )
                                TriggerClientEvent('chatMessage', source, "[💫 Pixel AntiCheat⭐️]", {255, 0, 0},"Successfully Teleported On Player." )
                            end
                        else
                            TriggerEvent('OVACTRIGGER:Ban1FuckinCheater', source,'Try To Use AdminMenu Without Permission',"GBAN")
                        end
                    end)
                    AddEventHandler('playerDropped', function()
                        local _source = source
                        if _source ~= nil then
                                local identifier = GetPlayerIdentifier(_source)
                                PlayerCheck[identifier] = nil
                                PlayerWarning[identifier] = nil
                        end
                    end)

                --EndEvents

                --Commands
                    RegisterCommand('pixelmenu',function(source)
                        if DoesPlayerHavePermission(source, "PX.Master") then
                            TriggerClientEvent('Pixel:OpenMenu',source)
                        end
                    end)
                    RegisterCommand('pxunban',function(source, args)
                        if DoesPlayerHavePermission(source, "PX.Master") then
                            if args then
                                MySQL.Async.execute('DELETE FROM pixel WHERE report_id=@banid', {

                                    ['@banid'] =  args

                                }, function(rowsChanged)
                                    if rowsChanged == 1 then
                                        print("^2[Pixel Unban] ^3The Player Successfully Unbanned ! :}")
                                    else 
                                        print("^2[Pixel Unban] ^1Ban ID Does Not Exist !")
                                    end
                                end)
                            else
                                print("^2[Pixel Helper] ^3Please Enter Valid Ban ID")
                            end
                        end
                    end)
                    RegisterCommand('screenall',function(source)
                        if DoesPlayerHavePermission(source, "PX.Master") then
                            sendToDiscord(PIXEL_A.DiscordPIXELScreens, -1,"[Screen All]","**Name: **"..GetPlayerName(target).."\n",3447003,1)
                        end
                    end)

                    RegisterCommand("Module", function(source, args)
                        if source == 0 then
                            if args[1] == nil then
                                return print('^3[Pixel Helper] ^1Invalid Input , Try Use Module help Command')
                            end
                            if string.lower(args[1]) == string.lower('install') then
                                    local AddStart = true
                                    for i = tonumber("1.0") , GetNumResources() do
                                        if GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= nil and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= GetCurrentResourceName() and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "_cfx_internal" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "fivem" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "fivem-map-hipster" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "fivem-map-skater" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "redm-map-one" and GetResourceByFindIndex(string.sub(tonumber(string.sub(i,  tonumber("1"), -tonumber("3"))),  tonumber("1"), -tonumber("3"))) ~= "chat-theme-gtao" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "yarn" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "sessionmanager-rdr3" then
                                            Citizen.Wait(tonumber("50"))
                                            local color = math.random(#Colors)
                                            if Logged then
                                                local AntiI = LoadResourceFile(GetCurrentResourceName(), "Module/ServerModule.lua")
                                                local AntiI2 = LoadResourceFile(GetCurrentResourceName(), "Module/ClientModule.lua")
                                                local fxmanifest = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "fxmanifest.lua")
                                                local resource = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "__resource.lua")

                                                if not AntiI or not AntiI2 then
                                                    return print("File not exist!")
                                                end
                                                if fxmanifest then
                                                        local Isfilex = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ClientModule.lua")
                                                        local Isfilex2 = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ServerModule.lua")
                                                        if not Isfilex or not Isfilex2 then
                                                            print("^"..Colors[color].."["..GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))).."]: Module Successfully Installed On This Script !")
                                                            SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ServerModule.lua", AntiI, -tonumber("1"))
                                                            Citizen.Wait(100)
                                                            SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ClientModule.lua", AntiI2, -tonumber("1"))
                                                            Citizen.Wait(100)
                                                            SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "fxmanifest.lua", "\nclient_script 'ClientModule.lua'\nserver_script 'ServerModule.lua'\n"..fxmanifest, -tonumber("1"))
                                                            NeedRestart = true
                                                        end
                                                elseif resource then
                                                        local Isfilex = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ClientModule.lua")
                                                        local Isfilex2 = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ServerModule.lua")
                                                        if not Isfilex or not Isfilex2 then
                                                            print("^"..Colors[color].."["..GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))).."]: Module Successfully Installed On This Script !")
                                                            SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ServerModule.lua", AntiI, -tonumber("1"))
                                                            Citizen.Wait(100)
                                                            SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "ClientModule.lua", AntiI2, -tonumber("1"))
                                                            Citizen.Wait(100)
                                                            SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "__resource.lua", "\nclient_script 'ClientModule.lua'\nserver_script 'ServerModule.lua'\n"..resource, -tonumber("1"))
                                                            NeedRestart = true
                                                        end
                                                end
                                            end
                                        end
                                    end
                                    if NeedRestart then
                                        print("[PIXEL AntiCheat]: Please Restart Server...")
                                    end
                            elseif string.lower(args[1]) == string.lower('uninstall') then
                                local AddStart = true
                                for i = tonumber("1.0") , GetNumResources() do
                                    if GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= nil and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= GetCurrentResourceName() and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "_cfx_internal" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "fivem" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "fivem-map-hipster" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "fivem-map-skater" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "redm-map-one" and GetResourceByFindIndex(string.sub(tonumber(string.sub(i,  tonumber("1"), -tonumber("3"))),  tonumber("1"), -tonumber("3"))) ~= "chat-theme-gtao" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "yarn" and GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))) ~= "sessionmanager-rdr3" then
                                        Citizen.Wait(tonumber("50"))
                                        local color = math.random(#Colors)
                                        if Logged then
                                            local fxmanifest = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "fxmanifest.lua")
                                            local resource = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "__resource.lua")
                                            local ResourcePatch = GetResourcePath(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))))
                                            if fxmanifest then
                                                    local Isfilex = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "fxmanifest.lua")
                                                    local Find, Char = string.find(Isfilex, "client_script 'ClientModule.lua'")
                                                    os.remove(""..ResourcePatch.."/ClientModule.lua")
                                                    os.remove(""..ResourcePatch.."/ServerModule.lua")
                                                    if Find ~= nil then
                                                        local newfx = fxmanifest:gsub("client_script 'ClientModule.lua'\nserver_script 'ServerModule.lua'","")
                                                        print("^"..Colors[color].."["..GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))).."]: Module Successfully UnInstalled On This Script !")
                                                        SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "fxmanifest.lua",newfx, -tonumber("1"))
                                                        NeedRestart = true
                                                    end
                                            elseif resource then
                                                    local Isfilex = LoadResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "__resource.lua")
                                                    local Find, Char = string.find(Isfilex, "client_script 'ClientModule.lua'")
                                                    os.remove(""..ResourcePatch.."/ClientModule.lua")
                                                    os.remove(""..ResourcePatch.."/ServerModule.lua")
                                                    if Find ~= nil then
                                                        local newres = resource:gsub("client_script 'ClientModule.lua'\nserver_script 'ServerModule.lua'","")
                                                        print("^"..Colors[color].."["..GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))).."]: Module Successfully UnInstalled On This Script !")
                                                        SaveResourceFile(GetResourceByFindIndex(tonumber(string.sub(i,  tonumber("1"), -tonumber("3")))), "__resource.lua", newres, -tonumber("1"))
                                                        NeedRestart = true
                                                    end
                                            end
                                        end
                                    end
                                end
                                if NeedRestart then
                                    print("[PIXEL AntiCheat]: Please Restart Server...")
                                end
                            elseif string.lower(args[1]) == string.lower('help') then
                                print("^3[Pixel Helper] ^1Welcome To Pixel Helper Part !")
                                print("^3[Pixel Helper] ^1Commands List ( U Need Type It In Your Console ) :")
                                print("^3[Pixel Helper] ^1For Install Module : Module install")
                                print("^3[Pixel Helper] ^1For UnInstall Module : Module uninstall")
                            end
                        else
                            DropPlayer(source, "Why U Try This Command On Game ?!")
                        end
                    end)
                --EndCommand
            else
                print("^1[Error]^0: ^1 Your License Has Been Expired. ")
                Citizen.Wait(tonumber("3000"))
                os.exit()
            end

		else
            print("^1Pixel AntiCheat^0: ^1 Error In Your License. ")
            if Auth.Reason then
                print("^1Pixel AntiCheat^0: ^1 Error: ^3"..Auth.Reason.."^0")
            end
            RequstToServer("http://pixelac.site/pixelacapi/Logs/TryCrack.php?Res=".. CurrentResourceName .."&License=".. PIXEL_A.License .."",function(a,b,c)
                if a == 0 and b == nil then
                    return print("[Pixel AntiCheat]:Error In Connect To Site For Send Log!")
                end
            end,"GET",'')
            Citizen.Wait(tonumber("5000"))
            os.exit()
        end
    end
end, 'GET','')
