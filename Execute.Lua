local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui") -- Using CoreGui prevents it from resetting on death

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ArmazHubNotification"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- 2. Create the Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 100)
mainFrame.Position = UDim2.new(0.5, -150, 0.4, -50) -- Centers it
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Rounded Corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

-- 3. Create the Success Message
local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(1, -20, 1, -20)
messageLabel.Position = UDim2.new(0, 10, 0, 10)
messageLabel.BackgroundTransparency = 1
messageLabel.Text = "Armaz Hub Has Been Successfully Executed!"
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.TextSize = 18
messageLabel.Font = Enum.Font.GothamBold
messageLabel.TextWrapped = true
messageLabel.Parent = mainFrame

-- 4. Create the Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 5)
buttonCorner.Parent = closeButton

-- 5. Close Button Logic
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Optional: Auto-destroy after 3 seconds
task.delay(3, function()
    if screenGui and screenGui.Parent then
        screenGui:Destroy()
    end
end)
