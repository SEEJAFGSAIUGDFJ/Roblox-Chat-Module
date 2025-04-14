-- make this a child of ChatModule

local module = require(script.Parent)
module:Init()
wait(1) -- wait for studio to load charater yk
module:SendAll("Test message", Color3.fromRGB(255, 255, 255))