
-- FlingThingsHub_Custom.lua
-- Mobile GUI Hub for Fling Things and People

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")

-- Create Screen GUI
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "FlingHub"
screenGui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 350)
frame.Position = UDim2.new(0.5, -125, 0.5, -175)
frame.BackgroundTransparency = 0.3
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true

-- Title Bar
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "FlingThings Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20

-- Close Button
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Minimize Button
local minButton = Instance.new("TextButton", frame)
minButton.Size = UDim2.new(0, 30, 0, 30)
minButton.Position = UDim2.new(1, -60, 0, 0)
minButton.Text = "-"
minButton.TextColor3 = Color3.fromRGB(255, 255, 0)
minButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local isMinimized = false
minButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    for _, child in pairs(frame:GetChildren()) do
        if child:IsA("TextButton") and child ~= closeButton and child ~= minButton then
            child.Visible = not isMinimized
        end
    end
end)

-- Scrollable Buttons
local scrollFrame = Instance.new("ScrollingFrame", frame)
scrollFrame.Size = UDim2.new(1, 0, 1, -40)
scrollFrame.Position = UDim2.new(0, 0, 0, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
scrollFrame.ScrollBarThickness = 4
scrollFrame.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", scrollFrame)
UIListLayout.Padding = UDim.new(0, 4)

local function createButton(name, func)
    local button = Instance.new("TextButton", scrollFrame)
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.MouseButton1Click:Connect(func)
end

-- Feature Functions
createButton("Super Throw", function()
    pcall(function()
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BodyThrust") then v:Destroy() end
        end
        local thrust = Instance.new("BodyThrust")
        thrust.Force = Vector3.new(0, 99999, 0)
        thrust.Location = LocalPlayer.Character.HumanoidRootPart.Position
        thrust.Parent = LocalPlayer.Character.HumanoidRootPart
    end)
end)

createButton("Increase Rope Length", function()
    for _, rope in pairs(workspace:GetDescendants()) do
        if rope:IsA("RopeConstraint") then
            rope.Length = rope.Length + 10
        end
    end
end)

createButton("Random Rope Color", function()
    for _, rope in pairs(workspace:GetDescendants()) do
        if rope:IsA("RopeConstraint") then
            rope.Color = BrickColor.Random()
        end
    end
end)

createButton("Shorter Escape Time", function()
    pcall(function()
        LocalPlayer.Character:FindFirstChild("Grabbed").Value = false
        wait(2)
        LocalPlayer.Character:FindFirstChild("Grabbed").Value = true
    end)
end)

createButton("Freeze Grabbed Player", function()
    local target = Mouse.Target
    if target and target:FindFirstAncestorOfClass("Model") then
        local char = target:FindFirstAncestorOfClass("Model")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
        end
    end
end)
