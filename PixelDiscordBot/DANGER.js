const Discord = require('discord.js');
const { token } = require('./config.json')
const fs = require('fs');
const discordModals = require('discord-modals')
const DANGER = new Discord.Client({
    intents: [ Discord.Intents.FLAGS.GUILDS, Discord.Intents.FLAGS.GUILD_MEMBERS, Discord.Intents.FLAGS.GUILD_MESSAGES, Discord.Intents.FLAGS.DIRECT_MESSAGES, Discord.Intents.FLAGS.DIRECT_MESSAGE_TYPING ],
    allowedMentions: { parse: ['users', 'roles', 'everyone'], repliedUser: true}
})



DANGER.commands = new Discord.Collection();
DANGER.aliases = new Discord.Collection();
DANGER.events = new Discord.Collection();
DANGER.SlashCmds = new Discord.Collection();
discordModals(DANGER)
module.exports.DANGER = DANGER;


//  کامند هندلر و ریلیس کامند
fs.readdirSync('./Commands/').forEach(dir => {
    fs.readdir(`./Commands/${dir}`, (err, files) => {
        if (err) throw err;
        var jsFiles = files.filter(f => f.split(".").pop() === "js");
        if (jsFiles.length <= 0) return console.log("[CMD HANDLER (OW) ] - Can't find any Commands");

        jsFiles.forEach(file => {
            var fileGet = require(`./Commands/${dir}/${file}`);
            console.log(`[CMD HANDLER (OW) ] - File ${file} Load Shod`)
            
            try {
                DANGER.commands.set(fileGet.help.name, fileGet);

                fileGet.help.aliases.forEach(alias => {
                    DANGER.aliases.set(alias, fileGet.help.name);
                })
            } catch (err) {
                return console.log(err)
            }
        })
    })
})



// ایونت هندلر
fs.readdirSync('./Events/').forEach(file => {
    var jsFiles = fs.readdirSync('./Events/').filter(f => f.split(".").pop() === "js");
    if (jsFiles.length <= 0) return console.log("[EVS HANDLER (OW) ] - Can't find any Events");
    let check = false
    jsFiles.forEach(event => {
        const eventGet = require(`./Events/${event}`)
        try {
            DANGER.events.set(eventGet.name, eventGet)
            if(check == false) {
                console.log(`[EVS HANDLER (OW) ] - File ${event} Load Shod`)
                check = true
            }
        } catch(error) {
            return console.log(error)
        }
    })
})



// اسلش کامند
fs.readdirSync('./SlashCommands/').forEach(dir => {
    fs.readdir(`./SlashCommands/${dir}`, (err, files) => {
        if (err) throw err;
        var jsFiles = files.filter(f => f.split(".").pop() === "js");
        if (jsFiles.length <= 0) return console.log("[SlCmds HANDLER (OW) ] - Can't find any Commands");

        jsFiles.forEach(file => {
            var fileGet = require(`./SlashCommands/${dir}/${file}`);
            console.log(`[SlCmds HANDLER (OW) ] - File ${file} Load Shod`)
            
            try {
                DANGER.SlashCmds.set(fileGet.help.name, fileGet); 
            } catch (err) {
                return console.log(err)
            }
        })
    })
})



DANGER.login(token)