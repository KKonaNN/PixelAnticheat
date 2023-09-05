const DANGER = require("../DANGER").DANGER
const { Formatters } = require('discord.js');

const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');
const request = require('request');
const randomstring = require("randomstring");
const { per, id_role_customer, id_channel_customer_new, ServerIP } = require('../config.json')

DANGER.on('modalSubmit', async (modal) => {
  if(modal.customId === 'RedeemKeyID'){
    const redeem = modal.getTextInputValue('RedeemKeyInputID')
    await modal.deferReply({ ephemeral: true })
    request({
        uri: `http://${ServerIP}/Pixelacapi/redeem/CheckRedeem.php?redeem=${redeem}`,
        method: 'POST'
    }, function(err,res,body) {
        if(body == "Redeem Expired !"){
            modal.followUp({content: 'Redeem Does not exist !', ephemeral: true})
        } else {
            const info = JSON.parse(body);
            const license_key = "PixelAC_" + randomstring.generate({length: 10,charset: 'hex'})
            //check redeem
            request({
                uri: `http://${ServerIP}/Pixelacapi/AddLicense.php?license=${license_key}&discordid=${modal.user.id}&expire=${info.license_expire}`,
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
                modal.followUp({embeds: [Redeemactive], ephemeral: true})
                
                return;
            })

            const role = modal.guild.roles.cache.find(r => r.id === id_role_customer)

            modal.guild.members.cache.find(user => user.id == modal.user.id).roles.add(role)





            /// send channel new customer
            const send_newcustomer_channel = new MessageEmbed()
            send_newcustomer_channel.setColor('#2f3136')
            send_newcustomer_channel.setTitle('New Customer!')
            send_newcustomer_channel.setAuthor('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            send_newcustomer_channel.setThumbnail(modal.user.displayAvatarURL({ format: 'jpg' , size: 1024}))
            send_newcustomer_channel.setDescription(`
            Hi <@!${modal.user.id}>,

            Congratulations on joining Pixel AntiCheat , thank you for trusting us and hoping you have the best moments with us

            `)
            send_newcustomer_channel.setFooter('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            send_newcustomer_channel.setTimestamp()

            /// send channel new customer
            const async = async() => {
                const customer_channel = modal.guild.channels.cache.find(c => c.id == id_channel_customer_new )
                const customer_channel_send = await customer_channel.send({embeds: [send_newcustomer_channel]})
                customer_channel_send.react('<:PixelLogo:1029131634122965002>');
            }

            async(DANGER)



            /// send log
            const CreateLicenselog = new MessageEmbed()
            CreateLicenselog.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
            CreateLicenselog.setTitle(`Create Licesne By Redeem`)
            CreateLicenselog.setDescription(`
                **License ${license_key} Created** By <@!${modal.user.id}>

                **Redeem Key : ${redeem}**
            `)
            CreateLicenselog.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
            CreateLicenselog.setTimestamp()


            const webhookClient = new WebhookClient({ id: '1029123555629203586', token: 'kd9LGbJ1iCvQr0y5X-LkEzBunrG99omXDt3Rp-qFtEkK_EXDcuu2haLoomxt2ju843BF' });
            webhookClient.send({
                username: 'Create Licesne By Redeem',
                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                embeds: [CreateLicenselog],
            })
        }
    })
    
  }  
});