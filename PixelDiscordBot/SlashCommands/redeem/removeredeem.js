const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const request = require('request');
const { ServerIP } = require('../../config.json')
module.exports.run = async (inter) => {

    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1029129035911024800') return inter.reply('<#1029129035911024800> !!')

    const redeem = inter.options.getString('redeem');
    //check redeem
    request({
        uri: `http://${ServerIP}/Pixelacapi/redeem/CheckRedeem.php?redeem=${redeem}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "Redeem Expired !"){
            inter.reply('Redeem Expired !')
        } else { 
            inter.reply(`${redeem} Removed!`)

            /// send log
            const webhookClient = new WebhookClient({ id: '1029129671192891494', token: '2Vx3v82_lKYcr66mtc0R6BPXmpL5252T61Y1fUNoskTX4otuA6u0VDuN4Fq4u5MNQHNG' });
            webhookClient.send({
                username: 'Redeem Key Removed !',
                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                content: `Redeem : ${redeem} || Removed By : <@!${inter.user.id}>`,
            })
        }
    })
}

module.exports.help = {
    name: 'removeredeem',
    permission: ['']
}