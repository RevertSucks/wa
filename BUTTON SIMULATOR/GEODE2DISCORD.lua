local useridtomention = ""
local webhook = ""
local plr = game.Players.LocalPlayer

local newmsg = game:GetService("HttpService"):JSONEncode({
    ["content"] = "New Player Connected!\nWaiting for found messages...",
    ["username"] = plr.Name,
    ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
})
syn.request({
    Url = webhook,
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = newmsg,
})

game:GetService("ReplicatedStorage").GameRemotes.SendMessage.OnClientEvent:Connect(function(...)
    local args = ...
    local text = args["Text"]
    if string.find(text,"GEODE BUTTON") then
        local foundmsg = game:GetService("HttpService"):JSONEncode({
            ["content"] = "<@"..useridtomention.."> "..text,
            ["username"] = plr.Name,
            ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
        })
        syn.request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = foundmsg,
        })
    end
end)
