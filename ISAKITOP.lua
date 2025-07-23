-- ISAKITOP.lua

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local validKeys = {
    ["isa-shidaev"] = true
}

-- Главное окно ввода ключа
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ISAKITOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local InputFrame = Instance.new("Frame", ScreenGui)
InputFrame.Size = UDim2.new(0, 360, 0, 180)
InputFrame.Position = UDim2.new(0.5, -180, 0.5, -90)
InputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
InputFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local Label = Instance.new("TextLabel", InputFrame)
Label.Size = UDim2.new(1, 0, 0, 40)
Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextScaled = true
Label.Text = "Введите ключ"
Label.Font = Enum.Font.SourceSansBold

local TextBox = Instance.new("TextBox", InputFrame)
TextBox.Size = UDim2.new(1, -40, 0, 40)
TextBox.Position = UDim2.new(0, 20, 0, 50)
TextBox.PlaceholderText = "Ключ"
TextBox.ClearTextOnFocus = false
TextBox.TextScaled = true
TextBox.Font = Enum.Font.SourceSans

local CheckButton = Instance.new("TextButton", InputFrame)
CheckButton.Size = UDim2.new(1, -40, 0, 40)
CheckButton.Position = UDim2.new(0, 20, 0, 100)
CheckButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
CheckButton.TextColor3 = Color3.new(1, 1, 1)
CheckButton.TextScaled = true
CheckButton.Text = "Проверить"
CheckButton.Font = Enum.Font.SourceSansBold

-- Главное меню с функциями (скрыто изначально)
local MenuFrame = Instance.new("Frame", ScreenGui)
MenuFrame.Size = UDim2.new(0, 360, 0, 300)
MenuFrame.Position = UDim2.new(0.5, -180, 0.5, -150)
MenuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MenuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MenuFrame.Visible = false

local function createMenuButton(text, posY, callback)
    local btn = Instance.new("TextButton", MenuFrame)
    btn.Size = UDim2.new(1, -40, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local discordLink = "https://discord.gg/vVbcqvDK"
local telegramLink = "https://t.me/isa_shidaev"

-- Функция телепорта на свою базу (замени координаты!)
local function teleportToMyBase()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(100, 10, 200)
    print("Телепорт на свою базу выполнен")
end

-- Функция телепорта на чужую базу (замени координаты!)
local function teleportToOtherBase()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(300, 10, 400)
    print("Телепорт на чужую базу выполнен")
end

local function increaseSpeed()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 50
        print("Скорость увеличена")
    end
end

local function copyDiscord()
    setclipboard(discordLink)
    print("Ссылка Discord скопирована")
end

local function copyTelegram()
    setclipboard(telegramLink)
    print("Ссылка Telegram скопирована")
end

-- Создаем кнопки в меню
createMenuButton("Телепорт на свою базу", 20, teleportToMyBase)
createMenuButton("Телепорт на чужую базу", 70, teleportToOtherBase)
createMenuButton("Увеличить скорость", 120, increaseSpeed)
createMenuButton("Скопировать Discord", 170, copyDiscord)
createMenuButton("Скопировать Telegram", 220, copyTelegram)

-- Проверка ключа
CheckButton.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validKeys[enteredKey] then
        Label.Text = "Ключ верный! Меню открыто."
        InputFrame.Visible = false
        MenuFrame.Visible = true
    else
        Label.Text = "Неверный ключ! Попробуй снова."
    end
end)
