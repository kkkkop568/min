
-- Dead Rails Mobile Script (UI + AutoFarm + Item Spawner) with Draggable UI
-- by ChatGPT & User

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "DeadRailsHub"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
mainFrame.Size = UDim2.new(0, 250, 0, 300)
mainFrame.BackgroundTransparency = 0.4
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Active = true
mainFrame.Draggable = true

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 12)

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0.3, -45, 0.2, 0)
toggleButton.Text = "-"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local toggleCorner = Instance.new("UICorner", toggleButton)
toggleCorner.CornerRadius = UDim.new(1, 0)

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(1, 0)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local function createButton(name, posY, callback)
    local button = Instance.new("TextButton", mainFrame)
    button.Size = UDim2.new(0, 220, 0, 30)
    button.Position = UDim2.new(0, 15, 0, posY)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.new(1, 1, 1)

    local btnCorner = Instance.new("UICorner", button)
    btnCorner.CornerRadius = UDim.new(0, 12)

    button.MouseButton1Click:Connect(callback)
end

local farming = false
createButton("자동사냥 ON/OFF", 50, function()
    farming = not farming
    while farming and screenGui.Parent do
        task.wait(1)
        for _, npc in pairs(workspace:GetDescendants()) do
            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
                if npc ~= character and (npc.Name:lower():find("zombie") or npc.Name:lower():find("vampire")) then
                    local dist = (npc.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                    if dist < 30 then
                        npc.Humanoid:TakeDamage(10)
                    end
                end
            end
        end
    end
end)

local itemList = {"채권", "붕대", "총알", "신문", "그림", "화분"}
for i, itemName in ipairs(itemList) do
    createButton(itemName .. " 소환", 50 + i * 40, function()
        print(itemName .. " 소환 시도됨")
    end)
end
