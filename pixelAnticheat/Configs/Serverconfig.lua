--[ Setup ]--
PIXEL_A = {}
PIXEL_A.Version = 2.0
PIXEL_A.License = "Dev"  --Put here your license
PIXEL_A.ConnectCheck = true
PIXEL_A.UseOneSyncInfinity = true
PIXEL_A.UseESX = false
PIXEL_A.EsxSharedObject = 'esx:getSharedObject'
PIXEL_A.UseEsxWhitlist = false
PIXEL_A.MinPermission_level = 1 -- enssentialmode
PIXEL_A.Admingroups = {'Helper','HeadHelper','Admin','HeadAdmin','Moderetor','superadmin','Manager','Developer',''}
PIXEL_A.MaxTransferAmount = 1500000

--[ DiscordLog ]--
PIXEL_A.DiscordLog = true
PIXEL_A.DiscordPIXELWarn      = "https://discord.com/api/webhooks/960989360851914812/C1cswJHgoP_jV-1UcRDopOZ4Hwimh8KX2DTl5AEaxRHWPaUvKABbGDORtm6uPLnPbfGH"
PIXEL_A.DiscordPIXELExplosion = "https://discord.com/api/webhooks/960989360851914812/C1cswJHgoP_jV-1UcRDopOZ4Hwimh8KX2DTl5AEaxRHWPaUvKABbGDORtm6uPLnPbfGH"
PIXEL_A.DiscordPIXELObject    = "https://discord.com/api/webhooks/960989360851914812/C1cswJHgoP_jV-1UcRDopOZ4Hwimh8KX2DTl5AEaxRHWPaUvKABbGDORtm6uPLnPbfGH"
PIXEL_A.DiscordPIXELBan       = "https://discord.com/api/webhooks/960989360851914812/C1cswJHgoP_jV-1UcRDopOZ4Hwimh8KX2DTl5AEaxRHWPaUvKABbGDORtm6uPLnPbfGH"
PIXEL_A.DiscordPIXELScreens   = "https://discord.com/api/webhooks/960989360851914812/C1cswJHgoP_jV-1UcRDopOZ4Hwimh8KX2DTl5AEaxRHWPaUvKABbGDORtm6uPLnPbfGH"
PIXEL_A.DiscordPIXEL          = "https://discord.com/api/webhooks/960989360851914812/C1cswJHgoP_jV-1UcRDopOZ4Hwimh8KX2DTl5AEaxRHWPaUvKABbGDORtm6uPLnPbfGH"

--[AntiCheat Reasons]--
PIXEL_A.BanMassage       = "You have been automatically banned from Pixel." 
PIXEL_A.KickMassage      = "You have been kick from server."
PIXEL_A.BanMessageToChat = true -- if u false it when player got ban just send log

--[ Anti GiveWeapon ]--
PIXEL_A.GiveWeaponDetection = true
PIXEL_A.GiveWeaponDetectionMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.GiveWeaponDetectionLog = true

--[Anti Non ESX Weapons]--
PIXEL_A.AntiNonESXWeapons = true
PIXEL_A.AntiNonESXWeaponsMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.AntiNonESXWeaponsLog = true

--[Anti Non ESX Vehicle]--
PIXEL_A.AntiSpawnNonESXVehicles = true
PIXEL_A.AntiSpawnNonESXVehiclesMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.AntiSpawnNonESXVehiclesLog = true

--[ Anti nil xPlayer ]--
PIXEL_A.Nilxp = false
PIXEL_A.NilxpMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.NilxpCheckTime = 15*60*1000 -- for bad system 5 min can be good
PIXEL_A.NilxpDetectionLog = true

--[ Anti Trigger ]-- Detecte All Triggers Use This Command in Console : Module install
PIXEL_A.AntiTrigger = true
PIXEL_A.AntiTriggerMode = "GBAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.AntiTriggerLog = true
PIXEL_A.AntiTriggerWhiteList = {
    'TEST:TEST',
    'EXAMPLE:EXAMPLE',
}

--[ Fake Message Detection ]--
PIXEL_A.AntiFakeChatMessages = true
PIXEL_A.AntiFakeChatMessagesMode = "GBAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.AntiFakeChatMessagesLog = true

--[ Anti FreezeLobby ]--
PIXEL_A.FreezeLobbyDetection = true
PIXEL_A.FreezeLobbyDetectionMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.FreezeLobbyDetectionLog = true

--[ Anti Perm And Group Hack ]--
PIXEL_A.DetectGivePerm = true
PIXEL_A.DetectGivePermMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.DetectGiveGroup = true
PIXEL_A.DetectGiveGroupMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 


--[ Trigger Detection ]--Follow tables/blacklistedevents.lua
PIXEL_A.TriggerDetection = false 
PIXEL_A.TriggerDetectionMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.TriggerDetectionLog = true 

--[ Block List Words ]--Follow tables/blacklistedwords.lua
PIXEL_A.BlacklistedWordsDetection = true 
PIXEL_A.BlacklistedWordsDetectionMode = "WARN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.BlacklistedWordsDetectionLog = true

--[ Anti Explosions ]--Follow tables/blacklistedexplosions.lua
PIXEL_A.DetectExplosions = true

--[ Anti Vehicle Spam ]--
PIXEL_A.AntiVehicleSpam = true
PIXEL_A.AntiVehicleTimer = 5
PIXEL_A.MAX_VEHICLE_SPAM = 3
PIXEL_A.AntiVehicleSpamMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

--[ Anti Prop Spam ]--
PIXEL_A.AntiPropSpam = true
PIXEL_A.AntiPropTimer = 7
PIXEL_A.MAX_Prop_SPAM = 5
PIXEL_A.AntiPropSpamMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 


--[ Anti tazer ]--
PIXEL_A.Antitaze = true
PIXEL_A.AntitazeTimer = 3
PIXEL_A.MAX_Taze_SPAM = 2
PIXEL_A.AntitazeSpamMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

--[ Anti Particle Spam ]--
PIXEL_A.AntiParticleSpam = true
PIXEL_A.AntiParticleTimer = 2
PIXEL_A.MAX_Particle_SPAM = 7
PIXEL_A.AntiParticleSpamMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 

--[ Anti Spawn Object ]--Follow tables/blacklistmodel.lua
PIXEL_A.AntiSpawnObject = true
PIXEL_A.AntiSpawnObjectMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.AntiSpawnObjectLog = true 

--[ Whitelist Object ]--Follow tables/whitelistmodels.lua
PIXEL_A.WhitelistObj = false
PIXEL_A.WhitelistObjMode = "BAN" --[ WARN | KICK | BAN | GBAN ] 
PIXEL_A.WhitelistObjLog = true 

--[ Object Blocker ]--Follow tables/blacklistedmodels.lua
PIXEL_A.AntiNuke = true
PIXEL_A.AntiSpawnVehicles = true
PIXEL_A.AntiSpawnPeds     = true

--[ AntiCheat Bypass ]--
PIXEL_A.Bypass = {"PX.Master"}