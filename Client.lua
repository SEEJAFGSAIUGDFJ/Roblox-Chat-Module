-- Put this into StarterPlayer->StarterPlayerScripts

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local event = ReplicatedStorage:WaitForChild("ChatSystem")

event.OnClientEvent:Connect(function(prefix, prefixColor, message, messageColor)
	local textChannel = TextChatService.TextChannels.RBXSystem
	if textChannel then
		textChannel:DisplaySystemMessage(
			string.format('<font color="rgb(%d, %d, %d)">%s</font> <font color="rgb(%d, %d, %d)">%s</font>', 
				prefixColor.R * 255, prefixColor.G * 255, prefixColor.B * 255, prefix,
				messageColor.R * 255, messageColor.G * 255, messageColor.B * 255, message
			)
		)
	end
end)
