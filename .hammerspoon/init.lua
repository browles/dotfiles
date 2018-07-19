-- Load extensions
local fnutils = require "hs.fnutils"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local screen = require "hs.screen"
local window = require "hs.window"
local layout = require "hs.layout"

local log = hs.logger.new("init", "debug")

hs.crash.crashLogToNSLog = true

window.animationDuration = 0

local ctrlAlt = {"ctrl", "alt"}
local mash      = {"ctrl", "cmd"}
local mashAlt   = {"ctrl", "cmd", "alt"}
local mashShift = {"ctrl", "cmd", "shift"}
local mashAll   = {"ctrl", "cmd", "alt", "shift"}

-- Load all screens and sort them from left to right

local getSortedScreens = function()
  local screens = hs.screen.allScreens()
  table.sort(screens, function(screen1, screen2)
    x1, y1 = screen1:position()
    x2, y2 = screen2:position()
    return x1 < x2
  end)

  for i, s in ipairs(screens) do
    log.d(i)
  end

  return screens
end

-- Window movements

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

-- Set up grid

local gridW = 6
local gridH = 8

grid.setGrid(hs.geometry.size(gridW, gridH))
   .setMargins(hs.geometry.point(0, 0))

-- Move windows to discrete positions

local goleft = {x=0, y=0, w=gridW/2, h=gridH}
local goright = {x=gridW/2, y=0, w=gridW/2, h=gridH}
local gotop = {x=0, y=0, w=gridW, h=gridH/2}
local gobottom = {x=0, y=gridH/2, w=gridW, h=gridH/2}
local gocenter = {x=1, y=0, w=4, h=gridH}

local goupleft = {x=0, y=0, w=gridW/2, h=gridH/2}
local goupright = {x=gridW/2, y=0, w=gridW/2, h=gridH/2}
local godownleft = {x=0, y=gridH/2, w=gridW/2, h=gridH/2}
local godownright = {x=gridW/2, y=gridH/2, w=gridW/2, h=gridH/2}

function gridToFrame(screen, grid)
  local screenFrame = screen:frame()
  local cellW = screenFrame.w / gridW
  local cellH = screenFrame.h / gridH
  return hs.geometry.rect(cellW * grid.x, cellH * grid.y, cellW * grid.w, cellH * grid.h)
end

local movements = {
   {mod=ctrlAlt, key="H", fn=gridset(goleft)},
   {mod=ctrlAlt, key="K", fn=gridset(gotop)},
   {mod=ctrlAlt, key="J", fn=gridset(gobottom)},
   {mod=ctrlAlt, key="L", fn=gridset(goright)},
   {mod=ctrlAlt, key="Y", fn=gridset(goupleft)},
   {mod=ctrlAlt, key="U", fn=gridset(goupright)},
   {mod=ctrlAlt, key="B", fn=gridset(godownleft)},
   {mod=ctrlAlt, key="N", fn=gridset(godownright)},
   {mod=ctrlAlt, key="Space", fn=gridset(gocenter)},
   {mod=ctrlAlt, key="M", fn=grid.maximizeWindow}
}

fnutils.each(movements, function(m)
  hotkey.bind(m.mod, m.key, m.fn)
end)

-- App control
hs.hotkey.bind(mash, 'T', function() hs.application.launchOrFocus('/Applications/iTerm.app') end)

-- Layout
local centerScreen = hs.screen{x=0,y=0}
local rightScreen = hs.screen{x=1,y=0}
local leftScreen = hs.screen{x=-1,y=0}

local workLayout = {
  {"Google Chrome", nil, leftScreen, hs.layout.left50, nil, nil},
  {"Emacs", nil, centerScreen, hs.layout.maximized, nil, nil},
  {"iTerm2", nil, leftScreen, hs.layout.right50, nil, nil},
  {"Slack", nil, rightScreen, hs.layout.maximized, nil, nil},
  {"Spotify", nil, rightScreen, hs.layout.maximized, nil, nil},
}

local laptopLayout = {
  {"Google Chrome", nil, centerScreen, hs.layout.maximized, nil, nil},
  {"Emacs", nil, centerScreen, hs.layout.maximized, nil, nil},
  {"iTerm2", nil, centerScreen, hs.layout.right50, nil, nil},
  {"Slack", nil, centerScreen, hs.layout.maximized, nil, nil},
  {"Spotify", nil, centerScreen, hs.layout.maximized, nil, nil},
}

local homeLayout = {
  {"Google Chrome", nil, centerScreen, hs.layout.left50, nil, nil},
  {"Emacs", nil, centerScreen, hs.layout.maximized, nil, nil},
  {"iTerm2", nil, centerScreen, hs.layout.right50, nil, nil},
  {"Slack", nil, rightScreen, hs.layout.maximized, nil, nil},
  {"Spotify", nil, rightScreen, hs.layout.maximized, nil, nil},
}

-- Screen watcher
local lastNumberOfScreens = #hs.screen.allScreens()

function switchLayout()
  local numScreens = #hs.screen.allScreens()
  local layout = {}

  if numScreens == 1 then
    layout = laptopLayout
    layoutName = "Laptop layout"
  elseif numScreens == 2 then
    layout = homeLayout
    layoutName = "Home layout"
  elseif numScreens == 3 then
    layout = workLayout
    layoutName = "Work layout"
  end
  hs.layout.apply(layout)
  hs.alert.show(layoutName)
end

function onScreensChanged()
  numScreens = #hs.screen.allScreens()
  if lastNumberOfScreens ~= numScreens then
    switchLayout()
    lastNumberOfScreens = numScreens
  end
end

local screenWatcher = hs.screen.watcher.new(onScreensChanged):start()

hs.hotkey.bind(mash, "r", function() switchLayout() end)

-- Inspired by https://github.com/jasoncodes/dotfiles/blob/master/hammerspoon/control_escape.lua
-- You'll also have to install Karabiner Elements and map caps_lock to left_control there
len = function(t)
    local length = 0
    for k, v in pairs(t) do
    	length = length + 1
    end
    return length
end


send_escape = false
prev_modifiers = {}

modifier_handler = function(evt)
    -- evt:getFlags() holds the modifiers that are currently held down
    local curr_modifiers = evt:getFlags()

    if curr_modifiers["ctrl"] and len(curr_modifiers) == 1 and len(prev_modifiers) == 0 then
        -- We need this here because we might have had additional modifiers, which
        -- we don't want to lead to an escape, e.g. [Ctrl + Cmd] —> [Ctrl] —> [ ]
        send_escape = true
    elseif prev_modifiers["ctrl"]  and len(curr_modifiers) == 0 and send_escape then
		send_escape = false
        hs.eventtap.keyStroke({}, "ESCAPE")
    else
        send_escape = false
	end
    prev_modifiers = curr_modifiers
	return false
end


-- Call the modifier_handler function anytime a modifier key is pressed or released
modifier_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, modifier_handler)
modifier_tap:start()


-- If any non-modifier key is pressed, we know we won't be sending an escape
non_modifier_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
    send_escape = false
	return false
end)
non_modifier_tap:start()
