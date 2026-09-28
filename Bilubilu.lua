--============================================================
-- SACRIFICE HUB | Universal
-- Teste em ambiente privado (NUNCA em jogos públicos)
--============================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Remover GUI antiga
pcall(function()
    if CoreGui:FindFirstChild("SACRIFICE_HUB") then
        CoreGui.SACRIFICE_HUB:Destroy()
    end
end)

--============================================================
-- INTERFACE
--============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SACRIFICE_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Botão flutuante (abrir/fechar)
local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Size = UDim2.new(0, 60, 0, 60)
Toggle.Position = UDim2.new(0, 20, 0.5, -30)
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Toggle.Text = "S"
Toggle.TextColor3 = Color3.fromRGB(255, 60, 60)
Toggle.TextScaled = true
Toggle.Font = Enum.Font.GothamBold
Toggle.AutoButtonColor = false
Toggle.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = Toggle

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(255, 60, 60)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = Toggle

-- Painel principal
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 500, 0, 420)
Main.Position = UDim2.new(0.5, -250, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 60, 60)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = Main

-- Gradiente de fundo
local Grad = Instance.new("UIGradient")
Grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
}
Grad.Rotation = 45
Grad.Parent = Main

-- Barra de título
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundTransparency = 1
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "💀 SACRIFICE HUB"
Title.TextColor3 = Color3.fromRGB(255, 60, 60)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -100, 1, 0)
Subtitle.Position = UDim2.new(0, 20, 0, 18)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "universal • v1.0"
Subtitle.TextColor3 = Color3.fromRGB(150, 150, 160)
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = TopBar

-- Botão minimizar/fechar
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -45, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- Sistema de abas
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 35)
TabBar.Position = UDim2.new(0, 10, 0, 55)
TabBar.BackgroundTransparency = 1
TabBar.Parent = Main

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 6)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabBar

-- Container de conteúdo
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -110)
Content.Position = UDim2.new(0, 10, 0, 95)
Content.BackgroundTransparency = 1
Content.Parent = Main

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1, 0, 1, 0)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ScrollBarThickness = 4
ContentScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 60, 60)
ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentScroll.Parent = Content

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 8)
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Parent = ContentScroll

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingTop = UDim.new(0, 5)
ContentPadding.PaddingLeft = UDim.new(0, 5)
ContentPadding.PaddingRight = UDim.new(0, 5)
ContentPadding.Parent = ContentScroll

--============================================================
-- CRIAÇÃO DE ELEMENTOS
--============================================================
local Tabs = {}
local ActiveTab = nil

local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(0, 100, 1, 0)
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
    TabBtn.TextSize = 12
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.AutoButtonColor = false
    TabBtn.Parent = TabBar
    
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 8)
    C.Parent = TabBtn
    
    local Page = Instance.new("Frame")
    Page.Name = name
    Page.Size = UDim2.new(1, 0, 0, 0)
    Page.AutomaticSize = Enum.AutomaticSize.Y
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = ContentScroll
    
    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Padding = UDim.new(0, 6)
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Parent = Page
    
    Tabs[name] = { Button = TabBtn, Page = Page }
    
    TabBtn.MouseButton1Click:Connect(function()
        for n, t in pairs(Tabs) do
            t.Page.Visible = false
            t.Button.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
            t.Button.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
        Page.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        ActiveTab = name
    end)
    
    return Page
end

local function CreateToggle(parent, text, default, callback)
    local state = default or false
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Btn.Text = ""
    Btn.AutoButtonColor = false
    Btn.Parent = parent
    
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 10)
    C.Parent = Btn
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.TextSize = 13
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Btn
    
    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 36, 0, 20)
    Indicator.Position = UDim2.new(1, -48, 0.5, -10)
    Indicator.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Indicator.Parent = Btn
    
    local IC = Instance.new("UICorner")
    IC.CornerRadius = UDim.new(1, 0)
    IC.Parent = Indicator
    
    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 16, 0, 16)
    Dot.Position = UDim2.new(0, 2, 0.5, -8)
    Dot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
    Dot.Parent = Indicator
    
    local DC = Instance.new("UICorner")
    DC.CornerRadius = UDim.new(1, 0)
    DC.Parent = Dot
    
    local function Update()
        if state then
            Indicator.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            Dot.Position = UDim2.new(1, -18, 0.5, -8)
            Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            Indicator.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            Dot.Position = UDim2.new(0, 2, 0.5, -8)
            Dot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
        end
    end
    
    Btn.MouseButton1Click:Connect(function()
        state = not state
        Update()
        if callback then callback(state) end
    end)
    
    Update()
    return { Set = function(v) state = v; Update(); if callback then callback(v) end end, Get = function() return state end }
end

local function CreateSlider(parent, text, min, max, default, callback)
    local val = default or min
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Frame.Parent = parent
    
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 10)
    C.Parent = Frame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 15, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. val
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.TextSize = 12
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
    
    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, -30, 0, 6)
    Bar.Position = UDim2.new(0, 15, 0, 32)
    Bar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Bar.Parent = Frame
    
    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(1, 0)
    BC.Parent = Bar
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    Fill.Parent = Bar
    
    local FC = Instance.new("UICorner")
    FC.CornerRadius = UDim.new(1, 0)
    FC.Parent = Fill
    
    local dragging = false
    
    local function Set(input)
        local rel = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
        val = math.floor(min + (max - min) * rel)
        Fill.Size = UDim2.new(rel, 0, 1, 0)
        Label.Text = text .. ": " .. val
        if callback then callback(val) end
    end
    
    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            Set(input)
        end
    end)
    Bar.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            Set(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return { Set = function(v) val = v; Fill.Size = UDim2.new((v - min)/(max-min), 0, 1, 0); Label.Text = text..": "..v; if callback then callback(v) end end, Get = function() return val end }
end

--============================================================
-- ABAS
--============================================================
local MoveTab = CreateTab("Movement")
local CombatTab = CreateTab("Combat")
local VisualTab = CreateTab("Visual")
local MiscTab = CreateTab("Misc")

--============================================================
-- MOVEMENT - SPEED / FLY
--============================================================
local SpeedEnabled = false
local SpeedValue = 50
local FlyEnabled = false
local FlySpeed = 50

CreateSlider(MoveTab, "WalkSpeed", 16, 500, 50, function(v) SpeedValue = v end)
CreateToggle(MoveTab, "Speed Hack", false, function(state)
    SpeedEnabled = state
    if not state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
    end
end)

CreateSlider(MoveTab, "Fly Speed", 10, 500, 50, function(v) FlySpeed = v end)
CreateToggle(MoveTab, "Fly", false, function(state)
    FlyEnabled = state
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    
    if state then
        local bg = Instance.new("BodyGyro")
        bg.P = 9e4
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.CFrame = hrp.CFrame
        bg.Parent = hrp
        
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Parent = hrp
        
        hum.PlatformStand = true
        
        local UIS = UserInputService
        local moveCon = RunService.RenderStepped:Connect(function()
            if not FlyEnabled or not hrp or not hrp.Parent then
                return
            end
            local move = Vector3.zero
            if UIS:IsKeyDown(Enum.KeyCode.W) then move += Camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then move -= Camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then move -= Camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then move += Camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0,1,0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move -= Vector3.new(0,1,0) end
            bv.Velocity = move.Magnitude > 0 and move.Unit * FlySpeed or Vector3.zero
            bg.CFrame = Camera.CFrame
        end)
        
        -- Cleanup quando desligar
        local checkCon
        checkCon = RunService.Heartbeat:Connect(function()
            if not FlyEnabled then
                moveCon:Disconnect()
                checkCon:Disconnect()
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
                if hum then hum.PlatformStand = false end
            end
        end)
    end
end)

CreateToggle(MoveTab, "NoClip", false, function(state)
    local con
    if state then
        con = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
        _G.SacrificeNoClipCon = con
    else
        if _G.SacrificeNoClipCon then
            _G.SacrificeNoClipCon:Disconnect()
            _G.SacrificeNoClipCon = nil
        end
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)

CreateToggle(MoveTab, "Infinite Jump", false, function(state)
    _G.SacrificeInfJump = state
end)

UserInputService.JumpRequest:Connect(function()
    if _G.SacrificeInfJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

--============================================================
-- COMBAT - AIMBOT / FOV / CLICK
--============================================================
local AimbotEnabled = false
local AimbotKey = Enum.UserInputType.MouseButton2
local FOVEnabled = false
local FOVRadius = 100

CreateToggle(CombatTab, "Aimbot (hold Right Mouse)", false, function(state)
    AimbotEnabled = state
end)

CreateSlider(CombatTab, "FOV Radius", 30, 600, 100, function(v)
    FOVRadius = v
    if _G.SacrificeFOVCircle then
        _G.SacrificeFOVCircle.Size = UDim2.new(0, v * 2, 0, v * 2)
    end
end)

CreateToggle(CombatTab, "Show FOV Circle", false, function(state)
    if state then
        local circle = Instance.new("Frame")
        circle.Name = "SacrificeFOV"
        circle.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2)
        circle.Position = UDim2.new(0.5, -FOVRadius, 0.5, -FOVRadius)
        circle.BackgroundTransparency = 1
        circle.Parent = ScreenGui
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(255, 60, 60)
        stroke.Thickness = 1.5
        stroke.Transparency = 0.3
        stroke.Parent = circle
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = circle
        
        _G.SacrificeFOVCircle = circle
    else
        if _G.SacrificeFOVCircle then
            _G.SacrificeFOVCircle:Destroy()
            _G.SacrificeFOVCircle = nil
        end
    end
end)

-- Aimbot loop
RunService.RenderStepped:Connect(function()
    if not AimbotEnabled then return end
    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
    
    local closest, dist = nil, FOVRadius
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local d = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if d < dist then
                        dist = d
                        closest = head
                    end
                end
            end
        end
    end
    
    if closest then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position)
    end
end)

--============================================================
-- VISUAL - ESP
--============================================================
local ESPEnabled = false
local ESPObjects = {}

local function CreateESP(plr)
    if plr == LocalPlayer then return end
    if not plr.Character then return end
    if ESPObjects[plr] then return end
    
    local box = Instance.new("BoxHandleAdornment")
    box.Size = Vector3.new(4, 5, 2)
    box.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Transparency = 0.5
    box.Color3 = Color3.fromRGB(255, 60, 60)
    box.Parent = plr.Character
    
    local nameTag = Instance.new("BillboardGui")
    nameTag.Size = UDim2.new(0, 100, 0, 20)
    nameTag.StudsOffset = Vector3.new(0, 3, 0)
    nameTag.AlwaysOnTop = true
    nameTag.Adornee = plr.Character:FindFirstChild("Head")
    nameTag.Parent = plr.Character
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = plr.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Parent = nameTag
    
    ESPObjects[plr] = { Box = box, Tag = nameTag }
end

local function RemoveESP(plr)
    if ESPObjects[plr] then
        if ESPObjects[plr].Box then ESPObjects[plr].Box:Destroy() end
        if ESPObjects[plr].Tag then ESPObjects[plr].Tag:Destroy() end
        ESPObjects[plr] = nil
    end
end

CreateToggle(VisualTab, "ESP (Box + Name)", false, function(state)
    ESPEnabled = state
    if state then
        for _, plr in pairs(Players:GetPlayers()) do
            CreateESP(plr)
        end
    else
        for plr, _ in pairs(ESPObjects) do
            RemoveESP(plr)
        end
    end
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        if ESPEnabled then
            task.wait(1)
            CreateESP(plr)
        end
    end)
end)

Players.PlayerRemoving:Connect(RemoveESP)

--============================================================
-- MISC
--============================================================
CreateToggle(MiscTab, "Anti-AFK", true, function(state)
    _G.SacrificeAntiAFK = state
end)

LocalPlayer.Idled:Connect(function()
    if _G.SacrificeAntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

CreateToggle(MiscTab, "Full Bright", false, function(state)
    if state then
        _G.SacrificeOldLighting = {
            Brightness = game.Lighting.Brightness,
            Ambient = game.Lighting.Ambient,
            OutdoorAmbient = game.Lighting.OutdoorAmbient
        }
        game.Lighting.Brightness = 3
        game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        if _G.SacrificeOldLighting then
            game.Lighting.Brightness = _G.SacrificeOldLighting.Brightness
            game.Lighting.Ambient = _G.SacrificeOldLighting.Ambient
            game.Lighting.OutdoorAmbient = _G.SacrificeOldLighting.OutdoorAmbient
        end
    end
end)

-- Botão de reset
local ResetBtn = Instance.new("TextButton")
ResetBtn.Size = UDim2.new(1, 0, 0, 38)
ResetBtn.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
ResetBtn.Text = "⟲ Reset Character"
ResetBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
ResetBtn.TextSize = 13
ResetBtn.Font = Enum.Font.GothamMedium
ResetBtn.AutoButtonColor = false
ResetBtn.Parent = MiscTab

local RC = Instance.new("UICorner")
RC.CornerRadius = UDim.new(0, 10)
RC.Parent = ResetBtn

ResetBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
end)

--============================================================
-- FUNÇÕES DE LOOP
--============================================================
RunService.Heartbeat:Connect(function()
    if SpeedEnabled and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = SpeedValue end
    end
end)

--============================================================
-- DRAG + TOGGLE
--============================================================
local dragging, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

-- Ativar primeira aba
Tabs["Movement"].Button.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Tabs["Movement"].Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tabs["Movement"].Page.Visible = true

-- Notificação
StarterGui:SetCore("SendNotification", {
    Title = "SACRIFICE HUB",
    Text = "Carregado com sucesso 💀",
    Duration = 5
})

print("[SACRIFICE HUB] Carregado!")
