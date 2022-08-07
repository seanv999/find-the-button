canClick = true
Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer
camera = workspace.CurrentCamera
runservice = game:GetService("RunService")
tracers = false
Esp = false
function initESP()

	boxEsp = Drawing.new("Square")
	boxEsp.Color = Color3.fromRGB(255,255,0)
	boxEsp.Visible = true
	boxEsp.Size = Vector2.new(60,50)

	BUTTON = Drawing.new("Text")
	BUTTON.Visible = true
	BUTTON.Center = true
	BUTTON.Outline = false
	BUTTON.Font = 7
	BUTTON.Color = Color3.fromRGB(0,0,0)
	BUTTON.Size = 25
	BUTTON.Text = "Button"
	--tracers
	local line = Drawing.new("Line")
	line.Visible = true
	line.Color = Color3.fromRGB(255,255,255)
	line.Thickness = 8
	line.Transparency = 1


	

	renderstepped = runservice.RenderStepped:Connect(function()
		--Check for button every frame
		
		boxEsp.Visible = false
		line.Visible = false
		BUTTON.Visible = false

		currentMap = game:GetService("Players").localPlayer.leaderstats.Mode.value .. "Mode"
		currentLevel = "Room".. game:GetService("Players").localPlayer.leaderstats.Room.value
		button = game:GetService("Workspace").Modes[currentMap][currentLevel]["Door/Button"].Button
	

		if(Esp) then
			boxEsp.Visible = true
			BUTTON.Visible = true
		end

		if(tracers) then
			line.Visible = true
		end


		drop_pos = camera:WorldToViewportPoint(button.Position)
		
		BUTTON.Position = Vector2.new(drop_pos.X+30, drop_pos.Y+10)
		char = camera:WorldToViewportPoint(LocalPlayer.Character.HumanoidRootPart.Position)
		line.From = Vector2.new(drop_pos.X,drop_pos.Y)
		line.To = Vector2.new(char.X,char.Y)
		boxEsp.Position = Vector2.new(drop_pos.X, drop_pos.Y)
	end)
end

initESP()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Find The Button                     Seanv999 Deathskull93937", "BloodTheme")
local Tab = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")
local Tab3 = Window:NewTab("Credit")
local Section = Tab:NewSection("Cheats")
local section2 = Tab2:NewSection("Basic")
local creditSection = Tab3:NewSection("s3an999 On Instagram")
local creditSection2 = Tab3:NewSection("kevinnnnndowdy On Instagram")



Section:NewButton("Teleport To Button", "Teleports Player To Button", function()
    currentMap = game:GetService("Players").localPlayer.leaderstats.Mode.value .. "Mode"
	--Map fixes
	if currentMap == 'SpringMode' then
		print('Fixed')
		currentMap = 'SweetSpringMode'
	end
	currentLevel = "Room".. game:GetService("Players").localPlayer.leaderstats.Room.value
	button = game:GetService("Workspace").Modes[currentMap][currentLevel]["Door/Button"].Button
	game.Players.LocalPlayer.Character:MoveTo(button.Position)
	
end)

section2:NewSlider("Walk Speed", "Change walk speed", 500, 0, function(s)
    LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

section2:NewToggle("Infinite Jump", "Jump Infinitly", function(state)
    if state then
        print("Toggle On")
		IJ = true
    else
        print("Toggle Off")
		IJ = false
    end
	
end)


Section:NewToggle("Box ESP", "Jump Infinitly", function(state)
    if state then
        print("Toggle On")
		Esp = true
		print(Esp)
    else
        print("Toggle Off")
		Esp = false
    end
	
end)

Section:NewToggle("Tracers", "Jump Infinitly", function(state)
    if state then
        print("Toggle On")
		tracers = true
    else
        print("Toggle Off")
		tracers = false
		line:Destroy()
    end
	
end)




game:GetService("UserInputService").JumpRequest:connect(function()
	if IJ then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if noclip then
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)


