-- ISAKITOP Hub

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Clipboard = setclipboard or toclipboard or (function() end) -- Для копирования ссылки

-- Ключи
local validKeys = {
    ["isa-shidaev"] = true
}

-- Удаляем старый GUI если есть
if player.PlayerGui:FindFirstChild("ISAKITOP") then
    player.PlayerGui.ISAKITOP:Destroy()
end

-- Создаем экран
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ISAKITOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Фрейм ввода ключа
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 360, 0, 240)
KeyFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyFrame.BorderSizePixel = 0
KeyFrame.ClipsDescendants = true
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.Visible = true

-- Заголовок
local Title = Instance.new("TextLabel", KeyFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.fromRGB(230, 230, 230)
Title.Text = "ISAKITOP Hub — Введите ключ"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.BorderSizePixel = 0

-- Текстбокс для ключа
local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(1, -40, 0, 50)
KeyBox.Position = UDim2.new(0, 20, 0, 70)
KeyBox.PlaceholderText = "Введите ключ здесь"
KeyBox.ClearTextOnFocus = false
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextScaled = true
KeyBox.TextColor3 = Color3.fromRGB(240, 240, 240)
KeyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KeyBox.BorderSizePixel = 0

-- Кнопка проверить
local CheckButton = Instance.new("TextButton", KeyFrame)
CheckButton.Size = UDim2.new(0, 120, 0, 40)
CheckButton.Position = UDim2.new(0, 20, 0, 130)
CheckButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
CheckButton.TextColor3 = Color3.new(1, 1, 1)
CheckButton.Text = "Проверить"
CheckButton.Font = Enum.Font.GothamBold
CheckButton.TextScaled = true
CheckButton.AutoButtonColor = true
CheckButton.BorderSizePixel = 0
CheckButton.Modal = true

-- Кнопка Discord (копировать ссылку)
local DiscordBtn = Instance.new("TextButton", KeyFrame)
DiscordBtn.Size = UDim2.new(0, 120, 0, 40)
DiscordBtn.Position = UDim2.new(0, 150, 0, 130)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
DiscordBtn.Text = "Discord"
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextScaled = true
DiscordBtn.AutoButtonColor = true
DiscordBtn.BorderSizePixel = 0

-- Кнопка Telegram (копировать ссылку)
local TelegramBtn = Instance.new("TextButton", KeyFrame)
TelegramBtn.Size = UDim2.new(0, 120, 0, 40)
TelegramBtn.Position = UDim2.new(0, 280, 0, 130)
TelegramBtn.BackgroundColor3 = Color3.fromRGB(0, 136, 204)
TelegramBtn.TextColor3 = Color3.new(1, 1, 1)
TelegramBtn.Text = "Telegram"
TelegramBtn.Font = Enum.Font.GothamBold
TelegramBtn.TextScaled = true
TelegramBtn.AutoButtonColor = true
TelegramBtn.BorderSizePixel = 0

-- Лейбл для сообщений
local MsgLabel = Instance.new("TextLabel", KeyFrame)
MsgLabel.Size = UDim2.new(1, -40, 0, 30)
MsgLabel.Position = UDim2.new(0, 20, 0, 185)
MsgLabel.BackgroundTransparency = 1
MsgLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
MsgLabel.Font = Enum.Font.GothamBold
MsgLabel.TextScaled = true
MsgLabel.Text = ""

-- Функции скрипта, которые будут в главном меню
local function teleportToOwnBase()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Поставь координаты своей базы тут
        MsgLabel.Text = "Телепорт на свою базу выполнен!"
    else
        MsgLabel.Text = "Ошибка: персонаж не найден!"
    end
end

local function teleportToOtherBase()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        -- Можно сделать ввод или выбрать цель, для простоты телепортируем в другую точку
        character.HumanoidRootPart.CFrame = CFrame.new(100, 10, 100) -- Поставь координаты чужой базы тут
        MsgLabel.Text = "Телепорт в чужую базу выполнен!"
    else
        MsgLabel.Text = "Ошибка: персонаж не найден!"
    end
end

local function changeWalkSpeed()
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 50
        MsgLabel.Text = "Скорость изменена на 50!"
    else
        MsgLabel.Text = "Ошибка: персонаж не найден!"
    end
end

-- Главное окно с функциями (появится после ввода ключа)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 280)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Visible = false

local MainTitle = Instance.new("TextLabel", MainFrame)
MainTitle.Size = UDim2.new(1, 0, 0, 45)
MainTitle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
MainTitle.Text = "ISAKITOP Hub"
MainTitle.Font = Enum.Font.GothamBold
MainTitle.TextScaled = true
MainTitle.BorderSizePixel = 0

local TeleportOwnBtn = Instance.new("TextButton", MainFrame)
TeleportOwnBtn.Size = UDim2.new(0, 180, 0, 50)
TeleportOwnBtn.Position = UDim2.new(0, 20, 0, 70)
TeleportOwnBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 150)
TeleportOwnBtn.TextColor3 = Color3.new(1, 1, 1)
TeleportOwnBtn.Text = "Телепорт на свою базу"
TeleportOwnBtn.Font = Enum.Font.GothamBold
TeleportOwnBtn.TextScaled = true
TeleportOwnBtn.BorderSizePixel = 0

local TeleportOtherBtn = Instance.new("TextButton", MainFrame)
TeleportOtherBtn.Size = UDim2.new(0, 180, 0, 50)
TeleportOtherBtn.Position = UDim2.new(0, 200, 0, 70)
TeleportOtherBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 80)
TeleportOtherBtn.TextColor3 = Color3.new(1, 1, 1)
TeleportOtherBtn.Text = "Телепорт в чужую базу"
TeleportOtherBtn.Font = Enum.Font.GothamBold
TeleportOtherBtn.TextScaled = true
TeleportOtherBtn.BorderSizePixel = 0

local SpeedBtn = Instance.new("TextButton", MainFrame)
SpeedBtn.Size = UDim2.new(0, 360, 0, 50)
SpeedBtn.Position = UDim2.new(0, 20, 0, 140)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
SpeedBtn.TextColor3 = Color3.new(1, 1, 1)
SpeedBtn.Text = "Установить скорость 50"
SpeedBtn.Font = Enum.Font.GothamBold
SpeedBtn.TextScaled = true
SpeedBtn.BorderSizePixel = 0

local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 360, 0, 40)
CloseBtn.Position = UDim2.new(0, 20, 0, 210)
CloseBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Text = "Закрыть"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextScaled = true
CloseBtn.BorderSizePixel = 0

-- Подключение функций к кнопкам
TeleportOwnBtn.MouseButton1Click:Connect(teleportToOwnBase)
TeleportOtherBtn.MouseButton1Click:Connect(teleportToOtherBase)
SpeedBtn.MouseButton1Click:Connect(changeWalkSpeed)
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    KeyFrame.Visible = true
end)

-- Кнопки соцсетей (копируют в буфер)
DiscordBtn.MouseButton1Click:Connect(function()
    Clipboard("https://discord.gg/vVbcqvDK")
    MsgLabel.Text = "Ссылка Discord скопирована!"
end)

TelegramBtn.MouseButton1Click:Connect(function()
    Clipboard("https://t.me/isa_shidaev")
    MsgLabel.Text = "Ссылка Telegram скопирована!"
end)

-- Обработка нажатия Проверить
CheckButton.MouseButton1Click:Connect(function()
    local key = KeyBox.Text:lower()
    if validKeys[key] then
        MsgLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        MsgLabel.Text = "Ключ верный! Запускаю..."
        task.wait(1)
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        MsgLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        MsgLabel.Text = "Неверный ключ! Попробуйте снова."
    end
end)
