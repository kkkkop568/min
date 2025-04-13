
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MobileHub"
gui.ResetOnSpawn = false

-- 원형 열기 버튼
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 20, 1, -80)
openBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openBtn.Text = "열기"
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold
openBtn.ZIndex = 2
openBtn.Parent = gui
local openCorner = Instance.new("UICorner", openBtn)
openCorner.CornerRadius = UDim.new(1, 0)

-- 메인 허브 UI
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.3
mainFrame.Visible = false
mainFrame.Parent = gui
local frameCorner = Instance.new("UICorner", mainFrame)

-- 닫기 버튼
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn)

-- 자동사냥 버튼
local autoBtn = Instance.new("TextButton")
autoBtn.Size = UDim2.new(0, 240, 0, 40)
autoBtn.Position = UDim2.new(0.5, -120, 0.4, 0)
autoBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoBtn.Text = "자동사냥"
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.TextScaled = true
autoBtn.Font = Enum.Font.Gotham
autoBtn.Parent = mainFrame
Instance.new("UICorner", autoBtn)

-- 아이템 소환 버튼
local itemBtn = Instance.new("TextButton")
itemBtn.Size = UDim2.new(0, 240, 0, 40)
itemBtn.Position = UDim2.new(0.5, -120, 0.65, 0)
itemBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemBtn.Text = "아이템 소환"
itemBtn.TextColor3 = Color3.new(1, 1, 1)
itemBtn.TextScaled = true
itemBtn.Font = Enum.Font.Gotham
itemBtn.Parent = mainFrame
Instance.new("UICorner", itemBtn)

-- 열기 / 닫기 이벤트
openBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- 기능: 외부 스크립트 불러오기
autoBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkkop568/moi/main/auto.lua"))()
end)

itemBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkkop568/moi/main/itemspawn.lua"))()
end)
