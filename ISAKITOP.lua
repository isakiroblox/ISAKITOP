local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyCheckGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 420, 0, 320)
Frame.Position = UDim2.new(0.5, -210, 0.5, -160)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 16)

local TitleLabel = Instance.new("TextLabel", Frame)
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🚀 Welcome, " .. LocalPlayer.Name
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextScaled = true

local InstructionLabel = Instance.new("TextLabel", Frame)
InstructionLabel.Size = UDim2.new(1, -20, 0, 40)
InstructionLabel.Position = UDim2.new(0, 10, 0, 60)
InstructionLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
InstructionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
InstructionLabel.Font = Enum.Font.GothamBold
InstructionLabel.TextScaled = true
InstructionLabel.TextWrapped = true
InstructionLabel.Text = "Enter your key and press Check Key"
InstructionLabel.ClipsDescendants = true
Instance.new("UICorner", InstructionLabel).CornerRadius = UDim.new(0, 10)

local KeyBox = Instance.new("TextBox", Frame)
KeyBox.PlaceholderText = "XXXX-XXXX-XXXX-XXXX"
KeyBox.Size = UDim2.new(0.85, 0, 0, 45)
KeyBox.Position = UDim2.new(0.075, 0, 0, 120)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
KeyBox.TextColor3 = Color3.fromRGB(230, 230, 230)
KeyBox.Font = Enum.Font.GothamSemibold
KeyBox.TextScaled = true
KeyBox.ClearTextOnFocus = false
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 10)

local StatusLabel = Instance.new("TextLabel", Frame)
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.Position = UDim2.new(0, 10, 0, 180)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextScaled = true
StatusLabel.TextWrapped = true

local CheckBtn = Instance.new("TextButton", Frame)
CheckBtn.Size = UDim2.new(0.6, 0, 0, 50)
CheckBtn.Position = UDim2.new(0.2, 0, 0, 220)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
CheckBtn.Text = "Check Key"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextScaled = true
Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 12)

local function isValidKeyFormat(key)
    -- Проверяем формат XXXX-XXXX-XXXX-XXXX, только буквы и цифры (без I, O, 1, 0)
    if type(key) ~= "string" then return false end
    if #key ~= 19 then return false end
    local pattern = "^([ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{4}%-){3}[ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{4}$"
    return key:match(pattern) ~= nil
end

CheckBtn.MouseButton1Click:Connect(function()
    local key = KeyBox.Text:upper()
    if key == "" then
        StatusLabel.Text = "Please enter a key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
        return
    end
    StatusLabel.Text = "Checking key format..."
    StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    wait(1)

    if isValidKeyFormat(key) then
        StatusLabel.Text = "Key accepted!"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        wait(1)
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Steal-a-Brainrot-op/refs/heads/main/Arbixhub-obfuscated.lua"))()
    else
        StatusLabel.Text = "Invalid key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)
