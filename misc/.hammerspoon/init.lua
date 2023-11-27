local grid   = require("hs.grid")
local hotkey = require("hs.hotkey")
local window = require("hs.window")

hs.loadSpoon("ControlEscape"):start()
hs.crash.crashLogToNSLog = true
window.animationDuration = 0

-- Window movement
local gridW              = 6
local gridH              = 8

grid.setGrid(hs.geometry.size(gridW, gridH))
    .setMargins(hs.geometry.point(0, 0))

local goleft = { x = 0, y = 0, w = gridW / 2, h = gridH }
local goright = { x = gridW / 2, y = 0, w = gridW / 2, h = gridH }
local gotop = { x = 0, y = 0, w = gridW, h = gridH / 2 }
local gobottom = { x = 0, y = gridH / 2, w = gridW, h = gridH / 2 }
local gocenter = { x = 1, y = 0, w = 4, h = gridH }

local goupleft = { x = 0, y = 0, w = gridW / 2, h = gridH / 2 }
local goupright = { x = gridW / 2, y = 0, w = gridW / 2, h = gridH / 2 }
local godownleft = { x = 0, y = gridH / 2, w = gridW / 2, h = gridH / 2 }
local godownright = { x = gridW / 2, y = gridH / 2, w = gridW / 2, h = gridH / 2 }

local goleftthird = { x = 0, y = 0, w = gridW / 3, h = gridH }
local gorightthird = { x = 2 * gridW / 3, y = 0, w = gridW / 3, h = gridH }
local gocenterthird = { x = gridW / 3, y = 0, w = gridW / 3, h = gridH }

local golefttwothird = { x = 0, y = 0, w = 2 * gridW / 3, h = gridH }
local gorighttwothird = { x = gridW / 3, y = 0, w = 2 * gridW / 3, h = gridH }

local gridset = function(frame)
  return function()
    local win = window.focusedWindow()
    if win then
      grid.set(win, frame, win:screen())
    else
      alert.show("No focused window.")
    end
  end
end

-- Window layouts
local centerScreen = hs.screen({ x = 0, y = 0 })
local rightScreen = hs.screen({ x = 1, y = 0 })
local leftScreen = hs.screen({ x = -1, y = 0 })

local oneScreenLayout = {
  { "Google Chrome", nil, centerScreen, hs.layout.maximized, nil, nil },
  { "iTerm2", nil, centerScreen, hs.layout.right50, nil, nil },
  { "Slack", nil, centerScreen, hs.layout.maximized, nil, nil },
  { "Spotify", nil, centerScreen, hs.layout.maximized, nil, nil },
}

local twoScreenLayout = {
  { "Google Chrome", nil, rightScreen, hs.layout.left50, nil, nil },
  { "iTerm2", nil, rightScreen, hs.layout.right50, nil, nil },
  { "Slack", nil, leftScreen, hs.layout.maximized, nil, nil },
  { "Spotify", nil, leftScreen, hs.layout.maximized, nil, nil },
}

function switchLayout()
  local numScreens = #hs.screen.allScreens()
  local layout = {}
  local layoutName = ""
  if numScreens == 1 then
    layout = oneScreenLayout
    layoutName = "One Screen Layout"
  else
    layout = twoScreenLayout
    layoutName = "Multi Screen Layout"
  end
  hs.layout.apply(layout)
  hs.alert.show(layoutName)
end

-- App control
local function launchOrFocus(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

-- Keybinds
local ctrlAlt      = { "ctrl", "alt" }
local ctrlCmd      = { "ctrl", "cmd" }
local ctrlShiftAlt = { "ctrl", "shift", "alt" }
local ctrlCmdAlt   = { "ctrl", "cmd", "alt" }
local ctrlCmdShift = { "ctrl", "cmd", "shift" }
local ctrlCmdAll   = { "ctrl", "cmd", "alt", "shift" }

local keybinds     = {
  { mod = ctrlAlt, key = "H", fn = gridset(goleft) },
  { mod = ctrlAlt, key = "K", fn = gridset(gotop) },
  { mod = ctrlAlt, key = "J", fn = gridset(gobottom) },
  { mod = ctrlAlt, key = "L", fn = gridset(goright) },
  { mod = ctrlAlt, key = "Y", fn = gridset(goupleft) },
  { mod = ctrlAlt, key = "U", fn = gridset(goupright) },
  { mod = ctrlAlt, key = "B", fn = gridset(godownleft) },
  { mod = ctrlAlt, key = "N", fn = gridset(godownright) },
  { mod = ctrlAlt, key = "Space", fn = gridset(gocenter) },
  { mod = ctrlAlt, key = "M", fn = grid.maximizeWindow },
  { mod = ctrlCmdAlt, key = "H", fn = gridset(goleftthird) },
  { mod = ctrlCmdAlt, key = "Space", fn = gridset(gocenterthird) },
  { mod = ctrlCmdAlt, key = "L", fn = gridset(gorightthird) },
  { mod = ctrlShiftAlt, key = "H", fn = gridset(golefttwothird) },
  { mod = ctrlShiftAlt, key = "L", fn = gridset(gorighttwothird) },
  { mod = ctrlCmd, key = 'T', fn = launchOrFocus("iTerm2") },
  { mod = ctrlCmd, key = "R", fn = switchLayout },
}

for _, bind in ipairs(keybinds) do
  hotkey.bind(bind.mod, bind.key, bind.fn)
end
