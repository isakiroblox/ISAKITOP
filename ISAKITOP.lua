local Players = game:GetService("Players")
local player = Players.LocalPlayer

local validKeys = {
    ["isa-shidaev"] = true
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyCheckGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Полупрозрачный фон
local Background = Instance.new("Frame", ScreenGui)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Background.BackgroundTransparency = 0.6
Background.BorderSizePixel = 0

-- Главное окно
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 380, 0, 180)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Visible = true

-- Тень для окна
local Shadow = Instance.new("ImageLabel", Frame)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Image = "rbxassetid://1316045217" -- мягкая тень
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ZIndex = 0

-- Заголовок
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ISAKITOP — Ввод ключа"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(230, 230, 230)
Title.TextScaled = true
Title.TextWrapped = true
Title.ZIndex = 1

-- Окно ввода
local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0.7, 0, 0, 50)
TextBox.Position = UDim2.new(0.05, 0, 0.4, 0)
TextBox.PlaceholderText = "Введите ключ..."
TextBox.Text = ""
TextBox.ClearTextOnFocus = false
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
TextBox.Font = Enum.Font.GothamSemibold
TextBox.TextScaled = true
TextBox.BorderSizePixel = 0
TextBox.ZIndex = 1
TextBox.ClipsDescendants = true

-- Кнопка Проверить
local CheckButton = Instance.new("TextButton", Frame)
CheckButton.Size = UDim2.new(0.2, 0, 0, 50)
CheckButton.Position = UDim2.new(0.77, 0, 0.4, 0)
CheckButton.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
CheckButton.BorderSizePixel = 0
CheckButton.Text = "Проверить"
CheckButton.TextColor3 = Color3.new(1, 1, 1)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.TextScaled = true
CheckButton.ZIndex = 1
CheckButton.AutoButtonColor = true
CheckButton.ClipsDescendants = true
CheckButton.Cursor = "PointingHand"

-- Лейбл для статуса
local StatusLabel = Instance.new("TextLabel", Frame)
StatusLabel.Size = UDim2.new(1, -20, 0, 25)
StatusLabel.Position = UDim2.new(0, 10, 0, 110)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.TextScaled = true
StatusLabel.TextWrapped = true
StatusLabel.Text = ""
StatusLabel.ZIndex = 1

-- Кнопки соцсетей
local function createSocialButton(parent, text, url, posX)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 80, 0, 30)
    btn.Position = UDim2.new(posX, 0, 0, 145)
    btn.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    btn.AutoButtonColor = true
    btn.Cursor = "PointingHand"
    btn.MouseButton1Click:Connect(function()
        -- Копируем ссылку в буфер обмена
        if setclipboard then
            setclipboard(url)
            StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
            StatusLabel.Text = text.." скопировано!"
        else
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            StatusLabel.Text = "Копирование не поддерживается."
        end
    end)
    return btn
end

createSocialButton(Frame, "Discord", "https://discord.gg/vVbcqvDK", 0.05)
createSocialButton(Frame, "Telegram", "https://t.me/isa_shidaev", 0.3)

-- Логика кнопки Проверить
CheckButton.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validKeys[enteredKey] then
        StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
        StatusLabel.Text = "Ключ верный! Загружаю скрипт..."
        -- Загружаем твой скрипт с проверкой ошибки
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-a-brainrot/refs/heads/main/Protected_3771863424757750.lua.txt"))()
        end)
        if success then
            ScreenGui:Destroy()
        else
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            StatusLabel.Text = "Ошибка загрузки скрипта: "..tostring(err)
        end
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        StatusLabel.Text = "Неверный ключ! Попробуйте снова."
    end
end)
