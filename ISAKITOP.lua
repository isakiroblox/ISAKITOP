local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 420, 0, 260)
frame.Position = UDim2.new(0.5, -210, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Введите ключ доступа"
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(1, -40, 0, 40)
input.Position = UDim2.new(0, 20, 0, 50)
input.PlaceholderText = "Ключ..."
input.Text = ""
input.TextSize = 18
input.Font = Enum.Font.Gotham
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 6)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 100)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.Font = Enum.Font.Gotham
status.TextSize = 16

local checkButton = Instance.new("TextButton", frame)
checkButton.Size = UDim2.new(0.5, -30, 0, 40)
checkButton.Position = UDim2.new(0, 20, 0, 140)
checkButton.Text = "Проверить"
checkButton.TextSize = 18
checkButton.Font = Enum.Font.GothamBold
checkButton.TextColor3 = Color3.new(1, 1, 1)
checkButton.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
Instance.new("UICorner", checkButton).CornerRadius = UDim.new(0, 6)

local discordBtn = Instance.new("TextButton", frame)
discordBtn.Size = UDim2.new(0.2, -10, 0, 40)
discordBtn.Position = UDim2.new(0.55, 10, 0, 140)
discordBtn.Text = "Discord"
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.TextColor3 = Color3.new(1, 1, 1)
discordBtn.Font = Enum.Font.Gotham
discordBtn.TextSize = 16
Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0, 6)

local telegramBtn = Instance.new("TextButton", frame)
telegramBtn.Size = UDim2.new(0.2, -10, 0, 40)
telegramBtn.Position = UDim2.new(0.76, 10, 0, 140)
telegramBtn.Text = "Telegram"
telegramBtn.BackgroundColor3 = Color3.fromRGB(0, 136, 204)
telegramBtn.TextColor3 = Color3.new(1, 1, 1)
telegramBtn.Font = Enum.Font.Gotham
telegramBtn.TextSize = 16
Instance.new("UICorner", telegramBtn).CornerRadius = UDim.new(0, 6)

-- 🔗 Ссылки на соцсети
discordBtn.MouseButton1Click:Connect(function()
    input.Text = "https://discord.gg/vVbcqvDK"
end)

telegramBtn.MouseButton1Click:Connect(function()
    input.Text = "https://t.me/isa_shidaev"
end)

-- 🔑 Проверка ключа через твой сервис
checkButton.MouseButton1Click:Connect(function()
    local key = input.Text
    if key == "" then
        status.Text = "❗ Введите ключ"
        return
    end

    status.Text = "🔄 Проверка ключа..."
    local success, response = pcall(function()
        return game:HttpGet("https://ajjankeysystem.infinityfreeapp.com/check.php?key=" .. key)
    end)

    if success and response:lower():find("valid") then
        status.Text = "✅ Ключ принят! Загружаю..."
        wait(1)
        gui:Destroy()

        -- ✅ Загрузка твоего скрипта
        loadstring(game:HttpGet("https://raw.githubusercontent.com/isakiroblox/ISAKITOP/main/ISAKITOP.lua"))()
    else
        status.Text = "❌ Неверный ключ!"
    end
end)
