diceroll = (res, n, m) ->
  if n <= 0
    return res
  else
    dice = Math.floor(Math.random() * m + 1)
    res.push dice
    diceroll(res, n - 1, m)

exports.roll = (n, m) ->
  return diceroll([], n, m)

sumList = (arr) ->
  if arr.length == 0
    0
  else
    t = arr.shift()
    t + sumList(arr)

exports.sum = (arr) ->
  sumList arr