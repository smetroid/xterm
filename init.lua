---local hyper = {"ctrl", "alt", "cmd"}
local hyper = {"ctrl", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.1
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "k"},
  right = {hyper, "l"},
  down = {hyper, "j"},
  left = {hyper, "h"},
  fullscreen = {hyper, "f"}
})

hs.hotkey.bind(hyper, "s", function()
  local win = hs.window.focusedWindow()
  local main = hs.screen.mainScreen()
  win:moveToScreen(win:screen():next())
end)
