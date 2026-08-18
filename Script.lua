-- Сервисы Roblox
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Получение папки для GUI
local targetParent = LocalPlayer:WaitForChild("PlayerGui")
pcall(function()
    if syn or Krnl or fluxus or gethui then
        targetParent = gethui() or CoreGui
    end
end)

-- Создание ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LQDSOFT_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = targetParent

-- Текст подсказки сверху посередине (Яркий неоновый цвет)
local TopHint = Instance.new("TextLabel")
TopHint.Name = "TopHint"
TopHint.Size = UDim2.new(0, 300, 0, 30)
TopHint.Position = UDim2.new(0.5, -150, 0, 15)
TopHint.BackgroundTransparency = 1
TopHint.Text = "Нажми на G чтобы открыть"
TopHint.TextColor3 = Color3.fromRGB(0, 255, 128)
TopHint.TextSize = 18
TopHint.Font = Enum.Font.SourceSansBold
TopHint.Visible = false
TopHint.Parent = ScreenGui

-- Круглая желтая кнопка "G" снизу слева для телефонов
local MobileOpenBtn = Instance.new("TextButton")
MobileOpenBtn.Name = "MobileOpenBtn"
MobileOpenBtn.Size = UDim2.new(0, 65, 0, 65)
MobileOpenBtn.Position = UDim2.new(0, 20, 1, -85)
MobileOpenBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MobileOpenBtn.Text = "G"
MobileOpenBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
MobileOpenBtn.Font = Enum.Font.SourceSansBold
MobileOpenBtn.TextSize = 32
MobileOpenBtn.Visible = false
MobileOpenBtn.Parent = ScreenGui

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = MobileOpenBtn
-- Идеально ровный контейнер меню (Высота увеличена до 270 для новой кнопки)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 310, 0, 270)
MainFrame.Position = UDim2.new(0.5, -155, 0.5, -135)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Верхняя панель (Оранжевая)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Фарм Золота | LQDSOFT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -31, 0.5, -13)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

local FarmBtn = Instance.new("TextButton")
FarmBtn.Name = "FarmBtn"
FarmBtn.Size = UDim2.new(1, -20, 0, 40)
FarmBtn.Position = UDim2.new(0, 10, 0, 45)
FarmBtn.BackgroundColor3 = Color3.fromRGB(230, 90, 90)
FarmBtn.Text = "Афк Фарм: ВЫКЛ"
FarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmBtn.Font = Enum.Font.SourceSansBold
FarmBtn.TextSize = 18
FarmBtn.Parent = MainFrame

local EspBtn = Instance.new("TextButton")
EspBtn.Name = "EspBtn"
EspBtn.Size = UDim2.new(1, -20, 0, 32)
EspBtn.Position = UDim2.new(0, 10, 0, 92)
EspBtn.BackgroundColor3 = Color3.fromRGB(230, 90, 90)
EspBtn.Text = "Esp: ВЫКЛ"
EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBtn.Font = Enum.Font.SourceSansBold
EspBtn.TextSize = 14
EspBtn.Parent = MainFrame

-- ДОБАВЛЕНО: Кнопка включения Анти-АФК в меню
local AntiAfkBtn = Instance.new("TextButton")
AntiAfkBtn.Name = "AntiAfkBtn"
AntiAfkBtn.Size = UDim2.new(1, -20, 0, 32)
AntiAfkBtn.Position = UDim2.new(0, 10, 0, 130)
AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(230, 90, 90)
AntiAfkBtn.Text = "Анти АФК: ВЫКЛ"
AntiAfkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAfkBtn.Font = Enum.Font.SourceSansBold
AntiAfkBtn.TextSize = 14
AntiAfkBtn.Parent = MainFrame
local DelayLabel = Instance.new("TextLabel")
DelayLabel.Name = "DelayLabel"
DelayLabel.Size = UDim2.new(0, 35, 0, 30)
DelayLabel.Position = UDim2.new(0, 10, 0, 168)
DelayLabel.BackgroundTransparency = 1
DelayLabel.Text = "2.0"
DelayLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DelayLabel.TextSize = 16
DelayLabel.Font = Enum.Font.SourceSansBold
DelayLabel.Parent = MainFrame

local MinusBtn = Instance.new("TextButton")
MinusBtn.Name = "MinusBtn"
MinusBtn.Size = UDim2.new(0, 26, 0, 26)
MinusBtn.Position = UDim2.new(0, 48, 0, 170)
MinusBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
MinusBtn.Text = "-"
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.Font = Enum.Font.SourceSansBold
MinusBtn.TextSize = 16
MinusBtn.Parent = MainFrame

local PlusBtn = Instance.new("TextButton")
PlusBtn.Name = "PlusBtn"
PlusBtn.Size = UDim2.new(0, 26, 0, 26)
PlusBtn.Position = UDim2.new(0, 80, 0, 170)
PlusBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.Font = Enum.Font.SourceSansBold
PlusBtn.TextSize = 16
PlusBtn.Parent = MainFrame

local RectangleLabel = Instance.new("TextLabel")
RectangleLabel.Name = "NormLabel"
RectangleLabel.Size = UDim2.new(0, 80, 0, 30)
RectangleLabel.Position = UDim2.new(0, 115, 0, 168)
RectangleLabel.BackgroundTransparency = 1
RectangleLabel.Text = "2.0 норм"
RectangleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
RectangleLabel.TextSize = 14
RectangleLabel.Font = Enum.Font.SourceSans
RectangleLabel.TextXAlignment = Enum.TextXAlignment.Left
RectangleLabel.Parent = MainFrame

local FixSpawnBtn = Instance.new("TextButton")
FixSpawnBtn.Name = "FixSpawnBtn"
FixSpawnBtn.Size = UDim2.new(0, 120, 0, 28)
FixSpawnBtn.Position = UDim2.new(0, 10, 0, 202)
FixSpawnBtn.BackgroundColor3 = Color3.fromRGB(230, 120, 30)
FixSpawnBtn.Text = "Исправить спавн"
FixSpawnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FixSpawnBtn.Font = Enum.Font.SourceSansBold
FixSpawnBtn.TextSize = 13
FixSpawnBtn.Parent = MainFrame

local DestroyBtn = Instance.new("TextButton")
DestroyBtn.Name = "DestroyBtn"
DestroyBtn.Size = UDim2.new(0, 120, 0, 28)
DestroyBtn.Position = UDim2.new(0, 10, 0, 235)
DestroyBtn.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
DestroyBtn.Text = "Выгрузить чит"
DestroyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyBtn.Font = Enum.Font.SourceSansBold
DestroyBtn.TextSize = 13
DestroyBtn.Parent = MainFrame

local autofarmActive = false
local espActive = false
local antiAfkActive = false -- Переключатель Анти-АФК
local currentDelay = 2.0
local scriptRunning = true

local goldTracker = Instance.new("TextLabel")
goldTracker.Name = "GoldTracker"
goldTracker.Size = UDim2.new(0, 130, 0, 25)
goldTracker.Position = UDim2.new(1, -145, 0, 202)
goldTracker.BackgroundTransparency = 1
goldTracker.Text = "Золото/ч: 0"
goldTracker.TextColor3 = Color3.fromRGB(255, 255, 255)
goldTracker.TextSize = 14
goldTracker.Font = Enum.Font.SourceSansBold
goldTracker.TextXAlignment = Enum.TextXAlignment.Left
goldTracker.Parent = MainFrame

local goldPerMinTracker = Instance.new("TextLabel")
goldPerMinTracker.Name = "GoldPerMinTracker"
goldPerMinTracker.Size = UDim2.new(0, 130, 0, 25)
goldPerMinTracker.Position = UDim2.new(1, -145, 0, 228)
goldPerMinTracker.BackgroundTransparency = 1
goldPerMinTracker.Text = "Золото/мин: 0"
goldPerMinTracker.TextColor3 = Color3.fromRGB(255, 255, 255)
goldPerMinTracker.TextSize = 14
goldPerMinTracker.Font = Enum.Font.SourceSansBold
goldPerMinTracker.TextXAlignment = Enum.TextXAlignment.Left
goldPerMinTracker.Parent = MainFrame

-- Таймер на 20 секунд со сбросом
task.spawn(function()
    local intervalStartTime = os.time()
    local intervalStartGold = LocalPlayer:WaitForChild("Data"):WaitForChild("Gold").Value
    while scriptRunning do
        task.wait(0.5)
        local currentGold = LocalPlayer.Data.Gold.Value
        local secondsInInterval = os.time() - intervalStartTime
        if secondsInInterval >= 20 then
            intervalStartTime = os.time()
            intervalStartGold = currentGold
            secondsInInterval = 0
            goldTracker.Text = "Золото/ч: 0"
            goldPerMinTracker.Text = "Золото/мин: 0"
        end
        if secondsInInterval > 0 and (currentGold - intervalStartGold) > 0 then
            local goldEarned = currentGold - intervalStartGold
            goldTracker.Text = "Золото/ч: " .. tostring(math.floor(goldEarned / (secondsInInterval / 3600)))
            goldPerMinTracker.Text = "Золото/мин: " .. tostring(math.floor(goldEarned / (secondsInInterval / 60)))
        end
    end
end)
local function setGuiVisible(state)
    MainFrame.Visible = state
    TopHint.Visible = not state
    MobileOpenBtn.Visible = not state
end

CloseBtn.MouseButton1Click:Connect(function() setGuiVisible(false) end)
MobileOpenBtn.MouseButton1Click:Connect(function() setGuiVisible(true) end)

MinusBtn.MouseButton1Click:Connect(function()
    if currentDelay > 0.1 then
        currentDelay = math.round((currentDelay - 0.1) * 10) / 10
        DelayLabel.Text = tostring(currentDelay)
        RectangleLabel.Text = tostring(currentDelay) .. " норм"
    end
end)

PlusBtn.MouseButton1Click:Connect(function()
    if currentDelay < 5.0 then
        currentDelay = math.round((currentDelay + 0.1) * 10) / 10
        DelayLabel.Text = tostring(currentDelay)
        RectangleLabel.Text = tostring(currentDelay) .. " норм"
    end
end)

local inputConnection
inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not scriptRunning then if inputConnection then inputConnection:Disconnect() end return end
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        setGuiVisible(not MainFrame.Visible)
    end
end)

local function executeCharacterReset()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.Health = 0 end
end

FixSpawnBtn.MouseButton1Click:Connect(executeCharacterReset)

local function clearAllEsp()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            if p.Character:FindFirstChild("LqdEspGui") then p.Character.LqdEspGui:Destroy() end
            if p.Character:FindFirstChild("LqdHighlight") then p.Character.LqdHighlight:Destroy() end
        end
    end
end

local antiAfkConnection

DestroyBtn.MouseButton1Click:Connect(function()
    scriptRunning = false
    autofarmActive = false
    espActive = false
    antiAfkActive = false
    clearAllEsp()
    local camera = Workspace.CurrentCamera
    if camera then camera.CameraType = Enum.CameraType.Custom end
    if inputConnection then inputConnection:Disconnect() end
    if antiAfkConnection then antiAfkConnection:Disconnect() end
    ScreenGui:Destroy()
end)

local function getPlayerGold(player)
    if not player then return 0 end
    local stats = player:FindFirstChild("leaderstats")
    if stats then
        local gold = stats:FindFirstChild("Gold") or stats:FindFirstChild("Золото") or stats:FindFirstChild("gold")
        if gold then return gold.Value end
    end
    local dataFolder = player:FindFirstChild("Data") or player:FindFirstChild("data")
    if dataFolder then
        local gold = dataFolder:FindFirstChild("Gold") or dataFolder:FindFirstChild("GoldValue")
        if gold then return gold.Value end
    end
    return 0
end

task.spawn(function()
    while scriptRunning do
        task.wait(0.5)
        if espActive then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local highlight = player.Character:FindFirstChild("LqdHighlight")
                    if not highlight then
                        highlight = Instance.new("Highlight")
                        highlight.Name = "LqdHighlight"
                        highlight.FillColor = Color3.fromRGB(0, 255, 255)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = player.Character
                    end
                    if player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        local espGui = player.Character:FindFirstChild("LqdEspGui")
                        if not espGui then
                            espGui = Instance.new("BillboardGui")
                            espGui.Name = "LqdEspGui"
                            espGui.Size = UDim2.new(0, 200, 0, 40)
                            espGui.AlwaysOnTop = true
                            pcall(function() espGui.ExtentsOffset = Vector3.new(0, 2.5, 0) end)
                            espGui.Parent = player.Character
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Name = "EspText"
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
                            textLabel.TextSize = 16
                            textLabel.Font = Enum.Font.SourceSansBold
                            textLabel.Parent = espGui
                        end
                        local playerGold = getPlayerGold(player)
                        if espGui:FindFirstChild("EspText") then
                            espGui.EspText.Text = player.Name .. "\n[Золото: " .. tostring(playerGold) .. "]"
                        end
                    end
                end
            end
        else
            clearAllEsp()
        end
    end
end)

EspBtn.MouseButton1Click:Connect(function()
    if not scriptRunning then return end
    espActive = not espActive
    if espActive then
        EspBtn.Text = "Esp: ВКЛ"
        EspBtn.BackgroundColor3 = Color3.fromRGB(90, 200, 90)
    else
        EspBtn.Text = "Esp: ВЫКЛ"
        EspBtn.BackgroundColor3 = Color3.fromRGB(230, 90, 90)
        clearAllEsp()
    end
end)
local function forceMoveFrame(targetCFrame)
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local camera = Workspace.CurrentCamera
    if root and targetCFrame and autofarmActive and scriptRunning then
        if camera then
            camera.CameraType = Enum.CameraType.Scriptable
            camera.CFrame = CFrame.new(targetCFrame.Position + Vector3.new(0, 15, 25), targetCFrame.Position)
        end
        local duration = currentDelay
        local startTime = tick()
        while tick() - startTime < duration do
            if not autofarmActive or not scriptRunning then break end
            root.CFrame = targetCFrame + Vector3.new(0, 3, 0)
            root.Velocity = Vector3.new(0,0,0)
            if camera then
                camera.CFrame = CFrame.new(targetCFrame.Position + Vector3.new(0, 15, 25), targetCFrame.Position)
            end
            RunService.Heartbeat:Wait()
        end
    end
end

local function getPhysicalStages()
    local stages = {}
    for _, desc in pairs(Workspace:GetDescendants()) do
        if desc:IsA("BasePart") and (desc.Name == "DarknessPart" or desc.Name == "Trigger" or desc.Name:lower():find("stage")) then
            if desc.Parent and (desc.Parent.Name:lower():find("stage") or desc.Parent.Name:lower():find("zone")) then
                table.insert(stages, desc)
            end
        end
    end
    table.sort(stages, function(a, b)
        return a.Position.Z < b.Position.Z
    end)
    return stages
end

task.spawn(function()
    while scriptRunning do
        task.wait(0.1)
        if autofarmActive and scriptRunning then
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if char and hum and hum.Health > 0 and root then
                
                local mapStages = getPhysicalStages()
                
                if #mapStages > 0 then
                    local count = 0
                    for _, stagePart in pairs(mapStages) do
                        if not autofarmActive or not scriptRunning or hum.Health <= 0 then break end
                        if count >= 10 then break end
                        
                        if stagePart and stagePart.Parent then
                            forceMoveFrame(stagePart.CFrame)
                            count = count + 1
                        end
                    end
                else
                    local boatStages = Workspace:FindFirstChild("BoatStages") or Workspace:FindFirstChild("Stages")
                    local normalStages = boatStages and (boatStages:FindFirstChild("NormalStages") or boatStages)
                    if normalStages then
                        for i = 1, 10 do
                            if not autofarmActive or not scriptRunning or hum.Health <= 0 then break end
                            local stage = normalStages:FindFirstChild("CaveStage" .. i) or normalStages:FindFirstChild("Stage" .. i)
                            local trigger = stage and (stage:FindFirstChild("DarknessPart") or stage:FindFirstChild("Trigger"))
                            if trigger then forceMoveFrame(trigger.CFrame) end
                        end
                    end
                end
                
                local endZone = Workspace:FindFirstChild("TheEnd") or Workspace:FindFirstChild("End")
                local chest = endZone and (endZone:FindFirstChild("GoldenChest") or endZone:FindFirstChild("Chest"))
                local chestTop = chest and (chest:FindFirstChild("ChestTop") or chest:FindFirstChild("Main"))
                
                if chestTop and autofarmActive and scriptRunning and hum.Health > 0 then
                    local startTimeChest = tick()
                    local camera = Workspace.CurrentCamera
                    while tick() - startTimeChest < 5.0 do
                        if not autofarmActive or not scriptRunning then break end
                        root.CFrame = chestTop.CFrame + Vector3.new(0, 2, 0)
                        if camera then camera.CFrame = CFrame.new(chestTop.Position + Vector3.new(0, 10, 15), chestTop.Position) end
                        RunService.Heartbeat:Wait()
                    end
                end
                
                if autofarmActive and scriptRunning and hum.Health > 0 then
                    local camera = Workspace.CurrentCamera
                    if camera then camera.CameraType = Enum.CameraType.Custom end
                    executeCharacterReset() 
                    LocalPlayer.CharacterAdded:Wait()
                    task.wait(1.5)
                end
            end
        end
    end
end)

FarmBtn.MouseButton1Click:Connect(function()
    if not scriptRunning then return end
    autofarmActive = not autofarmActive
    if autofarmActive then
        FarmBtn.Text = "Афк Фарм: ВКЛ"
        FarmBtn.BackgroundColor3 = Color3.fromRGB(90, 200, 90)
    else
        FarmBtn.Text = "Афк Фарм: ВЫКЛ"
        FarmBtn.BackgroundColor3 = Color3.fromRGB(230, 90, 90)
        local camera = Workspace.CurrentCamera
        if camera then camera.CameraType = Enum.CameraType.Custom end
        executeCharacterReset()
    end
end)

-- Логика переключения кнопки Анти-АФК
AntiAfkBtn.MouseButton1Click:Connect(function()
    if not scriptRunning then return end
    antiAfkActive = not antiAfkActive
    if antiAfkActive then
        AntiAfkBtn.Text = "Анти АФК: ВКЛ"
        AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(90, 200, 90)
    else
        AntiAfkBtn.Text = "Анти АФК: ВЫКЛ"
        AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(230, 90, 90)
    end
end)

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)

TopBar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then update(input) end end)

pcall(function()
    antiAfkConnection = LocalPlayer.Idled:Connect(function()
        if antiAfkActive then
            local virtualUser = game:GetService("VirtualUser")
            virtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
            task.wait(0.2)
            virtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        end
    end)
end)
