local Players = game:GetService("Players")
local player = Players.LocalPlayer

local validKeys = {
    ["isa-shidaev"] = true
}

-- Создаем GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ISAKITOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 180)
Frame.Position = UDim2.new(0.5, -175, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Frame.ClipsDescendants = true
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Введите ключ доступа"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextScaled = false

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -40, 0, 50)
TextBox.Position = UDim2.new(0, 20, 0, 60)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.new(1,1,1)
TextBox.PlaceholderText = "Введите ключ"
TextBox.ClearTextOnFocus = true
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 22
TextBox.TextScaled = false
TextBox.Text = ""

local CheckButton = Instance.new("TextButton", Frame)
CheckButton.Size = UDim2.new(0, 90, 0, 40)
CheckButton.Position = UDim2.new(1, -110, 0, 60)
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
CheckButton.TextColor3 = Color3.new(1,1,1)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.TextSize = 20
CheckButton.Text = "Проверить"
CheckButton.AutoButtonColor = true

local StatusLabel = Instance.new("TextLabel", Frame)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 1, -30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 18
StatusLabel.Text = ""

-- Функция запуска основного скрипта
local function runYourScript()
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    StatusLabel.Text = "Ключ верный! Запускаю скрипт..."
    -- Пример твоего кода:
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 50
    end
    wait(2)
    ScreenGui:Destroy()
end

CheckButton.MouseButton1Click:Connect(function()
    local key = TextBox.Text:lower()
    if validKeys[key] then
        runYourScript()
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "Неверный ключ, попробуйте снова."
    end
end)
