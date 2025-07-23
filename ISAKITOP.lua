local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local validKeys = {
    ["isa-shidaev"] = true
}

local discordLink = "https://discord.gg/vVbcqvDK"
local telegramLink = "https://t.me/isa_shidaev"

-- Создание GUI для ввода ключа
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "ISAKITOP_KeyGui"
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

-- ХАБ: Функции
local function openISAKITOPHub()
    local hub = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    hub.Name = "ISAKITOP_Hub"

    local main = Instance.new("Frame", hub)
    main.Size = UDim2.new(0, 300, 0, 280)
    main.Position = UDim2.new(0.5, -150, 0.5, -140)
    main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    title.Text = "ISAKITOP HUB"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true

    local function createButton(text, posY, func)
        local btn = Instance.new("TextButton", main)
        btn.Size = UDim2.new(1, -20, 0, 40)
        btn.Position = UDim2.new(0, 10, 0, posY)
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.TextScaled = true
        btn.Text = text
        btn.MouseButton1Click:Connect(func)
    end

    createButton("🏠 Телепорт на свою базу", 40, function()
        local base = workspace:FindFirstChild(player.Name .. " Base")
        if base and base:FindFirstChild("SpawnLocation") then
            player.Character:MoveTo(base.SpawnLocation.Position + Vector3.new(0, 5, 0))
        end
    end)

    createButton("🕵️‍♂️ Телепорт в чужую базу", 90, function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player then
                local b = workspace:FindFirstChild(p.Name .. " Base")
                if b and b:FindFirstChild("SpawnLocation") then
                    player.Character:MoveTo(b.SpawnLocation.Position + Vector3.new(0, 5, 0))
                    break
                end
            end
        end
    end)

    createButton("⚡ Увеличить скорость", 140, function()
        player.Character.Humanoid.WalkSpeed = 100
    end)

    createButton("🔄 Сброс скорости", 190, function()
        player.Character.Humanoid.WalkSpeed = 16
    end)

    createButton("❌ Закрыть", 240, function()
        hub:Destroy()
    end)
end

-- Проверка ключа
CheckButton.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validKeys[enteredKey] then
        Label.Text = "Ключ верный! Загружаю..."
        task.wait(1)
        ScreenGui:Destroy()
        openISAKITOPHub()
    else
        Label.Text = "Неверный ключ!"
    end
end)
