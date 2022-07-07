-- quickly find users in your game because why the fuck not?!
-- enjoy <3

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local finder = Instance.new("Frame")
local find = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")
local username = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local stop = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local stop_btn = Instance.new("ImageButton")
local UICorner_5 = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")

--Properties:

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(1, 1)
Frame.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(1, -10, 1, -10)
Frame.Size = UDim2.new(0, 200, 0, 35)

UICorner.CornerRadius = UDim.new(0.300000012, 0)
UICorner.Parent = Frame

finder.Name = "finder"
finder.Parent = Frame
finder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
finder.BackgroundTransparency = 1.000
finder.Size = UDim2.new(1, 0, 1, 0)

find.Name = "find"
find.Parent = finder
find.AnchorPoint = Vector2.new(1, 0.5)
find.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
find.BorderColor3 = Color3.fromRGB(27, 42, 53)
find.Position = UDim2.new(1, 0, 0.5, 0)
find.Size = UDim2.new(0.150000006, 0, 0.150000006, 0)
find.SizeConstraint = Enum.SizeConstraint.RelativeXX
find.Image = "http://www.roblox.com/asset/?id=6034684937"
find.ScaleType = Enum.ScaleType.Fit
find.SliceCenter = Rect.new(0.100000001, 0, 0.100000001, 0)

UICorner_2.CornerRadius = UDim.new(0.300000012, 0)
UICorner_2.Parent = find

username.Name = "username"
username.Parent = finder
username.Active = false
username.AnchorPoint = Vector2.new(0, 0.5)
username.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
username.Position = UDim2.new(0, 0, 0.5, 0)
username.Size = UDim2.new(0.800000012, 0, 0.75, 0)
username.Font = Enum.Font.Gotham
username.PlaceholderText = "username"
username.Text = ""
username.TextColor3 = Color3.fromRGB(255, 255, 255)
username.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0.300000012, 0)
UICorner_3.Parent = username

UIPadding.Parent = finder
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)

stop.Name = "stop"
stop.Parent = Frame
stop.Active = true
stop.AnchorPoint = Vector2.new(1, 0.5)
stop.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
stop.BorderColor3 = Color3.fromRGB(27, 42, 53)
stop.Position = UDim2.new(0, -5, 0.5, 0)
stop.Selectable = true
stop.Size = UDim2.new(1, 0, 1, 0)
stop.SizeConstraint = Enum.SizeConstraint.RelativeYY

UICorner_4.CornerRadius = UDim.new(0.300000012, 0)
UICorner_4.Parent = stop

stop_btn.Name = "stop_btn"
stop_btn.Parent = stop
stop_btn.AnchorPoint = Vector2.new(0.5, 0.5)
stop_btn.BackgroundColor3 = Color3.fromRGB(200, 19, 19)
stop_btn.BorderColor3 = Color3.fromRGB(27, 42, 53)
stop_btn.Position = UDim2.new(0.5, 0, 0.5, 0)
stop_btn.Size = UDim2.new(1, 0, 1, 0)
stop_btn.SizeConstraint = Enum.SizeConstraint.RelativeXX
stop_btn.Image = "http://www.roblox.com/asset/?id=6031094678"
stop_btn.ScaleType = Enum.ScaleType.Fit
stop_btn.SliceCenter = Rect.new(0.100000001, 0, 0.100000001, 0)

UICorner_5.CornerRadius = UDim.new(0.300000012, 0)
UICorner_5.Parent = stop_btn

UIPadding_2.Parent = stop
UIPadding_2.PaddingLeft = UDim.new(0, 5)
UIPadding_2.PaddingRight = UDim.new(0, 5)

-- main:
local highlightFolders = {}

local function returnPlayer(username)
	for _, player in pairs(game.Players:GetPlayers()) do
		local character = player.Character
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		
		if player.Name:lower():find(username:lower()) or humanoid.DisplayName:lower():find(username:lower()) then
			return player
		end
	end
end

local function createESP(player)
	local character = player.Character
	
	if character:IsDescendantOf(workspace) and not character:FindFirstChild("playerHighlight") then
		local playerFolder = Instance.new("Folder", character)
		playerFolder.Name = "playerHighlight"
		table.insert(highlightFolders, playerFolder)
		
		for _, part in pairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				local highlight = Instance.new("Highlight", playerFolder)
				highlight.Adornee = part
				highlight.OutlineTransparency = 1
				
				local bb = Instance.new("BillboardGui")
				bb.Adornee = character.HumanoidRootPart
				bb.ExtentsOffsetWorldSpace = Vector3.new(0, 0.5, 0)
				bb.StudsOffset = Vector3.new(0, 1, 0)
				bb.StudsOffsetWorldSpace = Vector3.new(0, 1, 0)
				bb.AlwaysOnTop = true
				bb.Size = UDim2.new(0, 5, 0, 5)
				bb.StudsOffset = Vector3.new(0, 0, 0)
				bb.Name = "hi_there_"..player.Name
				bb.Parent = playerFolder

				local frame = Instance.new("Frame", bb)
				frame.ZIndex = 10
				frame.BackgroundTransparency = 1
				frame.Size = UDim2.new(1, 0, 1, 0)

				local name = Instance.new("TextLabel", frame)
				name.ZIndex = 10
				name.Text = player.Name
				name.BackgroundTransparency = 1
				name.Position = UDim2.new(0, 0, 0, -45)
				name.Size = UDim2.new(1, 0, 10, 0)
				name.TextColor3 = Color3.fromRGB(255, 255, 255)
				name.Font = Enum.Font.Gotham
				name.TextSize = 13
				name.TextStrokeTransparency = 1
			end
		end
	end
end

find.MouseButton1Up:Connect(function()
	local target = returnPlayer(username.Text)
	
	if target then
		username.Text = ""
		createESP(target)
	end
	
	if not stop.Visible then
		stop.Visible = true
	end
end)

stop_btn.MouseButton1Up:Connect(function()
	for _, folder in pairs(highlightFolders) do
		folder:Destroy()
	end
	
	stop.Visible = false
	highlightFolders = {}
end)
