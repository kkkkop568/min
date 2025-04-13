
-- mobilehub.lua
-- Dead Rail 모바일용 허브 UI + 자동사냥 + 아이템 소환 예시

-- UI 생성
local ScreenGui = Instance.new("ScreenGui")
local OpenButton = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local AutoFarmButton = Instance.new("TextButton")
local ItemSpawnButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- 열기 버튼
OpenButton.Name = "OpenButton"
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.BackgroundTransparency = 0.3
OpenButton.BorderSizePixel = 0
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Text = "열기"
OpenButton.TextColor3 = Color3.new(1, 1, 1)
OpenButton.TextSize = 14
OpenButton.TextWrapped = true

-- 메인 프레임
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BackgroundTransparency = 0.3
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Visible = false

-- 닫기 버튼
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.TextSize = 14

-- 자동사냥 버튼
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Parent = Frame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
AutoFarmButton.Position = UDim2.new(0, 10, 0, 40)
AutoFarmButton.Size = UDim2.new(0, 180, 0, 40)
AutoFarmButton.Text = "자동사냥"
AutoFarmButton.TextColor3 = Color3.new(1, 1, 1)
AutoFarmButton.TextSize = 16

-- 아이템 소환 버튼
ItemSpawnButton.Name = "ItemSpawnButton"
ItemSpawnButton.Parent = Frame
ItemSpawnButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ItemSpawnButton.Position = UDim2.new(0, 10, 0, 90)
ItemSpawnButton.Size = UDim2.new(0, 180, 0, 40)
ItemSpawnButton.Text = "아이템 소환 (채권 포함)"
ItemSpawnButton.TextColor3 = Color3.new(1, 1, 1)
ItemSpawnButton.TextSize = 14

-- 기능
OpenButton.MouseButton1Click:Connect(function()
    Frame.Visible = true
end)

CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)

AutoFarmButton.MouseButton1Click:Connect(function()
    -- 여기에 자동사냥 로직 작성
    print("자동사냥 시작")
end)

ItemSpawnButton.MouseButton1Click:Connect(function()
    -- 여기에 아이템 소환 로직 작성
    print("아이템 소환")
end)
