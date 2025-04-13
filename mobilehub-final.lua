
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
gui.Name = "MobileHub"

-- 원형 버튼 UI
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 80, 0, 80)
openButton.Position = UDim2.new(0.02, 0, 0.4, 0)
openButton.Text = "열기"
openButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextScaled = true
openButton.BackgroundTransparency = 0.3
openButton.BorderSizePixel = 0
openButton.Parent = gui
openButton.ClipsDescendants = true
openButton.AutoButtonColor = true
openButton.ZIndex = 2
openButton.AnchorPoint = Vector2.new(0, 0)
openButton.TextWrapped = true
openButton.Name = "OpenButton"
openButton.TextStrokeTransparency = 0.7
openButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
openButton.Font = Enum.Font.GothamBold
openButton.UICorner = Instance.new("UICorner", openButton)

-- 메인 프레임
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.2
mainFrame.Visible = false
mainFrame.Parent = gui
mainFrame.Name = "MainFrame"
Instance.new("UICorner", mainFrame)

-- 닫기 버튼
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeButton.Parent = mainFrame
Instance.new("UICorner", closeButton)

-- 버튼1: 자동사냥
local autoBtn = Instance.new("TextButton")
autoBtn.Size = UDim2.new(0, 200, 0, 40)
autoBtn.Position = UDim2.new(0.5, -100, 0.3, -20)
autoBtn.Text = "자동사냥"
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoBtn.Parent = mainFrame
Instance.new("UICorner", autoBtn)

-- 버튼2: 아이템 소환
local itemBtn = Instance.new("TextButton")
itemBtn.Size = UDim2.new(0, 200, 0, 40)
itemBtn.Position = UDim2.new(0.5, -100, 0.65, -20)
itemBtn.Text = "아이템 소환 (채권 포함)"
itemBtn.TextColor3 = Color3.new(1, 1, 1)
itemBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemBtn.Parent = mainFrame
Instance.new("UICorner", itemBtn)

-- 이벤트 연결
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

autoBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkkop568/moi/main/auto.lua"))()
end)

itemBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkkop568/moi/main/itemspawn.lua"))()
end)
