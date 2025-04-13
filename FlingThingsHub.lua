-- Fling Things and People: Mobile Hub GUI Script
-- Features: toy limit raise, infinite house, slot unlock, faster escape, rope color/length, coin boost, ban on grab

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")

-- Create ScreenGui
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "MobileHub"
gui.ResetOnSpawn = false

-- Main frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 220, 0, 300)
main.Position = UDim2.new(0.5, -110, 0.5, -150)
main.BackgroundTransparency = 0.5
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Visible = true
main.Active = true
main.Draggable = true

-- Toggle button
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(0.5, 85, 0.5, -170)
toggleBtn.Text = "-"
toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.TextScaled = true
toggleBtn.BorderSizePixel = 0
toggleBtn.ZIndex = 10

-- Close button
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
closeBtn.BorderSizePixel = 0

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- Scrolling buttons container
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -10, 1, -50)
scroll.Position = UDim2.new(0, 5, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 400)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

-- Button creation helper
local function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.BorderSizePixel = 0
    btn.Parent = scroll
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Sample features
createButton("장난감 수 200개로 증가", function()
    if LocalPlayer:FindFirstChild("PlayerScripts") then
        local scriptMod = LocalPlayer.PlayerScripts:FindFirstChild("ToyLimit")
        if scriptMod then
            scriptMod.MaxToys.Value = 200
        end
    end
end)

createButton("무제한 집 유지", function()
    LocalPlayer:SetAttribute("HouseTime", math.huge)
end)

createButton("집 슬롯 확장", function()
    LocalPlayer:SetAttribute("CanUseSlot2", true)
    LocalPlayer:SetAttribute("CanUseSlot3", true)
end)

createButton("탈출 시간 4초로 감소", function()
    LocalPlayer:SetAttribute("GrabEscapeTime", 4)
end)

createButton("줄 길이 증가", function()
    local rope = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Rope")
    if rope then
        rope.Length = 50
    end
end)

createButton("줄 색상 랜덤", function()
    local rope = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Rope")
    if rope and rope:IsA("Beam") then
        rope.Color = ColorSequence.new(Color3.fromHSV(math.random(), 1, 1))
    end
end)

createButton("코인 +50 획득", function()
    LocalPlayer:SetAttribute("Coins", (LocalPlayer:GetAttribute("Coins") or 0) + 50)
end)

createButton("잡은 사람 밴 (실험)", function()
    Mouse.Button1Down:Connect(function()
        local target = Mouse.Target
        if target and target.Parent and Players:GetPlayerFromCharacter(target.Parent) then
            local victim = Players:GetPlayerFromCharacter(target.Parent)
            victim:Kick("You were banned by mobile hub.")
        end
    end)
end)
