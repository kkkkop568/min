
-- Dead Rail 모바일 전용 허브 by kkkkop568

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- GUI 생성
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "DeadRailHub"

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -30)
toggleBtn.BackgroundTransparency = 0.4
toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
toggleBtn.Text = "-"
toggleBtn.TextScaled = true
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Parent = ScreenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 300)
mainFrame.Position = UDim2.new(0, 80, 0.5, -150)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Visible = true
mainFrame.Parent = ScreenGui

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Parent = mainFrame

-- 자동사냥 버튼
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(1, -20, 0, 50)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 50)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
autoFarmBtn.Text = "자동사냥 ON"
autoFarmBtn.TextColor3 = Color3.new(1, 1, 1)
autoFarmBtn.Parent = mainFrame

-- 아이템 버튼 예시 (채권)
local itemBtn = Instance.new("TextButton")
itemBtn.Size = UDim2.new(1, -20, 0, 50)
itemBtn.Position = UDim2.new(0, 10, 0, 120)
itemBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
itemBtn.Text = "채권 소환"
itemBtn.TextColor3 = Color3.new(1, 1, 1)
itemBtn.Parent = mainFrame

-- 기능: UI 열기/닫기
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- 기능: UI 종료
closeBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 자동사냥 기능 (샘플, 실제 공격은 NPC 이름 기반으로 수정 필요)
local autoFarm = false
autoFarmBtn.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    autoFarmBtn.Text = autoFarm and "자동사냥 OFF" or "자동사냥 ON"
end)

RunService.RenderStepped:Connect(function()
    if autoFarm and character and character:FindFirstChild("HumanoidRootPart") then
        for _, npc in pairs(workspace:GetDescendants()) do
            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
                if (npc.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude < 30 then
                    -- 공격 명령 (여기선 예시, 실제 공격 함수로 대체 필요)
                    npc.Humanoid:TakeDamage(10)
                end
            end
        end
    end
end)

-- 아이템 소환 기능 (예시: 채권)
itemBtn.MouseButton1Click:Connect(function()
    -- 실제 아이템 생성 로직 필요 (서버 요청 기반일 수도 있음)
    print("채권 소환 시도됨")
end)
