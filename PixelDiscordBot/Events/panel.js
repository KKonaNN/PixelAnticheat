const DANGER = require("../DANGER").DANGER
const request = require('request');
const { MessageEmbed, MessageAttachment, WebhookClient, MessageButton, MessageActionRow } = require('discord.js');

const { id_channel_customer_use, per, ServerIP } = require('../config.json')

DANGER.on('ready', async () => {
    const guild = DANGER.guilds.cache.get('978407884813643776')
    const channel = guild.channels.cache.get('1028777779606601768')
    const panelid = '1029131814578683914'

    channel.messages.fetch(panelid).then(message => {


        const SendPanel = async (DANGER) => {







            request({
                uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_Check.php?discord_id=${Member.id}`,
                method: 'POST'
            }, function(err,res,body) {
                if(body == "No License"){
                    Member.send('You do not have a license')
                } else if (body == "License Expire"){
                    Member.send('Your license has expired')
                } else {
        
                    const LicensePanel = new MessageEmbed()
                    const info = JSON.parse(body);
        
                    const rows = new MessageActionRow()
                    const activerow = new MessageButton()
                    .setCustomId('Active')
                    .setLabel('Active')
                    .setStyle('SUCCESS')
                    .setEmoji("✅")
        
                    const deactiverow = new MessageButton()
                    .setCustomId('DeActive')
                    .setLabel('DeActive')
                    .setStyle('DANGER')
                    .setEmoji("🚫")
        
                    const changeiprow = new MessageButton()
                    .setCustomId('ChangeIP')
                    .setLabel('Change IP')
                    .setStyle('PRIMARY')
                    .setEmoji("🌐")
        
                    const changeservernamerow = new MessageButton()
                    .setCustomId('ChangeServerName')
                    .setLabel('Change ServerName')
                    .setStyle('PRIMARY')
                    .setEmoji("✳️")
                    
        

                    //log active license
                    const panel_log_active = new WebhookClient({ id: '1029122498513612871', token: 'fN6gS6l4ywKchZcg8vw9knnYitgAD4snB0G7n6ck2oCr26_GLkvueIkgj4aHHd2u-8ad' });
                    //log deactive license
                    const panel_log_deactive = new WebhookClient({ id: '1029122591304204369', token: 'j5Hw7fxWR1q-PIhdNRDqanNZCsmcCLYLbsj-gk1Frmk_x-krwhWzNutL9HkgoIsngQCy' });
                    //log change ip license 
                    const panel_log_changeip = new WebhookClient({ id: '1029122884855148644', token: 'uw40c988l2dGO_W7ghIAS9r_Q_Oz6kca4MD3Nhzbxz2Eg9AqgmpeTZ7jNBjFlvGp3csX' });
                    //log change server name license 
                    const panel_log_changeservername = new WebhookClient({ id: '1029122984331464734', token: 'UD9xGpBGFkLPVpH2WENgfYFcIRAk8-JkYUEWfmrzobHaBdhzSv-W0Ik7Tk_eBTAU_djs' });
        

        
        
        
        
                    if(info.licensestatus == "false"){
        
        
                        LicensePanel.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                        LicensePanel.setTitle("License Panel")
                        LicensePanel.setColor('#2f3136')
                        LicensePanel.setDescription(`
        
                        **License Key** : \`\`${info.license}\`\`
        
                        **Expire** : \`\`${info.expire}\`\`
        
                        **Status** :\`\`DeActive\`\`
        
                        **IP** : ${info.ip}
        
                        **ServerName** : ${info.Servername}
        
                        `)
                        LicensePanel.setFooter('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                        
                        rows.addComponents(
                            activerow,
                            deactiverow.setDisabled('true'),
                            changeiprow.setDisabled('true'),
                            changeservernamerow.setDisabled('true')
                        );
        
        
                        const async = async() => {
                            const sendpanel = await Member.send({ embeds: [LicensePanel], components: [rows] })
        
                            const collector = sendpanel.createMessageComponentCollector({ componentType: 'BUTTON', time: 20000 });
        
                            collector.on('collect', async i => {
                                if (i.customId === 'Active') {
        
                                    const licenseactive = new MessageEmbed()
                                    licenseactive.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                                    licenseactive.setTitle('License Activated')
                                    licenseactive.setDescription('**Your license activated**')
                                    licenseactive.setImage('https://cdn.discordapp.com/attachments/892874366201778247/928364928769851402/unknown.png')
                                    await i.update({ embeds:[LicensePanel.setDescription('**Your license will be activated soon**')], components: [] }).then(setTimeout(() => {
                                        //sendpanel.delete()
                                        Member.send({content: `<@!${Member.id}>\nUse \`\`${per}panel\`\` to reuse the panel`, embeds: [licenseactive]})
                                        
                                    }, 6000))
        
                                    
                                    request({
                                        uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_ChangeStatus.php?discord_id=${Member.id}&ChangeStatus=true`,
                                        method: 'POST'
                                    }, function(err,res,body) {})
        
                                    // send log active
                                    panel_log_active.send({
                                        username: 'Active Log',
                                        avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                                        content: `------------------------------\n<@!${Member.id}>,\n${Member.tag} Used A Bot Panel,\n\nLicense \`\`${info.license}\`\` Active Shod :white_check_mark: \n------------------------------`
                                    })
        
                                }
                            })
        
                            collector.on('end', collected => {
                                sendpanel.delete()
                            }); 
                            
                             
                        }
                        async(DANGER)
        
        
        
                    } else {
        
        
                        LicensePanel.setAuthor('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                        LicensePanel.setTitle("License Panel")
                        LicensePanel.setColor('#2f3136')
                        LicensePanel.setDescription(`
        
                        **License Key** : \`\`${info.license}\`\`
        
                        **Expire** : \`\`${info.expire}\`\`
        
                        **Status** :\`\`Active\`\`
        
                        **IP** : ${info.ip}
        
                        **ServerName** : ${info.Servername}
        
                        `)
                        LicensePanel.setFooter('PixelAC', 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png', '')
                        
        
                        if(Number(info.IPLimit) <= 0){
                            /////// zamani ke limit nabashe
                            
                            rows.addComponents(
                                activerow.setDisabled('true'),
                                deactiverow,
                                changeiprow,
                                changeservernamerow
                            );
                            const async = async() => {
                                const sendpanel = await Member.send({ embeds: [LicensePanel], components: [rows] })
        
                                const collector = sendpanel.createMessageComponentCollector({ componentType: 'BUTTON', time: 20000 });
        
                                collector.on('collect', async i => {
                                    if (i.customId === 'DeActive') {
        
                                        
                                        await i.update({ embeds:[LicensePanel.setDescription('**Your license will be deactivated soon**')], components: [] }).then(setTimeout(() => {
                                            
                                            Member.send('**Your license deactivated**')
                                            Member.send(`Use \`\`${per}panel\`\` to reuse the panel`)
                                        }, 6000))
        
                                        request({
                                            uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_ChangeStatus.php?discord_id=${Member.id}&ChangeStatus=false`,
                                            method: 'POST'
                                        }, function(err,res,body) {})
        
        
                                        // send log deactive
                                        panel_log_deactive.send({
                                            username: 'DeActive Log',
                                            avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                                            content: `------------------------------\n<@!${Member.id}>,\n${Member.tag} Used A Bot Panel,\n\nLicense \`\`${info.license}\`\` Deactive Shod :negative_squared_cross_mark:  \n------------------------------`
                                        })
        
        
                                    } else if (i.customId === 'ChangeIP') {
        
                                        await i.update({ embeds:[LicensePanel.setDescription('**Enter the new IP**')], components: [] });
                                        const sendip = Member.dmChannel.createMessageCollector({ max: 1, time: 25000 })
        
                                        sendip.on('collect', m => {
        
                                            request({
                                                uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_ChangeIP.php?discord_id=${Member.id}&newIP=${m.content}`,
                                                method: 'POST'
                                            }, function(err,res,body) {})
        
                                            Member.send(`**New IP set.** Use \`\`${per}panel\`\` to reuse the panel`)
        
        
                                            // send log changeip
                                            panel_log_changeip.send({
                                                username: 'Change IP Log',
                                                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                                                content: `------------------------------\n<@!${Member.id}>,\n${Member.tag} Used A Bot Panel,\n\nIP License \`\`${info.license}\`\` Avaz Shod,\nOld IP : ${info.ip} && New IP : ${m.content} :globe_with_meridians:   \n------------------------------`
                                            })
                                        });
                                        /*sendip.on('end', collected => {
                                            sendpanel.delete()
                                        });*/    
        
        
                                    } else if (i.customId == 'ChangeServerName') {
        
                                        await i.update({ embeds:[LicensePanel.setDescription('**Enter the new ServerName**')], components: [] });
                                        const sendname = Member.dmChannel.createMessageCollector({ max: 1, time: 25000 })
                                        sendname.on('collect', m => {
                                            console.log(m.content)
                                            request({
                                                uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_ChangeServerName.php?discord_id=${Member.id}&NewServerName=${m.content}`,
                                                method: 'POST'
                                            }, function(err,res,body) {})
        
                                            Member.send(`**New ServerName set.** Use \`\`${per}panel\`\` to reuse the panel`)
        
        
                                            // send log change servername
                                            panel_log_changeservername.send({
                                                username: 'Change ServerName Log',
                                                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                                                content: `------------------------------\n<@!${Member.id}>,\n${Member.tag} Used A Bot Panel,\n\nServerName License \`\`${info.license}\`\` Avaz Shod,\nOld ServerName : ${info.Servername} && New ServerName : ${m.content} :globe_with_meridians:   \n------------------------------`
                                            })
        
                                        });
                                        /*sendname.on('end', collected => {
                                            sendpanel.delete()
                                        });*/
        
                                    }
                                });
        
                                collector.on('end', collected => {
                                    sendpanel.delete()
                                });   
                                
        
                            }
                            async(DANGER)
        
                            
                        } else {
                            ////  zamani ke limit bashe
        
                            rows.addComponents(
                                activerow.setDisabled('true'),
                                deactiverow,
                                changeiprow.setDisabled('true'),
                                changeservernamerow
                            );
        
                            const async = async() => {
                                const sendpanel = await Member.send({ embeds: [LicensePanel], components: [rows] })
        
                                const collector = sendpanel.createMessageComponentCollector({ componentType: 'BUTTON', time: 20000 });
        
                                collector.on('collect', async i => {
                                    if (i.customId === 'DeActive') {
        
                                        await i.update({ embeds:[LicensePanel.setDescription('**Your license will be deactivated soon**')], components: [] }).then(setTimeout(() => {
                                            //sendpanel.delete()
                                            Member.send('**Your license deactivated**')
                                            Member.send(`Use \`\`${per}panel\`\` to reuse the panel`)
                                        }, 6000))
        
                                        request({
                                            uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_ChangeStatus.php?discord_id=${Member.id}&ChangeStatus=false`,
                                            method: 'POST'
                                        }, function(err,res,body) {})
        
        
                                        // send log deactive
                                        panel_log_deactive.send({
                                            username: 'DeActive Log',
                                            avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                                            content: `------------------------------\n<@!${Member.id}>,\n${Member.tag} Used A Bot Panel,\n\nLicense \`\`${info.license}\`\` Deactive Shod :negative_squared_cross_mark:  \n------------------------------`
                                        })
        
                                    } else if (i.customId == 'ChangeServerName') {
        
                                        await i.update({ embeds:[LicensePanel.setDescription('**Enter the new ServerName**')], components: [] });
                                        const sendname = Member.dmChannel.createMessageCollector({ max: 1, time: 25000 })
                                        sendname.on('collect', m => {
        
                                            request({
                                                uri: `http://${ServerIP}/Pixelacapi/User_Panel/User_Panel_ChangeServerName.php?discord_id=${Member.id}&NewServerName=${m.content}`,
                                                method: 'POST'
                                            }, function(err,res,body) {})
        
                                            Member.send(`**New ServerName set.** Use \`\`${per}panel\`\` to reuse the panel`)
        
                                            // send log change servername
                                            panel_log_changeservername.send({
                                                username: 'Change ServerName Log',
                                                avatarURL: 'https://cdn.discordapp.com/attachments/955499597252407327/1029129091061915808/pixelanticheatlogo.png',
                                                content: `------------------------------\n<@!${Member.id}>,\n${Member.tag} Used A Bot Panel,\n\nServerName License \`\`${info.license}\`\` Avaz Shod,\nOld ServerName : ${info.Servername} && New ServerName : ${m.content} :globe_with_meridians:   \n------------------------------`
                                            })
        
                                        });
                                        /*sendname.on('end', collected => {
                                            sendpanel.delete()
                                        });*/
        
                                    }
                                });
        
                                collector.on('end', collected => {
                                    sendpanel.delete()
                                });
                            }
                            async(DANGER)
                        }
                        
        
                       
                    }
                }
            })








        }



        const collector = message.createMessageComponentCollector({ componentType: 'BUTTON' });
        collector.on('collect', async i => {
            if (i.customId === 'panelrows') {
                Member = i.user
                SendPanel(DANGER)

                i.reply({content: 'Your license info has been sent to your direct, if you have problems receiving direct contact us with support', ephemeral: true})
            } 
        });
    })

})