const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const request = require('request');
const randomstring = require("randomstring");
const { ServerIP } = require('../../config.json')

module.exports.run = async (inter) => {

    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')
    if(inter.channel.id != '1029128964867899513') return inter.reply('<#1029128964867899513> !!')

    const expire = inter.options.getString('expire');
    const number = inter.options.getString('number');

    arr = [];
    for (let index = 0; index < number ; index++) {
        const redeem_key = "PixelAC-" + randomstring.generate({length: 4,charset: 'numeric'}) + "-" + randomstring.generate({length: 4,charset: 'numeric'}) + "-" + randomstring.generate({length: 4,charset: 'numeric'}) + "-" + randomstring.generate({length: 4,charset: 'numeric'})
        //console.log(redeem_key+`\t(expire : ${expire})`)

        request({
            uri: `http://${ServerIP}/Pixelacapi/redeem/AddRedeem.php?redeem=${redeem_key}&&redeem_expire=${expire}&license_expire=${expire}`,
            method: 'POST'
        }, function(err,res,body) {                
            return;
        })


 
        arr.push(redeem_key);

        if(arr.length == number){
            console.log()
            const GenerateRedeem = new MessageEmbed()
            GenerateRedeem.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            GenerateRedeem.setTitle('Redeem Key Generated !')
            GenerateRedeem.setDescription(`
               **Redeem : \`${number}\` | License Time : \`${expire} Day\`**

                Created By <@!${inter.user.id}>

               **${arr.join('\n')}**
            `)
            GenerateRedeem.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            GenerateRedeem.setTimestamp()
            inter.reply({embeds: [GenerateRedeem]})

            
            /// send log
            const webhookClient = new WebhookClient({ id: '1029129354640367636', token: 'irIZ6tb1pNIRWQRhuJkxDm1RCHXXpC2gu3JpjnQwGEFHA0xFdubfwZI9EeAaYJxDUrQI' });
            webhookClient.send({
                username: 'Redeem Key Generated',
                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                embeds: [GenerateRedeem],
            })
        }

    }

}

module.exports.help = {
    name: 'generate',
    permission: ['']
}