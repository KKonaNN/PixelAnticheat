const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const { ServerIP } = require('../../config.json')

const request = require('request');
module.exports.run = async (inter) => {
    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1028777794739654757') return inter.reply('<#1028777794739654757> !!')
    
    const SteamHex = inter.options.getString('steam');
    const license = inter.options.getString('license');
    const discord = inter.options.getString('discord');
    const token = inter.options.getString('token');

    //check Ban
    request({
        uri: `http://${ServerIP}/Pixelacapi/Global/Check.php?steamhex=${SteamHex}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "Steam Is Baned"){
            inter.reply('This is steam hex ban')
        } else {
            //ADD BAN
            request({
                uri: `http://${ServerIP}/Pixelacapi/Global/AddGlobalBan.php?steamhex=${SteamHex}&license=${license}&discord=${discord}&token=${token}`,
                method: 'POST'
            }, function(err,res,body) {
                const GlobalBanAdd = new MessageEmbed()
                GlobalBanAdd.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                GlobalBanAdd.setTitle(`Global Ban`)
                GlobalBanAdd.setDescription(`
                    SteamHex : ${SteamHex}

                    License : ${license}

                    Discord : <@!${discord}>

                    Token : ${token}
                `)
                GlobalBanAdd.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
                GlobalBanAdd.setTimestamp()
                inter.reply({embeds: [GlobalBanAdd]})
            })
        }
    })
}

module.exports.help = {
    name: 'globalban',
    permission: ['']
}