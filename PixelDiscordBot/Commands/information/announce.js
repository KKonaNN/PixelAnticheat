const Discord = require("discord.js")
const { MessageAttachment, MessageEmbed } = require('discord.js');
module.exports.run = async (DANGER, message, args, perfix) => {
    if(!message.member.roles.cache.has('915929148256550962')) return message.reply('Dast Nazan!')
    

    const howan = new MessageEmbed()
    howan.setColor('#2f3136')
    howan.setDescription(`announce <id channel> <Title> <text>`)
    if(!args[0] || !args[1] || !args[2]) return message.reply({ embeds: [howan] });

    const guild = DANGER.guilds.cache.get('764830933505277993');
    const channel = guild.channels.cache.get(args[0]);
    const text = args.slice(2).join(' ')

    const embed = new MessageEmbed();
    embed.setAuthor('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    embed.setTitle(args[1])
    embed.setColor('#2f3136')
    embed.setDescription(text)
    embed.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    embed.setFooter('Pixel AntiCheat')
    embed.setTimestamp()
    channel.send({ content: '@everyone',embeds: [embed] });
}

module.exports.help = {
    name: "announce",
    aliases: []
}