local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeySystem"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "🔑 Введите ключ для доступа"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Ваш ключ здесь..."
textbox.Size = UDim2.new(0.9, 0, 0, 40)
textbox.Position = UDim2.new(0.05, 0, 0, 50)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.TextScaled = true
Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 6)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 100)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.new(1, 1, 1)
status.TextScaled = true

-- Кнопка проверки ключа
local checkBtn = Instance.new("TextButton", frame)
checkBtn.Size = UDim2.new(0.6, -10, 0, 40)
checkBtn.Position = UDim2.new(0.05, 0, 0, 140)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
checkBtn.Text = "Проверить"
checkBtn.TextColor3 = Color3.new(1, 1, 1)
checkBtn.TextScaled = true
Instance.new("UICorner", checkBtn).CornerRadius = UDim.new(0, 6)

-- Кнопка получения ключа
local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Size = UDim2.new(0.3, -10, 0, 40)
getKeyBtn.Position = UDim2.new(0.65, 5, 0, 140)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
getKeyBtn.Text = "Получить ключ"
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.TextScaled = true
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 6)

-- Кнопка Discord
local discordBtn = Instance.new("TextButton", frame)
discordBtn.Size = UDim2.new(0.45, -5, 0, 35)
discordBtn.Position = UDim2.new(0.05, 0, 0, 190)
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.Text = "📎 Discord"
discordBtn.TextColor3 = Color3.new(1, 1, 1)
discordBtn.TextScaled = true
Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0, 6)

-- Кнопка Telegram
local telegramBtn = Instance.new("TextButton", frame)
telegramBtn.Size = UDim2.new(0.45, -5, 0, 35)
telegramBtn.Position = UDim2.new(0.5, 5, 0, 190)
telegramBtn.BackgroundColor3 = Color3.fromRGB(0, 136, 204)
telegramBtn.Text = "📎 Telegram"
telegramBtn.TextColor3 = Color3.new(1, 1, 1)
telegramBtn.TextScaled = true
Instance.new("UICorner", telegramBtn).CornerRadius = UDim.new(0, 6)

-- ✅ Обработчик кнопки "Проверить"
checkBtn.MouseButton1Click:Connect(function()
	local key = textbox.Text
	local url = "https://ajjankeysystem.infinityfreeapp.com/check.php?key=" .. key

	local success, response = pcall(function()
		return game:HttpGet(url)
	end)

	if success and response:lower():find("valid") then
		status.Text = "✅ Ключ принят!"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
		task.wait(1.5)
		gui:Destroy()
		-- 🔥 Загружаем твой скрипт
		loadstring(game:HttpGet("https://raw.githubusercontent.com/isakiroblox/ISAKITOP/main/ISAKITOP.lua"))()
	else
		status.Text = "❌ Неверный ключ!"
		status.TextColor3 = Color3.fromRGB(255, 80, 80)
	end
end)

-- 📎 Кнопка получения ключа
getKeyBtn.MouseButton1Click:Connect(function()
	local link = "https://ajjankeysystem.infinityfreeapp.com/?hash=pcs5Zs04zOVcutzglF0W8CfGFGeNwDx6HnFmAIAfyC5Oe43ZiXUKnjaYm3XrKVbX&i=1"
	textbox.Text = link
	textbox:CaptureFocus()
	StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Ссылка на получение ключа вставлена. Нажмите Ctrl+C чтобы скопировать.",
		Color = Color3.fromRGB(0, 150, 200),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size18,
	})
end)

-- 📎 Кнопка Discord
discordBtn.MouseButton1Click:Connect(function()
	textbox.Text = "https://discord.gg/vVbcqvDK"
	textbox:CaptureFocus()
end)

-- 📎 Кнопка Telegram
telegramBtn.MouseButton1Click:Connect(function()
	textbox.Text = "https://t.me/isa_shidaev"
	textbox:CaptureFocus()
end)
