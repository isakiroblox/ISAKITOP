local P=game:GetService("Players")local S=game:GetService("StarterGui")local p=P.LocalPlayer
local g=Instance.new("ScreenGui")g.Name="UniqueKeySystem"g.ResetOnSpawn=false
g.Parent=p:WaitForChild("PlayerGui")
local f=Instance.new("Frame",g)
f.Size=UDim2.new(0,420,0,280)
f.Position=UDim2.new(0.5,-210,0.5,-140)
f.BackgroundColor3=Color3.fromRGB(20,20,30)
f.BorderSizePixel=0
f.ClipsDescendants=true
local c=Instance.new("UICorner",f)c.CornerRadius=UDim.new(0,16)
local gr=Instance.new("UIGradient",f)
gr.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(55,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,255,255))}
local t=Instance.new("TextLabel",f)
t.Size=UDim2.new(1,0,0,40)
t.Position=UDim2.new(0,0,0,10)
t.BackgroundTransparency=1
t.Text="🔐 Введите ключ для доступа"
t.TextColor3=Color3.fromRGB(240,240,240)
t.Font=Enum.Font.GothamBold
t.TextScaled=true
local tb=Instance.new("TextBox",f)
tb.PlaceholderText="Введите ключ здесь..."
tb.Size=UDim2.new(0.85,0,0,45)
tb.Position=UDim2.new(0.075,0,0,70)
tb.BackgroundColor3=Color3.fromRGB(35,35,45)
tb.TextColor3=Color3.fromRGB(230,230,230)
tb.Font=Enum.Font.GothamSemibold
tb.TextScaled=true
tb.ClearTextOnFocus=false
tb.Text=""
Instance.new("UICorner",tb).CornerRadius=UDim.new(0,10)
local st=Instance.new("TextLabel",f)
st.Size=UDim2.new(1,-20,0,30)
st.Position=UDim2.new(0,10,0,125)
st.BackgroundTransparency=1
st.Text=""
st.TextColor3=Color3.fromRGB(255,100,100)
st.Font=Enum.Font.GothamBold
st.TextScaled=true
st.TextWrapped=true
local ch=Instance.new("TextButton",f)
ch.Size=UDim2.new(0.6,0,0,50)
ch.Position=UDim2.new(0.075,0,0,170)
ch.BackgroundColor3=Color3.fromRGB(0,200,100)
ch.Text="Проверить ключ"
ch.TextColor3=Color3.fromRGB(255,255,255)
ch.Font=Enum.Font.GothamBold
ch.TextScaled=true
Instance.new("UICorner",ch).CornerRadius=UDim.new(0,12)
local gk=Instance.new("TextButton",f)
gk.Size=UDim2.new(0.3,0,0,50)
gk.Position=UDim2.new(0.7,0,0,170)
gk.BackgroundColor3=Color3.fromRGB(0,130,255)
gk.Text="Получить ключ"
gk.TextColor3=Color3.fromRGB(255,255,255)
gk.Font=Enum.Font.GothamBold
gk.TextScaled=true
Instance.new("UICorner",gk).CornerRadius=UDim.new(0,12)
local dc=Instance.new("TextButton",f)
dc.Size=UDim2.new(0.45,-5,0,40)
dc.Position=UDim2.new(0.05,0,0,230)
dc.BackgroundColor3=Color3.fromRGB(88,101,242)
dc.Text="📎 Discord"
dc.TextColor3=Color3.fromRGB(255,255,255)
dc.Font=Enum.Font.GothamBold
dc.TextScaled=true
Instance.new("UICorner",dc).CornerRadius=UDim.new(0,10)
local tg=Instance.new("TextButton",f)
tg.Size=UDim2.new(0.45,-5,0,40)
tg.Position=UDim2.new(0.5,5,0,230)
tg.BackgroundColor3=Color3.fromRGB(0,136,204)
tg.Text="📎 Telegram"
tg.TextColor3=Color3.fromRGB(255,255,255)
tg.Font=Enum.Font.GothamBold
tg.TextScaled=true
Instance.new("UICorner",tg).CornerRadius=UDim.new(0,10)
ch.MouseButton1Click:Connect(function()
    local k=tb.Text
    if k==""then st.Text="⚠️ Введите ключ!" st.TextColor3=Color3.fromRGB(255,165,0) return end
    st.Text="⏳ Проверка ключа..."
    st.TextColor3=Color3.fromRGB(200,200,200)
    local url="https://ajjankeysystem.infinityfreeapp.com/check.php?key="..k
    local s,r=pcall(function()return game:HttpGet(url)end)
    if s and r:lower():find("valid")then
        st.Text="✅ Ключ принят!"
        st.TextColor3=Color3.fromRGB(100,255,100)
        task.wait(1.5)
        g:Destroy()
        -- Основной скрипт, уже обфусцированный (ниже вставь свой код)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/isakiroblox/ISAKITOP/main/ISAKITOP.lua"))()
    else
        st.Text="❌ Неверный ключ!"
        st.TextColor3=Color3.fromRGB(255,80,80)
    end
end)
local function copy(text,msg,col)
    setclipboard(text)
    S:SetCore("ChatMakeSystemMessage",{Text=msg,Color=col,Font=Enum.Font.GothamBold,FontSize=Enum.FontSize.Size18})
end
gk.MouseButton1Click:Connect(function()
    copy("https://ajjankeysystem.infinityfreeapp.com/?hash=pcs5Zs04zOVcutzglF0W8CfGFGeNwDx6HnFmAIAfyC5Oe43ZiXUKnjaYm3XrKVbX&i=1","Ссылка на получение ключа скопирована в буфер обмена!",Color3.fromRGB(0,130,255))
end)
dc.MouseButton1Click:Connect(function()
    copy("https://discord.gg/vVbcqvDK","Ссылка на Discord скопирована в буфер обмена!",Color3.fromRGB(88,101,242))
end)
tg.MouseButton1Click:Connect(function()
    copy("https://t.me/isa_shidaev","Ссылка на Telegram скопирована в буфер обмена!",Color3.fromRGB(0,136,204))
end)
