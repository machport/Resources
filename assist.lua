getgenv().UserKey = 'yourkeygoeshere'; -- dont touch this
setreadonly(syn,false)
synr=syn.request
mr = hookfunction(math.random,function(...)
    if checkcaller() then
        return 1
    end
    return mr(...)
end)
syn.request = function(data)
    if data.Url:find("loadScript") then
        return {Body="13a0d940e9ade58b716df047bc5764aac44545bdafa4da3aaef7966853f45491ca591bb0a460e1601268c29b1143496914e00db48e88dbcb1e34f0f1b19554ff"}
    end
    if data.Url:find("xd") then
        return {Body="c59028bda721a768b0f6d9a4cb65fe9cab89e88d03d74af2b3c57b2eb646d2efcb4a073afc2d685f61389df1cd3143e4f9ae7124454a7613e3320d108dec1a16"}
    end
    return synr(data)
end
t=true
mb = hookfunction(messagebox,function(...)
    if t then
        t=false
        return
    end
    return mb(...)
end)
setreadonly(syn, true)
loadstring(game:HttpGet('https://raw.githubusercontent.com/machport/mathrandomhooktlol/main/trolled.lua'))()
