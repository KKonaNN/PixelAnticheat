const Discord = require("discord.js")
const { MessageAttachment, MessageEmbed, MessageActionRow, MessageButton } = require('discord.js');
module.exports.run = async (DANGER, message, args, perfix) => {
    if(!message.member.roles.cache.has('1029120514867863593')) return message.reply('Dast Nazan!')


    const rowspanel = new MessageActionRow()
    const panelrows = new MessageButton()
    .setCustomId('panelrows')
    .setLabel('Panel!')
    .setStyle('SUCCESS')
    .setEmoji("<:PixelLogo:1029131634122965002>")
       
    rowspanel.addComponents(
        panelrows
    );

    const embed = new MessageEmbed();
    embed.setAuthor('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    embed.setTitle('AntiCheat Panel')
    embed.setColor('#2f3136')
    embed.setDescription(`
    **To use the panel, just click the Button below**
    `)
    embed.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    embed.setFooter('Pixel AntiCheat')
    embed.setTimestamp()
    message.channel.send({ content: '@everyone',embeds: [embed], components: [rowspanel] });







}

module.exports.help = {
    name: "guildpanel",
    aliases: []
}