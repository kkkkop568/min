
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 기존 GUI 제거 (중복 방지)
local oldGui = player:FindFirstChild("PlayerGui"):FindFirstChild("MobileHub")
if oldGui then
	oldGui:Destroy()
end

-- GUI 생성
local gui = Instance.new("ScreenGui")
gui.Name = "MobileHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- 열기 버튼
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 80, 0, 80)
openButton.Position = UDim2.new(0.02, 0, 0.4, 0)
openButton.Text = "열기"
openButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextScaled = true
openButton.BackgroundTransparency = 0.3
openButton.BorderSizePixel = 0
openButton.ZIndex = 2
openButton.Name = "OpenButton"
openButton.Font = Enum.Font.GothamBold
openButton.Parent = gui
local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(1, 0)
openCorner.Parent = openButton

-- 메인 프레임
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 160)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -80)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.2
mainFrame.Visible = false
mainFrame.Parent = gui
local frameCorner = Instance.new("UICorner")
frameCorner.Parent = mainFrame

-- 닫기 버튼
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeButton.Parent = mainFrame
local closeCorner = Instance.new("UICorner")
closeCorner.Parent = closeButton

-- 자동사냥 버튼
local autoBtn = Instance.new("TextButton")
autoBtn.Size = UDim2.new(0, 200, 0, 40)
autoBtn.Position = UDim2.new(0.5, -100, 0.35, 0)
autoBtn.Text = "자동사냥"
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoBtn.Parent = mainFrame
Instance.new("UICorner", autoBtn)

-- 아이템 소환 버튼
local itemBtn = Instance.new("TextButton")
itemBtn.Size = UDim2.new(0, 200, 0, 40)
itemBtn.Position = UDim2.new(0.5, -100, 0.65, 0)
itemBtn.Text = "아이템 소환"
itemBtn.TextColor3 = Color3.new(1, 1, 1)
itemBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemBtn.Parent = mainFrame
Instance.new("UICorner", itemBtn)

-- 열기/닫기 기능
openButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
end)

closeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- 기능 버튼 클릭 시 외부 스크립트 실행
autoBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkkop568/moi/main/auto.lua"))()
end)

itemBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkkop568/moi/main/itemspawn.lua"))()
end)
