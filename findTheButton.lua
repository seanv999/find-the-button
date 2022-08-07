

function esp(drop)
	Players = game:GetService("Players")

	LocalPlayer = Players.LocalPlayer

	currentMap = game:GetService("Players").localPlayer.leaderstats.Mode.value .. "Mode"

	currentLevel = "Room".. game:GetService("Players").localPlayer.leaderstats.Room.value


	camera = workspace.CurrentCamera

	runservice = game:GetService("RunService")
	button =  game:GetService("Workspace").Modes[currentMap][currentLevel]["Door/Button"].Button
	BUTTON = Drawing.new("Text")
	BUTTON.Visible = true
	BUTTON.Center = true
	BUTTON.Outline = true
	BUTTON.Font = 4
	BUTTON.Color = Color3.fromRGB(255,255,0)
	BUTTON.Size = 25

	renderstepped = runservice.RenderStepped:Connect(function()
		
		drop_pos = camera:WorldToViewportPoint(button.Position)
		BUTTON.Position = Vector2.new(drop_pos.X, drop_pos.Y)
		BUTTON.Text = "UGHHH"
		
	end)

	wait(5)
	BUTTON.Visible = false

end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Find The Button    Sean, Kevin", "DarkTheme")
local Tab = Window:NewTab("Main")

local Section = Tab:NewSection("Cheats")

Section:NewButton("Show Button", "Shows Button", function()
    esp(button)
end)
