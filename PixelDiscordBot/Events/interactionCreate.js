const DANGER = require("../DANGER").DANGER
DANGER.on('interactionCreate',async inter => {
    if(inter.isCommand()) {
        let slashCmds = DANGER.SlashCmds.get(inter.commandName)
        //if(inter.member.permissions.has(slashCmds.help.permissions))
        if(slashCmds) slashCmds.run(inter)
    }

    if(inter.isContextMenu()) {
        let slashCmds = DANGER.SlashCmds.get(inter.commandName)
        //if(inter.member.permissions.has(slashCmds.help.permissions))
        if(slashCmds) slashCmds.run(inter)
    }

})