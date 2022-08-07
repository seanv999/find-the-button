Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer
camera = workspace.CurrentCamera
runservice = game:GetService("RunService")
canClick = true
function esp(drop)
	canClick = false

	currentMap = game:GetService("Players").localPlayer.leaderstats.Mode.value .. "Mode"

	currentLevel = "Room".. game:GetService("Players").localPlayer.leaderstats.Room.value
	button =  game:GetService("Workspace").Modes[currentMap][currentLevel]["Door/Button"].Button

	BUTTON = Drawing.new("Text")
	BUTTON.Visible = true
	
	BUTTON.Center = true
	BUTTON.Outline = true
	BUTTON.Font = 4
	BUTTON.Color = Color3.fromRGB(255,255,0)
	BUTTON.Size = 25
	BUTTON.Text = "UGHHH"

	renderstepped = runservice.RenderStepped:Connect(function()
		
		drop_pos = camera:WorldToViewportPoint(button.Position)
		BUTTON.Position = Vector2.new(drop_pos.X, drop_pos.Y)
	end)
	wait(5)
	BUTTON:Destroy()
	canClick = true

	

end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Find The Button    Sean, Kevin", "BloodTheme")
local Tab = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")
local Section = Tab:NewSection("Cheats")

Section:NewButton("Show Button", "Shows Button", function()
    if canClick then
		esp(button)
	end
end)

Section:NewButton("Teleport To Button", "Teleports Player To Button", function()
    currentMap = game:GetService("Players").localPlayer.leaderstats.Mode.value .. "Mode"

	currentLevel = "Room".. game:GetService("Players").localPlayer.leaderstats.Room.value
	button = game:GetService("Workspace").Modes[currentMap][currentLevel]["Door/Button"].Button
	game.Players.LocalPlayer.Character:MoveTo(button.Position)
	
end)
