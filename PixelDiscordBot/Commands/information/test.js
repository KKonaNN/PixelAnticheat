const Discord = require("discord.js")
const { MessageAttachment, MessageEmbed } = require('discord.js');
module.exports.run = async (DANGER, message, args, perfix) => {
    /*
    const sendip = message.channel.createMessageCollector({ time: 15000 });
    
    sendip.on('collect', m => {
        console.log(`Collected ${m.content}`);
    });
    
    sendip.on('end', collected => {
        console.log(`Collected ${collected.size} items`);
    });*/
    const file = new MessageAttachment('./image/OverWolf-Panel.mp4');
    
    const embed = new MessageEmbed();
    embed.setAuthor('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    embed.setTitle('Instructions for using the panel')
    embed.setColor('#2f3136')
    embed.setDescription(`
    > 🇬🇧  To use the OverWolf User panel, follow the video below  <:logo:916248376339750963>

    > 🇮🇷  برای استفاده از پنل کاربری خود کافیست طبق ویدیوی زیر عمل کنید  <:logo:916248376339750963>

    > 🇬🇧 Note: Only those who have obtained a license can use this panel ⚠️

    > 🇮🇷 توجه فقط کسانی که لایسنس تهیه کرده باشند میتوانند از این پنل استفاده کنند ⚠️
    `)
    embed.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    embed.setFooter('Pixel AntiCheat')
    embed.setTimestamp()
    message.channel.send({ embeds: [embed],files: [file] });
}

module.exports.help = {
    name: "test",
    aliases: []
}