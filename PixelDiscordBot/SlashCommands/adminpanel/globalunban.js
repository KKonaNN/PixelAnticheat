const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const { ServerIP } = require('../../config.json')

const request = require('request');
module.exports.run = async (inter) => {
    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1028777796035694722') return inter.reply('<#1028777796035694722> !!')
    
    const SteamHex = inter.options.getString('steam');
    

    //check Ban
    request({
        uri: `http://${ServerIP}/Pixelacapi/Global/Check.php?steamhex=${SteamHex}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "No steam"){
            inter.reply('This is steam hex Not ban')
        } else {
            //remove ban
            request({
                uri: `http://${ServerIP}/Pixelacapi/Global/RemoveGlobalBan.php?steamhex=${SteamHex}`,
                method: 'POST'
            }, function(err,res,body) {
                const GlobalBanRemove = new MessageEmbed()
                GlobalBanRemove.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                GlobalBanRemove.setTitle(`Global UnBan`)
                GlobalBanRemove.setDescription(`
                    SteamHex : ${SteamHex}
                `)
                GlobalBanRemove.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
                GlobalBanRemove.setTimestamp()
                inter.reply({embeds: [GlobalBanRemove]})
            })
        }
    })
}

module.exports.help = {
    name: 'globalunban',
    permission: ['']
}