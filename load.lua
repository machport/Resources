writefile('temp.txt',"BAUAAAAIAAAAVUlDb3JuZXIABwABAARwFAYEAgYEBklOU1QfAAAAHQAAAAAAAADwDgYAAAAMAAAAVUlMaXN0TGF5b3V0AAEAAAAAAAASUFJPUBgAAAAWAAAAAAAAAPAHAAAAAAYAAABBY3RpdmUCAAAAAAAAAFBST1AuAAAATAAAAAAAAADwBgAAAAALAAAAQW5jaG9yUG9pbnQNfhUAAQUADgIAARcAAQUACQIAUAAAAAAAUFJPUCoAAAA4AAAAAAAAAPANAAAAABMAAABBdHRyaWJ1dGVzU2VyaWFsaXplARwADwIAAFAAAAAAAFBST1AeAAAAHAAAAAAAAADwDQAAAAAMAAAAQXV0b0xvY2FsaXplAgEBAQEBAQFQUk9QJAAAADIAAAAAAAAA8AcAAAAADQAAAEF1dG9tYXRpY1NpemUSFgAPAgAAUAAAAAAAUFJPUGAAAABtAAAAAAAAAPMYAAAAABAAAABCYWNrZ3JvdW5kQ29sb3IzDHx7ewB7fHsZgdEAARlxBwBzGoTSAAIachwAcyGR4QABIYEHAPMGIpTiAAIignx8fAB7fHyBEVEAAYEBBwBwghJSAAKEAlBST1AtAAAAOwAAAAAAAADwEAAAAAAWAAAAQmFja2dyb3VuZFRyYW5zcGFyZW5jeQQfAA8CAABQAAAAAABQUk9QUQAAAGkAAAAAAAAA8AsAAAAADAAAAEJvcmRlckNvbG9yMwwAAHt7exoAN6GxsQcAMKS0tA4AMHt8fAcAN6FRUQcAMKRSUg4ABBwAIKmpDgDAoampAAAAAKSsrAAAUFJPUCEAAAAvAAAAAAAAAPAEAAAAAAoAAABCb3JkZXJNb2RlEhMADwIAAFAAAAAAAFBST1AnAAAANAAAAAAAAADwCQAAAAAPAAAAQm9yZGVyU2l6ZVBpeGVsAxgADQIAcAQCAgAAAgJQUk9QIgAAACAAAAAAAAAA8BEAAAAAEAAAAENsaXBzRGVzY2VuZGFudHMCAAAAAAAAAFBST1AbAAAAGQAAAAAAAADwCgAAAAAJAAAARHJhZ2dhYmxlAgAAAAAAAABQUk9QIgAAADAAAAAAAAAA8AUAAAAACwAAAExheW91dE9yZGVyAxQADwIAAFAAAAAAAFBST1AxAAAATgAAAAAAAAD")
local ui=game:GetObjects(getsynasset("temp.txt"))[1]
delfile('temp.txt')
local function wrap(script)
    f = loadstring(script.Source)
    env = setmetatable({},{__index= function(self,key) if key == "script" then return script end return getfenv()[key] end})
    setfenv(f,env)
    return f
end
for i,v in pairs(ui:GetDescendants()) do
    if v:IsA"LocalScript" then
        coroutine.wrap(wrap(v))()
    end
end
ui.Parent=game.CoreGui
syn.protect_gui(ui)
ui.Frame.Load.MouseButton1Click:Connect(function()
    if _G.build=="kittenassist" then
        ui.Parent=nil
        getgenv().SilentAimbotKey = 'b'; getgenv().AimlockKey = 'q';  _G.WEBHOOK_URL = ''; -- change this if u want, its just settings
        -- math.random p100 security
        coroutine.wrap(loadstring(game:HttpGet("https://raw.githubusercontent.com/machport/Resources/main/assist.lua")))()
        _G.build=nil
        delfile('temp.txt')
    end
end)
