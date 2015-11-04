npm = require 'npm'
thing = (word) ->
  return ->
    document.querySelector("#mainbod").style.display = "none"
    document.querySelector("#installing").style.display = "flex"
    npm.load {global: true}, (err) ->
      if not err
        npm.commands[word] [document.querySelector("#packagename").value],
        (err, data) ->
          if not err
            document.querySelector("#installing").style.display = "none"
            document.querySelector("#done").style.display = "flex"
          else
            document.querySelector("#installing").style.display = "none"
            document.querySelector("#error").style.display = "flex"
      else
        document.querySelector("#installing").style.display = "none"
        document.querySelector("#error").style.display = "flex"

document.querySelector("#install").onclick = thing "install"
document.querySelector("#uninstall").onclick = thing "remove"

for i in document.querySelectorAll(".another")
  i.onclick = ->
    document.querySelector("#done").style.display = "none"
    document.querySelector("#error").style.display = "none"
    document.querySelector("#mainbod").style.display = "flex"
