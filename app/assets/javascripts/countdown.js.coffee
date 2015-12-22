secondToHHMMSS = undefined
hhmmssToSecond = undefined

secondToHHMMSS = (seconds) ->
  date = undefined
  hh = undefined
  mm = undefined
  ss = undefined
  date = new Date(seconds * 1000)
  hh = date.getUTCHours()
  mm = date.getUTCMinutes()
  ss = date.getSeconds()
  if hh < 10
    hh = '0' + hh
  if mm < 10
    mm = '0' + mm
  if ss < 10
    ss = '0' + ss
  hh + ':' + mm + ':' + ss

hhmmssToSecond = (s) ->
  hours = undefined
  minutes = undefined
  seconds = undefined
  time = undefined
  time = s.split(':')
  hours = parseInt(time[0], 10)
  minutes = parseInt(time[1], 10)
  seconds = parseInt(time[2], 10)
  hours * 3600 + minutes * 60 + seconds

jQuery ->
  id = undefined
  seconds = undefined
  timeLeft = undefined
  countDown = undefined
  timeLeft = $('#time')
  if !timeLeft.length
    return
  seconds = hhmmssToSecond(timeLeft.text())

  countDown = ->
    seconds = seconds - 1
    if seconds < 0
      clearInterval id
      $('#submit_answer_sheet').click()
      alert 'Exam time has expired, your examination will be submitted automatically'
      return
    timeLeft.text secondToHHMMSS(seconds)
    return

  id = setInterval(countDown, 1000)