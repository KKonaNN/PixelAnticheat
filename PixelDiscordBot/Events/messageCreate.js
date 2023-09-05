const DANGER = require("../DANGER").DANGER
const { link } = require("fs")
const { per } = require('../config.json')

DANGER.on('messageCreate', async message => {
    if(message.author.bot) return
    //if(message.author.id != '855006353322803202') return message.reply("Updating pls wait!")
    //if(message.channel.type == "DM") message.author.send('asdasdafasf')

    let perfix = per
    let messageArray = message.content.split(" ");
    let cmd = messageArray[0];
    let args = messageArray.slice(1)



    let commands = DANGER.commands.get(cmd.slice(perfix.length)) || DANGER.commands.get(DANGER.aliases.get(cmd.slice(perfix.length)));
    if(commands) {
        if(!message.content.startsWith(perfix)) return
        commands.run(DANGER, message, args, perfix)
    } 
})