-- Sena VIP Hub [COMPLETE PREMIUM HUB - ANTI LAG & ADVANCED SCRIPTS]
-- Features: Auto Farm, Chest Farm, Hitbox Extender, Long Range Skill, Matte FPS Booster, Luxury Player ESP

repeat task.wait() until game:IsLoaded()

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui", 20)
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
if not PlayerGui then return end

-- Anti-Duplication
if PlayerGui:FindFirstChild("SenaPremiumHub") then
    PlayerGui.SenaPremiumHub:Destroy()
end

-- Core Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SenaPremiumHub"
ScreenGui.Parent = PlayerGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 99999

-----------------------------------------
-- 📊 REAL-TIME FPS COUNTER
-----------------------------------------
local FPSLabel = Instance.new("TextLabel")
FPSLabel.Name = "SenaFPSCounter"
FPSLabel.Parent = ScreenGui
FPSLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
FPSLabel.BackgroundTransparency = 0.15
FPSLabel.Position = UDim2.new(0, 140, 0, 5) 
FPSLabel.Size = UDim2.new(0, 85, 0, 30)
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.Text = "FPS: --"
FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
FPSLabel.TextSize = 13.000

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 6)
FPSCorner.Parent = FPSLabel

local FrameCount = 0
local TimeElapsed = 0
RunService.RenderStepped:Connect(function(dt)
    FrameCount = FrameCount + 1
    TimeElapsed = TimeElapsed + dt
    if TimeElapsed >= 0.5 then
        local CurrentFPS = math.floor(FrameCount / TimeElapsed)
        FPSLabel.Text = "FPS: " .. tostring(CurrentFPS)
        if CurrentFPS >= 50 then FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
        elseif CurrentFPS >= 30 then FPSLabel.TextColor3 = Color3.fromRGB(255, 180, 0)
        else FPSLabel.TextColor3 = Color3.fromRGB(255, 50, 50) end
        FrameCount = 0
        TimeElapsed = 0
    end
end)

-----------------------------------------
-- 📱 MOBILE TOGGLE BUTTON (S)
-----------------------------------------
local OpenButton = Instance.new("TextButton")
local OpenCorner = Instance.new("UICorner")
local ButtonStroke = Instance.new("UIStroke")

OpenButton.Name = "SenaOpenButton"
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
OpenButton.Position = UDim2.new(0.02, 0, 0.25, 0)
OpenButton.Size = UDim2.new(0, 45, 0, 45)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Text = "S"
OpenButton.TextColor3 = Color3.fromRGB(255, 40, 40)
OpenButton.TextSize = 22.000
OpenButton.Visible = false
OpenButton.Active = true
OpenButton.Draggable = true

OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

ButtonStroke.Color = Color3.fromRGB(255, 40, 40)
ButtonStroke.Thickness = 1.5
ButtonStroke.Parent = OpenButton

-----------------------------------------
-- 🎨 LUXURY SCROLLABLE MATTE PANEL (NEON RED)
-----------------------------------------
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -140)
MainFrame.Size = UDim2.new(0, 360, 0, 280)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIStroke.Name = "NeonGlow"
UIStroke.Color = Color3.fromRGB(255, 40, 40)
UIStroke.Thickness = 1.8
UIStroke.Parent = MainFrame

task.spawn(function()
    local info = TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local tween = TweenService:Create(UIStroke, info, {Transparency = 0.4})
    tween:Play()
end)

-- Header Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1.000
TopBar.Size = UDim2.new(1, 0, 0, 45)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Sena Hub [PREMIUM V4]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1.000
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
CloseBtn.TextSize = 16.000

-- Inner Scrolling Container for Features
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
ScrollingFrame.Position = UDim2.new(0, 15, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -30, 1, -65)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 360) -- Canvas extended for new ESP option
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 40, 40)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local UIPadding = Instance.new("UIPadding")
UIPadding.Parent = ScrollingFrame
UIPadding.PaddingTop = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 10)

-----------------------------------------
-- FUNCTION: CREATE LUXURY TOGGLE ROW
-----------------------------------------
local function CreateToggle(name, labelText, defaultState, callback)
    local RowFrame = Instance.new("Frame")
    RowFrame.Name = name .. "Row"
    RowFrame.BackgroundTransparency = 1.000
    RowFrame.Size = UDim2.new(1, -10, 0, 40)
    RowFrame.Parent = ScrollingFrame

    local Label = Instance.new("TextLabel")
    Label.Parent = RowFrame
    Label.BackgroundTransparency = 1.000
    Label.Size = UDim2.new(0, 200, 1, 0)
    Label.Font = Enum.Font.GothamMedium
    Label.Text = labelText
    Label.TextColor3 = Color3.fromRGB(240, 240, 240)
    Label.TextSize = 13.000
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Container = Instance.new("TextButton")
    local ConCorner = Instance.new("UICorner")
    local Circle = Instance.new("Frame")
    local CirCorner = Instance.new("UICorner")

    Container.Size = UDim2.new(0, 46, 0, 24)
    Container.Position = UDim2.new(1, -55, 0, 8)
    Container.BackgroundColor3 = defaultState and Color3.fromRGB(255, 40, 40) or Color3.fromRGB(45, 48, 55)
    Container.Text = ""
    Container.AutoButtonColor = false
    Container.Parent = RowFrame
    ConCorner.CornerRadius = UDim.new(1, 0)
    ConCorner.Parent = Container

    Circle.Size = UDim2.new(0, 18, 0, 18)
    Circle.Position = defaultState and UDim2.new(0, 25, 0, 3) or UDim2.new(0, 3, 0, 3)
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.Parent = Container
    CirCorner.CornerRadius = UDim.new(1, 0)
    CirCorner.Parent = Circle

    local state = defaultState
    Container.MouseButton1Click:Connect(function()
        state = not state
        if state then
            Container.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
            TweenService:Create(Circle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 25, 0, 3)}):Play()
        else
            Container.BackgroundColor3 = Color3.fromRGB(45, 48, 55)
            TweenService:Create(Circle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 3, 0, 3)}):Play()
        end
        callback(state)
    end)
end

----------------------------------------------------
-- ⚙️ ADVANCED CHEAT MODULES (BLOX FRUITS ENGINE)
----------------------------------------------------

-- 1. Auto Ultimate FPS Booster (Matte Graphics)
local FpsEnabled = false
CreateToggle("FpsBooster", "Matte FPS Booster (No Lag)", false, function(bool)
    FpsEnabled = bool
    if FpsEnabled then
        if setfpscap then setfpscap(240) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        Lighting.GlobalShadows = false
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj:Destroy()
            end
        end
    else
        if setfpscap then setfpscap(60) end
    end
end)

-- 2. Advanced Hitbox Extender (Enhanced Strong Size)
local HitboxEnabled = false
CreateToggle("HitboxExtender", "Enemies Hitbox Extender", false, function(bool)
    HitboxEnabled = bool
end)

task.spawn(function()
    while task.wait(0.4) do
        if HitboxEnabled then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and not v.HumanoidRootPart:FindFirstChild("SenaSizeMark") then
                        local marker = Instance.new("BoolValue", v.HumanoidRootPart)
                        marker.Name = "SenaSizeMark"
                        v.HumanoidRootPart.Size = Vector3.new(26, 26, 26) -- Enhanced and Strengthened Size
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Transparency = 0.65
                        v.HumanoidRootPart.Color = Color3.fromRGB(255, 40, 40)
                    end
                end
            end)
        end
    end
end)

-- 3. Smart Long Range Skill (Legit Medium Range Attack)
local RangeEnabled = false
CreateToggle("LongRange", "Medium Long-Range Skills", false, function(bool)
    RangeEnabled = bool
end)

task.spawn(function()
    while task.wait(0.2) do
        if RangeEnabled then
            pcall(function()
                local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Handle") then
                    tool.Handle.Size = Vector3.new(12, 12, 12)
                    tool.Handle.CanCollide = false
                end
            end)
        end
    end
end)

-- 4. Fast Auto Chest Farm (With Anti-Cheat Protection)
local ChestEnabled = false
CreateToggle("ChestFarm", "Auto Farm Gold Chests", false, function(bool)
    ChestEnabled = bool
end)

task.spawn(function()
    while task.wait(0.2) do -- Safe bypass timing to keep account secured
        if ChestEnabled and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
                        if v:IsA("BasePart") then
                            Player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
                            task.wait(0.25)
                        end
                    end
                end
            end)
        end
    end
end)

-- 5. Luxury Player Info ESP (Medium Safe Distance)
local EspEnabled = false
CreateToggle("PlayerEsp", "Luxury Player Info ESP", false, function(bool)
    EspEnabled = bool
    if not bool then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("SenaESP") then
                p.Character.Head.SenaESP:Destroy()
            end
        end
    end
end)

local function GetPlayerItems(p)
    local fruit, melee, sword = "None", "Combat", "None"
    if p:FindFirstChild("Backpack") or p.Character then
        local storage = {}
        for _, item in pairs(p.Backpack:GetChildren()) do table.insert(storage, item) end
        if p.Character then for _, item in pairs(p.Character:GetChildren()) do table.insert(storage, item) end end
        
        for _, tool in pairs(storage) do
            if tool:IsA("Tool") then
                local name = tool.Name
                if string.find(name, "Fruit") or string.find(name, "Awakened") then fruit = name
                elseif name == "Godhuman" or name == "Superhuman" or string.find(name, "Fighting") or name == "Electric Claw" or name == "Death Step" or name == "Sharkman Karate" then melee = name
                elseif tool:FindFirstChild("Tooltip") and tool.Tooltip == "Sword" then sword = name end
            end
        end
    end
    return fruit, melee, sword
end

RunService.Heartbeat:Connect(function()
    if not EspEnabled then return end
    pcall(function()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= Player and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (Player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if distance < 700 then -- Stable medium range detection
                    local head = p.Character.Head
                    local espGui = head:FindFirstChild("SenaESP")
                    if not espGui then
                        espGui = Instance.new("BillboardGui")
                        espGui.Name = "SenaESP"
                        espGui.AlwaysOnTop = true
                        espGui.Size = UDim2.new(0, 130, 0, 50)
                        espGui.StudsOffset = Vector3.new(0, 3.2, 0)
                        espGui.Parent = head

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Font = Enum.Font.GothamBold
                        textLabel.TextSize = 9.5 -- Elegant medium size text layout
                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.Parent = espGui
                    end
                    local fr, me, sw = GetPlayerItems(p)
                    espGui.TextLabel.Text = string.format("%s\n[Fruit: %s]\n[Melee: %s]\n[Sword: %s]", p.Name, fr, me, sw)
                else
                    if p.Character.Head:FindFirstChild("SenaESP") then p.Character.Head.SenaESP:Destroy() end
                end
            end
        end
    end)
end)

-- Window Actions
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

workspace.DescendantAdded:Connect(function(descendant)
    if FpsEnabled then
        task.wait()
        pcall(function()
            if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Decal") then
                descendant:Destroy()
            elseif descendant:IsA("BasePart") then
                descendant.Material = Enum.Material.SmoothPlastic
                descendant.CastShadow = false
            end
        end)
    end
end)
