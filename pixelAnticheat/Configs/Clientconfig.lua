

PIXEL_C = {}

----------------------------------------------------------------------------------|
----------------------------------[✔️  Setup  ✔️ ]-------------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.GeneralStuff        = true 
PIXEL_C.PlayerProtection    = true
PIXEL_C.UseESX    = false
PIXEL_C.EsxSharedObject     = 'esx:getSharedObject'
PIXEL_C.ScreenShotName      = 'PIXEL-module' 
PIXEL_C.CheckPlayersMoney   = false 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
----------------------------------[✔️  Setup  ✔️ ]-------------------------------|
----------------------------------------------------------------------------------|

--[ Anti Trigger ]-- Detecte All Triggers Use This Command in Console : Module install
PIXEL_C.AntiTrigger = true
PIXEL_C.AntiTriggerMode = "GBAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_C.AntiTriggerLog = true
PIXEL_C.AntiTriggerWhiteList = {
    'TEST:TEST',
    'EXAMPLE:EXAMPLE',
}
----------------------------------------------------------------------------------|

----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti GodMode  ✔️ ]-------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiGodMode      = true
PIXEL_C.AntiGodModeTimer = 1000 
PIXEL_C.AntiGodModeMode  = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti GodModeDemiGod  ✔️ ]------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiGodModeDemiGod     = true 
PIXEL_C.MaxPlayerHealth        = 200 
PIXEL_C.AntiGodModeDemiGodMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti Teleport  ✔️ ]------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiTeleport     = true 
PIXEL_C.AntiTeleportMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|

----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti Teleport  ✔️ ]------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiNoiseSound     = true 
PIXEL_C.AntiNoiseSoundMode = 1

----------------------------------------------------------------------------------|

----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti AddWeapon  ✔️ ]-------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiAddWeapon      = false
PIXEL_C.AntiAddWeaponMode  = "BAN" --[ WARN | KICK | BAN | GBAN ] 

--Add it On GiveWeaponToPed Natives / When want add weapon to ped
--TriggerEvent('Pixel:AddWeaponToList', 'WEAPON_SMG') --Set Name Of Weapon
-- Put it When Scripts Want Remove Or Drop Ped Weapons
--TriggerEvent('Pixel:DropWeapon', 'WEAPON_SMG') -- remove hes weapon

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti Invincible  ✔️ ]----------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiInvisible      = true
PIXEL_C.AntiInvincibleMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|



----------------------------------------------------------------------------------|
----------------------------------[✔️ AntiLicenseClears ✔️ ]---------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiLicenseClears     = true
PIXEL_C.AntiLicenseClearsMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
--------------------------------------[✔️ AntiFreeCam ✔️ ]-----------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiFreeCam     = true
PIXEL_C.AntiFreeCamMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|

----------------------------------------------------------------------------------|

----------------------------------------------------------------------------------|
--------------------------------------[✔️ AntiFlyandNoclip ✔️ ]------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiFlyandNoclip     = true
PIXEL_C.AntiFlyandNoclipMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|



----------------------------------------------------------------------------------|
--------------------------------------[✔️ Anti NightVision ✔️ ]------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiNightVision     = true
PIXEL_C.AntiNightVisionMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|




----------------------------------------------------------------------------------|
--------------------------------------[✔️ Anti TermalVision ✔️ ]-----------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiThermalVision     = true
PIXEL_C.AntiThermalVisionMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|




----------------------------------------------------------------------------------|
--------------------------------------[✔️ Anti Boom Damage ✔️ ]------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiBoomDamage     = true
PIXEL_C.AntiBoomDamageMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|



----------------------------------------------------------------------------------|
--------------------------------------[✔️ Anti VehicleSpawn ✔️ ]-----------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiVehicleSpawn     = false
PIXEL_C.AntiVehicleSpawnMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_C.GarageList = {
	{x = 217.89, y = -804.99, z = 30.91},
}

----------------------------------------------------------------------------------|



----------------------------------------------------------------------------------|
---------------------------------------[✔️ Anti Speed ✔️ ]-----------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiSpeedHack      = true
PIXEL_C.SpeedHackValue     = 10
PIXEL_C.AntiSpeedHackMode  = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
----------------------------------[✔️ Anti Super Jumb  ✔️ ]----------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiSuperJump     = true 
PIXEL_C.AntiSuperJumpMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
---------------------------------------[✔️ NONPC ✔️ ]----------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.NONPC = false

----------------------------------------------------------------------------------|



----------------------------------------------------------------------------------|
-----------------------------------[✔️ Anti Player Blip ✔️ ]---------------------|
----------------------------------------------------------------------------------

PIXEL_C.AntiPlayerBlips      = true
PIXEL_C.AntiPlayerBlipsMode  = "BAN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|




----------------------------------------------------------------------------------|
-----------------------------------[✔️ Anti Spectate ✔️ ]------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiSpectate     = true
PIXEL_C.AntiSpectateMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
-----------------------------------[✔️ Anti Attach ✔️ ]--------------------------|
----------------------------------------------------------------------------------|

PIXEL_C.AntiAttach = true
PIXEL_C.AntiAttachMode = "WARN"
----------------------------------------------------------------------------------|


----------------------------------------------------------------------------------|
-----------------------------------[✔️ Anti Ped Attack ✔️ ]----------------------|
----------------------------------------------------------------------------------|


PIXEL_C.AntiSpawnPeds      = true --[ Deactive random peds ]
PIXEL_C.AntiPedAttack      = true
PIXEL_C.AntiPedAttackMode  = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_C.AntiPedAttackLog   = true

----------------------------------------------------------------------------------|



----------------------------------------------------------------------------------|
-----------------------------------[✔️ Anti Blacklisted Weapons  ✔️ ]------------|
----------------------------------------------------------------------------------|

PIXEL_C.BlacklistedWeapons      = true 
PIXEL_C.BlacklistedWeaponsMode  = "WARN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_C.BlacklistedWeaponsTable = {
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_STINGER",
	"WEAPON_MINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_FIREWORK",
	"WEAPON_BALL",
	"WEAPON_BOTTLE",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_GARBAGEBAG",
	"WEAPON_RAILGUN",
	"WEAPON_RAILPISTOL",
	"WEAPON_RAYPISTOL", 
	"WEAPON_RAYCARBINE", 
	"WEAPON_RAYMINIGUN",
	"WEAPON_DIGISCANNER",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_HOMINGLAUNCHER", 
	"WEAPON_SMG_MK2"
}


--[ Anti Cheat Engine ]--


    ----------------------------------------------------------------------------------|
    -----------------------------------[✔️ Anti Damge Modifier  ✔️ ]-----------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.AntiDamageModifier     = true
    PIXEL_C.AntiDamageModifierMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    ----------------------------------------------------------------------------------|



    ----------------------------------------------------------------------------------|
    -------------------------------[✔️ Anti Weapon DamageChanger ✔️ ]----------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.AntiDamageChanger     = true
    PIXEL_C.AntiDamageChangerMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    ----------------------------------------------------------------------------------|





    ----------------------------------------------------------------------------------|
    -------------------------------[✔️ Anti Explosive Weapons ✔️ ]-------------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.WeaponExplosiveCheck     = true
    PIXEL_C.WeaponExplosiveCheckMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
    PIXEL_C.WeaponExplosiveWhiteList = {
        "weapon_sniperrifle",
        "weapon_heavysniper",
        "weapon_heavysniper_mk2",
        "weapon_marksmanrifle",
        "weapon_marksmanrifle_mk2",
    }

PIXEL_C.WeaponDamages = {
	[-1357824103] = { damage = 34, name = "AdvancedRifle"}, -- AdvancedRifle
    [453432689] = { damage = 26, name = "Pistol"}, -- Pistol
    [1593441988] = { damage = 27, name = "CombatPistol"}, -- CombatPistol
    [584646201] = { damage = 25, name = "APPistol"}, -- APPistol
    [-1716589765] = { damage = 51, name = "Pistol50"}, -- Pistol50
    [-1045183535] = { damage = 160, name = "Revolver"}, -- Revolver
    [-1076751822] = { damage = 28, name = "SNSPistol"}, -- SNSPistol
    [-771403250] = { damage = 40, name = "HeavyPistol"}, -- HeavyPistol
    [137902532] = { damage = 34, name = "VintagePistol"}, -- VintagePistol
    [324215364] = { damage = 21, name = "MicroSMG"}, -- MicroSMG
    [736523883] = { damage = 22, name = "SMG"}, -- SMG
    [-270015777] = { damage = 23, name = "AssaultSMG"}, -- AssaultSMG
    [-1121678507] = { damage = 22, name = "MiniSMG"}, -- MiniSMG
    [-619010992] = { damage = 27, name = "MachinePistol"}, -- MachinePistol
    [171789620] = { damage = 22, name = "CombatPDW"}, -- CombatPDW
    [487013001] = { damage = 58, name = "PumpShotgun"}, -- PumpShotgun
    [2017895192] = { damage = 40, name = "SawnoffShotgun"}, -- SawnoffShotgun
    [-494615257] = { damage = 32, name = "AssaultShotgun"}, -- AssaultShotgun
    [-1654528753] = { damage = 14, name = "BullpupShotgun"}, -- BullpupShotgun
    [984333226] = { damage = 117, name = "HeavyShotgun"}, -- HeavyShotgun
    [-1074790547] = { damage = 30, name = "AssaultRifle"}, -- AssaultRifle
    [-2084633992] = { damage = 32, name = "CarbineRifle"}, -- CarbineRifle
    [-1063057011] = { damage = 32, name = "SpecialCarbine"}, -- SpecialCarbine
    [2132975508] = { damage = 32, name = "BullpupRifle"}, -- BullpupRifle
    [1649403952] = { damage = 34, name = "CompactRifle"}, -- CompactRifle
    [-1660422300] = { damage = 40, name = "MG"}, -- MG
    [2144741730] = { damage = 45, name = "CombatMG"}, -- CombatMG
    [1627465347] = { damage = 34, name = "Gusenberg"}, -- Gusenberg
    [100416529] = { damage = 101, name = "SniperRifle"}, -- SniperRifle
    [205991906] = { damage = 216, name = "HeavySniper"}, -- HeavySniper
    [-952879014] = { damage = 65, name = "MarksmanRifle"}, -- MarksmanRifle
    [1119849093] = { damage = 30, name = "Minigun"}, -- Minigun
    [-1466123874] = { damage = 165, name = "Musket"}, -- Musket
    [911657153] = { damage = 1, name = "StunGun"}, -- StunGun
    [1198879012] = { damage = 10, name = "FlareGun"}, -- FlareGun
    [-598887786] = { damage = 220, name = "MarksmanPistol"}, -- MarksmanPistol
    [1834241177] = { damage = 30, name = "Railgun"}, -- Railgun
    [-275439685] = { damage = 30, name = "DoubleBarrelShotgun"}, -- DoubleBarrelShotgun
    [-1746263880] = { damage = 81, name = "Double Action Revolver"}, -- Double Action Revolver
    [-2009644972] = { damage = 30, name = "SNS Pistol Mk II"}, -- SNS Pistol Mk II
    [-879347409] = { damage = 200, name = "Heavy Revolver Mk II"}, -- Heavy Revolver Mk II
    [-1768145561] = { damage = 32, name = "Special Carbine Mk II"}, -- Special Carbine Mk II
    [-2066285827] = { damage = 33, name = "Bullpup Rifle Mk II"}, -- Bullpup Rifle Mk II
    [1432025498] = { damage = 32, name = "Pump Shotgun Mk II"}, -- Pump Shotgun Mk II
    [1785463520] = { damage = 75, name = "Marksman Rifle Mk II"}, -- Marksman Rifle Mk II
    [961495388] = { damage = 40, name = "Assault Rifle Mk II"}, -- Assault Rifle Mk II
    [-86904375] = { damage = 33, name = "Carbine Rifle Mk II"}, -- Carbine Rifle Mk II
    [-608341376] = { damage = 47, name = "Combat MG Mk II"}, -- Combat MG Mk II
    [177293209] = { damage = 230, name = "Heavy Sniper Mk II"}, -- Heavy Sniper Mk II
    [-1075685676] = { damage = 32, name = "Pistol Mk II"}, -- Pistol Mk II
    [2024373456] = { damage = 25, name = "SMG Mk II"} -- SMG Mk II
}

--[ Base Anti injection ]--


    ----------------------------------------------------------------------------------|
    -------------------------------[✔️ Resource Counter ✔️ ]-------------------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.ResourceCounter     = false
    PIXEL_C.ResourceCounterMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    ----------------------------------------------------------------------------------|





    ----------------------------------------------------------------------------------|
    -------------------------------[✔️ Resource Checker  ✔️ ]------------------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.ResourceChecker     = false
    PIXEL_C.ResourceCounterMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    ----------------------------------------------------------------------------------|



    ----------------------------------------------------------------------------------|
    -------------------------------[✔️ Resource Checker  ✔️ ]------------------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.AntiResourceStop     = false
    PIXEL_C.AntiResourceStopMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    ----------------------------------------------------------------------------------|

    

    ----------------------------------------------------------------------------------|
    -------------------------------[✔️ Resource Checker  ✔️ ]------------------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.AntiFCommands     = false
    PIXEL_C.AntiFCommandsMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 



    --[ Whitelist ]-- --[ types: 1 = AntiFreeCamMode | 2 = AntiThermalVisionMode + AntiNightVisionMode | 3 = AntiSpectateMode  | 4 = AntiInvisible | 5 = BlacklistedWeapons | 6 = AntiTeleport]
    --[[
        TriggerClientEvent('OW:Whitelist', source, 
        1, ---ban type
        true --- state of that
        )
        TriggerEvent('OW:Whitelist',
        1, ---ban type
        true --- state of that
        )
    ]]

    ----------------------------------------------------------------------------------|
    ---------------------------[✔️ AntiKeyboardNativeInjections  ✔️ ]----------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.AntiKeyboardNativeInjections     = true
    PIXEL_C.AntiKeyboardNativeInjectionsMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    -----------------------------------------------------------------------------------|    




    ----------------------------------------------------------------------------------|
    ---------------------------[✔️ AntiOnScreenMenuDetection  ✔️ ]-------------------|
    ----------------------------------------------------------------------------------|

    PIXEL_C.AntiNuiDevtools     = true
    PIXEL_C.AntiNuiDevtoolsMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

    ----------------------------------------------------------------------------------|


--
