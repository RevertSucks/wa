print(_G.webhook)
print(_G.id)
local http = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local PlayerService = game:GetService("Players")
local plr = PlayerService.LocalPlayer
local gameid = game.JobId
local date = game:GetService("HttpService"):JSONEncode(os.date("*t"))
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Size = UDim2.new(0, 534, 0, 54)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
local function FTDPC_fake_script() -- TextLabel.LocalScript 
	local script = Instance.new('LocalScript', TextLabel)

	local PlayerService = game:GetService("Players")
	local plr = PlayerService.LocalPlayer
	local parent = script.Parent
	
	while wait() do
		parent.Text = tostring(plr.Character.HumanoidRootPart.Position)
	end
end
coroutine.wrap(FTDPC_fake_script)()


local newmsg = game:GetService("HttpService"):JSONEncode({
    ["content"] = "New Player Connected!\nChecking for fruits...",
    ["username"] = plr.Name,
    ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
})
syn.request({
    Url = _G.webhook,
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = newmsg,
})
print([["void"]])

wait(0.05)

for Index, Fruit in pairs(Workspace:GetChildren()) do
    if string.find(Fruit.Name, "Fruit") then
        local foundfirst = game:GetService("HttpService"):JSONEncode({
            ["content"] = "<@".._G.id..">",
            ["embeds"] = {
                {
                  ["title"] = "Fruit Found!",
                  ["fields"] = {
                    {
                      ["name"] = Fruit.Name,
                      ["value"] = "!!!",
                      ["inline"] = false
                    },
                    {
                        ["name"] = "Position",
                        ["value"] = tostring(Fruit.Handle.Position),
                        ["inline"] = false
                    },
                    {
                      ["name"] = "Job ID",
                      ["value"] = gameid,
                      ["inline"] = false
                  },
                  {
                    ["name"] = "Time",
                    ["value"] = date,
                    ["inline"] = false
                },
                  },
                  ["footer"] = {
                    ["text"] = "Exxen",
                    ["icon_url"] = "https://cdn.discordapp.com/avatars/396868660267843584/aff772021b0c73d1d3e67a063f450a38.png?size=4096"
                  }
                }
              },
              ["username"] = plr.Name,
              ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
        })
        syn.request({
            Url = _G.webhookwebhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = foundfirst,
        })
        print([["void"]])
    end
end
Workspace.ChildAdded:Connect(function(Fruit)
if string.find(Fruit.Name, "Fruit") then
        local foundsecond = game:GetService("HttpService"):JSONEncode({
            ["content"] = "<@".._G.id..">",
            ["embeds"] = {
                {
                  ["title"] = "New Fruit Spawned!",
                  ["fields"] = {
                    {
                      ["name"] = Fruit.Name,
                      ["value"] = "Player Connected: "..plr.Name,
                      ["inline"] = false
                    },
                    {
                        ["name"] = "Position",
                        ["value"] = tostring(Fruit.Handle.Position),
                        ["inline"] = false
                    },
                    {
                      ["name"] = "Job ID",
                      ["value"] = gameid,
                      ["inline"] = false
                  },
                  {
                    ["name"] = "Time",
                    ["value"] = date,
                    ["inline"] = false
                },
                  },
                  ["footer"] = {
                    ["text"] = "Exxen",
                    ["icon_url"] = "https://cdn.discordapp.com/avatars/396868660267843584/aff772021b0c73d1d3e67a063f450a38.png?size=4096"
                  },
                  ["username"] = plr.Name,
                  ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
                }
              }
        })
        syn.request({
            Url = _G.webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = foundsecond,
        })
        print([["void"]])
    end
end)
Workspace.ChildRemoved:Connect(function(Fruit)
    if string.find(Fruit.Name, "Fruit") then
        local lostfruit = game:GetService("HttpService"):JSONEncode({
            ["content"] = "<@".._G.id..">",
            ["embeds"] = {
                {
                  ["title"] = "Someone Found a Fruit",
                  ["fields"] = {
                    {
                      ["name"] = Fruit.Name,
                      ["value"] = "Player Connected: "..plr.Name,
                      ["inline"] = false
                    },
                    {
                      ["name"] = "Job ID",
                      ["value"] = gameid,
                      ["inline"] = false
                  },
                  {
                    ["name"] = "Time",
                    ["value"] = date,
                    ["inline"] = false
                },
                  },
                  ["footer"] = {
                    ["text"] = "Exxen",
                    ["icon_url"] = "https://cdn.discordapp.com/avatars/396868660267843584/aff772021b0c73d1d3e67a063f450a38.png?size=4096"
                  },
                  ["username"] = plr.Name,
                  ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
                }
              }
        })
        syn.request({
            Url = _G.webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = lostfruit,
        })
        print([["void"]])
    end
end)

local newms2g = game:GetService("HttpService"):JSONEncode({
    ["content"] = "Finished!",
    ["username"] = plr.Name,
    ["avatar_url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..plr.Name
})
syn.request({
    Url = _G.webhook,
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = newms2g,
})
print([["void"]])
