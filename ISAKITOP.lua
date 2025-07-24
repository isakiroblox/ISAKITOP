local Players = game:GetService("Players")
local player = Players.LocalPlayer

local validKeys = {
    ["isa-shidaev"] = true
}

-- UI
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "ISAKITOP_GUI"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "🔐 Введите ключ доступа"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(0, 200, 255)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -40, 0, 45)
TextBox.Position = UDim2.new(0, 20, 0, 70)
TextBox.PlaceholderText = "Ключ доступа"
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 20
TextBox.ClearTextOnFocus = true
TextBox.Text = ""
TextBox.Parent = Frame
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(0.5, -30, 0, 40)
Button.Position = UDim2.new(0.25, 0, 0, 130)
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Text = "Проверить"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 20
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

local Status = Instance.new("TextLabel", Frame)
Status.Size = UDim2.new(1, -20, 0, 30)
Status.Position = UDim2.new(0, 10, 1, -40)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.Gotham
Status.TextSize = 18
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 100, 100)
Status.TextWrapped = true
Status.Parent = Frame

-- Функция запуска скрипта
local function runYourScript()
	Status.TextColor3 = Color3.fromRGB(100, 255, 100)
	Status.Text = "Ключ верный! Загружаю скрипт..."
	
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-a-brainrot/refs/heads/main/Protected_3771863424757750.lua.txt"))()
	end)

	wait(2)
	ScreenGui:Destroy()
end

-- Проверка ключа
Button.MouseButton1Click:Connect(function()
	local entered = TextBox.Text:lower()
	if validKeys[entered] then
		runYourScript()
	else
		Status.TextColor3 = Color3.fromRGB(255, 100, 100)
		Status.Text = "❌ Неверный ключ! Попробуйте снова."
	end
end)
