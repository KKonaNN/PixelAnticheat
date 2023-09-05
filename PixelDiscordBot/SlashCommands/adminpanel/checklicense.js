const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const { ServerIP } = require('../../config.json')

const request = require('request');
module.exports.run = async (inter) => {
    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1028777793565237329') return inter.reply('<#1028777793565237329> !!')
    
    const license = inter.options.getString('license');
    //check license
    request({
        uri: `http://${ServerIP}/Pixelacapi/CheckLicense.php?license=${license}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "No License"){
            inter.reply('No License')
        } else if (body == "License Expire"){
            inter.reply('License has expired')
        } else {
            const info = JSON.parse(body);
            const LicenseInfo = new MessageEmbed()
            LicenseInfo.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            LicenseInfo.setTitle(`License Key : ${info.license}`)
            LicenseInfo.setDescription(`
            Expire : \`${info.expire}\`

            Status : \`${info.licensestatus}\`

            IP : ${info.ip}

            Reason : ${info.Reason}

            Server Name : ${info.Servername}

            DiscordID : <@!${info.DiscordID}>

            IPLimit : ${info.IPLimit}
            `)
            LicenseInfo.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            LicenseInfo.setTimestamp()
            inter.reply({embeds: [LicenseInfo]})
        }
    })
}

module.exports.help = {
    name: 'checklicense',
    permission: ['']
}