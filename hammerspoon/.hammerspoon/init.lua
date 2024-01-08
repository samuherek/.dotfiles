hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)



hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
    local appName = hs.application.frontmostApplication():name()

    if (appName == "Brave Browser" or appName == "Google Chrome" or appName == "Safari") then
        hs.eventtap.keyStroke({"cmd"}, "L")
        hs.eventtap.keyStroke({"cmd"}, "C")
        hs.eventtap.keyStroke("", "Escape")
        local url = hs.pasteboard.getContents()
        print(url)
    end
end)

function startMouseMover()
    hs.notify.new({title="mover", informativeText="does it work?"}):send()
    hs.mouse.absolutePosition({20, 20})
end

hs.urlevent.bind("startMouseMover", function(eventName, params) startMouseMover() end)

--hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
--    hs.eventtap.keyStroke({"cmd"}, "W")
--end)

--function braveWatcher(appName, eventType, appObject)
 --   if (eventType == hs.application.watcher.activated) then
 --       if (appName == 'Brave Browser') then
 --       hs.notify.new({title="brave", informativeText="Hello World"}):send()
 --       end
 --   end
--end

--appWatcher = hs.application.watcher.new(braveWatcher)
--appWatcher:start()
