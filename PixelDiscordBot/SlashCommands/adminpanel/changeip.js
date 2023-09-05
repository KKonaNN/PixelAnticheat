const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const { ServerIP } = require('../../config.json')

const request = require('request');
module.exports.run = async (inter) => {
    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1028777792541835364') return inter.reply('<#1028777792541835364> !!')
    
    const license = inter.options.getString('license');
    const NewIP = inter.options.getString('newip');


    //check license
    request({
        uri: `http://${ServerIP}/Pixelacapi/CheckLicense.php?license=${license}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "No License"){
            inter.reply('No License')
        } else {
            const info = JSON.parse(body);

            //Change Ip
            request({
                uri: `http://${ServerIP}/Pixelacapi/ChangeIP.php?license=${license}&newIP=${NewIP}`,
                method: 'POST'
            }, function(err,res,body) {})
            const ChangeIpLicense = new MessageEmbed()
            ChangeIpLicense.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            ChangeIpLicense.setTitle(`Change Licesne IP`)
            ChangeIpLicense.setDescription(`
                **License : ${license} **

                Old IP : ${info.ip}

                New IP : ${NewIP}
            `)
            ChangeIpLicense.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            ChangeIpLicense.setTimestamp()
            inter.reply({embeds: [ChangeIpLicense]})
        }
    })
}

module.exports.help = {
    name: 'changeip',
    permission: ['']
}