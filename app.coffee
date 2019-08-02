discord = require 'discord.js'
client = new discord.Client()
token = process.env.DISCORD_KEY

diceroll = require './diceroll'

client.on 'ready', ->
  console.log 'login!'

client.on 'message', (message) ->
  if message.author.bot
    return
  else
    if m = message.content.match /(\d+)[dD](\d+)(.*)/
      roll = diceroll.roll(m[1], m[2])
      msg = "[" + roll.join(",") + "]: -> " + diceroll.sum(roll)
      if m[3].match /シークレット/
        message.author.send msg
        return
      else
        message.reply msg

client.login token