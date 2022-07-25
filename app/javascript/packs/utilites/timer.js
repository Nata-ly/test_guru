document.addEventListener('turbolinks:load', function() {
  let timer = document.querySelector('.timer')

  if (timer){
    setInterval(timerStart, 1000)
  }
})

timerStart = function(){
  timer = document.querySelector('.timer')
  time = parseInt(timer.dataset.time)
  if (time > 0){
    time--
    document.querySelector('.timer').textContent = formatTime(time)
    document.querySelector('.timer').dataset.time = time
  } else {
    redirect_timer()
    clearInterval(timerStart)
  }
}

function formatTime(time){
  seconds = Math.trunc(time%60)
  minutes = Math.trunc(time/60%60)
  hour = Math.trunc(time/60/60%60)
  return `${hour.toString().padStart(2, "0")}:${minutes.toString().padStart(2, "0")}:${seconds.toString().padStart(2, "0")}`
}

function redirect_timer(){
  document.querySelector('.update-button').click()
}
