local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
local penguinEvent = workspace:WaitForChild("ChangeCharacter")
local goldEvent = workspace:WaitForChild("ClaimRiverResultsGold")

local MAX_STAGES = 10
local STAGE_DURATION = 0.5   -- u can change with +/- in gui
local GOLD_COLLECT_RADIUS = 40
local GOD_MODE_ENABLED = true
local LOW_GRAVITY = 0

--gold per cycle lol
local GOLD_PER_CYCLE = 100   -- not sure if thats correct

local originalGravity = workspace.Gravity
local farming = false
local russian = false
local rainbowThread = nil
local hintRainbowThread = nil

--Gold/h tests?
local cycleStartTime = 0
local goldPerHour = 0
local totalCycles = 0
local totalGold = 0
local startFarmTime = 0   

-- ==================== ScreenGui ====================
local gui = Instance.new("ScreenGui")
gui.Name = "GoldFarmGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ==================== Main screen ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 220)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Visible = true
MainFrame.Parent = gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
MainGradient.Parent = MainFrame

local TitleBar = Instance.new("TextButton")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
TitleBar.Text = "Gold Farm  |  By: Error"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextScaled = true
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Color = Color3.fromRGB(255, 200, 100)
TitleStroke.Thickness = 1.5
TitleStroke.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -28, 0, 2)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0.5, 0)
CloseCorner.Parent = CloseBtn

local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0, 40, 0, 28)
langBtn.Position = UDim2.new(0, 8, 0, 38)
langBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
langBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
langBtn.TextScaled = true
langBtn.Font = Enum.Font.SourceSansBold
langBtn.Text = "RU"
langBtn.Parent = MainFrame

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 6)
LangCorner.Parent = langBtn

local LangStroke = Instance.new("UIStroke")
LangStroke.Color = Color3.fromRGB(150, 180, 255)
LangStroke.Thickness = 1
LangStroke.Parent = langBtn

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 230, 0, 40)
btn.Position = UDim2.new(0, 55, 0, 38)
btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextScaled = true
btn.Font = Enum.Font.SourceSansBold
btn.Text = "Afk Farm: OFF"
btn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = btn

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Color = Color3.fromRGB(255, 180, 180)
BtnStroke.Thickness = 1.5
BtnStroke.Parent = btn

local durationLabel = Instance.new("TextLabel")
durationLabel.Size = UDim2.new(0, 40, 0, 24)
durationLabel.Position = UDim2.new(0, 10, 0, 90)
durationLabel.BackgroundTransparency = 1
durationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
durationLabel.TextScaled = true
durationLabel.Font = Enum.Font.SourceSansBold
durationLabel.Text = string.format("%.1f", STAGE_DURATION)
durationLabel.Parent = MainFrame

local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 24, 0, 24)
minusBtn.Position = UDim2.new(0, 55, 0, 90)
minusBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.TextScaled = true
minusBtn.Font = Enum.Font.SourceSansBold
minusBtn.Text = "-"
minusBtn.Parent = MainFrame

local MinusCorner = Instance.new("UICorner")
MinusCorner.CornerRadius = UDim.new(0, 5)
MinusCorner.Parent = minusBtn

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 24, 0, 24)
plusBtn.Position = UDim2.new(0, 85, 0, 90)
plusBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.TextScaled = true
plusBtn.Font = Enum.Font.SourceSansBold
plusBtn.Text = "+"
plusBtn.Parent = MainFrame

local PlusCorner = Instance.new("UICorner")
PlusCorner.CornerRadius = UDim.new(0, 5)
PlusCorner.Parent = plusBtn

local speedHintLabel = Instance.new("TextLabel")
speedHintLabel.Size = UDim2.new(0, 110, 0, 24)
speedHintLabel.Position = UDim2.new(0, 115, 0, 90)
speedHintLabel.BackgroundTransparency = 1
speedHintLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedHintLabel.TextScaled = true
speedHintLabel.Font = Enum.Font.SourceSans
speedHintLabel.Text = "0.5 is normal"
speedHintLabel.Parent = MainFrame

local resetHintLabel = Instance.new("TextLabel")
resetHintLabel.Size = UDim2.new(0, 310, 0, 20)
resetHintLabel.Position = UDim2.new(0, 10, 0, 118)
resetHintLabel.BackgroundTransparency = 1
resetHintLabel.TextColor3 = Color3.fromRGB(255, 230, 150)
resetHintLabel.TextScaled = true
resetHintLabel.Font = Enum.Font.SourceSans
resetHintLabel.Text = "if gold didn't reset, press + 2 times"
resetHintLabel.Parent = MainFrame

local fixBtn = Instance.new("TextButton")
fixBtn.Size = UDim2.new(0, 120, 0, 28)
fixBtn.Position = UDim2.new(0, 10, 0, 145)
fixBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 30)
fixBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fixBtn.TextScaled = true
fixBtn.Font = Enum.Font.SourceSansBold
fixBtn.Text = "Fix Spawn"
fixBtn.Parent = MainFrame

local FixCorner = Instance.new("UICorner")
FixCorner.CornerRadius = UDim.new(0, 6)
FixCorner.Parent = fixBtn

local FixStroke = Instance.new("UIStroke")
FixStroke.Color = Color3.fromRGB(255, 200, 100)
FixStroke.Thickness = 1.2
FixStroke.Parent = fixBtn

--Gold/h
local goldLabel = Instance.new("TextLabel")
goldLabel.Size = UDim2.new(0, 200, 0, 24)
goldLabel.Position = UDim2.new(0, 135, 0, 145)
goldLabel.BackgroundTransparency = 1
goldLabel.TextColor3 = Color3.fromRGB(255, 255, 150)
goldLabel.TextScaled = true
goldLabel.Font = Enum.Font.SourceSansBold
goldLabel.Text = "Gold/h: 0"
goldLabel.Parent = MainFrame

-- version
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(0, 60, 0, 16)
versionLabel.Position = UDim2.new(1, -65, 1, -18)
versionLabel.BackgroundTransparency = 1
versionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
versionLabel.TextScaled = true
versionLabel.Font = Enum.Font.SourceSans
versionLabel.Text = "Ver. 2.5"
versionLabel.Parent = MainFrame

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 40, 0, 40)
OpenButton.Position = UDim2.new(0, 10, 1, -50)
OpenButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
OpenButton.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenButton.TextScaled = true
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.Text = "G"
OpenButton.Visible = false
OpenButton.Parent = gui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 10)
OpenCorner.Parent = OpenButton

local hintLabel = Instance.new("TextLabel")
hintLabel.Size = UDim2.new(0, 300, 0, 36)
hintLabel.Position = UDim2.new(0.5, -150, 0, 8)
hintLabel.BackgroundTransparency = 1
hintLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hintLabel.TextScaled = true
hintLabel.Font = Enum.Font.SourceSansBold
hintLabel.Text = "To Open Press G"
hintLabel.Visible = false
hintLabel.Parent = gui

local HintStroke = Instance.new("UIStroke")
HintStroke.Color = Color3.fromRGB(0, 0, 0)
HintStroke.Thickness = 2
HintStroke.Parent = hintLabel

-- ==================== other ui thing ====================
local isDragging = false
local dragStartPos = Vector2.new()
local frameStartPos = nil

TitleBar.MouseButton1Down:Connect(function()
    if not MainFrame.Visible then return end
    isDragging = true
    dragStartPos = UIS:GetMouseLocation()
    frameStartPos = MainFrame.Position
end)

TitleBar.MouseButton1Up:Connect(function()
    isDragging = false
end)

UIS.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = UIS:GetMouseLocation() - dragStartPos
        MainFrame.Position = UDim2.new(
            frameStartPos.X.Scale,
            frameStartPos.X.Offset + delta.X,
            frameStartPos.Y.Scale,
            frameStartPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- ==================== logic ====================
local function updateGoldPerHour()
    if not farming then
        goldLabel.Text = russian and "Золото/ч: 0" or "Gold/h: 0"
        return
    end

    local now = tick()
    if startFarmTime == 0 then
        startFarmTime = now
    end

    if cycleStartTime > 0 then
        local cycleTime = now - cycleStartTime
        if cycleTime > 0 then
            goldPerHour = math.floor((GOLD_PER_CYCLE * 3600) / cycleTime)
        end
    end

    if (now - cycleStartTime) > 5 then
        local totalTime = now - startFarmTime
        if totalTime > 0 then
            goldPerHour = math.floor((totalGold * 3600) / totalTime)
        end
    end

    goldLabel.Text = (russian and "Золото/ч: " or "Gold/h: ") .. goldPerHour
end

local function updateUI()
    if russian then
        TitleBar.Text = "Фарм Золота  |  От: Error"
        if farming then
            btn.Text = "Афк Фарм: ВКЛ"
        else
            btn.Text = "Афк Фарм: ВЫКЛ"
            btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        end
        langBtn.Text = "EN"
        speedHintLabel.Text = "0.5 норм"
        hintLabel.Text = "Чтобы открыть нажми G"
        resetHintLabel.Text = "Если золото не появится, нажми + 2 раза"
        fixBtn.Text = "Исправить спавн"
    else
        TitleBar.Text = "Gold Farm  |  By: Error"
        if farming then
            btn.Text = "Afk Farm: ON"
        else
            btn.Text = "Afk Farm: OFF"
            btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        end
        langBtn.Text = "RU"
        speedHintLabel.Text = "0.5 is normal"
        hintLabel.Text = "To Open Press G"
        resetHintLabel.Text = "if gold didn't reset, press + 2 times"
        fixBtn.Text = "Fix Spawn"
    end
    durationLabel.Text = string.format("%.1f", STAGE_DURATION)
    updateGoldPerHour()
end

langBtn.MouseButton1Click:Connect(function()
    russian = not russian
    updateUI()
end)

minusBtn.MouseButton1Click:Connect(function()
    STAGE_DURATION = math.max(0.1, STAGE_DURATION - 0.1)
    updateUI()
end)

plusBtn.MouseButton1Click:Connect(function()
    STAGE_DURATION = math.min(5.0, STAGE_DURATION + 0.1)
    updateUI()
end)

fixBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        pcall(function()
            char.Humanoid.MaxHealth = 100
            char.Humanoid.Health = 0
        end)
        if char:FindFirstChild("HumanoidRootPart") and char.Humanoid.Health > 0 then
            pcall(function() char:BreakJoints() end)
        end
        if farming then
            workspace.Gravity = originalGravity
        end
    end
end)

local function startRainbow()
    local hue = 0
    while farming do
        local color = Color3.fromHSV(hue % 1, 1, 1)
        btn.BackgroundColor3 = color
        hue = hue + 0.01
        task.wait(0.05)
    end
end

local function stopRainbow()
    if rainbowThread then
        pcall(function() coroutine.close(rainbowThread) end)
        rainbowThread = nil
    end
end

local function startHintRainbow()
    local hue = 0
    while hintLabel.Visible do
        local color = Color3.fromHSV(hue % 1, 1, 1)
        hintLabel.TextColor3 = color
        hue = hue + 0.01
        task.wait(0.05)
    end
end

local function stopHintRainbow()
    if hintRainbowThread then
        pcall(function() coroutine.close(hintRainbowThread) end)
        hintRainbowThread = nil
    end
end

local function isAlive(char)
    return char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0
end

local function applyGodMode(char)
    if not GOD_MODE_ENABLED then return end
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        pcall(function()
            hum.MaxHealth = 1e9
            hum.Health = 1e9
        end)
    end
end

local function collectGoldNearby(char)
    if not isAlive(char) then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local goldNames = {"gold", "goldnugget", "coin", "money", "ingot", "goldpiece"}
    local function isGoldPart(p)
        if not p:IsA("BasePart") then return false end
        local n = p.Name:lower()
        for _, kw in ipairs(goldNames) do
            if n:find(kw) then return true end
        end
        if p.Parent and p.Parent ~= workspace then
            local pn = p.Parent.Name:lower()
            for _, kw in ipairs(goldNames) do
                if pn:find(kw) then return true end
            end
        end
        return false
    end

    for _, part in ipairs(workspace:GetDescendants()) do
        if isGoldPart(part) and (part.Position - hrp.Position).Magnitude <= GOLD_COLLECT_RADIUS then
            pcall(function()
                firetouchinterest(hrp, part, 0)
                firetouchinterest(hrp, part, 1)
            end)
        end
    end

    local statueNames = {"gold", "statue", "treasure", "chest"}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ClickDetector") then
            local parent = obj.Parent
            if parent and parent:IsA("BasePart") then
                local n = parent.Name:lower()
                for _, kw in ipairs(statueNames) do
                    if n:find(kw) and (parent.Position - hrp.Position).Magnitude <= GOLD_COLLECT_RADIUS then
                        pcall(function() fireclickdetector(obj, 50) end)
                        break
                    end
                end
            end
        end
    end
end

local function farmLoop()
    startFarmTime = tick()
    totalGold = 0
    totalCycles = 0

    while farming do
        cycleStartTime = tick()   
        repeat task.wait(0.1) until not farming or (player.Character and isAlive(player.Character))
        if not farming then break end

        local char = player.Character
        applyGodMode(char)

        for i = 1, MAX_STAGES do
            if not farming then break end

            local success = false
            repeat
                if not isAlive(player.Character) then
                    repeat task.wait(0.1) until not farming or isAlive(player.Character)
                    if not farming then break end
                    char = player.Character
                    applyGodMode(char)
                end

                local stageName = "CaveStage"..i
                local darknessPart = stages:FindFirstChild(stageName) and stages[stageName]:FindFirstChild("DarknessPart")

                if not darknessPart then
                    task.wait(0.5)
                    continue
                end

                char.HumanoidRootPart.CFrame = darknessPart.CFrame
                task.wait(0.05)
                if isAlive(char) then
                    collectGoldNearby(char)
                end

                local startTime = tick()
                while (tick() - startTime) < STAGE_DURATION and farming do
                    if not isAlive(player.Character) then break end
                    task.wait(0.05)
                end

                if isAlive(player.Character) then
                    success = true
                end
            until success or not farming

            if farming and success and isAlive(player.Character) then
                pcall(function() goldEvent:FireServer() end)
            end
        end

        totalCycles = totalCycles + 1
        totalGold = totalGold + GOLD_PER_CYCLE

        if farming then
            char = player.Character
            if char and isAlive(char) then
                char.Humanoid.Health = 0
            end
            repeat task.wait(0.1) until not farming or isAlive(player.Character)
        end
    end
end

-- update Gold/h
spawn(function()
    while true do
        updateGoldPerHour()
        task.wait(1)
    end
end)

local function stopFarmSafe()
    if farming then
        farming = false
        updateUI()
        workspace.Gravity = originalGravity
        stopRainbow()
        btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    end
end

local function closeWindow()
    stopFarmSafe()
    MainFrame.Visible = false
    OpenButton.Visible = true
    hintLabel.Visible = true
    stopHintRainbow()
    hintRainbowThread = coroutine.create(startHintRainbow)
    coroutine.resume(hintRainbowThread)
end

local function openWindow()
    MainFrame.Visible = true
    OpenButton.Visible = false
    hintLabel.Visible = false
    stopHintRainbow()
end

CloseBtn.MouseButton1Click:Connect(closeWindow)
OpenButton.MouseButton1Click:Connect(openWindow)

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G then
        if not MainFrame.Visible then
            openWindow()
        end
    end
end)

btn.MouseButton1Click:Connect(function()
    if not farming then
        farming = true
        updateUI()
        workspace.Gravity = LOW_GRAVITY
        task.spawn(farmLoop)
        rainbowThread = coroutine.create(startRainbow)
        coroutine.resume(rainbowThread)
    else
        farming = false
        updateUI()
        workspace.Gravity = originalGravity
        stopRainbow()
        btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
        end
    end
end)

player.CharacterAdded:Connect(function(char) end)
updateUI()
