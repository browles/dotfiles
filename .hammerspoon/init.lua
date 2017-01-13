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
   {mod=mashShift, key="Left", fn=gridset(goleft)},
   {mod=mashShift, key="Up", fn=gridset(gotop)},
   {mod=mashShift, key="Down", fn=gridset(gobottom)},
   {mod=mashShift, key="Right", fn=gridset(goright)},
   {mod=mashShift, key="Space", fn=gridset(gocenter)},
   {mod=mashShift, key="M", fn=grid.maximizeWindow}
}

fnutils.each(movements, function(m)
  hotkey.bind(m.mod, m.key, m.fn)
end)
