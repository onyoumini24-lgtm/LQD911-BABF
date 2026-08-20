-- ==========================================
-- ЧАСТЬ 1: СОЗДАНИЕ ИНТЕРФЕЙСА (UI)
-- ==========================================
_G.ScreenGui = Instance.new("ScreenGui")
_G.MainFrame = Instance.new("Frame")
_G.ToggleButton = Instance.new("TextButton")
_G.UnloadButton = Instance.new("TextButton")
_G.LangButton = Instance.new("TextButton")
_G.CloseXButton = Instance.new("TextButton")
_G.MobileMenuButton = Instance.new("TextButton")
_G.TopHintLabel = Instance.new("TextLabel")

local FrameStroke = Instance.new("UIStroke")
local TitleLabel = Instance.new("TextLabel")
local AuthorLabel = Instance.new("TextLabel")
local MainCorner = Instance.new("UICorner")
local MobileButtonCorner = Instance.new("UICorner")
local TextButtonUIStroke = Instance.new("UIStroke")
local ButtonGlowStroke = Instance.new("UIStroke")
local TextShadow = Instance.new("UIStroke")

_G.ScreenGui.Name = "PremiumAntiAFK_L1TEBRAY"
_G.ScreenGui.Parent = game:GetService("CoreGui")
_G.ScreenGui.ResetOnSpawn = false

-- Главное окно меню (Glassmorphism)
_G.MainFrame.Name = "MainFrame"
_G.MainFrame.Parent = _G.ScreenGui
_G.MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
_G.MainFrame.BackgroundTransparency = 0.15
_G.MainFrame.Position = UDim2.new(0.5, -125, 0.4, -75)
_G.MainFrame.Size = UDim2.new(0, 250, 0, 150)
_G.MainFrame.Active = true
_G.MainFrame.Draggable = true
_G.MainFrame.BorderSizePixel = 0

MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = _G.MainFrame

FrameStroke.Parent = _G.MainFrame
FrameStroke.Color = Color3.fromRGB(60, 60, 75)
FrameStroke.Thickness = 1.2
FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Главный заголовок
TitleLabel.Name = "Title"
TitleLabel.Parent = _G.MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 16, 0, 10)
TitleLabel.Size = UDim2.new(0, 150, 0, 16)
TitleLabel.Font = Enum.Font.BuilderSansBold
TitleLabel.Text = "antiafk universal"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Авторство (by L1TEBRAY)
AuthorLabel.Name = "Author"
AuthorLabel.Parent = _G.MainFrame
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.Position = UDim2.new(0, 16, 0, 24)
AuthorLabel.Size = UDim2.new(0, 150, 0, 12)
AuthorLabel.Font = Enum.Font.BuilderSans
AuthorLabel.Text = "by L1TEBRAY"
AuthorLabel.TextColor3 = Color3.fromRGB(140, 140, 155)
AuthorLabel.TextSize = 10
AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка смены языка
_G.LangButton.Name = "LangButton"
_G.LangButton.Parent = _G.MainFrame
_G.LangButton.BackgroundTransparency = 1
_G.LangButton.Position = UDim2.new(1, -72, 0, 12)
_G.LangButton.Size = UDim2.new(0, 30, 0, 22)
_G.LangButton.Font = Enum.Font.BuilderSansBold
_G.LangButton.Text = "EN"
_G.LangButton.TextColor3 = Color3.fromRGB(140, 140, 155)
_G.LangButton.TextSize = 12

-- Крестик закрытия
_G.CloseXButton.Name = "CloseXButton"
_G.CloseXButton.Parent = _G.MainFrame
_G.CloseXButton.BackgroundTransparency = 1
_G.CloseXButton.Position = UDim2.new(1, -34, 0, 12)
_G.CloseXButton.Size = UDim2.new(0, 22, 0, 22)
_G.CloseXButton.Font = Enum.Font.BuilderSansBold
_G.CloseXButton.Text = "×"
_G.CloseXButton.TextColor3 = Color3.fromRGB(140, 140, 155)
_G.CloseXButton.TextSize = 20

-- Кнопка Статуса
_G.ToggleButton.Name = "ToggleButton"
_G.ToggleButton.Parent = _G.MainFrame
_G.ToggleButton.BackgroundColor3 = Color3.fromRGB(235, 65, 65)
_G.ToggleButton.Position = UDim2.new(0.06, 0, 0.40, 0)
_G.ToggleButton.Size = UDim2.new(0.88, 0, 0, 34)
_G.ToggleButton.Font = Enum.Font.BuilderSansBold
_G.ToggleButton.Text = "Status: INACTIVE"
_G.ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
_G.ToggleButton.TextSize = 13
_G.ToggleButton.BorderSizePixel = 0

local ButtonCorner1 = Instance.new("UICorner")
ButtonCorner1.CornerRadius = UDim.new(0, 10)
ButtonCorner1.Parent = _G.ToggleButton

-- Кнопка выгрузки скрипта
_G.UnloadButton.Name = "UnloadButton"
_G.UnloadButton.Parent = _G.MainFrame
_G.UnloadButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
_G.UnloadButton.Position = UDim2.new(0.06, 0, 0.68, 0)
_G.UnloadButton.Size = UDim2.new(0.88, 0, 0, 34)
_G.UnloadButton.Font = Enum.Font.BuilderSansBold
_G.UnloadButton.Text = "Unload Script"
_G.UnloadButton.TextColor3 = Color3.fromRGB(170, 170, 185)
_G.UnloadButton.TextSize = 13
_G.UnloadButton.BorderSizePixel = 0

local ButtonCorner2 = Instance.new("UICorner")
ButtonCorner2.CornerRadius = UDim.new(0, 10)
ButtonCorner2.Parent = _G.UnloadButton

-- Мобильная кнопка "G"
_G.MobileMenuButton.Name = "MobileMenuButton"
_G.MobileMenuButton.Parent = _G.ScreenGui
_G.MobileMenuButton.BackgroundColor3 = Color3.fromRGB(255, 195, 0)
_G.MobileMenuButton.Position = UDim2.new(0, 25, 1, -85)
_G.MobileMenuButton.Size = UDim2.new(0, 50, 0, 50)
_G.MobileMenuButton.Font = Enum.Font.BuilderSansBold
_G.MobileMenuButton.Text = "G"
_G.MobileMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
_G.MobileMenuButton.TextSize = 26
_G.MobileMenuButton.Visible = false
_G.MobileMenuButton.BorderSizePixel = 0

MobileButtonCorner.CornerRadius = UDim.new(1, 0)
MobileButtonCorner.Parent = _G.MobileMenuButton

TextButtonUIStroke.Parent = _G.MobileMenuButton
TextButtonUIStroke.Color = Color3.fromRGB(20, 20, 25)
TextButtonUIStroke.Thickness = 3.5
TextButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

ButtonGlowStroke.Parent = _G.MobileMenuButton
ButtonGlowStroke.Color = Color3.fromRGB(215, 155, 0)
ButtonGlowStroke.Thickness = 1.2
ButtonGlowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Направляющий text сверху
_G.TopHintLabel.Name = "TopHintLabel"
_G.TopHintLabel.Parent = _G.ScreenGui
_G.TopHintLabel.BackgroundTransparency = 1
_G.TopHintLabel.Position = UDim2.new(0.5, -200, 0, 24)
_G.TopHintLabel.Size = UDim2.new(0, 400, 0, 30)
_G.TopHintLabel.Font = Enum.Font.BuilderSansBold
_G.TopHintLabel.Text = "Press G to open menu"
_G.TopHintLabel.TextSize = 16
_G.TopHintLabel.Visible = false

TextShadow.Parent = _G.TopHintLabel
TextShadow.Color = Color3.fromRGB(0, 0, 0)
TextShadow.Thickness = 1.5
TextShadow.Transparency = 0.5
-- ==========================================
-- ЧАСТЬ 2: УНИВЕРСАЛЬНЫЙ КОМПЛЕКСНЫЙ ОБХОД
-- ==========================================
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

local enabled = false
local scriptRunning = true
local currentLang = "EN"

local idledConnection = nil
local loopThread = nil

local localization = {
    EN = {
        unload = "Unload Script",
        hint = "Press G to open menu",
        statusActive = "Status: ACTIVE",
        statusInactive = "Status: INACTIVE"
    },
    RU = {
        unload = "Выгрузить чит",
        hint = "Нажмите на G, чтобы открыть меню",
        statusActive = "Статус: АКТИВЕН",
        statusInactive = "Статус: НЕАКТИВЕН"
    }
}

local function updateTexts()
    local langData = localization[currentLang]
    _G.UnloadButton.Text = langData.unload
    _G.TopHintLabel.Text = langData.hint
    if enabled then
        _G.ToggleButton.Text = langData.statusActive
    else
        _G.ToggleButton.Text = langData.statusInactive
    end
end

local function playClickAnimation(button)
    local originalSize = button.Size
    button:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset - 6, originalSize.Y.Scale, originalSize.Y.Offset - 4), "Out", "Quad", 0.05, true)
    task.wait(0.05)
    button:TweenSize(originalSize, "Out", "Quad", 0.05, true)
end

_G.LangButton.MouseButton1Click:Connect(function()
    currentLang = (currentLang == "EN") and "RU" or "EN"
    _G.LangButton.Text = currentLang
    updateTexts()
end)

local rgbConnection
rgbConnection = RunService.RenderStepped:Connect(function()
    if not scriptRunning then rgbConnection:Disconnect() return end
    if _G.TopHintLabel.Visible then
        local hue = (tick() % 5) / 5
        _G.TopHintLabel.TextColor3 = Color3.fromHSV(hue, 0.75, 1)
    end
end)

local function startUniversalBypass()
    if loopThread then task.cancel(loopThread) end
    if idledConnection then idledConnection:Disconnect() end
    
    idledConnection = LocalPlayer.Idled:Connect(function()
        if enabled and scriptRunning then
            pcall(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(0.1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end)
    
    loopThread = task.spawn(function()
        while enabled and scriptRunning do
            task.wait(math.random(45, 90)) -- Хаотичный интервал времени
            
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            
            if humanoid and humanoid.Health > 0 then
                pcall(function()
                    local actionType = math.random(1, 3) -- Рандомайзер действий
                    
                    if actionType == 1 then
                        humanoid.Jump = true -- Прыжок (Легально для BAC-1515)
                    elseif actionType == 2 then
                        -- Микро-шаг
                        humanoid:Move(Vector3.new(0, 0, -0.1), true)
                        task.wait(0.05)
                        humanoid:Move(Vector3.new(0, 0, 0.1), true)
                        task.wait(0.05)
                        humanoid:Move(Vector3.new(0, 0, 0), true)
                    elseif actionType == 3 then
                        -- Системный клик по экрану
                        VirtualInputManager:SendMouseButtonEvent(math.random(10, 100), math.random(10, 100), 0, true, game, 1)
                        task.wait(0.05)
                        VirtualInputManager:SendMouseButtonEvent(math.random(10, 100), math.random(10, 100), 0, false, game, 1)
                    end
                end)
            end
        end
    end)
end

local function toggleMenu()
    if not scriptRunning then return end
    local isVisible = _G.MainFrame.Visible
    _G.MainFrame.Visible = not isVisible
    _G.MobileMenuButton.Visible = isVisible
    _G.TopHintLabel.Visible = isVisible
end

_G.ToggleButton.MouseButton1Click:Connect(function()
    task.spawn(function() playClickAnimation(_G.ToggleButton) end)
    enabled = not enabled
    if enabled then
        _G.ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 185, 105)
        startUniversalBypass()
    else
        _G.ToggleButton.BackgroundColor3 = Color3.fromRGB(235, 65, 65)
        if idledConnection then idledConnection:Disconnect() end
        if loopThread then task.cancel(loopThread) end
    end
    updateTexts()
end)

_G.CloseXButton.MouseEnter:Connect(function() _G.CloseXButton.TextColor3 = Color3.fromRGB(255, 80, 80) end)
_G.CloseXButton.MouseLeave:Connect(function() _G.CloseXButton.TextColor3 = Color3.fromRGB(140, 140, 155) end)
_G.LangButton.MouseEnter:Connect(function() _G.LangButton.TextColor3 = Color3.fromRGB(240, 240, 245) end)
_G.LangButton.MouseLeave:Connect(function() _G.LangButton.TextColor3 = Color3.fromRGB(140, 140, 155) end)

_G.CloseXButton.MouseButton1Click:Connect(toggleMenu)
_G.MobileMenuButton.MouseButton1Click:Connect(function()
    task.spawn(function() playClickAnimation(_G.MobileMenuButton) end)
    toggleMenu()
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        toggleMenu()
    end
end)

_G.UnloadButton.MouseButton1Click:Connect(function()
    playClickAnimation(_G.UnloadButton)
    scriptRunning = false
    enabled = false
    if idledConnection then idledConnection:Disconnect() end
    if loopThread then task.cancel(loopThread) end
    if rgbConnection then rgbConnection:Disconnect() end
    _G.ScreenGui:Destroy()
end)
