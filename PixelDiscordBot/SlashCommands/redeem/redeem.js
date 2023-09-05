const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const request = require('request');
const randomstring = require("randomstring");
const { per, id_role_customer, id_channel_customer_new } = require('../../config.json')


const { Modal, TextInputComponent, showModal } = require('discord-modals')
const { DANGER } = require('../../DANGER')


module.exports.run = async (inter) => {
    /*if(inter.channel.id != '952562165880090674') return inter.reply('<#952562165880090674> !!')
    
    const redeem = inter.options.getString('redeem');
    //check redeem
    request({
        uri: `http://localhost/Pixelacapi/redeem/CheckRedeem.php?redeem=${redeem}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "Redeem Expired !"){
            inter.reply({content: 'Redeem Does not exist !', ephemeral: true})
        } else {
            const info = JSON.parse(body);
            const license_key = "PixelAC_" + randomstring.generate({length: 10,charset: 'hex'})
            //check redeem
            request({
                uri: `http://Pixelac.site/Pixelacapi/AddLicense.php?license=${license_key}&discordid=${inter.user.id}&expire=${info.license_expire}`,
                method: 'POST'
            }, function(err,res,body) {
                

                const Redeemactive = new MessageEmbed()
                Redeemactive.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                Redeemactive.setTitle('Redeem Key Active !')
                Redeemactive.setDescription(`
                    **License Key Has Been Crated !**
    
                    > **Redeem Key : \`\`${redeem}\`\` **
                    > ---------------------------
                    > **License Key : \`\`${license_key}\`\`**
                `)
                Redeemactive.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
                Redeemactive.setTimestamp()
                inter.reply({embeds: [Redeemactive], ephemeral: true})
                
                return;
            })

            const role = inter.guild.roles.cache.find(r => r.id === id_role_customer)

            inter.guild.members.cache.find(user => user.id == inter.user.id).roles.add(role)

            /// send log
            const CreateLicenselog = new MessageEmbed()
            CreateLicenselog.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            CreateLicenselog.setTitle(`Create Licesne By Redeem`)
            CreateLicenselog.setDescription(`
                **License ${license_key} Created** By <@!${inter.user.id}>

                **Redeem Key : ${redeem}**
            `)
            CreateLicenselog.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            CreateLicenselog.setTimestamp()


            const webhookClient = new WebhookClient({ id: '952646194289590292', token: 'sQjaECRpWU4YSi7rhnTC5bmxN69oWbaU6-L-HtWxDxOT7oVfZlbOTDbVLDm29WCqVFJd' });
            webhookClient.send({
                username: 'Create Licesne By Redeem',
                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                embeds: [CreateLicenselog],
            })
        }
    })*/




    // update version 2
    if(inter.channel.id != '1029129512643985448') return inter.reply('<#1029129512643985448> !!')

    const textinput  = new TextInputComponent() 
    textinput.setCustomId('RedeemKeyInputID')
    textinput.setLabel('Enter your Redeem!')
    textinput.setStyle('SHORT')
    textinput.setMinLength(20)
    textinput.setMaxLength(40)
    textinput.setPlaceholder('Write a Redeem Key')
    textinput.setRequired(true)



    const modal = new Modal() // We create a Modal
    modal.setCustomId('RedeemKeyID')
    modal.setTitle('Use Redeem Key')
    modal.addComponents([textinput])

    showModal(modal, {
        client: DANGER, 
        interaction: inter 
    })

}

module.exports.help = {
    name: 'redeem',
    permission: ['']
}