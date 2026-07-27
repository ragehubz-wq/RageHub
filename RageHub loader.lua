-- RageHub Loader Script
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Destruir instancia anterior si existe
if CoreGui:FindFirstChild("RageHubLoader") then
    CoreGui.RageHubLoader:Destroy()
end

-- ScreenGui Principal
local RageHubLoader = Instance.new("ScreenGui")
RageHubLoader.Name = "RageHubLoader"
RageHubLoader.Parent = CoreGui
RageHubLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Marco Principal (Main Container)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 340)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 1
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Parent = RageHubLoader

-- Outline Celeste Principal
local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromRGB(0, 210, 255)
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = MainFrame

---------------------------------------------------------
-- Imagen Circular de Discord con Animación y Notificación
---------------------------------------------------------
local DiscordImageBtn = Instance.new("ImageButton")
DiscordImageBtn.Name = "DiscordImageBtn"
DiscordImageBtn.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordImageBtn.Size = UDim2.new(0, 20, 0, 20)
DiscordImageBtn.Position = UDim2.new(0, 20, 0, 18)
DiscordImageBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DiscordImageBtn.Image = "rbxthumb://type=Asset&id=18505728250&w=150&h=150"
DiscordImageBtn.AutoButtonColor = false
DiscordImageBtn.ZIndex = 10
DiscordImageBtn.BorderSizePixel = 0
DiscordImageBtn.Parent = MainFrame

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(1, 0)
ImageCorner.Parent = DiscordImageBtn

-- Texto de Notificación al lado de Discord
local DiscordNotice = Instance.new("TextLabel")
DiscordNotice.Name = "DiscordNotice"
DiscordNotice.Size = UDim2.new(0, 110, 0, 20)
DiscordNotice.Position = UDim2.new(0, 35, 0, 8)
DiscordNotice.BackgroundTransparency = 1
DiscordNotice.TextColor3 = Color3.fromRGB(88, 101, 242) -- Color de Discord (#5865F2)
DiscordNotice.TextSize = 11
DiscordNotice.Font = Enum.Font.Code
DiscordNotice.TextXAlignment = Enum.TextXAlignment.Left
DiscordNotice.Text = ""
DiscordNotice.ZIndex = 10
DiscordNotice.Parent = MainFrame

-- Variables para control de clics y tiempo
local lastCopyTime = 0
local noticeThread = nil

DiscordImageBtn.MouseButton1Click:Connect(function()
    -- Animación de "Pop" al presionar
    DiscordImageBtn.Size = UDim2.new(0, 14, 0, 14)
    TweenService:Create(DiscordImageBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 20, 0, 20)
    }):Play()

    local currentTime = os.clock()

    -- Si presiona antes de que pasen los 2 segundos
    if (currentTime - lastCopyTime) < 2 then
        if noticeThread then
            task.cancel(noticeThread)
        end
        
        DiscordNotice.TextColor3 = Color3.fromRGB(255, 75, 75) -- Rojo
        DiscordNotice.Text = "too fast!"
        
        noticeThread = task.delay(2, function()
            DiscordNotice.Text = ""
        end)
    else
        -- Copiado exitoso
        local discordUrl = "https://discord.gg/xyWMBWS2n"
        if setclipboard then
            setclipboard(discordUrl)
        elseif toclipboard then
            toclipboard(discordUrl)
        end

        lastCopyTime = currentTime

        if noticeThread then
            task.cancel(noticeThread)
        end

        DiscordNotice.TextColor3 = Color3.fromRGB(88, 101, 242) -- Azul Discord
        DiscordNotice.Text = "discord copied"

        noticeThread = task.delay(2, function()
            DiscordNotice.Text = ""
        end)
    end
end)

-- Título Top Principal (Centrado para dar espacio)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0, 300, 0, 30)
TitleLabel.Position = UDim2.new(0.5, -150, 0, 4)
TitleLabel.BackgroundTransparency = 1
TitleLabel.RichText = true
TitleLabel.Text = 'Rage<font color="rgb(0, 210, 255)">Hub</font> <font color="rgb(255, 140, 0)">Rost</font> alpha'
TitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.Code
TitleLabel.Parent = MainFrame

-- Contenedor Interno de Paneles
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -20, 1, -44)
ContentContainer.Position = UDim2.new(0, 10, 0, 34)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

-- Panel Izquierdo
local LeftPanel = Instance.new("Frame")
LeftPanel.Name = "LeftPanel"
LeftPanel.Size = UDim2.new(0.48, 0, 1, 0)
LeftPanel.Position = UDim2.new(0, 0, 0, 0)
LeftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LeftPanel.BorderColor3 = Color3.fromRGB(30, 30, 30)
LeftPanel.BorderSizePixel = 1
LeftPanel.Parent = ContentContainer

-- Texto del Panel Izquierdo
local PlayerTitle = Instance.new("TextLabel")
PlayerTitle.Name = "PlayerTitle"
PlayerTitle.Size = UDim2.new(1, 0, 0, 25)
PlayerTitle.Position = UDim2.new(0, 0, 0, 10)
PlayerTitle.BackgroundTransparency = 1
PlayerTitle.RichText = true
PlayerTitle.Text = 'Rage<font color="rgb(0, 210, 255)">Hub</font> Player'
PlayerTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
PlayerTitle.TextSize = 15
PlayerTitle.Font = Enum.Font.Code
PlayerTitle.Parent = LeftPanel

-- Avatar del Personaje (R6)
local AvatarContainer = Instance.new("Frame")
AvatarContainer.Name = "AvatarContainer"
AvatarContainer.Size = UDim2.new(0, 120, 0, 210)
AvatarContainer.Position = UDim2.new(0.5, -60, 0, 38)
AvatarContainer.BackgroundTransparency = 1
AvatarContainer.Parent = LeftPanel

local function createBodyPart(name, size, position)
    local part = Instance.new("Frame")
    part.Name = name
    part.Size = size
    part.Position = position
    part.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    part.BorderSizePixel = 0
    part.Parent = AvatarContainer

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Color = Color3.fromRGB(50, 50, 50)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = part

    return part
end

local LeftArm  = createBodyPart("LeftArm",  UDim2.new(0, 25, 0, 68), UDim2.new(0.5, -55, 0, 0))
local RightArm = createBodyPart("RightArm", UDim2.new(0, 25, 0, 68), UDim2.new(0.5, 30,  0, 0))
local Head     = createBodyPart("Head",     UDim2.new(0, 52, 0, 52), UDim2.new(0.5, -26, 0, 15))
local Torso    = createBodyPart("Torso",    UDim2.new(0, 52, 0, 68), UDim2.new(0.5, -26, 0, 70))
local LeftLeg  = createBodyPart("LeftLeg",  UDim2.new(0, 25, 0, 68), UDim2.new(0.5, -26, 0, 140))
local RightLeg = createBodyPart("RightLeg", UDim2.new(0, 25, 0, 68), UDim2.new(0.5, 1,   0, 140))

-- Panel Derecho (Botones principales)
local RightPanel = Instance.new("Frame")
RightPanel.Name = "RightPanel"
RightPanel.Size = UDim2.new(0.48, 0, 1, 0)
RightPanel.Position = UDim2.new(0.52, 0, 0, 0)
RightPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
RightPanel.BorderColor3 = Color3.fromRGB(30, 30, 30)
RightPanel.BorderSizePixel = 1
RightPanel.Parent = ContentContainer

local LoadButton = Instance.new("TextButton")
LoadButton.Name = "LoadButton"
LoadButton.Size = UDim2.new(0.85, 0, 0, 38)
LoadButton.Position = UDim2.new(0.075, 0, 0.28, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadButton.BorderColor3 = Color3.fromRGB(35, 35, 35)
LoadButton.BorderSizePixel = 1
LoadButton.Text = "Load"
LoadButton.TextColor3 = Color3.fromRGB(200, 200, 200)
LoadButton.TextSize = 13
LoadButton.Font = Enum.Font.Code
LoadButton.Parent = RightPanel

local ExitButton = Instance.new("TextButton")
ExitButton.Name = "ExitButton"
ExitButton.Size = UDim2.new(0.85, 0, 0, 38)
ExitButton.Position = UDim2.new(0.075, 0, 0.48, 0)
ExitButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ExitButton.BorderColor3 = Color3.fromRGB(35, 35, 35)
ExitButton.BorderSizePixel = 1
ExitButton.Text = "Exit"
ExitButton.TextColor3 = Color3.fromRGB(200, 200, 200)
ExitButton.TextSize = 13
ExitButton.Font = Enum.Font.Code
ExitButton.Parent = RightPanel

LoadButton.MouseButton1Click:Connect(function()
    print("[RageHub] Cargando script...")
    RageHubLoader:Destroy()
    loadstring(game:HttpGet("\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\114\097\103\101\104\117\098\122\045\119\113\047\082\097\103\101\072\117\098\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\082\097\103\101\072\117\098\046\108\117\097"))()
end)

ExitButton.MouseButton1Click:Connect(function()
    RageHubLoader:Destroy()
end)

---------------------------------------------------------
-- SISTEMA DE KEY Y CAPA NEGRA
---------------------------------------------------------
local KeyOverlay = Instance.new("Frame")
KeyOverlay.Name = "KeyOverlay"
KeyOverlay.Size = UDim2.new(1, 0, 1, 0)
KeyOverlay.Position = UDim2.new(0, 0, 0, 0)
KeyOverlay.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
KeyOverlay.BackgroundTransparency = 0
KeyOverlay.BorderSizePixel = 0
KeyOverlay.Active = true
KeyOverlay.ZIndex = 100
KeyOverlay.Parent = MainFrame

-- Título del Sistema de Key
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Name = "KeyTitle"
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Position = UDim2.new(0, 0, 0, 50)
KeyTitle.BackgroundTransparency = 1
KeyTitle.RichText = true
KeyTitle.Text = 'Rage<font color="rgb(0, 210, 255)">Hub</font> key'
KeyTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
KeyTitle.TextSize = 18
KeyTitle.Font = Enum.Font.Code
KeyTitle.ZIndex = 101
KeyTitle.Parent = KeyOverlay

-- TextBox Cuadrado Estilizado
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(0, 240, 0, 38)
KeyInput.Position = UDim2.new(0.5, -120, 0, 110)
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyInput.BorderColor3 = Color3.fromRGB(35, 35, 35)
KeyInput.BorderSizePixel = 1
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter Key..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(110, 110, 110)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 13
KeyInput.Font = Enum.Font.Code
KeyInput.TextXAlignment = Enum.TextXAlignment.Center
KeyInput.ZIndex = 101
KeyInput.Parent = KeyOverlay

local KeyInputStroke = Instance.new("UIStroke")
KeyInputStroke.Thickness = 1
KeyInputStroke.Color = Color3.fromRGB(45, 45, 45)
KeyInputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
KeyInputStroke.Parent = KeyInput

-- Botón Accept
local AcceptBtn = Instance.new("TextButton")
AcceptBtn.Name = "AcceptBtn"
AcceptBtn.Size = UDim2.new(0, 240, 0, 36)
AcceptBtn.Position = UDim2.new(0.5, -120, 0, 160)
AcceptBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AcceptBtn.BorderColor3 = Color3.fromRGB(35, 35, 35)
AcceptBtn.BorderSizePixel = 1
AcceptBtn.Text = "Accept"
AcceptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
AcceptBtn.TextSize = 13
AcceptBtn.Font = Enum.Font.Code
AcceptBtn.ZIndex = 101
AcceptBtn.Parent = KeyOverlay

-- Texto para error de Key
local ErrorText = Instance.new("TextLabel")
ErrorText.Name = "ErrorText"
ErrorText.Size = UDim2.new(1, 0, 0, 20)
ErrorText.Position = UDim2.new(0, 0, 0, 205)
ErrorText.BackgroundTransparency = 1
ErrorText.Text = ""
ErrorText.TextColor3 = Color3.fromRGB(255, 70, 70)
ErrorText.TextSize = 12
ErrorText.Font = Enum.Font.Code
ErrorText.ZIndex = 101
ErrorText.Parent = KeyOverlay

---------------------------------------------------------
-- SISTEMA DE CARGA (Loading Progress Bar & Animation)
---------------------------------------------------------
local LoadingText = Instance.new("TextLabel")
LoadingText.Name = "LoadingText"
LoadingText.Size = UDim2.new(1, 0, 0, 30)
LoadingText.Position = UDim2.new(0, 0, 0, 115)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "loading..."
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextSize = 16
LoadingText.Font = Enum.Font.Code
LoadingText.Visible = false
LoadingText.ZIndex = 101
LoadingText.Parent = KeyOverlay

-- Contenedor de la barra
local ProgressBg = Instance.new("Frame")
ProgressBg.Name = "ProgressBg"
ProgressBg.Size = UDim2.new(0, 260, 0, 18)
ProgressBg.Position = UDim2.new(0.5, -130, 0, 160)
ProgressBg.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ProgressBg.BorderColor3 = Color3.fromRGB(35, 35, 35)
ProgressBg.BorderSizePixel = 1
ProgressBg.Visible = false
ProgressBg.ClipsDescendants = true
ProgressBg.ZIndex = 101
ProgressBg.Parent = KeyOverlay

-- Relleno Celeste de la barra
local ProgressFill = Instance.new("Frame")
ProgressFill.Name = "ProgressFill"
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.Position = UDim2.new(0, 0, 0, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.ZIndex = 102
ProgressFill.Parent = ProgressBg

---------------------------------------------------------
-- Lógica de Verificación y Animación de Carga
---------------------------------------------------------
local animRunning = false

local function startLoadingProcess()
    KeyTitle.Visible = false
    KeyInput.Visible = false
    AcceptBtn.Visible = false
    ErrorText.Visible = false

    LoadingText.Visible = true
    ProgressBg.Visible = true

    animRunning = true
    task.spawn(function()
        local frames = {"loading...", "loading..", "loading.", "loading", "loading.", "loading.."}
        local index = 1
        while animRunning do
            LoadingText.Text = frames[index]
            index = (index % #frames) + 1
            task.wait(0.4)
        end
    end)

    local tween = TweenService:Create(ProgressFill, TweenInfo.new(5, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, 0, 1, 0)
    })
    tween:Play()

    tween.Completed:Connect(function()
        animRunning = false
        TweenService:Create(KeyOverlay, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
        task.wait(0.4)
        KeyOverlay:Destroy()
    end)
end

AcceptBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "RageHubOnTop" then
        startLoadingProcess()
    else
        ErrorText.Text = "incorrect key"
        task.wait(2)
        RageHubLoader:Destroy()
        task.wait(2)
        LocalPlayer:Kick("RageHub: incorrect key")
    end
end)

---------------------------------------------------------
-- Sistema Drag (Arrastrar ventana)
---------------------------------------------------------
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
