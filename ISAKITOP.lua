local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- Ключ
local validKeys = {
    ["isa-shidaev"] = true
}

-- Ссылки
local discordLink = "https://discord.gg/vVbcqvDK"
local telegramLink = "https://t.me/isa_shidaev"

-- GUI
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "ISAKITOP"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 340, 0, 240)
Frame.Position = UDim2.new(0.5, -170, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local Label = Instance.new("TextLabel", Frame)
Label.Size = UDim2.new(1, 0, 0, 30)
Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextScaled = true
Label.Text = "Введите ключ"

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 40)
TextBox.PlaceholderText = "Ключ"
TextBox.ClearTextOnFocus = false
TextBox.Text = ""

-- Кнопка проверки ключа
local CheckButton = Instance.new("TextButton", Frame)
CheckButton.Size = UDim2.new(1, -20, 0, 40)
CheckButton.Position = UDim2.new(0, 10, 0, 90)
CheckButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
CheckButton.TextColor3 = Color3.new(1, 1, 1)
CheckButton.TextScaled = true
CheckButton.Text = "Проверить"

-- Кнопка Discord
local DiscordButton = Instance.new("TextButton", Frame)
DiscordButton.Size = UDim2.new(0.48, -10, 0, 40)
DiscordButton.Position = UDim2.new(0, 10, 0, 140)
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.TextColor3 = Color3.new(1, 1, 1)
DiscordButton.TextScaled = true
DiscordButton.Text = "Discord"

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard(discordLink)
    Label.Text = "Скопировано: Discord"
end)

-- Кнопка Telegram
local TelegramButton = Instance.new("TextButton", Frame)
TelegramButton.Size = UDim2.new(0.48, -10, 0, 40)
TelegramButton.Position = UDim2.new(0.52, 0, 0, 140)
TelegramButton.BackgroundColor3 = Color3.fromRGB(0, 136, 204)
TelegramButton.TextColor3 = Color3.new(1, 1, 1)
TelegramButton.TextScaled = true
TelegramButton.Text = "Telegram"

TelegramButton.MouseButton1Click:Connect(function()
    setclipboard(telegramLink)
    Label.Text = "Скопировано: Telegram"
end)

-- Проверка ключа и запуск скрипта
CheckButton.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validKeys[enteredKey] then
        Label.Text = "Ключ верный! Загружаю..."
        task.wait(1)
        ScreenGui:Destroy()
        -- Загружается основной скрипт
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Steal-a-Brainrot-op/refs/heads/main/Arbixhub-obfuscated.lua"))()
    else
        Label.Text = "Неверный ключ!"
    end
end)
