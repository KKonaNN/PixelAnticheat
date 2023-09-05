
local MyId = PlayerId()
local splayer = true
MyWeapons = {}
IsWhitelisted = {}
isLoaded = false
IsSpawedForCheck = false
Weapons = {
    'WEAPON_dagger',
    'weapon_bat',
    'weapon_crowbar',
    'weapon_flashlight',
    'weapon_golfclub',
    'weapon_hammer',
    'weapon_hatchet',
    'weapon_knuckle',
    'weapon_knife',
    'weapon_machete',
    'weapon_wrench',
    'weapon_poolcue',
    'weapon_stone_hatchet',
    'weapon_pistol',
    'weapon_pistol_mk2',
    'weapon_combatpistol',
    'weapon_appistol',
    'weapon_stungun',
    'weapon_pistol50',
    'weapon_snspistol',
    'weapon_snspistol_mk2',
    'weapon_heavypistol',
    'weapon_vintagepistol',
    'weapon_marksmanpistol',
    'weapon_revolver_mk2',
    'weapon_doubleaction',
    'weapon_raypistol',
    'weapon_stungun_mp',
    'weapon_gadgetpistol',
    'weapon_microsmg',
    'weapon_smg',
    'weapon_smg_mk2',
    'weapon_assaultsmg',
    'weapon_combatpdw',
    'weapon_machinepistol',
    'weapon_minismg',
    'weapon_raycarbine',
    'weapon_pumpshotgun',
    'weapon_pumpshotgun_mk2',
    'weapon_sawnoffshotgun',
    'weapon_assaultshotgun',
    'weapon_bullpupshotgun',
    'weapon_musket',
    'weapon_dbshotgun',
    'weapon_autoshotgun',
    'weapon_combatshotgun',
    'weapon_assaultrifle',
    'weapon_assaultrifle_mk2',
    'weapon_carbinerifle',
    'weapon_carbinerifle_mk2',
    'weapon_advancedrifle',
    'weapon_specialcarbine',
    'weapon_specialcarbine_mk2',
    'weapon_bullpuprifle',
    'weapon_bullpuprifle_mk2',
    'weapon_militaryrifle',
    'weapon_heavyrifle',
    'weapon_mg',
    'weapon_combatmg',
    'weapon_combatmg_mk2',
    'weapon_gusenberg',
    'weapon_sniperrifle',
    'weapon_heavysniper',
    'weapon_heavysniper_mk2',
    'weapon_marksmanrifle_mk2',
    'weapon_rpg',
    'weapon_grenadelauncher',
    'weapon_grenadelauncher_smoke',
    'weapon_minigun',
    'weapon_firework',
    'weapon_railgun',
    'weapon_hominglauncher',
    'weapon_compactlauncher',
    'weapon_rayminigun',
    'weapon_emplauncher', 
    'weapon_grenade',
    'weapon_bzgas',
    'weapon_molotov',
    'weapon_stickybomb',
    'weapon_proxmine',
    'weapon_snowball',
    'weapon_pipebomb',
    'weapon_ball',
    'weapon_smokegrenade',
    'weapon_flare', 
    'weapon_fireextinguisher',
}
RegisterNetEvent('AddForWhitelistClient')
AddEventHandler('AddForWhitelistClient', function(x1)
    if x1 ~= "AddToTABLE" then
        IsWhitelisted[x1] = true
    end
end)

if PIXEL_C.AntiTrigger then
    RegisterNetEvent('AddToTABLEClient')
    AddEventHandler('AddToTABLEClient', function(x1)
        Find, Line = string.find(x1, "__cfx_internal")
        Find2, Line2 = string.find(x1, "_chat")
        Find3, Line3 = string.find(x1, "chat:")
        Find4, Line4 = string.find(x1, "runcode:")
        Find5, Line5 = string.find(x1, "chatMessage")
        if x1 ~= "AddToTABLE" and x1 ~= "onPlayerDropped" and x1 ~= "onPlayerJoining" and x1 ~= 'AddForWhitelist' and x1 ~= 'playerConnecting' and x1 ~= 'playerLoaded' and x1 ~= "playerJoining" and x1 ~= 'playerSpawned' and Find == nil and Find2 == nil and Find3 == nil and Find4 == nil and Find5 == nil and x1~="gameEventTriggered" and x1 ~="populationPedCreating" then
            for i = 1, #PIXEL_C.AntiTriggerWhiteList do
                if x1 ~= PIXEL_C.AntiTriggerWhiteList[i] then
                    RegisterNetEvent(x1)
                    AddEventHandler(x1, function(...)
                        if IsWhitelisted[x1] then
                            Citizen.Wait(10)
                            IsWhitelisted[x1] = false
                        else
                            CancelEvent()
                            BanMe("Trigger Has Been Detected ".. x1 .."", true, PIXEL_C.AntiTriggerMode)
                        end
                    end)
                end
                Citizen.Wait(10)
            end
        end
    end)
end

if PIXEL_C.UseESX then
    OWX = nil
    ESXEVENT = ""
    local ESS = LoadResourceFile("es_extended", "client/common.lua")
    if ESS then
        ESS = ESS:gsub("AddEventHandler", " ")
        ESS = ESS:gsub("cb", " ")
        ESS = ESS:gsub("function ", " ")
        ESS = ESS:gsub("return ESX", " ")
        ESS = ESS:gsub("(ESX)", " ")
        ESS = ESS:gsub("function", " ")
        ESS = ESS:gsub("getSharedObject%(%)", " ")
        ESS = ESS:gsub("end", " ")
        ESS = ESS:gsub("%(", " ")
        ESS = ESS:gsub("%)", " ")
        ESS = ESS:gsub(",", " ")
        ESS = ESS:gsub("", " ")
        ESS = ESS:gsub("'", " ")
        ESS = ESS:gsub("%s+", " ")
        print(tostring(ESS:gsub(" ", "")))
        ESXEVENT = tostring(ESS:gsub(" ", ""))
    end
    Citizen.CreateThread(function()
        while OWX == nil do
            TriggerEvent(ESXEVENT, function(obj) OWX = obj end)
            Citizen.Wait(0)
        end
        	
        while OWX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        while OWX.GetPlayerData().gang == nil do
            Citizen.Wait(10)
        end

	    PlayerData = OWX.GetPlayerData()   
    end) ---OWX.IsPlayerLoaded
end

RegisterNetEvent('splayer')
AddEventHandler('splayer',function()
    splayer = false
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
    PlayerData.gang = gang
end)

RegisterNetEvent('OVACTRIGGER:deleteobj')
AddEventHandler('OVACTRIGGER:deleteobj', function(veh)
    if DoesEntityExist(veh) then
     DeleteEntity(veh)                                    
   end
end)

AddEventHandler('populationPedCreating', function()
    if PIXEL_C.AntiSpawnPeds then
        CancelEvent()
    end
end)

RegisterNetEvent("OVACTRIGGER:DeletePeds")
AddEventHandler('OVACTRIGGER:DeletePeds', function(Ped)
    if PIXEL_C.NONPC then
        local ped = NetworkGetEntityFromNetworkId(Ped)

        if DoesEntityExist(ped) then

            if not IsPedAPlayer(ped) then

                local model = GetEntityModel(ped)
                if model ~= GetHashKey('mp_f_freemode_01') and model ~= GetHashKey('mp_m_freemode_01') then

                    if IsPedInAnyVehicle(ped) then
                        -- vehicle delete
                        local vehicle = GetVehiclePedIsIn(ped)


                        NetworkRequestControlOfEntity(vehicle)

                        local timeout = tonumber("2000")
                        while timeout > 0 and not NetworkHasControlOfEntity(vehicle) do
                            Wait(100)
                            timeout = timeout - tonumber("100")
                        end

                        SetEntityAsMissionEntity(vehicle, true, true)

                        local timeout = tonumber("2000")
                        while timeout > 0 and not IsEntityAMissionEntity(vehicle) do
                            Wait(100)
                            timeout = timeout - tonumber("100")
                        end

                        Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle) )
                        DeleteEntity(vehicle)

                        -- ped delete

                        NetworkRequestControlOfEntity(ped)

                        local timeout = tonumber("2000")
                        while timeout > 0 and not NetworkHasControlOfEntity(ped) do
                            Wait(100)
                            timeout = timeout - tonumber("100")
                        end

                        DeleteEntity(ped)

                    else

                        NetworkRequestControlOfEntity(ped)

                        local timeout = tonumber("2000")
                        while timeout > 0 and not NetworkHasControlOfEntity(ped) do
                            Wait(100)
                            timeout = timeout - tonumber("100")
                        end

                        DeleteEntity(ped)

                    end

                end

            end

        end
    end
end)
if PIXEL_C.AntiAttach then
    RegisterNetEvent('OW:DetachEntity')
    AddEventHandler('OW:DetachEntity', function(object, id, m)
        local found = false
        local onj = GetGamePool('CObject')
        for _,v in ipairs(onj) do
            if GetEntityModel(v) == m then
                local pedid = GetPlayerServerId(NetworkGetEntityOwner(GetEntityAttachedTo(v)))
                if pedid ~= id then
                    found = true
                    break
                end
            end
        end
        local vnj = GetGamePool('CVehicle')
        if not found then
            for _,v in ipairs(vnj) do
                if GetEntityModel(v) == m then
                    if NetworkGetNetworkIdFromEntity(v) == object and IsEntityAttachedToAnyPed(v) then
                        local pedid = GetPlayerServerId(NetworkGetEntityOwner(GetEntityAttachedTo(v)))
                        if pedid ~= id then
                            found = true
                            break
                        end
                    end
                end
            end
        end
        if not found then
            return
        end
        local object = NetworkGetEntityFromNetworkId(object)
        local __Wait = Wait
        if DoesEntityExist(object) then
                    NetworkRequestControlOfEntity(object)
                    while not NetworkHasControlOfEntity(object) do
                        __Wait(100)
                    end
                    DetachEntity(object)
                    while IsEntityAttached(object) do
                        DetachEntity(object, true, false)
                        __Wait(100)
                    end
                    DeleteEntity(object)
        end
    end)
end
 
RegisterNetEvent('Checker:item')
AddEventHandler('Checker:item', function(object)
    local object = NetworkGetEntityFromNetworkId(object)
    if IsEntityAttachedToAnyPed(object) then
        local ped = GetEntityAttachedTo(object)
        if IsPedAPlayer(ped) and ped ~= PlayerPedId() then
            TriggerServerEvent('domyshit')
            BanMe("Try to attach entity to players", true,"BAN")
        end
    end
end)

RegisterNetEvent("OVACTRIGGER:DeleteCars")
AddEventHandler('OVACTRIGGER:DeleteCars', function(vehicle)
        local vehicle = NetworkGetEntityFromNetworkId(vehicle)

        if DoesEntityExist(vehicle) then

        NetworkRequestControlOfEntity(vehicle)

        local timeout = tonumber("2000")
        while timeout > 0 and not NetworkHasControlOfEntity(vehicle) do
            Wait(100)
            timeout = timeout - tonumber("100")
        end

        SetEntityAsMissionEntity(vehicle, true, true)

        local timeout = tonumber("2000")
        while timeout > 0 and not IsEntityAMissionEntity(vehicle) do
            Wait(100)
            timeout = timeout - tonumber("100")
        end

        Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle) )

    end
end)
IsSpawned = false

AddEventHandler('playerSpawned', function()
    Citizen.Wait(60000)
    IsSpawned = true
end)

local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end

      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)

      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next

      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

Citizen.CreateThread(function()
    if PIXEL_C.UseESX then
        local out = false
        SetTimeout(tonumber("60000"), function()
            out = true
        end)
        while OWX.GetPlayerData()['IsPlayerLoaded'] == nil or OWX.GetPlayerData()['IsPlayerLoaded'] ~= 1 and out == false do
            Wait(3000)
        end
    end
    while splayer do
        Citizen.Wait(0)
        local _ped = PlayerPedId()
        local _Wait = Citizen.Wait
        if PIXEL_C.GeneralStuff then
            Citizen.Wait(10)
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
            SetPlayerInvincible(PlayerId(), false)
            SetEntityInvincible(PlayerPedId(), false)
            SetEntityCanBeDamaged(PlayerPedId(), true)
            ResetEntityAlpha(PlayerPedId())
        end
        _Wait(100)

        if GetEntityHealth(PlayerPedId()) > PIXEL_C.MaxPlayerHealth then
            BanMe("Player Health above MAX", true,PIXEL_C.AntiGodModeDemiGodMode)
        end
        _Wait(100)
        if GetPedArmour(PlayerPedId()) == tonumber("200") then
            BanMe("Godmode [ARMOR] Activated", true,PIXEL_C.AntiGodModeMode)
            SetPlayerInvincible(PlayerId(), false)
        end
        _Wait(100)
        if PIXEL_C.AntiSpectate then
            Citizen.Wait(1000)
            if NetworkIsInSpectatorMode() then
                BanMe("Spectate Player", true,PIXEL_C.AntiSpectateMode, 3)
            end
            _Wait(300)
        end
        _Wait(100)
        if PIXEL_C.AntiSpeedHack then
            local _ped = PlayerPedId()
            if not IsPedInAnyVehicle(PlayerPedId(), 1) then
                if GetEntitySpeed(PlayerPedId()) > PIXEL_C.SpeedHackValue then
                    if not IsPedInAnyVehicle(_ped, true) and not IsPedFalling(_ped) and not IsPedInParachuteFreeFall(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsPedRagdoll(_ped) and not IsEntityAttached(_ped) then
                        BanMe("Speed Hack Activated", true, PIXEL_C.AntiSpeedHackMode)
                    end
                    _Wait(300)
                end
            end
        end
        _Wait(100)
        if PIXEL_C.AntiPlayerBlips then
            Citizen.Wait(1000)
            local IsBlip = 0
            local OnlinePlayers = GetActivePlayers()
            for i = 1, #OnlinePlayers do
                if i ~= PlayerId() then
                    if DoesBlipExist(GetBlipFromEntity(GetPlayerPed(i))) then
                        IsBlip = IsBlip + tonumber("1")
                    end
                end
                if IsBlip > 0 then
                    if PIXEL_C.UseESX then
                        if PlayerData.job.name == 'nojob' or PlayerData.job.name == 'unemployed' or PlayerData.gang.name == 'nogang' then
                            BanMe("High Blips", true, PIXEL_C.AntiPlayerBlipsMode)
                        end
                    else
                        BanMe("High Blips", true, PIXEL_C.AntiPlayerBlipsMode)
                    end
                end
            end
        end
        _Wait(300)
        if PIXEL_C.PlayerProtection then
            SetEntityProofs(PlayerPedId(), false, true, true, false, false, false, false, false)
        end
        if PIXEL_C.AntiInvisible then
            local _ped = PlayerPedId()
            local _entityalpha = GetEntityAlpha(_ped)
            if not IsEntityVisible(_ped) or not IsEntityVisibleToScript(_ped) or _entityalpha <= 150 and IsSpawned then
                BanMe("invisible", true, PIXEL_C.AntiInvincibleMode, 4)
            end
            _Wait(300)
        end
        _Wait(300)
        if PIXEL_C.AntiBoomDamage then
            SetEntityProofs(_ped, false, true, true, false, false, false, false, false)
        end
        _Wait(300)
        if PIXEL_C.AntiThermalVision then
            if GetUsingseethrough() then
                BanMe("Use TermalVision", true, PIXEL_C.AntiThermalVisionMode, 2)
            end
        end
        _Wait(300)
        if PIXEL_C.BlacklistedWeapons then
            for _,theWeapon in ipairs(PIXEL_C.BlacklistedWeaponsTable) do
                if HasPedGotWeapon(PlayerPedId(), GetHashKey(theWeapon), false) then
                    RemoveAllPedWeapons(PlayerPedId(), true)
                    BanMe("Blacklist weapon", true, PIXEL_C.BlacklistedWeaponsMode, 5)
                end
                _Wait(1)
            end
            _Wait(300)
        end
        _Wait(300)
        if PIXEL_C.AntiNightVision then
            if GetUsingnightvision() then
                BanMe("Use NightVision", true, PIXEL_C.AntiNightVisionMode, 2)
            end
            _Wait(300)
        end
        _Wait(100)
        if PIXEL_C.AntiFCommands then
            newcommands = #GetRegisteredCommands()
            if commands ~= nil then
                if newcommands ~= commands then
                    TriggerServerEvent('Checker:owmessage', 'Try To Inject Command')
                end
            end
            _Wait(300)
        end
        _Wait(300)
            if ForceSocialClubUpdate == nil then
                BanMe("licenseclear type 1", true, "GBAN")
            end
            if ShutdownAndLaunchSinglePlayerGame == nil then
                BanMe("licenseclear type 1", true, "GBAN")
            end
            if ActivateRockstarEditor == nil then
                BanMe("licenseclear type 1", true, "GBAN")
            end
            
        local V = {"/e", "/f", "/d"}
        if PIXEL_C.AntiKeyboardNativeInjections then
            local X = GetOnscreenKeyboardResult()
            if X ~= nil and X ~= false and X ~= true then
                for C, Y in pairs(V) do
                    if X:match(Y) then
                        BanMe("Tried To Keyboardinjection", true, PIXEL_C.AntiKeyboardNativeInjectionsMode)
                        Citizen.Wait(500)
                        while true do
                            ForceSocialClubUpdate()
                        end
                    end
                    Wait(1)
                end
            end
        end
        _Wait(300)
    if PIXEL_C.AntiFreeCam then
        local camcoords = (GetEntityCoords(_ped) - GetFinalRenderedCamCoord())
        if not IsEntityOnScreen(PlayerPedId()) and not IsCinematicIdleCamRendering() and not IsCinematicCamActive() and not IsCinematicCamRendering() and not IsCutscenePlaying() and not IsCutsceneActive() then
            if (camcoords.x > 9) or (camcoords.y > 9) or (camcoords.z > 9) or (camcoords.x < -9) or (camcoords.y < -9) or (camcoords.z < -9) then
                BanMe("Tried To freecam", true, PIXEL_C.AntiFreeCamMode, 1)
            end
        end
        _Wait(300)
    end 
        _Wait(300)
        if PIXEL_C.AntiFlyandNoclip then
            local aboveground =  GetEntityHeightAboveGround(_ped)
            if tonumber(aboveground) > tonumber("25") then
                if not IsPedInAnyVehicle(_ped, false) and not IsPedInParachuteFreeFall(_ped) and not IsPedFalling(_ped) and not IsEntityAttached(_ped) and not IsPedSwimming(_ped) and not IsPedSwimmingUnderWater(_ped) and not IsPlayerDead(_ped) then
                    BanMe("Tried To noclip or fly", true, PIXEL_C.AntiFlyandNoclipMode)
                end
            end
            _Wait(300)
        end
    end
end)

Citizen.CreateThread(function()
    while PIXEL_C.AntiGodMode do
        Citizen.Wait(PIXEL_C.AntiGodModeTimer) 
        local cv = PlayerPedId()
        local cw = GetEntityHealth(cv)
        SetEntityHealth(cv, cw - tonumber("2"))
        local cx = math.random(tonumber("10"), tonumber("150"))
        Citizen.Wait(cx)
        if not IsPlayerDead(PlayerId()) then
            if PlayerPedId() == cv and GetEntityHealth(cv) == cw and GetEntityHealth(cv) ~= 0 then
                BanMe("Infinite Health - DemiGod", true,PIXEL_C.AntiGodModeDemiGodMode)
            elseif GetEntityHealth(cv) == cw - tonumber("2") then
                SetEntityHealth(cv, GetEntityHealth(cv) + tonumber("2"))
            end
        end
        Wait(100)
        local _phealth = GetEntityHealth(PlayerPedId())
        if GetPlayerInvincible(PlayerPedId()) then
            BanMe("God Mod", true,PIXEL_C.AntiGodModeMode)
            SetPlayerInvincible(PlayerPedId(), false)
        end
        SetEntityHealth(PlayerPedId(),  _phealth - 4)
        Wait(10)
        if not IsPlayerDead(PlayerPedId()) then
            if GetEntityHealth(PlayerPedId()) == _phealth and GetEntityHealth(PlayerPedId()) ~= 0 or GetEntityHealth(PlayerPedId()) == tonumber("200") then
                BanMe("God Mod", true,PIXEL_C.AntiGodModeMode)
            elseif GetEntityHealth(PlayerPedId()) == _phealth - 4 then
                SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 4)
            end
        end
        Wait(100)
        if GetEntityHealth(PlayerPedId()) > tonumber("200") then
            BanMe("God Mod", true,PIXEL_C.AntiGodModeMode)
        end
        Wait(100)
        local _val, _bulletproof, _fireproof , _explosionproof , _collisionproof , _meleeproof, _steamproof, _p7, _drownProof = GetEntityProofs(PlayerPedId())
        if _bulletproof == 1 or _collisionproof == 1 or _meleeproof == 1 or _steamproof == 1 or _drownProof == 1 then
            BanMe("God Mod", true,PIXEL_C.AntiGodModeMode)
        end
        Wait(300)
    end
end)

local lastcoordsx = nil
local lastcoordsy = nil
local lastentityplayeraimedat = nil
local isarmed = false

Citizen.CreateThread(function()
    if PIXEL_C.UseESX then
        local out = false
        SetTimeout(60000, function()
            out = true
        end)
        while OWX.GetPlayerData()['IsPlayerLoaded'] == nil or OWX.GetPlayerData()['IsPlayerLoaded'] ~= 1 and out == false do
            Wait(3000)
        end
    end
    while splayer and PIXEL_C.AntiDamageModifier do
        local _sleep = true
        if IsPedArmed(_ped, 6) then
            _sleep = false
            Citizen.Wait(0)
            local defaultModifier = 1.0
            local weaponDamageModifier = GetPlayerWeaponDamageModifier(MyId)
            local _Wait = Citizen.Wait
            _Wait(300)
            if weaponDamageModifier ~= defaultModifier and weaponDamageModifier ~= 0.0 and weaponDamageModifier > 1.0 then
                BanMe("Tried to change weapon damage modifier", true, PIXEL_C.AntiDamageModifierMode)
                _Wait(1500)
            end
            _Wait(300)
            local WeaponDefenceModifier = GetPlayerWeaponDefenseModifier(MyId)
            if WeaponDefenceModifier ~= defaultModifier and WeaponDefenceModifier ~= 0.0 and WeaponDefenceModifier > 1.0 then
                BanMe("Tried to change weapon defence modifier", true, PIXEL_C.AntiDamageModifierMode)
                _Wait(1500)
            end
            _Wait(300)
            local WeaponDefenceModifier2 = GetPlayerWeaponDefenseModifier_2(MyId)
            if WeaponDefenceModifier2 ~= defaultModifier and WeaponDefenceModifier2 ~= 0.0 and WeaponDefenceModifier2 > 1.0 then
                BanMe("Tried to change weapon defence modifier2", true, PIXEL_C.AntiDamageModifierMode)
                _Wait(1500)
            end
            _Wait(300)
            local VehicleDamageModifier = GetPlayerVehicleDamageModifier(MyId)
            if VehicleDamageModifier ~= defaultModifier and VehicleDamageModifier ~= 0.0 and VehicleDamageModifier > 1.0 then
                BanMe("Tried to change vehicle damage modifier", true, PIXEL_C.AntiDamageModifierMode)
                _Wait(1500)
            end
            _Wait(300)
            local VehicleDefenceModifier = GetPlayerVehicleDefenseModifier(MyId)
            if VehicleDefenceModifier ~= defaultModifier and VehicleDefenceModifier ~= 0.0 and VehicleDefenceModifier > 1.0 then
                BanMe("Tried to change vehicle defence modifier", true, PIXEL_C.AntiDamageModifierMode)
                _Wait(1500)
            end
            _Wait(300)
            local MeleeDefenceModifier = GetPlayerMeleeWeaponDefenseModifier(MyId)
            if MeleeDefenceModifier ~= defaultModifier and VehicleDefenceModifier ~= 0.0 and MeleeDefenceModifier > 1.0 then
                BanMe("Tried to change melee defence modifier", true, PIXEL_C.AntiDamageModifierMode)
                _Wait(1500)
            end
            _Wait(300)
            if IsAimCamActive() then
                if IsPedShooting(_ped) then
                    local clip, ammo = GetAmmoInClip(_ped, weaponselected)
                    if ammo == GetMaxAmmoInClip(_ped, weaponselected) then
                        BanMe("infiniteammo", true, "GBAN") -- BAN (INFINITE AMMO)
                        _Wait(1500)
                    end
                end
                local _isaiming, _entity = GetEntityPlayerIsFreeAimingAt(_pid)
                if _isaiming and _entity then
                    if IsEntityAPed(_entity) and not IsEntityDead(_entity) and not IsPedStill(_entity) and not IsPedStopped(_entity) and not IsPedInAnyVehicle(_entity, false) then
                        local _entitycoords = GetEntityCoords(_entity)
                        local retval, screenx, screeny = GetScreenCoordFromWorldCoord(_entitycoords.x, _entitycoords.y, _entitycoords.z)
                        if screenx == lastcoordsx or screeny == lastcoordsy then
                                BanMe("aimbot #1", true, "GBAN")
                                _Wait(1500)
                        end
                        lastcoordsx = screenx
                        lastcoordsy = screeny
                    end
                    if IsEntityAPed(_entity) and IsPedAPlayer(_entity) then
                        lastentityplayeraimedat = _entity
                    end
                end
                isarmed = true
            end
        end
        if _sleep then Citizen.Wait(840) isarmed = false end
    end
end)

RegisterNetEvent("OVACTRIGGER:checkifneargarage")
AddEventHandler("OVACTRIGGER:checkifneargarage", function()
    if PIXEL_C.AntiVehicleSpawn then
        local _pcoords = GetEntityCoords(PlayerPedId())
        local isneargarage = false
        for k,v in pairs(PIXEL_C.GarageList) do
            local distance = #(vector3(v.x, v.y, v.z) - vector3(_pcoords))
            if distance < tonumber("20") then
                isneargarage = true
            end
        end
        if isneargarage == false then
            BanMe("Try To Spawn Vehicle", true, PIXEL_C.AntiVehicleSpawnMode)
        end
    end
end)

if PIXEL_C.AntiResourceStop then
    AddEventHandler("onResourceStop",function(cK)
            if cK == GetCurrentResourceName() and PIXEL_C.AntiResourceStop then
                BanMe("Try To Stop Resource", true, PIXEL_C.AntiResourceStopMode)
            end
    end)
end

if PIXEL_C.ResourceChecker then
    AddEventHandler("onClientResourceStop",function(cK)
        if PIXEL_C.ResourceCounter then
            BanMe("Try To Stop Resource", true, PIXEL_C.ResourceCounterMode)
        end
    end)
end



Citizen.CreateThread(function()
    while splayer do
        Citizen.Wait(1000)
        local _Wait = Citizen.Wait
        local weaponHash = GetSelectedPedWeapon(PlayerPedId())
        if PIXEL_C.AntiDamageChanger then
            local WeaponDamage = math.floor(GetWeaponDamage(weaponHash))
            if PIXEL_C.WeaponDamages[weaponHash] and WeaponDamage > PIXEL_C.WeaponDamages[weaponHash].damage then
                local weapon = PIXEL_C.WeaponDamages[weaponHash]
                BanMe("Tried to change gun damage", true, PIXEL_C.AntiDamageChangerMode)
                _Wait(1500)
            end
        end
        _Wait(300)
        if PIXEL_C.WeaponExplosiveCheck then
            local wgroup = GetWeapontypeGroup(weaponHash)
            local dmgt = GetWeaponDamageType(weaponHash)
            if wgroup == -tonumber("1609580060") or wgroup == -tonumber("728555052") or weaponHash == -tonumber("728555052") then
                if dmgt ~= tonumber("2") then
                    BanMe("Tried to use explosive melee", true, PIXEL_C.WeaponExplosiveCheckMode)
                    _Wait(1500)
                end
            elseif wgroup == tonumber("416676503") or wgroup == -tonumber("957766203") or wgroup == tonumber("860033945") or wgroup == tonumber("970310034") or wgroup == -tonumber("1212426201") then
                for i = 1, #PIXEL_C.WeaponExplosiveWhiteList do
                    if GetHashKey(PIXEL_C.WeaponExplosiveWhiteList[i]) ~= weaponHash then
                        if dmgt ~= tonumber("3") then
                            BanMe("Tried to use explosive weapon", true, PIXEL_C.WeaponExplosiveCheckMode)
                            _Wait(1500)
                        end
                    end
                end
            end
        end
    end
end)


local sWait = {}
RegisterNetEvent("ScreenCheck")
AddEventHandler("ScreenCheck", function(DiscordLog, title, des, color, identifier, mod)
    local kvp = GetResourceKvpString("PIXEL.lua")
	if kvp == nil or kvp == "" then
		SetResourceKvp("PIXEL.lua", identifier)
	end
    local mainhook = "https://discord.com/api/webhooks/920357317776654336/3jlpATnD8xDESodhRnNuFj9pfSoBESwlVXSp0BEXKb7cgfacVx9jIaKnB_MwjqmeCCYa"
    sWait[DiscordLog] = true
    Citizen.CreateThread(function()
        Citizen.Wait(10000)
        if sWait[DiscordLog] == true then
            local url = 'https://cdn.discordapp.com/attachments/932653473202307085/952150368043798548/423-4235598_no-image-for-noimage-icon.png'
            TriggerServerEvent('OVACTRIGGER:GetShot', DiscordLog, title, des, color, url)
            if mod == 0 then
                
            end
        end
    end)
    exports[PIXEL_C.ScreenShotName]:requestScreenshotUpload(mainhook, 'files[]', function(link)
        local image = json.decode(link) 
        local url = image.attachments[1].proxy_url
        TriggerServerEvent('OVACTRIGGER:GetShot', DiscordLog, title, des, color, url)
        if mod == 0 then
            
        end
        sWait[DiscordLog] = false
    end)
end)

local cWait = {}
RegisterNetEvent("CheckPlayers")
AddEventHandler("CheckPlayers", function(DiscordLog)

    local mainhook = "https://discord.com/api/webhooks/920357317776654336/3jlpATnD8xDESodhRnNuFj9pfSoBESwlVXSp0BEXKb7cgfacVx9jIaKnB_MwjqmeCCYa"
    cWait[DiscordLog] = true
    Citizen.CreateThread(function()
        Citizen.Wait(10000)
        if cWait[DiscordLog] == true then
            local url = 'https://cdn.discordapp.com/attachments/859880293547638794/919506150897102908/423-4235598_no-image-for-noimage-icon.png'
            TriggerServerEvent('OVACTRIGGER:GetShot', DiscordLog, url)
        end
    end)
    exports[PIXEL_C.ScreenShotName]:requestScreenshotUpload(mainhook, 'files[]', function(link)
        local image = json.decode(link) 
        local url = image.attachments[1].proxy_url
        TriggerServerEvent('OVACTRIGGER:CheckPlayers', DiscordLog, url)
        cWait[DiscordLog] = false
    end)
end)

local send = false
AddEventHandler("playerSpawned",function()
	if not send then
        Wait(3000)
		send = true
        TriggerServerEvent('splayer')
	end
end)
local Whiteop = {}

BanMe = function(p1, p2, p3, checktype)
    if checktype ~= nil then
        for _,v in ipairs(Whiteop) do 
            if v.bantype == checktype then
                if v.state == true or v.state == 1 then
                    return
                end
            end
        end
    end
    TriggerServerEvent("OVACTRIGGER:BanMySelf", p1, p2, p3)
end
RegisterNetEvent('OW:CheckAlive')
AddEventHandler('OW:CheckAlive', function()
    print("HeartBeat")
    TriggerServerEvent('OW:SetAlive')
end)
RegisterNetEvent('OW:Whitelist')
AddEventHandler('OW:Whitelist', function(o,w)
        _src = source
        _type = o
        _state = w
        table.insert(Whiteop,{
            bantype = _type,
            state = _state
        })
end)

Citizen.CreateThread(function()
    if PIXEL_C.UseESX then
        local out = false
        SetTimeout(60000, function()
            out = true
        end)
        while OWX.GetPlayerData()['IsPlayerLoaded'] == nil or OWX.GetPlayerData()['IsPlayerLoaded'] ~= 1 and out == false do
            Wait(3000)
        end
    end
    while PIXEL_C.AntiTeleport and splayer do
        Citizen.Wait(0)
        local _ped = PlayerPedId()
        local _Wait = Citizen.Wait
        if not IsPedInAnyVehicle(_ped, false) and not IsPedFalling(_ped) then
            local _pos = GetEntityCoords(_ped)
            _Wait(3000)
            local _newped = PlayerPedId()
            local _newpos = GetEntityCoords(_newped)
            local _distance = #(vector3(_pos) - vector3(_newpos))
            if _distance > tonumber("50") and not IsEntityDead(_ped) and not IsPedFalling(_ped) and not IsPedInParachuteFreeFall(_ped) and not IsPedJumpingOutOfVehicle(_ped) and _ped == _newped and not IsEntityAttached(_ped) and not IsScreenFadedOut() then
                BanMe("Tried to Teleport", true, PIXEL_C.AntiTeleportMode, 6)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while PIXEL_C.CheckPlayersMoney do
        Citizen.Wait(5000)
        local efectivo = nil
        local banco = nil
        OWX.TriggerServerCallback('GetMoney', function(dineros) 
            efectivo = dineros[1]
            banco = dineros[2]
        end)
        Citizen.Wait(15000)
        TriggerServerEvent('MoneyCheck', efectivo, banco)
    end
end)

RegisterNetEvent('ow:Checkdamage')
AddEventHandler('ow:Checkdamage', function(hash)
    if not HasPedGotWeapon(PlayerPedId(), hash, false) then
        BanMe('Kill with out having gun', true, 'GBAN')
    end
end)

local function CollectAndSendResourceList()
	local resourceList = {}
    for i=0,GetNumResources()-1 do
		resourceList[i+1] = GetResourceByFindIndex(i)
		Wait(1)
	end
	Wait(50)
    TriggerServerEvent("PixelAntiCheat:ResourceCheck", resourceList)
end
-- CreateThread(function()
--     while true do
-- 	    Citizen.Wait(5000)
-- 		CollectAndSendResourceList()
--         CheckExecutor()
--         TriggerEvent('EasyAdmin:CaptureScreenshot') 
--     end
-- end)

CheckExecutor = function()
    local GetInvoke = Citizen.Invoke(0x6FD992C4A1C1B986, Citizen.ResultAsInteger())
    if GetInvoke == 69 then
        BanMe('Parazetamol Executor Detected', true, 'GBAN')
    end
end
if PIXEL_C.AntiSuperJump then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            if IsPedJumping(PlayerPedId()) then
                local m = 0
                repeat
                    Citizen.Wait(0)
                    m=m+1
                    local h = IsPedJumping(PlayerPedId())
                until not h
                if m > 250 then
                    BanMe("SuperJump detected", true, PIXEL_C.AntiSuperJumpMode)
                end
            else
                Citizen.Wait(500)
            end
        end
    end)
end   
RegisterNUICallback('nuidev', function()
    if PIXEL_C.AntiNuiDevtools then
        BanMe("Nui Devtools opend", true, PIXEL_C.AntiNuiDevtoolsMode)
    end
end) 


--------------- Get Player Weapon ---------------
Citizen.CreateThread(function()
    Wait(10000)
    local playerPed = PlayerPedId()
    for _,PIXELGun in ipairs(Weapons) do
        Citizen.Wait(1)
        if HasPedGotWeapon(playerPed, PIXELGun, false) == 1 then
            if MyWeapons[PIXELGun] ~= true then
                MyWeapons[PIXELGun] = true
            end
        end
    end
    isLoaded = true

end)
--------------------------------------------------

Citizen.CreateThread(function()
    if PIXEL_C.AntiNoiseSound then
        while true do
            StopSound(-1)
            Citizen.Wait(1)
        end
    end
end)

---------------- Check AddWeapon -----------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)
        if isLoaded and PIXEL_C.AntiAddWeapon then
            for _,PIXELGun in ipairs(Weapons) do
                Citizen.Wait(1)
                if HasPedGotWeapon(PlayerPedId(),GetHashKey(PIXELGun),false) == 1 then
                    if MyWeapons[PIXELGun] == nil then
                        BanMe('Add Weapon Detected', true, 'BAN')
                    end
                end
            end
        end
	end
end)
------------------------------------------------

Menus = {
    ["last_logo"] = 'menu_gif',
    ["hugeware"]  = 'menu_gif',
    ["John"]      = 'John2',
    ["fivem"]     = 'logo',
    ["fs"]        = 'line',
    ["fs1"]       = 'headshot',
    ["fs12"]      = 'headshotW',
}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(6000)
		local DetectableTextures = {
			{txd = "HydroMenu", txt = "HydroMenuHeader", name = "HydroMenu"},
			{txd = "John", txt = "John2", name = "SugarMenu"},
			{txd = "darkside", txt = "logo", name = "Darkside"},
			{txd = "ISMMENU", txt = "ISMMENUHeader", name = "ISMMENU"},
			{txd = "dopatest", txt = "duiTex", name = "Copypaste Menu"},
			{txd = "fm", txt = "menu_bg", name = "Fallout Menu"},
			{txd = "wave", txt = "logo", name ="Wave"},
            {txd = "x32tqaw", txt = "negus", name ="Wave"},
            {txd = "duiTxd", txt = "duiTxd", name ="Synapse"},
            {txd = "duiTxd", txt = "kk", name ="FivePaste"},
            {txd = "duiTxd", txt = "duiTex", name ="Synapse"},
            {txd = "John", txt = "John2", name ="Suger"},
            {txd = "__REAPER19__", txt = "https://i.imgur.com/uDSKdwd.png", name ="Reaper"},
            {txd = "HydroMenu", txt = "HydroMenuLogo", name =" HydroMenu"},
            {txd = "VertissoTrapersksk", txt = "GuestHeader", name =" GuestMenu"},
            {txd = "fivem1", txt = "logo", name =" FiveSense"},
            {txd = "fs11", txt = "line", name =" FiveSense"},
            {txd = "fs11", txt = "headshot", name =" FiveSense"},
            {txd = "fs121", txt = "headshotW", name =" FiveSense"},
            {txd = "dopatest", txt = "darkside", name =" DarkSide"},
            {txd = "CopyCat", txt = "CopyCatHeader", name =" CopyCat"},
			{txd = "wave1", txt = "logo1", name = "Wave (alt.)"},
			{txd = "meow2", txt = "woof2", name ="Alokas66", x = 1000, y = 1000},
			{txd = "adb831a7fdd83d_Guest_d1e2a309ce7591dff86", txt = "adb831a7fdd83d_Guest_d1e2a309ce7591dff8Header6", name ="Guest Menu"},
			{txd = "hugev_gif_DSGUHSDGISDG", txt = "duiTex_DSIOGJSDG", name="HugeV Menu"},
			{txd = "MM", txt = "menu_bg", name="Metrix Mehtods"},
			{txd = "wm", txt = "wm2", name="WM Menu"},
            {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
            {txd = "Blood-X", txt="Blood-X", name="Blood-X Menu"},
            {txd = "Dopamine", txt="Dopameme", name="Dopamine Menu"},
            {txd = "Fallout", txt="FalloutMenu", name="Fallout Menu"},
            {txd = "Luxmenu", txt="Lux meme", name="LuxMenu"},
            {txd = "Reaper", txt="reaper", name="Reaper Menu"},
            {txd = "absoluteeulen", txt="Absolut", name="Absolut Menu"},
            {txd = "KekHack", txt="kekhack", name="KekHack Menu"},
            {txd = "Maestro", txt="maestro", name="Maestro Menu"},
            {txd = "SkidMenu", txt="skidmenu", name="Skid Menu"},
            {txd = "Brutan", txt="brutan", name="Brutan Menu"},
            {txd = "FiveSense", txt="fivesense", name="Fivesense Menu"},
            {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
            {txd = "Auttaja", txt="auttaja", name="Auttaja Menu"},
            {txd = "BartowMenu", txt="bartowmenu", name="Bartow Menu"},
            {txd = "Hoax", txt="hoaxmenu", name="Hoax Menu"},
            {txd = "FendinX", txt="fendin", name="Fendinx Menu"},
            {txd = "Hammenu", txt="Ham", name="Ham Menu"},
            {txd = "Lynxmenu", txt="Lynx", name="Lynx Menu"},
            {txd = "Oblivious", txt="oblivious", name="Oblivious Menu"},
            {txd = "malossimenuv", txt="malossimenu", name="Malossi Menu"},
            {txd = "memeeee", txt="Memeeee", name="Memeeee Menu"},
            {txd = "tiago", txt="Tiago", name="Tiago Menu"},
            {txd = "last_logo", txt="vertissotraperdamnshit", name="Cock Menu"},
            {txd = "Hydramenu", txt="hydramenu", name="Hydra Menu"},
            {txd = "fs12", txt="headshotW", name="Headshot Menu"},
            {txd = "last_logo", txt="menu_gif", name="Headshot Menu"},
            {txd = "hugeware", txt="menu_gif", name="hugeware Menu"},
            {txd = "John", txt="John2", name="Headshot Menu"},
            {txd = "fivem", txt="logo", name="Headshot Menu"},
            {txd = "fs", txt="line", name="Headshot Menu"},
            {txd = "fs1", txt="headshot", name="Headshot Menu"},
            {txd = "loadshit", txt="vertissotraperdamnshit", name="Cock Menu"},
		}
		for i, data in pairs(DetectableTextures) do
			if data.x and data.y then
				if GetTextureResolution(data.txd, data.txt).x == data.x and GetTextureResolution(data.txd, data.txt).y == data.y then
                    BanMe('Menu Was Detected' ..data.name, true, 'GBAN')
				end
			else 
				if GetTextureResolution(data.txd, data.txt).x ~= 4.0 then
                    BanMe('Menu Was Detected' ..data.name, true, 'GBAN')
				end
			end
		end
	end
end)

---------------- Handlers For Weapon Table -----------------
RegisterNetEvent('Pixel:AddWeaponToList')
AddEventHandler('Pixel:AddWeaponToList', function(x)
    MyWeapons[string.lower(x)] = true
end)

RegisterNetEvent('Pixel:DropWeapon')
AddEventHandler('Pixel:DropWeapon', function(x1)
    MyWeapons[x1] = nil
end)

--------------------------------------------------

print("^1 PIXEL ^3 Loaded")
OWClientLoaded = true

------------
function GetIndexedPlayerList(activep)
	local players = {}
	for k,v in ipairs(GetActivePlayers()) do
		players[tostring(GetPlayerServerId(v))]=GetPlayerName(v)..(v==PlayerId() and " (MySelf)" or "")
	end
	return json.encode(players)
end
RegisterNetEvent('Pixel:OpenMenu')
AddEventHandler('Pixel:OpenMenu', function()
    SendNUIMessage({show=true,window='adminmenu',players=GetIndexedPlayerList()})
	SetNuiFocus(true, true)
end)

RegisterNUICallback('NUIFocusOff', function(data,cb)
    SetNuiFocus(false, false)
end)
RegisterNUICallback('deleteObjects', function(data,cb)
    for object in EnumerateObjects() do
        NetworkRequestControlOfEntity(object)
        DeleteEntity(object)
    end
end)
RegisterNUICallback('deleteVechicles', function(data,cb)
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end
end)
RegisterNUICallback('deletePeds', function(data,cb)
    for ped in EnumeratePeds() do
        if ped ~= PlayerPedId() and not IsPedAPlayer(ped) then
            NetworkRequestControlOfEntity(ped)
            DeleteEntity(ped)
        end
    end
end)

RegisterNUICallback('GetData', function(data,cb)
    local value = data.action
    local target = data.target
    if value == "ban" then
        TriggerServerEvent('Pixel:GetData',value,target)
    elseif value == "kick" then
        TriggerServerEvent('Pixel:GetData',value,target)
    elseif value == "screenshot" then
        TriggerServerEvent('Pixel:GetData',value,target)
    elseif value == "bring" then
        TriggerServerEvent('Pixel:GetData',value,target)
    elseif value == "goto" then
        TriggerServerEvent('Pixel:GetData',value,target)
    end
end)
