-- ISAKITOP.lua

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- ✅ Здесь хранятся допустимые ключи
local validKeys = {
    ["isa-shidaev"] = true
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ISAKITOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 320, 0, 200)
Frame.Position = UDim2.new(0.5, -160, 0.5, -100)
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

-- ✅ Твой скрипт, который выполнится после включения
local function runYourScript()
    -- 🔧 Вот твой код:
    print("Скрипт активирован!")
    player.Character.Humanoid.WalkSpeed = 50
    -- Можешь сюда вставить что угодно
end

-- 🔐 Проверка переключателя
CheckButton.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validKeys[enteredKey] then
        Label.Text = "Ключ верный! Запускаю..."
        runYourScript()
        task.wait(2)
        ScreenGui:Destroy()
    else
        Label.Text = "Неверный ключ! Попробуй снова."
    end
end)
