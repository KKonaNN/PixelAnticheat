const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const { ServerIP } = require('../../config.json')

const request = require('request');
module.exports.run = async (inter) => {
    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1028777791132545115') return inter.reply('<#1028777791132545115> !!')
    
    const license = inter.options.getString('license');
    //check license
    request({
        uri: `http://${ServerIP}/Pixelacapi/CheckLicense.php?license=${license}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "No License"){
            inter.reply('No License')
        } else {
            //Remove Licese
            request({
                uri: `http://${ServerIP}/Pixelacapi/RemoveLicense.php?license=${license}`,
                method: 'POST'
            }, function(err,res,body) {})
            const RemoveLicense = new MessageEmbed()
            RemoveLicense.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            RemoveLicense.setTitle(`Remove Licesne`)
            RemoveLicense.setDescription(`
                **License ${license} Removed**
            `)
            RemoveLicense.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            RemoveLicense.setTimestamp()
            inter.reply({embeds: [RemoveLicense]})




            /// send log
            const RemoveLicenselog = new MessageEmbed()
            RemoveLicenselog.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            RemoveLicenselog.setTitle(`Remove Licesne`)
            RemoveLicenselog.setDescription(`
                **License ${license} Removed** By <@!${inter.user.id}>
            `)
            RemoveLicenselog.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            RemoveLicenselog.setTimestamp()


            const webhookClient = new WebhookClient({ id: '1029124483254071338', token: '-Xj4S9vSFhZ4FdbnUpFWIR_cSFPKe9Wwmcr7gntM6wS2wT6ZE89CgyhnvD1-l4eYD3Pd' });
            webhookClient.send({
                username: 'License Remove',
                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                embeds: [RemoveLicenselog],
            })
        }
    })
}

module.exports.help = {
    name: 'removelicense',
    permission: ['']
}