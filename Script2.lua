if game.CoreGui:FindFirstChild("BABFT_Premium_Hub") then 
    game.CoreGui.BABFT_Premium_Hub:Destroy() 
end

local UserInputService = game:GetService("UserInputService")
local SG = Instance.new("ScreenGui", game.CoreGui)
SG.Name = "BABFT_Premium_Hub"
SG.ResetOnSpawn = false

_G.AutoFarm = false
_G.EspActive = false
_G.AntiAfk = false
_G.SpawnSpeed = 2.0

local Main = Instance.new("Frame", SG)
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 310, 0, 240)
Main.Position = UDim2.new(0.5, -155, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local TopHeader = Instance.new("Frame", Main)
TopHeader.Size = UDim2.new(1, 0, 0, 32)
TopHeader.BackgroundColor3 = Color3.fromRGB(235, 137, 53)
TopHeader.BorderSizePixel = 0

local Title = Instance.new("TextLabel", TopHeader)
Title.Size = UDim2.new(1, -45, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Фарм Золота | LQDSOFT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopHeader)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -26, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(210, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 11
CloseBtn.BorderSizePixel = 0
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

local TopHint = Instance.new("TextLabel", SG)
TopHint.Size = UDim2.new(1, 0, 0, 30)
TopHint.Position = UDim2.new(0, 0, 0, 10)
TopHint.BackgroundTransparency = 1
TopHint.Text = "Нажмите на G, чтобы открыть меню"
TopHint.Font = Enum.Font.SourceSansBold
TopHint.TextSize = 18
TopHint.Visible = false

task.spawn(function()
    while true do
        for i = 0, 1, 0.005 do
            TopHint.TextColor3 = Color3.fromHSV(i, 1, 1)
            task.wait(0.02)
        end
    end
end)

local OpenButton = Instance.new("TextButton", SG)
OpenButton.Position = UDim2.new(0, 15, 1, -65)
OpenButton.Size = UDim2.new(0, 45, 0, 45)
OpenButton.BackgroundColor3 = Color3.fromRGB(235, 137, 53)
OpenButton.Text = "G"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
OpenButton.TextStrokeTransparency = 0
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.TextSize = 26
OpenButton.BorderSizePixel = 0
OpenButton.Visible = false
Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1, 0)

local function SetMenuVisible(state)
    Main.Visible = state
    TopHint.Visible = not state
    OpenButton.Visible = not state
end

CloseBtn.MouseButton1Click:Connect(function() SetMenuVisible(false) end)
OpenButton.MouseButton1Click:Connect(function() SetMenuVisible(true) end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.G then
        SetMenuVisible(not Main.Visible)
    end
end)

local function CreateMenuBtn(text, pos, size, color)
    local btn = Instance.new("TextButton", Main)
    btn.Position = pos
    btn.Size = size
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)
    return btn
end

local ToggleFarm = CreateMenuBtn("Афк Фарм: ВЫКЛ", UDim2.new(0.05, 0, 0.18, 0), UDim2.new(0.9, 0, 0, 30), Color3.fromRGB(215, 85, 85))
local ToggleEsp = CreateMenuBtn("Esp: ВЫКЛ", UDim2.new(0.05, 0, 0.33, 0), UDim2.new(0.9, 0, 0, 26), Color3.fromRGB(215, 85, 85))
local ToggleAfk = CreateMenuBtn("Анти АФК: ВЫКЛ", UDim2.new(0.05, 0, 0.46, 0), UDim2.new(0.9, 0, 0, 26), Color3.fromRGB(215, 85, 85))

local SpeedFrame = Instance.new("Frame", Main)
SpeedFrame.Position = UDim2.new(0.05, 0, 0.59, 0)
SpeedFrame.Size = UDim2.new(0.9, 0, 0, 26)
SpeedFrame.BackgroundTransparency = 1

local SpeedText = Instance.new("TextLabel", SpeedFrame)
SpeedText.Size = UDim2.new(0, 30, 1, 0)
SpeedText.BackgroundTransparency = 1
SpeedText.Text = "2.0"
SpeedText.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedText.Font = Enum.Font.SourceSansBold
SpeedText.TextSize = 14
SpeedText.TextXAlignment = Enum.TextXAlignment.Left

local SpeedMinus = CreateMenuBtn("-", UDim2.new(0, 35, 0, 0), UDim2.new(0, 24, 1, 0), Color3.fromRGB(215, 85, 85))
SpeedMinus.Parent = SpeedFrame

local SpeedPlus = CreateMenuBtn("+", UDim2.new(0, 63, 0, 0), UDim2.new(0, 24, 1, 0), Color3.fromRGB(65, 150, 65))
SpeedPlus.Parent = SpeedFrame

local SpeedNorm = Instance.new("TextLabel", SpeedFrame)
SpeedNorm.Position = UDim2.new(0, 95, 0, 0)
SpeedNorm.Size = UDim2.new(0, 80, 1, 0)
SpeedNorm.BackgroundTransparency = 1
SpeedNorm.Text = "2.0 норм"
SpeedNorm.TextColor3 = Color3.fromRGB(120, 120, 120)
SpeedNorm.Font = Enum.Font.SourceSans
SpeedNorm.TextSize = 13
SpeedNorm.TextXAlignment = Enum.TextXAlignment.Left

SpeedMinus.MouseButton1Click:Connect(function()
    if _G.SpawnSpeed > 0.1 then 
        _G.SpawnSpeed = tonumber(string.format("%.1f", _G.SpawnSpeed - 0.1))
        SpeedText.Text = tostring(_G.SpawnSpeed) 
    end
end)
SpeedPlus.MouseButton1Click:Connect(function()
    if _G.SpawnSpeed < 10 then 
        _G.SpawnSpeed = tonumber(string.format("%.1f", _G.SpawnSpeed + 0.1))
        SpeedText.Text = tostring(_G.SpawnSpeed) 
    end
end)

local FixSpawn = CreateMenuBtn("Исправить спавн", UDim2.new(0.05, 0, 0.72, 0), UDim2.new(0.43, 0, 0, 26), Color3.fromRGB(235, 137, 53))
local UnloadCheat = CreateMenuBtn("Выгрузить чит", UDim2.new(0.05, 0, 0.85, 0), UDim2.new(0.43, 0, 0, 26), Color3.fromRGB(130, 35, 35))

local Stats = Instance.new("Frame", Main)
Stats.Position = UDim2.new(0.52, 0, 0.72, 0)
Stats.Size = UDim2.new(0.43, 0, 0, 55)
Stats.BackgroundTransparency = 1

local Sh = Instance.new("TextLabel", Stats)
Sh.Size = UDim2.new(1, 0, 0.5, 0)
Sh.BackgroundTransparency = 1
Sh.Text = "Золото/ч: 10000"
Sh.TextColor3 = Color3.fromRGB(240, 240, 240)
Sh.Font = Enum.Font.SourceSansBold; Sh.TextSize = 13; Sh.TextXAlignment = Enum.TextXAlignment.Left

local Sm = Instance.new("TextLabel", Stats)
Sm.Position = UDim2.new(0, 0, 0.5, 0)
Sm.Size = UDim2.new(1, 0, 0.5, 0)
Sm.BackgroundTransparency = 1
Sm.Text = "Золото/мин: 166"
Sm.TextColor3 = Color3.fromRGB(240, 240, 240)
Sm.Font = Enum.Font.SourceSansBold; Sm.TextSize = 13; Sm.TextXAlignment = Enum.TextXAlignment.Left

ToggleFarm.MouseButton1Click:Connect(function()
    _G.AutoFarm = not _G.AutoFarm
    ToggleFarm.BackgroundColor3 = _G.AutoFarm and Color3.fromRGB(65, 150, 65) or Color3.fromRGB(215, 85, 85)
    ToggleFarm.Text = _G.AutoFarm and "Афк Фарм: ВКЛ" or "Афк Фарм: ВЫКЛ"
    if _G.AutoFarm then 
        if _G.StartExactCaveFarm then _G.StartExactCaveFarm() end 
    else 
        if _G.KillPlayer then _G.KillPlayer() end 
    end
end)

ToggleEsp.MouseButton1Click:Connect(function()
    _G.EspActive = not _G.EspActive
    ToggleEsp.BackgroundColor3 = _G.EspActive and Color3.fromRGB(65, 150, 65) or Color3.fromRGB(215, 85, 85)
    ToggleEsp.Text = _G.EspActive and "Esp: ВКЛ" or "Esp: ВЫКЛ"
    if _G.ToggleESPState then _G.ToggleESPState() end
end)

ToggleAfk.MouseButton1Click:Connect(function()
    _G.AntiAfk = not _G.AntiAfk
    ToggleAfk.BackgroundColor3 = _G.AntiAfk and Color3.fromRGB(65, 150, 65) or Color3.fromRGB(215, 85, 85)
    ToggleAfk.Text = _G.AntiAfk and "Анти АФК: ВКЛ" or "Анти АФК: ВЫКЛ"
end)

FixSpawn.MouseButton1Click:Connect(function() if _G.KillPlayer then _G.KillPlayer() end end)

UnloadCheat.MouseButton1Click:Connect(function()
    _G.AutoFarm = false; _G.EspActive = false; _G.AntiAfk = false
    if _G.ResetGravity then _G.ResetGravity() end
    if _G.CleanupESP then _G.CleanupESP() end
    SG:Destroy()
end)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local NormalGravity = workspace.Gravity

_G.KillPlayer = function()
    workspace.Gravity = NormalGravity
    if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
        LP.Character:FindFirstChildOfClass("Humanoid").Health = 0
    end
end

_G.CleanupESP = function()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            if p.Character:FindFirstChild("ESPHighlight") then p.Character.ESPHighlight:Destroy() end
            if p.Character.Head:FindFirstChild("ESPTag") then p.Character.Head.ESPTag:Destroy() end
        end
    end
end

_G.ResetGravity = function() workspace.Gravity = NormalGravity end

-- ГЛАВНЫЙ ИСПРАВЛЕННЫЙ ДВИЖОК: Полная пошаговая проверка сборки персонажа на спавне
_G.StartExactCaveFarm = function()
    if not _G.AutoFarm then return end
    
    -- Жесткое пошаговое ожидание загрузки персонажа (Предотвращает зависания потока)
    local char = LP.Character or LP.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart", 10)
    local hum = char:WaitForChild("Humanoid", 10)
    
    if root and hum and hum.Health > 0 then
        task.wait(1.5) -- Обязательный легитный тайм-аут прогрузки на спавне базы
        if not _G.AutoFarm then return end
        
        workspace.Gravity = 0 -- Невесомость
        
        local normalStages = workspace:FindFirstChild("BoatStages") and workspace.BoatStages:FindFirstChild("NormalStages")
        if normalStages then
            -- Цикл по вашему ТЗ со скриншота: CaveStage1 – CaveStage10
            for i = 1, 10 do
                if not _G.AutoFarm then break end
                local caveStage = normalStages:FindFirstChild("CaveStage" .. i)
                
                if caveStage and caveStage:FindFirstChild("DarknessPart") then
                    root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    
                    root.CFrame = caveStage.DarknessPart.CFrame
                    task.wait(_G.SpawnSpeed) -- Твоя задержка КД из меню
                end
            end
        end
        
        -- По достижении CaveStage10 — моментальный килл
        if _G.AutoFarm then
            _G.KillPlayer()
        end
    end
end

-- ИСПРАВЛЕНО: Безопасный триггер респавна. Запускает цикл только тогда, когда старый поток полностью очищен
if _G.CharacterConnection then _G.CharacterConnection:Disconnect() end
_G.CharacterConnection = LP.CharacterAdded:Connect(function(char)
    if _G.AutoFarm then
        -- Ждем, пока игра уберет заставку награды и персонаж появится на спавне базы живым
        local hum = char:WaitForChild("Humanoid", 10)
        if hum then
            hum.AncestryChanged:Wait() -- Защита от запуска в мертвом состоянии
            task.wait(1.2)
            _G.StartExactCaveFarm()
        end
    end
end)

-- Высокий синий ESP (+5.0 студов вверх над игроком) по папке Data режима
_G.ToggleESPState = function()
    if _G.EspActive then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                task.spawn(function()
                    local char = p.Character
                    if not char:FindFirstChild("ESPHighlight") then
                        local hl = Instance.new("Highlight", char)
                        hl.Name = "ESPHighlight"
                        hl.FillColor = Color3.fromRGB(0, 110, 255)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.FillTransparency = 0.4
                    end
                    
                    local head = char:WaitForChild("Head", 5)
                    if head and not head:FindFirstChild("ESPTag") then
                        local bg = Instance.new("BillboardGui", head)
                        bg.Name = "ESPTag"; bg.Size = UDim2.new(0, 140, 0, 45); bg.StudsOffset = Vector3.new(0, 5.0, 0); bg.AlwaysOnTop = true
                        local tl = Instance.new("TextLabel", bg)
                        tl.Size = UDim2.new(1, 0, 1, 0); tl.BackgroundTransparency = 1; tl.TextColor3 = Color3.fromRGB(255, 255, 255); tl.Font = Enum.Font.SourceSansBold; tl.TextSize = 13
                        
                        task.spawn(function()
                            while _G.EspActive and char.Parent and head.Parent do
                                local gold = 0
                                if p:FindFirstChild("Data") and p.Data:FindFirstChild("Gold") then
                                    gold = p.Data.Gold.Value
                                end
                                tl.Text = p.DisplayName .. "\n[Золото: " .. tostring(gold) .. "]"
                                task.wait(0.5)
                            end
                        end)
                    end
                end)
            end
        end
    else
        _G.CleanupESP()
    end
end

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function() if _G.EspActive then task.wait(0.5); _G.ToggleESPState() end end)
end)

-- Встроенный фоновый кликер Анти-АФК
if not _G.AntiAfkConnected then
    _G.AntiAfkConnected = true
    LP.Idled:Connect(function()
        if _G.AntiAfk then
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
        end
    end)
end
