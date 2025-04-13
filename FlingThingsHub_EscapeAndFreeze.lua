local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- UI Setup
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 300)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
mainFrame.BackgroundTransparency = 0.4
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true

-- Scrollable UI
local scrollingFrame = Instance.new("ScrollingFrame", mainFrame)
scrollingFrame.Size = UDim2.new(1, 0, 1, -30)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.BackgroundTransparency = 1

-- Close and Minimize buttons
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local minimizeButton = Instance.new("TextButton", mainFrame)
minimizeButton.Text = "-"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -60, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    scrollingFrame.Visible = not minimized
end)

-- Button creator function
local function createButton(text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, #scrollingFrame:GetChildren() * 45)
    button.Text = text
    button.BackgroundTransparency = 0.3
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = scrollingFrame
    button.MouseButton1Click:Connect(callback)
end

-- 탈출 시간 단축
createButton("탈출 시간 2초로 단축", function()
    LocalPlayer:SetAttribute("GrabEscapeTime", 2)
end)

-- 잡은 사람 얼리기
createButton("잡은 사람 얼리기", function()
    UIS.TouchTap:Connect(function(touches)
        local pos = touches[1]
        local unitRay = workspace.CurrentCamera:ScreenPointToRay(pos.X, pos.Y)
        local ray = Ray.new(unitRay.Origin, unitRay.Direction * 500)
        local part = workspace:FindPartOnRay(ray, LocalPlayer.Character, false, true)

        if part and part.Parent then
            local character = part:FindFirstAncestorOfClass("Model")
            local victim = Players:GetPlayerFromCharacter(character)
            if victim and victim.Character then
                local humanoid = victim.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 0
                    humanoid.JumpPower = 0
                end
            end
        end
    end)
end)
