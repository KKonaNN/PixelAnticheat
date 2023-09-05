fx_version 'bodacious'
game 'gta5'


author 'PIXEL Development Team'
description 'PIXEL AntiCheat'
version '2.0'

client_scripts {
	'Configs/Clientconfig.lua',
	'Client.lua',
}


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'Configs/*.lua',
	'Tables/*.lua',
	'Server.lua'
}


ui_page('html/index.html') 

files {
	'html/index.html', 
    'html/*.css', 
    'html/*.js',
	'html/jquery.datetimepicker.min.css',
    'html/jquery.datetimepicker.full.min.js',
    'html/date.format.js',
}
