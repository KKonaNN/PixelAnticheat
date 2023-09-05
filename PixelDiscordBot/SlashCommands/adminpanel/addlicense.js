const { MessageEmbed, MessageAttachment, WebhookClient } = require('discord.js');

const request = require('request');
const randomstring = require("randomstring");

const { per, id_role_customer, id_channel_customer_new, ServerIP } = require('../../config.json')
const DANGER = require('../../DANGER').DANGER
module.exports.run = async (inter) => {
    if(!inter.member.roles.cache.has('1029120514867863593')) return inter.reply('You Dont Have Permission To Use This Command!!')

    
    //const license = inter.options.getString('license');
    const discord = inter.options.getMember('discord');
    const expire = inter.options.getString('expire');

    ///// create license
    const license_key = "PixelAC_" + randomstring.generate({length: 7,charset: 'hex'})

    request({
        uri: `http://${ServerIP}/Pixelacapi/AddLicense.php?license=${license_key}&discordid=${discord.id}&expire=${expire}`,
        method: 'POST'
    }, function(err,res,body) {
        return;
    });

    //// add role
    const role = inter.guild.roles.cache.find(r => r.id === id_role_customer)

    discord.roles.add(role)


    

    ////////
    const addlicense = new MessageEmbed()
	.setColor('#2f3136')
	.setTitle('Add License')
	.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
	.setDescription(`
    License Has Been **Created** !!

    ***Information***

    **License** : \`\`${license_key}\`\`

    **Owner** : ${discord}

    **Expire** : \`\`${expire}\`\`

    **Status** : **De Active**

    
    `)
	.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
	.setFooter('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    .setTimestamp()
    //.setImage('https://cdn.discordapp.com/attachments/859880293547638794/915622080073068574/ZamZam.gif')

    //const gif = new MessageAttachment('./image/active.gif');
    //send channel
    //inter.reply({embeds: [addlicense] , files: [gif]});
    

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    // send dms
    const addlicense_dmsend = new MessageEmbed()
	.setColor('#2f3136')
	.setTitle('Add License')
	.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
	.setDescription(`
    License Has Been **Created** !!

    ***Information***

    **License** : \`\`${license_key}\`\`

    **Owner** : ${discord}

    **Expire** : \`\`${expire}\`\`

    **Status** : **De Active**

    \n**Use the following command to activate your license, otherwise your license will not be activated**

    **\`\`\`${per}panel\`\`\`**
    
    `)
	.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
	.setFooter('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    .setTimestamp()


    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    /////send log

    const addlicense_logsend = new MessageEmbed()
	.setColor('#2f3136')
	.setTitle('License Log')
	.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
	.setDescription(`
    New License Created 

    ***Information***

    **License** : \`\`${license_key}\`\`

    **Owner** : ${discord}

    **Expire** : \`\`${expire}\`\`

    **Status** : **De Active**

    **Created By** : <@!${inter.user.id}>
    
    `)
	.setThumbnail('https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
	.setFooter('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    .setTimestamp()
    




    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    /// send channel new customer

    const send_newcustomer_channel = new MessageEmbed()
	.setColor('#2f3136')
	.setTitle('New Customer!')
	.setAuthor('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
    .setThumbnail(discord.user.displayAvatarURL({ format: 'jpg' , size: 1024}))
    .setDescription(`
    Hi ${discord},

    Congratulations on joining Pixel AntiCheat , thank you for trusting us and hoping you have the best moments with us

    `)
    .setFooter('Pixel AntiCheat', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png')
    .setTimestamp()



    
    /////// send

    discord.send({embeds: [addlicense_dmsend]}).catch(error => {
        // if (error.code !== 50007) {
        //     inter.reply('kaaaaaaaaaaaaar kard')                
        // }
        const chaannel =  inter.guild.channels.cache.find(c => c.id == inter.channel.id )
        chaannel.send({ content: `${discord},\n\`\`\`Your direct is closed, so we had to send your license receipt here, to activate, your direct must be open\`\`\``, embeds: [addlicense_dmsend] })
    })
        
    try {
        inter.reply({embeds: [addlicense]});
    } catch (err) {
        console.log('eror send addlicense')
    }


    /// send log
    const webhookClient = new WebhookClient({ id: '1029123876011118662', token: 'nu-Vde5_25GAq8aBYX9DzLD0V-nAWdFa3cduA9lNBCDbcDs2239jJ1y52PF4i3yL5G-a' });
    webhookClient.send({
        username: 'License Created',
        avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
        embeds: [addlicense_logsend],
    })

    /// send channel new customer
    const customer_channel = inter.guild.channels.cache.find(c => c.id == id_channel_customer_new )
    const customer_channel_send = await customer_channel.send({embeds: [send_newcustomer_channel]})
    customer_channel_send.react('<:PixelLogo:1029131634122965002>');
}

module.exports.help = {
    name: 'addlicense',
    permission: ['']
}