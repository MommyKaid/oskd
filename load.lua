-- [[ Script By Fiji ]] 
-- [[Edit by Naavi ]] 


local library = loadstring(game:HttpGet("https://pastebin.com/raw/FkVcazx4"))()

local window = library:AddWindow('Feather Anarchy')

local mt = getrawmetatable(game)
local oldindex = mt.__index

local bypass = true
if bypass == true then
	local oldWS = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed

	local oldJP = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower

	setreadonly(mt, false)

	mt.__index = newcclosure(function(self, method)

		if method == 'WalkSpeed' then
			return tonumber(oldWS)
		end

		if method == 'JumpPower' then
			return tonumber(oldJP)
		end

		return oldindex(self, method)

	end)

	setreadonly(mt, true)
end



local tab1 = window:AddTab("Aiming")
local tab2 = window:AddTab("Visuals")
local tab3 = window:AddTab("Player")
local tab4 = window:AddTab("Miscellaneous")
local tab5 = window:AddTab("Credits")
tab4:AddLabel("Heres some Miscellaneous options for you!")
tab5:AddLabel("Coming soon!")
tab4:AddLabel("Other:")

tab4:AddButton("Reset",function(value)
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)















local a = tab1:AddLabel("Made by Fiji")
local dropdown = tab1:AddDropdown("Aimbot Hit Part",function(selected)
	selectedpart = selected
end)

dropdown:Add("HumanoidRootPart")
dropdown:Add("Head")

local slider = tab1:AddSlider("FOV", function(slide)
	fov = slide
end, {
	["min"] = 10,
	["max"] = 1000,
})

tab1:AddSwitch("FOV Circle",function(value)
	circle = value
	local Line = Drawing.new("Circle")
	while circle do wait()
		Line.Color = Color3.fromRGB(255,0,0)
		Line.Visible = true
		Line.Radius = fov
		Line.Thickness = 1
		Line.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
	end
	if circle == false then
		Line.Visible = not Line.Visible
	end
end)

tab1:AddSwitch("Aimbot [ Smoothing ]",function(value)

    aimbotpenis = value
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local mouse = LocalPlayer:GetMouse()
	local Camera = workspace.CurrentCamera
	local Debris = game:GetService("Debris")
	local UserInputService = game:GetService("UserInputService")
	local target = false
	local RunService = game:GetService("RunService")

	local features = {
		silentaim = aimbotpenis;
		fov = fov;
	}
	aimbotpenis = value
	function getnearest()
		local nearestmagnitude = math.huge
		local nearestenemy = nil
		local vector = nil
        wait(.05)
		for i,v in next, game.Players:GetChildren() do
			if v ~= Players.LocalPlayer then
				if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
					local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
					if onScreen then
						local ray = Ray.new(
							Camera.CFrame.p,
							(v.Character["HumanoidRootPart"].Position-Camera.CFrame.p).unit*500
						)
						local ignore = {
							LocalPlayer.Character,
						}
						local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
						if hit and hit:FindFirstAncestorOfClass("Model") and Players:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
							local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
							if magnitude < nearestmagnitude and magnitude <= features["fov"] then
								nearestenemy = v
								nearestmagnitude = magnitude
							end
						end
					end
				end
			end
		end
		return nearestenemy
	end
end)

local aiming = false
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(penis)
	if penis.UserInputType == Enum.UserInputType.MouseButton2 then
		aiming = true
	end
end)
uis.InputEnded:Connect(function(key)
	if key.UserInputType == Enum.UserInputType.MouseButton2 then
		aiming = false
	end
end)



game:GetService("RunService").RenderStepped:Connect(function()
	if aiming and aimbotpenis == true then
		workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,getnearest().Character[selectedpart].Position)
	end
end)

tab1:AddSwitch("Aimbot [ Normal ]",function(value)
	
    aimbotpenis = value
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local mouse = LocalPlayer:GetMouse()
	local Camera = workspace.CurrentCamera
	local Debris = game:GetService("Debris")
	local UserInputService = game:GetService("UserInputService")
	local target = false
	local RunService = game:GetService("RunService")

	local features = {
		silentaim = aimbotpenis;
		fov = fov;
	}
	aimbotpenis = value
	function getnearest()
		local nearestmagnitude = math.huge
		local nearestenemy = nil
		local vector = nil
		for i,v in next, game.Players:GetChildren() do
			if v ~= Players.LocalPlayer then
				if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
					local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
					if onScreen then
						local ray = Ray.new(
							Camera.CFrame.p,
							(v.Character["HumanoidRootPart"].Position-Camera.CFrame.p).unit*500
						)
						local ignore = {
							LocalPlayer.Character,
						}
						local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
						if hit and hit:FindFirstAncestorOfClass("Model") and Players:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
							local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
							if magnitude < nearestmagnitude and magnitude <= features["fov"] then
								nearestenemy = v
								nearestmagnitude = magnitude
							end
						end
					end
				end
			end
		end
		return nearestenemy
	end
end)

local aiming = false
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(penis)
	if penis.UserInputType == Enum.UserInputType.MouseButton2 then
		aiming = true
	end
end)
uis.InputEnded:Connect(function(key)
	if key.UserInputType == Enum.UserInputType.MouseButton2 then
		aiming = false
	end
end)



game:GetService("RunService").RenderStepped:Connect(function()
	if aiming and aimbotpenis == true then
		workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,getnearest().Character[selectedpart].Position)
	end
end)
tab2:AddSwitch("ESP",function(value)
	esptog = value
	local ESP = loadstring(game:HttpGet("https://pastebin.com/raw/KD1DLrjR"))()
	while wait() do
		if esptog  == true then
			ESP:Toggle(true)
		else
			ESP:Toggle(false)
		end
	end
end)


tab2:AddSwitch("Crosshair",function(value)
	corss = value
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local Camera = workspace.CurrentCamera

	local Typing = false

	local ViewportSize_ = Camera.ViewportSize / 2
	local Axis_X, Axis_Y = ViewportSize_.X, ViewportSize_.Y

	local HorizontalLine = Drawing.new("Line")
	local VerticalLine = Drawing.new("Line")

	_G.ToMouse = false   -- If set to true then the crosshair will be positioned to your mouse cursor's position. If set to false it will be positioned to the center of your screen.

	_G.CrosshairVisible = true   -- If set to true then the crosshair would be visible and vice versa.
	_G.CrosshairSize = 20   -- The size of the crosshair.
	_G.CrosshairThickness = 1   -- The thickness of the crosshair.
	_G.CrosshairColor = Color3.fromRGB(255,0,0)   -- The color of the crosshair
	_G.CrosshairTransparency = 1   -- The transparency of the crosshair.

	RunService.RenderStepped:Connect(function()
		local Real_Size = _G.CrosshairSize / 2

		HorizontalLine.Color = _G.CrosshairColor
		HorizontalLine.Thickness = _G.CrosshairThickness
		HorizontalLine.Visible = _G.CrosshairVisible
		HorizontalLine.Transparency = _G.CrosshairTransparency

		VerticalLine.Color = _G.CrosshairColor
		VerticalLine.Thickness = _G.CrosshairThickness
		VerticalLine.Visible = _G.CrosshairVisible
		VerticalLine.Transparency = _G.CrosshairTransparency

		if _G.ToMouse == true then
			HorizontalLine.From = Vector2.new(UserInputService:GetMouseLocation().X - Real_Size, UserInputService:GetMouseLocation().Y)
			HorizontalLine.To = Vector2.new(UserInputService:GetMouseLocation().X + Real_Size, UserInputService:GetMouseLocation().Y)

			VerticalLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y - Real_Size)
			VerticalLine.To = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y + Real_Size)
		elseif _G.ToMouse == false then
			HorizontalLine.From = Vector2.new(Axis_X - Real_Size, Axis_Y)
			HorizontalLine.To = Vector2.new(Axis_X + Real_Size, Axis_Y)

			VerticalLine.From = Vector2.new(Axis_X, Axis_Y - Real_Size)
			VerticalLine.To = Vector2.new(Axis_X, Axis_Y + Real_Size)
		end
	end)


	if corss == false then
		_G.CrosshairVisible = false
	end
end)

tab3:AddTextBox("WalkSpeed",function(value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)


tab3:AddTextBox("JumpPower",function(value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)

tab3:AddSwitch("Inf Jump",function(value)
	tog = value
	while true do wait()
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if tog == true then
				game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	end
end)
