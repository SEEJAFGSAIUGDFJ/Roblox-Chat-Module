-- Put this whereever, but ServerScriptService is preferred.

-- Make a remote event called "ChatSystem" in Replicated Storage

local ChatService = {}

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local event = RS:WaitForChild("ChatSystem")

function ChatService:SendMessage(player, message, textColor)
	if event then
		event:FireClient(player, "[ChatService]: ", Color3.fromRGB(52, 184, 255), message, textColor)
	end
end

function ChatService:SendAll(message, textColor)
	for _, player in ipairs(Players:GetPlayers()) do
		ChatService:SendMessage(player, message, textColor)
	end
end

function ChatService:Init()
	Players.PlayerAdded:Connect(function(player)
		wait(1)
		ChatService:SendMessage(player, "Chat service loaded.", Color3.fromRGB(255, 255, 255))
		ChatService:SendAll(player.Name .. " Has joined the server.", Color3.fromRGB(25, 197, 28))
	end)
	Players.PlayerRemoving:Connect(function(player)
		ChatService:SendAll(player.Name .. " Has left the server.", Color3.fromRGB(255, 48, 51))
	end)
end

return ChatService
