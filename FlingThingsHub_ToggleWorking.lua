
-- Fling Things and People Custom Hub (Mobile Optimized)
-- with Working Minimize Button & Super Throw Power Control

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- GUI 생성
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FlingThingsHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 260, 0, 420)
main.Position = UDim2.new(0.5, -130, 0.5, -210)
main.BackgroundTransparency = 0.3
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Active = true
main.Draggable = true

-- 닫기 버튼
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- 열고 닫기 버튼
local toggleBtn = Instance.new("TextButton", main)
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(1, -70, 0, 5)
toggleBtn.Text = "-"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- 내용 컨테이너
local content = Instance.new("ScrollingFrame", main)
content.Size = UDim2.new(1, -20, 1, -60)
content.Position = UDim2.new(0, 10, 0, 50)
content.CanvasSize = UDim2.new(0, 0, 0, 500)
content.ScrollBarThickness = 6
content.BackgroundTransparency = 1
content.Name = "Content"

local isOpen = true
toggleBtn.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	content.Visible = isOpen
end)

-- 슈퍼 스로우 파워
local power = 50

local powerLabel = Instance.new("TextLabel", content)
powerLabel.Size = UDim2.new(1, -20, 0, 30)
powerLabel.Position = UDim2.new(0, 0, 0, 0)
powerLabel.Text = "던지기 힘: " .. power
powerLabel.TextColor3 = Color3.new(1, 1, 1)
powerLabel.BackgroundTransparency = 1

local powerButton = Instance.new("TextButton", content)
powerButton.Size = UDim2.new(1, -20, 0, 30)
powerButton.Position = UDim2.new(0, 0, 0, 40)
powerButton.Text = "힘 증가"
powerButton.TextColor3 = Color3.new(1, 1, 1)
powerButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

powerButton.MouseButton1Click:Connect(function()
	power = power + 10
	if power > 100 then power = 10 end
	powerLabel.Text = "던지기 힘: " .. power
end)

-- 던지기 작동
local function throw()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local grab = char:FindFirstChildWhichIsA("Tool")
	if grab and grab:FindFirstChild("Handle") then
		local bv = Instance.new("BodyVelocity", grab.Handle)
		bv.Velocity = hrp.CFrame.lookVector * power
		bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
		game.Debris:AddItem(bv, 0.5)
	end
end

-- 모바일 대응 버튼
local throwButton = Instance.new("TextButton", content)
throwButton.Size = UDim2.new(1, -20, 0, 30)
throwButton.Position = UDim2.new(0, 0, 0, 80)
throwButton.Text = "던지기 (슈퍼 스로우)"
throwButton.TextColor3 = Color3.new(1, 1, 1)
throwButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
throwButton.MouseButton1Click:Connect(throw)
