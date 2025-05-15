---- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")

-- Gắn vào Player
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MyMenu"

-- Thiết lập Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.BorderSizePixel = 0

-- Thiết lập nút Close
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 20

-- Khi nhấn nút X
CloseButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

-- Biến lưu tốc độ hiện tại
local speed = 16 -- tốc độ mặc định của nhân vật

-- Nút +1
local PlusButton = Instance.new("TextButton")
PlusButton.Name = "PlusButton"
PlusButton.Parent = MainFrame
PlusButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
PlusButton.Position = UDim2.new(0, 10, 1, -40)
PlusButton.Size = UDim2.new(0, 60, 0, 30)
PlusButton.Text = "+1"
PlusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusButton.Font = Enum.Font.SourceSansBold
PlusButton.TextSize = 18

-- Nút -1
local MinusButton = Instance.new("TextButton")
MinusButton.Name = "MinusButton"
MinusButton.Parent = MainFrame
MinusButton.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
MinusButton.Position = UDim2.new(1, -70, 1, -40)
MinusButton.Size = UDim2.new(0, 60, 0, 30)
MinusButton.Text = "-1"
MinusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusButton.Font = Enum.Font.SourceSansBold
MinusButton.TextSize = 18

-- Biến tốc độ ban đầu
local speed = 16

-- Label hiển thị tốc độ
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, -38, 0, 5)
SpeedLabel.Size = UDim2.new(0, 150, 0, 25)
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.SourceSansBold
SpeedLabel.TextSize = 15
SpeedLabel.Text = "Tốc độ: " .. speed

-- Hàm cập nhật tốc độ và Label
local function updateSpeed()
	local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = speed
	end
	SpeedLabel.Text = "Tốc độ: " .. math.floor(speed)
end

-- Sự kiện nút +1
PlusButton.MouseButton1Click:Connect(function()
	speed *= 2
	updateSpeed()
	print("Tăng tốc độ lên: " .. speed)
end)

-- Sự kiện nút -1
MinusButton.MouseButton1Click:Connect(function()
	speed /= 2
	updateSpeed()
	print("Giảm tốc độ xuống: " .. speed)
end)

local RunService = game:GetService("RunService")

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Name = "FPSLabel"
FPSLabel.Parent = MainFrame
FPSLabel.BackgroundTransparency = 1
FPSLabel.Position = UDim2.new(0, -45, 1, -180)
FPSLabel.Size = UDim2.new(0, 150, 0, 25)
FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSLabel.Font = Enum.Font.SourceSansBold
FPSLabel.TextSize = 15
FPSLabel.Text = "FPS: 0"

-- Biến đếm FPS
local frames = 0
local lastUpdate = tick()

-- Đếm frame mỗi khi render
RunService.RenderStepped:Connect(function()
	frames += 1
	local now = tick()
	if now - lastUpdate >= 1 then
		FPSLabel.Text = "FPS: " .. frames
		frames = 0
		lastUpdate = now
	end
end)

-- Tạo nút O để ẩn/hiện menu
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui -- hoặc GUI chính của anh
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Position = UDim2.new(1, -45, 0, 10) -- Góc phải trên cùng
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Text = "O"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 15
ToggleButton.BorderSizePixel = 0
ToggleButton.BackgroundTransparency = 0.2

-- Biến trạng thái ẩn/hiện
local isVisible = true

-- Sự kiện bấm nút O
ToggleButton.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	MainFrame.Visible = isVisible
end)

local Players = game:GetService("Players")

-- Label hiển thị số người chơi
local PlayerCountLabel = Instance.new("TextLabel")
PlayerCountLabel.Name = "PlayerCountLabel"
PlayerCountLabel.Parent = MainFrame
PlayerCountLabel.BackgroundTransparency = 1
PlayerCountLabel.Position = UDim2.new(0, -52, 0, 35) -- Góc trên bên trái menu
PlayerCountLabel.Size = UDim2.new(0, 200, 0, 25)
PlayerCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerCountLabel.Font = Enum.Font.SourceSansBold
PlayerCountLabel.TextSize = 15
PlayerCountLabel.Text = "Người chơi: 0"

-- Cập nhật liên tục
local function updatePlayerCount()
	while true do
		PlayerCountLabel.Text = "Người chơi: " .. tostring(#Players:GetPlayers())
		wait(1)
	end
end

spawn(updatePlayerCount)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Label hiển thị máu
local HealthLabel = Instance.new("TextLabel")
HealthLabel.Name = "HealthLabel"
HealthLabel.Parent = MainFrame
HealthLabel.BackgroundTransparency = 1
HealthLabel.Position = UDim2.new(0, -60, 0, 50) -- Dưới dòng người chơi
HealthLabel.Size = UDim2.new(0, 200, 0, 25)
HealthLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
HealthLabel.Font = Enum.Font.SourceSansBold
HealthLabel.TextSize = 15
HealthLabel.Text = "Máu: 100%"

-- Cập nhật máu liên tục
RunService.RenderStepped:Connect(function()
	local character = LocalPlayer.Character
	if character and character:FindFirstChild("Humanoid") then
		local humanoid = character:FindFirstChild("Humanoid")
		local health = math.floor((humanoid.Health / humanoid.MaxHealth) * 100)
		HealthLabel.Text = "Máu: " .. health .. "%"
	end
end)

-- Tạo Frame chứa từng chữ
local NameFrame = Instance.new("Frame")
NameFrame.Name = "NameFrame"
NameFrame.Parent = MainFrame
NameFrame.BackgroundTransparency = 1
NameFrame.Position = UDim2.new(0, 100, 0, 160)
NameFrame.Size = UDim2.new(0, 200, 0, 30)

local letters = {
	{char = "V", color = Color3.fromRGB(255, 0, 0)},     -- Đỏ
	{char = "a", color = Color3.fromRGB(255, 128, 0)},   -- Cam
	{char = "n", color = Color3.fromRGB(0, 200, 255)},   -- Xanh dương
	{char = "h", color = Color3.fromRGB(0, 255, 0)},     -- Xanh lá
}

local spacing = 25
for i, letterInfo in ipairs(letters) do
	local label = Instance.new("TextLabel")
	label.Parent = NameFrame
	label.Text = letterInfo.char
	label.TextColor3 = letterInfo.color
	label.Font = Enum.Font.SourceSansBold
	label.TextSize = 24
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(0, 25, 1, 0)
	label.Position = UDim2.new(0, (i - 1) * spacing, 0, 0)
end

----nút fly
local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Parent = MainFrame
FlyButton.Size = UDim2.new(0, 60, 0, 30)
FlyButton.Position = UDim2.new(0, 10, 1, -120) -- Góc dưới trái menu
FlyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Font = Enum.Font.SourceSansBold
FlyButton.TextSize = 18
FlyButton.Text = "Fly"

FlyButton.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)
end)

------infinite
local InfiniteButton = Instance.new("TextButton")
InfiniteButton.Name = "InfiniteButton"
InfiniteButton.Parent = MainFrame
InfiniteButton.Size = UDim2.new(0, 60, 0, 30)
InfiniteButton.Position = UDim2.new(0, 10, 1, -80) -- Đặt cạnh nút Fly
InfiniteButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfiniteButton.TextColor3 = Color3.fromRGB(255, 255, 0)
InfiniteButton.Font = Enum.Font.SourceSansBold
InfiniteButton.TextSize = 18
InfiniteButton.Text = "INFINITE"

InfiniteButton.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end)

----fly jump
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Tạo nút Fly Jump
local FlyJmpButton = Instance.new("TextButton")
FlyJmpButton.Name = "FlyJmpButton"
FlyJmpButton.Parent = MainFrame
FlyJmpButton.Size = UDim2.new(0, 60, 0, 30)
FlyJmpButton.Position = UDim2.new(0, 83, 1, -80)
FlyJmpButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
FlyJmpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyJmpButton.Font = Enum.Font.SourceSansBold
FlyJmpButton.TextSize = 18
FlyJmpButton.Text = "FLY JMP"

local infiniteJumpEnabled = false

FlyJmpButton.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    FlyJmpButton.Text = infiniteJumpEnabled and "FLY JMP ✅" or "FLY JMP ❌"
end)

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled and character and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)


-------aimbot
local AimBotButton = Instance.new("TextButton")
AimBotButton.Name = "AimBotButton"
AimBotButton.Parent = MainFrame
AimBotButton.Size = UDim2.new(0, 60, 0, 30)
AimBotButton.Position = UDim2.new(0, 230, 1, -80) -- Đặt nút bên cạnh RESET
AimBotButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AimBotButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AimBotButton.Font = Enum.Font.SourceSansBold
AimBotButton.TextSize = 18
AimBotButton.Text = "AIMBOT"

AimBotButton.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Equinox-Hub/main/aimbot.lua", true))()
    end)
end)

-- Tạo nút FLFLING trong MainFrame
local FlingButton = Instance.new("TextButton")
FlingButton.Name = "FlingButton"
FlingButton.Parent = MainFrame  -- Thay vì ScreenGui
FlingButton.Size = UDim2.new(0, 60, 0, 30)
FlingButton.Position = UDim2.new(0, 158, 1, -80) -- Điều chỉnh vị trí trong menu
FlingButton.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.Font = Enum.Font.SourceSansBold
FlingButton.TextSize = 18
FlingButton.Text = "FLING"

-- Khi nhấn nút FLFLING
FlingButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'), true))()
end)

-- Tạo label hiển thị
local NearbyLabel = Instance.new("TextLabel")
NearbyLabel.Name = "NearbyPlayersLabel"
NearbyLabel.Parent = MainFrame
NearbyLabel.BackgroundTransparency = 1
NearbyLabel.Position = UDim2.new(0, 50, 0, 4) -- Điều chỉnh vị trí theo menu của bạn
NearbyLabel.Size = UDim2.new(0, 200, 0, 25)
NearbyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NearbyLabel.Font = Enum.Font.SourceSansBold
NearbyLabel.TextSize = 15
NearbyLabel.Text = "Người chơi gần: 0"

-- Hàm kiểm tra khoảng cách
local function IsInRange(targetPos, playerPos)
    return (targetPos - playerPos).Magnitude <= 100 -- 100 studs = 100m trong Roblox
end

-- Cập nhật liên tục
game:GetService("RunService").Heartbeat:Connect(function()
    local localPlayer = game.Players.LocalPlayer
    if not localPlayer.Character then return end
    
    local localRoot = localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not localRoot then return end
    
    local count = 0
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot and IsInRange(targetRoot.Position, localRoot.Position) then
                count += 1
            end
        end
    end
    
    NearbyLabel.Text = "Người gần (100m): " .. count
end)

local Http = game:GetService("HttpService")
local Players = game:GetService("Players")


-- Tạo nút trong MainFrame
local RenzButton = Instance.new("TextButton")
RenzButton.Name = "RenzXW_Lock"
RenzButton.Parent = MainFrame
RenzButton.Size = UDim2.new(0, 60, 0, 30)
RenzButton.Position = UDim2.new(0, 83, 1, -120) -- Vị trí trên nút NOCLIP
RenzButton.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
RenzButton.TextColor3 = Color3.new(1, 1, 1)
RenzButton.Font = Enum.Font.SourceSansBold
RenzButton.TextSize = 18
RenzButton.Text = "LOCK ON"

-- Thêm chức năng khi nhấn
RenzButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/RENZXW/RENZXW-SCRIPTS/main/RenzXW-Lock.txt'))()
    end)
    
    if success then
        RenzButton.Text = "✅ LOCKED"
    else
        RenzButton.Text = "❌ LỖI"
        warn("Lỗi khi tải script: "..err)
    end
    wait(1)
    RenzButton.Text = "LOCK ON"
end)

-- Tạo nút GHOST trong MainFrame
local GhostButton = Instance.new("TextButton")
GhostButton.Name = "GhostButton"
GhostButton.Parent = MainFrame
GhostButton.Size = UDim2.new(0, 60, 0, 30)
GhostButton.Position = UDim2.new(0, 158, 1, -120) -- Vị trí trên nút TROLL
GhostButton.BackgroundColor3 = Color3.fromRGB(100, 0, 150) -- Màu tím
GhostButton.TextColor3 = Color3.new(1, 1, 1)
GhostButton.Font = Enum.Font.SourceSansBold
GhostButton.TextSize = 18
GhostButton.Text = "GHOST"

-- Thêm chức năng khi click
GhostButton.MouseButton1Click:Connect(function()
    GhostButton.Text = "Đang tải..."
    
    local success, err = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end)
    
    if success then
        GhostButton.Text = "✅ Đã kích hoạt"
    else
        GhostButton.Text = "❌ Lỗi tải script"
        warn("Lỗi GhostHub: "..err)
    end
    
    wait(1)
    GhostButton.Text = "GHOST"
end)

    local isLoading = false
GhostButton.MouseButton1Click:Connect(function()
    if isLoading then return end
    isLoading = true
    
    -- ... code tải script ...
    
    isLoading = false
end)

    GhostButton.MouseButton1Click:Connect(function()
    local dots = 0
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        dots = (dots % 3) + 1
        GhostButton.Text = "Đang tải" .. string.rep(".", dots)
    end)
    
    -- ... code tải script ...
    
    connection:Disconnect()
end)

-- Tạo nút ESP trong MainFrame
local ESPButton = Instance.new("TextButton")
ESPButton.Name = "ESPButton"
ESPButton.Parent = MainFrame
ESPButton.Size = UDim2.new(0, 60, 0, 30)
ESPButton.Position = UDim2.new(0, 230, 1, -120) -- Điều chỉnh vị trí phù hợp
ESPButton.BackgroundColor3 = Color3.fromRGB(0, 150, 200) -- Màu xanh dương
ESPButton.TextColor3 = Color3.new(1, 1, 1)
ESPButton.Font = Enum.Font.SourceSansBold
ESPButton.TextSize = 18
ESPButton.Text = "ESP"

-- Logic kích hoạt ESP
ESPButton.MouseButton1Click:Connect(function()
    ESPButton.Text = "Đang kích hoạt..."
    
    local success, err = pcall(function()
       _G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

--------------------------------------------------------------------
local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(1, 2, 1)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = false
Box.Visible = false

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 15
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

if _G.Reantheajfdfjdgs then
    return
end

_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end
    end
end
    end)
    
    if success then
        ESPButton.Text = "✅ ESP BẬT"
        ESPButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        ESPButton.Text = "❌ LỖI ESP"
        warn("Lỗi ESP: "..err)
        wait(1)
        ESPButton.Text = "ESP"
        ESPButton.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
    end
end)

-- Tạo GUI
local TimeGui = Instance.new("ScreenGui")
local TimeLabel = Instance.new("TextLabel")

TimeGui.Name = "TimeGui"
TimeGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

TimeLabel.Name = "TimeLabel"
TimeLabel.Parent = MainFrame
TimeLabel.AnchorPoint = Vector2.new(0.5, 0)
TimeLabel.Position = UDim2.new(0.5, 12, 0, 14) -- Giữa màn hình phía trên
TimeLabel.Size = UDim2.new(0, 300, 0, 40)
TimeLabel.BackgroundTransparency = 1
TimeLabel.TextColor3 = Color3.new(1, 1, 1) -- Màu trắng
TimeLabel.Font = Enum.Font.SourceSansBold
TimeLabel.TextSize = 15
TimeLabel.Text = "00:00:00"

-- Cập nhật thời gian
local function UpdateTime()
    while true do
        local CurrentTime = os.date("%H:%M:%S - %d/%m/%Y") -- Format: Giờ:Phút:Giây - Ngày/Tháng/Năm
        TimeLabel.Text = "🕒 "..CurrentTime
        wait(1)
    end
end

spawn(UpdateTime)
--nơi viết code mới vào đây -----------------------------
-- Tạo Label nhắc bật SHIFT LOCK
local shiftLockLabel = Instance.new("TextLabel")
shiftLockLabel.Size = UDim2.new(0, 300, 0, 20)
shiftLockLabel.Position = UDim2.new(0, 0, 0, 200)
shiftLockLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
shiftLockLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
shiftLockLabel.Font = Enum.Font.SourceSansItalic
shiftLockLabel.TextSize = 22
shiftLockLabel.Text = "⚠ Bật SHIFT LOCK khi xem map !"
shiftLockLabel.TextWrapped = true
shiftLockLabel.TextStrokeTransparency = 0.4
shiftLockLabel.Parent = MainFrame

-- Radar military style 📡
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RadarGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local RadarFrame = Instance.new("Frame")
RadarFrame.Size = UDim2.new(0, 200, 0, 200)
RadarFrame.Position = UDim2.new(1, -520, 1, -220)
RadarFrame.BackgroundTransparency = 1
RadarFrame.ClipsDescendants = true
RadarFrame.Parent = MainFrame

local RadarCircle = Instance.new("ImageLabel")
RadarCircle.Size = UDim2.new(1, 0, 1, 0)
RadarCircle.BackgroundTransparency = 1
RadarCircle.Image = "rbxassetid://3570695787"
RadarCircle.Parent = RadarFrame


local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextScaled = true
CloseButton.Parent = RadarFrame

-- Chấm radar
local playerDots = {}
local radarRange = 1000
local scale = 90 / radarRange  -- 200x200 frame = 100 radius

-- Mũi tên "^" đại diện cho mình
local CenterArrow = Instance.new("TextLabel")
CenterArrow.Size = UDim2.new(0, 20, 0, 20)
CenterArrow.AnchorPoint = Vector2.new(0.5, 0.5)
CenterArrow.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterArrow.BackgroundTransparency = 1
CenterArrow.Text = "^"
CenterArrow.TextColor3 = Color3.fromRGB(255, 80, 80)
CenterArrow.Font = Enum.Font.GothamBold
CenterArrow.TextScaled = true
CenterArrow.ZIndex = 3
CenterArrow.Parent = RadarFrame


-- Tạo chấm xanh
local function createDot(player)
	if player == LocalPlayer then return end

	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, 6, 0, 6)
	dot.AnchorPoint = Vector2.new(0.5, 0.5)
	dot.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	dot.BorderSizePixel = 0
	dot.ZIndex = 1
	dot.Parent = RadarFrame

	playerDots[player] = dot
end

-- Xoá khi rời
Players.PlayerRemoving:Connect(function(player)
	if playerDots[player] then
		playerDots[player]:Destroy()
		playerDots[player] = nil
	end
end)

-- Thêm người chơi vào radar
for _, p in ipairs(Players:GetPlayers()) do
	createDot(p)
end

Players.PlayerAdded:Connect(createDot)

-- Cập nhật radar
RunService.RenderStepped:Connect(function()
	if not HRP or not HRP.Parent then
		Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		HRP = Character:WaitForChild("HumanoidRootPart")
	end

	local myPos = HRP.Position
	local lookVector = HRP.CFrame.LookVector
	local angle = math.atan2(-lookVector.X, -lookVector.Z)
	local rotation = math.deg(angle)

	-- Xoay radar vòng
	RadarCircle.Rotation = rotation

	for player, dot in pairs(playerDots) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local pos = player.Character.HumanoidRootPart.Position
			local offset = pos - myPos
			local x = offset.X
			local y = offset.Z

			if math.sqrt(x^2 + y^2) <= radarRange then
				-- Xoay vị trí theo góc nhìn
				local rx = x * math.cos(angle) - y * math.sin(angle)
				local ry = x * math.sin(angle) + y * math.cos(angle)

				dot.Position = UDim2.new(0.5, rx * scale, 0.5, ry * scale)
				dot.Visible = true
			else
				dot.Visible = false
			end
		end
	end
end)

-- Tắt radar
CloseButton.MouseButton1Click:Connect(function()
	RadarFrame.Visible = false
end)


--- reojoin
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local placeId = game.PlaceId
local jobId = game.JobId

-- Tạo GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RejoinButtonGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo nút REJOIN
local rejoinButton = Instance.new("TextButton")
rejoinButton.Size = UDim2.new(0, 60, 0, 30)
rejoinButton.Position = UDim2.new(0, 158, 1, -155)
rejoinButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
rejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rejoinButton.Font = Enum.Font.GothamBold
rejoinButton.TextSize = 15
rejoinButton.Text = "REJOIN"
rejoinButton.Parent = MainFrame

-- Tạo label đếm ngược
local countdownLabel = Instance.new("TextLabel")
countdownLabel.Size = UDim2.new(0, 300, 0, 50)
countdownLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
countdownLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
countdownLabel.BackgroundTransparency = 0.4
countdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
countdownLabel.Font = Enum.Font.GothamBold
countdownLabel.TextSize = 32
countdownLabel.Text = ""
countdownLabel.Visible = false
countdownLabel.Parent = screenGui

-- Hàm đếm ngược và rejoin
local function startRejoin()
	rejoinButton.Visible = false
	countdownLabel.Visible = true

	for i = 5, 1, -1 do
		countdownLabel.Text = "Rejoining in " .. i .. "..."
		wait(1)
	end

	countdownLabel.Text = "Rejoining now..."

	-- Rejoin
	pcall(function()
		TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
	end)
end

-- Sự kiện khi nhấn nút
rejoinButton.MouseButton1Click:Connect(startRejoin)



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Tạo GUI
local gui = Instance.new("ScreenGui")
gui.Name = "CoordinateGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Tạo Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 201, 0, 30)
label.Position = UDim2.new(1, -300, 1, -230)
label.AnchorPoint = Vector2.new(0, 1)
label.BackgroundTransparency = 0.3
label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.SourceSansBold
label.TextScaled = true
label.Text = "X: 0 | Y: 0 | Z: 0"
label.Parent = MainFrame

-- Cập nhật tọa độ mỗi frame
RunService.RenderStepped:Connect(function()
	local pos = rootPart.Position
	label.Text = string.format("X: %.1f | Y: %.1f | Z: %.1f", pos.X, pos.Y, pos.Z)
end)

-- Cập nhật nếu reset nhân vật
player.CharacterAdded:Connect(function(char)
	character = char
	rootPart = char:WaitForChild("HumanoidRootPart")
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Tạo GUI
local gui = Instance.new("ScreenGui")
gui.Name = "EntityNearbyGUI"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Label hiển thị số thực thể gần
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 30)
label.Position = UDim2.new(0, 1, 0, -30)
label.BackgroundTransparency = 0.3
label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.SourceSansBold
label.TextScaled = true
label.Text = "Thực thể: 0"
label.Parent = MainFrame

-- Hàm lấy HRP
local function getRoot(p)
	local char = p.Character
	if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
		return char.HumanoidRootPart, char:FindFirstChildOfClass("Humanoid")
	end
	return nil, nil
end

-- Cập nhật số lượng thực thể gần đang di chuyển
RunService.RenderStepped:Connect(function()
	local myRoot = getRoot(LocalPlayer)
	if not myRoot then return end

	local count = 0

	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer then
			local root, humanoid = getRoot(p)
			if root and humanoid and humanoid.MoveDirection.Magnitude > 0 then
				local dist = (root.Position - myRoot.Position).Magnitude
				if dist <= 200 then
					count += 1
				end
			end
		end
	end

	label.Text = "Nearby Moving Entities: " .. count
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- Tạo GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
gui.Name = "DodgeGUI"
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 30)
button.Position = UDim2.new(0, 93, 0, 45)
button.Text = "OFF"
button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.Draggable = true
button.Active = true
button.Parent = MainFrame

-- Trạng thái toggle
local isOn = false
local dodgeConnection -- để lưu kết nối RunService

-- Lấy vị trí HumanoidRootPart
local function getCharacterRoot(p)
	local char = p.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		return char.HumanoidRootPart
	end
	return nil
end

-- Bắt đầu né
local function startDodging()
	dodgeConnection = RunService.Heartbeat:Connect(function()
		local myRoot = getCharacterRoot(player)
		if not myRoot then return end

		for _, otherPlayer in pairs(Players:GetPlayers()) do
			if otherPlayer ~= player then
				local otherRoot = getCharacterRoot(otherPlayer)
				if otherRoot then
					local dist = (myRoot.Position - otherRoot.Position).Magnitude
					if dist <= 100 then
						local dir = (myRoot.Position - otherRoot.Position).Unit
						local newPos = myRoot.Position + dir * 50
						myRoot.CFrame = CFrame.new(newPos)
						print("Đã né khỏi " .. otherPlayer.Name)
						break
					end
				end
			end
		end
	end)
end

-- Dừng né
local function stopDodging()
	if dodgeConnection then
		dodgeConnection:Disconnect()
		dodgeConnection = nil
		print("Đã ngưng né người.")
	end
end

-- Sự kiện click nút
button.MouseButton1Click:Connect(function()
	isOn = not isOn
	if isOn then
		button.Text = "ON"
		button.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
		startDodging()
	else
		button.Text = "OFF"
		button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		stopDodging()
	end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- Create a ScreenGui for the loading sequence
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "LoadingGui"
LoadingGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame for the loading message
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 300, 0, 100)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = LoadingGui

local LoadingUICorner = Instance.new("UICorner")
LoadingUICorner.CornerRadius = UDim.new(0, 10)
LoadingUICorner.Parent = LoadingFrame

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Font = Enum.Font.GothamBold
LoadingText.TextColor3 = Color3.new(1, 1, 1)
LoadingText.TextSize = 18
LoadingText.Text = "This script was made by Vanh  ;)"
LoadingText.Parent = LoadingFrame

-- Function to show loading sequence
local function showLoadingSequence(isGoodbye)
    local text = isGoodbye and "Goodbye!" or "This script was made by Vanh ;)"
    LoadingText.Text = text
    LoadingFrame.Position = UDim2.new(0.5, -150, 1.5, 0)
    local goal = {}
    goal.Position = UDim2.new(0.5, -150, 0.5, -50)
    local tween = TweenService:Create(LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
    tween:Play()
    wait(2)
    goal.Position = UDim2.new(0.5, -150, -0.5, 0)
    tween = TweenService:Create(LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), goal)
    tween:Play()
    wait(0.5)
    LoadingGui:Destroy()
end

-- Show loading sequence
showLoadingSequence(false)

function GetShortenedPlrFromName(name)
    name = string.lower(tostring(name))

    if not game:GetService("Players"):FindFirstChild("me") and name == "me" or game:GetService("Players"):FindFirstChild("me") and game:GetService("Players"):FindFirstChild("me").ClassName ~= "Player" and name == "me" then
        return {LocalPlayer}
    end
    if not game:GetService("Players"):FindFirstChild("all") and name == "all" or game:GetService("Players"):FindFirstChild("all") and game:GetService("Players"):FindFirstChild("all").ClassName ~= "Player" and name == "all" then
        return game:GetService("Players"):GetPlayers()
    end
    if not game:GetService("Players"):FindFirstChild("others") and name == "others" or game:GetService("Players"):FindFirstChild("others") and game:GetService("Players"):FindFirstChild("others").ClassName ~= "Player" and name == "others" then
        name = game:GetService("Players"):GetPlayers()
        for i, v in pairs(name) do
            if v == LocalPlayer then
                table.remove(name, i)
            end
        end
        return name
    end

    for i, v in pairs(game.Players:GetPlayers()) do
        if string.lower(string.sub(v.DisplayName, 1, #name)) == name or string.lower(string.sub(v.Name, 1, #name)) == name then
            return {v}
        end
    end

    return nil
end

-- Create a ScreenGui to hold our UI elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame for our teleport UI
local TeleportFrame = Instance.new("Frame")
TeleportFrame.Size = UDim2.new(0, 220, 0, 230)  -- Increased height to accommodate new button
TeleportFrame.Position = UDim2.new(1, 0, 0.5, -115)  -- Adjusted position
TeleportFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TeleportFrame.BorderSizePixel = 0
TeleportFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = TeleportFrame

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, -30, 0, 40)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 18
TextLabel.Text = "Vanh Teleporter"  -- Updated version number
TextLabel.Parent = TeleportFrame

-- Create a close button (X)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextSize = 18
CloseButton.Text = "X"
CloseButton.Parent = TeleportFrame

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0.9, 0, 0, 35)
Input.Position = UDim2.new(0.05, 0, 0.2, 0)  -- Adjusted position
Input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Input.BorderSizePixel = 0
Input.Font = Enum.Font.Gotham
Input.TextColor3 = Color3.new(1, 1, 1)
Input.TextSize = 14
Input.PlaceholderText = "Enter player name"
Input.Text = ""
Input.Parent = TeleportFrame
Input.ClearTextOnFocus = false

local InputUICorner = Instance.new("UICorner")
InputUICorner.CornerRadius = UDim.new(0, 5)
InputUICorner.Parent = Input

-- Create a button for the player selection tool
local SelectPlayerButton = Instance.new("TextButton")
SelectPlayerButton.Size = UDim2.new(0.9, 0, 0, 35)
SelectPlayerButton.Position = UDim2.new(0.05, 0, 0.37, 0)  -- Adjusted position
SelectPlayerButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SelectPlayerButton.BorderSizePixel = 0
SelectPlayerButton.Font = Enum.Font.Gotham
SelectPlayerButton.TextColor3 = Color3.new(1, 1, 1)
SelectPlayerButton.TextSize = 14
SelectPlayerButton.Text = "Select Player"
SelectPlayerButton.Parent = TeleportFrame

local SelectPlayerUICorner = Instance.new("UICorner")
SelectPlayerUICorner.CornerRadius = UDim.new(0, 5)
SelectPlayerUICorner.Parent = SelectPlayerButton

-- Create a new button for teleporting
local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(0.9, 0, 0, 35)
TeleportButton.Position = UDim2.new(0.05, 0, 0.54, 0)  -- Adjusted position
TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
TeleportButton.BorderSizePixel = 0
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.TextColor3 = Color3.new(1, 1, 1)
TeleportButton.TextSize = 14
TeleportButton.Text = "Teleport"
TeleportButton.Parent = TeleportFrame

local TeleportUICorner = Instance.new("UICorner")
TeleportUICorner.CornerRadius = UDim.new(0, 5)
TeleportUICorner.Parent = TeleportButton

-- Create a new button for click teleport
local ClickTeleportButton = Instance.new("TextButton")
ClickTeleportButton.Size = UDim2.new(0.9, 0, 0, 35)
ClickTeleportButton.Position = UDim2.new(0.05, 0, 0.71, 0)  -- New position
ClickTeleportButton.BackgroundColor3 = Color3.fromRGB(0, 180, 60)  -- Different color
ClickTeleportButton.BorderSizePixel = 0
ClickTeleportButton.Font = Enum.Font.GothamBold
ClickTeleportButton.TextColor3 = Color3.new(1, 1, 1)
ClickTeleportButton.TextSize = 14
ClickTeleportButton.Text = "Click Teleport"
ClickTeleportButton.Parent = TeleportFrame

local ClickTeleportUICorner = Instance.new("UICorner")
ClickTeleportUICorner.CornerRadius = UDim.new(0, 5)
ClickTeleportUICorner.Parent = ClickTeleportButton

-- Add this new function to update the Input text
local function updateInputText(player)
    if player then
        Input.Text = player.Name
    end
end

local function createPlayerSelectionTool()
    local tool = Instance.new("Tool")
    tool.Name = "Player Selector"
    tool.RequiresHandle = false
    
    tool.Activated:Connect(function()
        local mouse = LocalPlayer:GetMouse()
        local target = mouse.Target
        
        -- Check if the target is part of a character
        while target and target ~= workspace do
            local humanoid = target:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local player = Players:GetPlayerFromCharacter(humanoid.Parent)
                if player then
                    updateInputText(player)
                    return
                end
            end
            target = target.Parent
        end
        
        print("No player found")
    end)
    
    return tool
end

-- Function to create click teleport tool
local function createClickTeleportTool()
    local tool = Instance.new("Tool")
    tool.Name = "Click Teleporter"
    tool.RequiresHandle = false
    
    tool.Activated:Connect(function()
        local mouse = LocalPlayer:GetMouse()
        local targetPos = mouse.Hit.Position
        
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPos + Vector3.new(0, 3, 0)))
            print("Teleported to clicked location")
        end
    end)
    
    return tool
end

SelectPlayerButton.MouseButton1Click:Connect(function()
    local tool = createPlayerSelectionTool()
    if LocalPlayer.Character then
        tool.Parent = LocalPlayer.Backpack
        LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end)

ClickTeleportButton.MouseButton1Click:Connect(function()
    local tool = createClickTeleportTool()
    if LocalPlayer.Character then
        tool.Parent = LocalPlayer.Backpack
        LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end)

-- Add this new function to handle player selection
local function selectPlayer(player)
    updateInputText(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
        print("Teleported to", player.DisplayName)
        LocalPlayer.Character:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame)
    end
end

Input.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local players = GetShortenedPlrFromName(Input.Text)
        if players and #players > 0 then
            selectPlayer(players[1])
        else
            print("Player not found")
        end
    end
end)

TeleportButton.MouseButton1Click:Connect(function()
    local players = GetShortenedPlrFromName(Input.Text)
    if players and #players > 0 then
        selectPlayer(players[1])
    else
        print("Player not found")
    end
end)

-- Create a toggle button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 30, 0, 230)  -- Increased height
ToggleButton.Position = UDim2.new(1, -30, 0.5, -115)  -- Adjusted position
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ToggleButton.BorderSizePixel = 0
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.TextSize = 18
ToggleButton.Text = ">"
ToggleButton.Parent = ScreenGui

local ToggleUICorner = Instance.new("UICorner")
ToggleUICorner.CornerRadius = UDim.new(0, 5)
ToggleUICorner.Parent = ToggleButton

local isVisible = false

-- Function to show UI
local function showUI()
    local goal = {}
    goal.Position = UDim2.new(1, -240, 0.5, -115)  -- Adjusted position
    local tween = TweenService:Create(TeleportFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
    tween:Play()
    ToggleButton.Text = "<"
    isVisible = true
end

-- Function to hide UI
local function hideUI()
    local goal = {}
    goal.Position = UDim2.new(1, 0, 0.5, -115)  -- Adjusted position
    local tween = TweenService:Create(TeleportFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
    tween:Play()
    ToggleButton.Text = ">"
    isVisible = false
end

-- Function to show goodbye sequence
local function showGoodbyeSequence()
    -- Create a new ScreenGui for the goodbye sequence
    local GoodbyeGui = Instance.new("ScreenGui")
    GoodbyeGui.Name = "GoodbyeGui"
    GoodbyeGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create a Frame for the goodbye message
    local GoodbyeFrame = Instance.new("Frame")
    GoodbyeFrame.Size = UDim2.new(0, 300, 0, 100)
    GoodbyeFrame.Position = UDim2.new(0.5, -150, 1.5, 0)
    GoodbyeFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    GoodbyeFrame.BorderSizePixel = 0
    GoodbyeFrame.Parent = GoodbyeGui

    local GoodbyeUICorner = Instance.new("UICorner")
    GoodbyeUICorner.CornerRadius = UDim.new(0, 10)
    GoodbyeUICorner.Parent = GoodbyeFrame

    local GoodbyeText = Instance.new("TextLabel")
    GoodbyeText.Size = UDim2.new(1, 0, 1, 0)
    GoodbyeText.BackgroundTransparency = 1
    GoodbyeText.Font = Enum.Font.GothamBold
    GoodbyeText.TextColor3 = Color3.new(1, 1, 1)
    GoodbyeText.TextSize = 18
    GoodbyeText.Text = "Goodbye!"
    GoodbyeText.Parent = GoodbyeFrame

    -- Animate the goodbye message
    local goal = {}
    goal.Position = UDim2.new(0.5, -150, 0.5, -50)
    local tween = TweenService:Create(GoodbyeFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
    tween:Play()
    wait(2)
    goal.Position = UDim2.new(0.5, -150, -0.5, 0)
    tween = TweenService:Create(GoodbyeFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), goal)
    tween:Play()
    wait(0.5)
    GoodbyeGui:Destroy()
end

-- Function to close the UI completely
local function closeUI()
    ScreenGui:Destroy()
    showGoodbyeSequence()
end

-- Variable to track if mouse is over UI
local mouseOverUI = false

-- Connect MouseEnter event for toggle button
ToggleButton.MouseButton1Click:Connect(function()
    if isVisible then
        hideUI()
    else
        showUI()
    end
end)

-- Connect MouseEnter event for TeleportFrame
TeleportFrame.MouseEnter:Connect(function()
    mouseOverUI = true
end)

-- Connect MouseLeave event for TeleportFrame
TeleportFrame.MouseLeave:Connect(function()
    mouseOverUI = false
    wait(0.5) -- Small delay before hiding UI
    if not mouseOverUI and not ToggleButton.MouseEnter then
        hideUI()
    end
end)

-- Connect close button
CloseButton.MouseButton1Click:Connect(closeUI)

-- Initially hide the UI
hideUI()