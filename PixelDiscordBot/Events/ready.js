const DANGER = require("../DANGER").DANGER
const request = require('request');
const { id_role_customer } = require('../config.json')
const { createCmd } = require("../DataHandler")
DANGER.on('ready', async () => {
    console.log('Bot Successfully Started')
    createCmd(DANGER, '978407884813643776')

    DANGER.user.setPresence({
        status: 'dnd'
    })

    
    
    /*function statusanim() {
            
        const guild = DANGER.guilds.cache.get('1007028440169467984');
        request({
            uri: `http://localhost/Pixelacapi/ActiveKey.php`,
            method: 'POST'
        }, function(err,res,body) {
            const info = JSON.parse(body);
            const memberCount = guild.memberCount;
            let DANGER1 = ["🌀Updating Version 1.8 ...." , `✅ GlobalBans : ${info.Bans +120}`, `✅ Active licenses : ${info.Keys}` , `👥 Members : ${memberCount.toLocaleString()}`]
            let Power = Math.floor(Math.random() * DANGER1.length);
            DANGER.user.setActivity(DANGER1[Power], {type: "WATCHING"});
        })
        
        
    }; setInterval(statusanim, 8000)*/
})