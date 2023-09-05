const DANGER = require("../DANGER").DANGER
const { MessageEmbed } = require('discord.js');
const { id_channel_Wel, id_role_Wel } = require('../config.json')

DANGER.on('guildMemberAdd', async guildmember => {
    const channel = guildmember.guild.channels.cache.find(c => c.id == id_channel_Wel)
    const role = guildmember.guild.roles.cache.find(r => r.id === id_role_Wel)

    guildmember.roles.add(role)


    const welcomeembed = new MessageEmbed()
	.setColor('#2f3136')
	.setTitle('Welcome')
	//.setURL('https://discord.js.org/')
	.setAuthor('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
	.setDescription(`
    Hello ${guildmember},
    Welcome to **Pixel AntiCheat** Discord Server, introduce us to your friends, our team is ready to answer you 24/7
    
    `)
	.setThumbnail(guildmember.user.displayAvatarURL({size: 1024}))
	.addFields(
		{ name: 'Account creation time', value: guildmember.user.createdAt.toUTCString(), inline: true },
		// { name: '\u200B', value: '\u200B' },
		{ name: 'Server join time', value: guildmember.joinedAt.toUTCString(), inline: true },
	)
	
	.setTimestamp()
	.setFooter('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')

    channel.send({ embeds: [welcomeembed] });
})
