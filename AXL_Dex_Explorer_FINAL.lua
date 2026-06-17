-- [[ AXL GARDEN 2 - VIP PREMIUM SYSTEM ]] --
-- Created with premium UI/UX Animations and High-End Performance

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local lp = Players.LocalPlayer

-- UI Parent Protection
local ProtectGui = protect_gui or (syn and syn.protect_gui) or function(gui) gui.Parent = CoreGui end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AxlGarden2_VIP"
ScreenGui.ResetOnSpawn = false
ProtectGui(ScreenGui)

-- Language & Configuration States
local CurrentLanguage = "AR" -- Default
local ActivePlot = nil
local Toggles = {
    DroppedItems = false,
    SeedPack = false,
    NightStealer = false,
    AutoProxyPlot = false,
    PetESP = false
}

-- Translation Dictionary
local Localization = {
    AR = {
        Loading = "جاري تحميل نظام اكسل...",
        ChoseLang = "اختر اللغة / Choose Language",
        Title = "AXL GARDEN 2 | نظام VIP",
        TabInfo = "معلومات",
        TabFeatures = "المميزات",
        TabSettings = "الإعدادات",
        PlotDetect = "المزرعة المكتشفة: ",
        PlotScanning = "جاري البحث عن مزرعتك...",
        CopySuccess = "تم نسخ الرابط بنجاح!",
        ToggleOn = "تفعيل",
        ToggleOff = "تعطيل"
    },
    EN = {
        Loading = "Loading AXL System...",
        ChoseLang = "Choose Language",
        Title = "AXL GARDEN 2 | VIP SYSTEM",
        TabInfo = "Info",
        TabFeatures = "Features",
        TabSettings = "Settings",
        PlotDetect = "Detected Plot: ",
        PlotScanning = "Scanning for your plot...",
        CopySuccess = "Link Copied Successfully!",
        ToggleOn = "Enabled",
        ToggleOff = "Disabled"
    }
}

-- Smooth Tween Function
local function quickTween(obj, info, property)
    local tween = TweenService:Create(obj, TweenInfo.new(info, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), property)
    tween:Play()
    return tween
end

-- ==========================================
-- 1. INTRO & LANGUAGE SELECTION SCREEN
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingFrame.ZIndexWithChildren = 10
LoadingFrame.Parent = ScreenGui

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Size = UDim2.new(0, 300, 0, 40)
LoadingTitle.Position = UDim2.new(0.5, -150, 0.4, -20)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "AXL GARDEN 2"
LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingTitle.TextSize = 28
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.Parent = LoadingFrame

local LangPrompt = Instance.new("TextLabel")
LangPrompt.Size = UDim2.new(0, 300, 0, 20)
LangPrompt.Position = UDim2.new(0.5, -150, 0.5, 0)
LangPrompt.BackgroundTransparency = 1
LangPrompt.Text = "Choose Language / اختر اللغة"
LangPrompt.TextColor3 = Color3.fromRGB(200, 200, 200)
LangPrompt.TextSize = 14
LangPrompt.Font = Enum.Font.Gotham
LangPrompt.Parent = LoadingFrame

local BtnAR = Instance.new("TextButton")
BtnAR.Size = UDim2.new(0, 100, 0, 35)
BtnAR.Position = UDim2.new(0.5, -110, 0.6, 0)
BtnAR.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BtnAR.Text = "العربية"
BtnAR.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnAR.Font = Enum.Font.GothamBold
BtnAR.TextSize = 14
BtnAR.Parent = LoadingFrame

local BtnEN = Instance.new("TextButton")
BtnEN.Size = UDim2.new(0, 100, 0, 35)
BtnEN.Position = UDim2.new(0.5, 10, 0.6, 0)
BtnEN.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BtnEN.Text = "English"
BtnEN.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnEN.Font = Enum.Font.GothamBold
BtnEN.TextSize = 14
BtnEN.Parent = LoadingFrame

-- UI Styling for Lang Buttons
for _, btn in pairs({BtnAR, BtnEN}) do
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 6) c.Parent = btn
    local s = Instance.new("UIStroke") s.Color = Color3.fromRGB(255, 255, 255) s.Thickness = 1 s.Parent = btn
end

-- ==========================================
-- 2. MAIN APPLICATION GUI CONFIGURATION
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 408, 0, 256)
MainFrame.Position = UDim2.new(0.5, -204, 0.5, -128)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- TopBar System (Human-like Dragging)
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TopBar.Parent = MainFrame

local TopBarStroke = Instance.new("UIStroke")
TopBarStroke.Color = Color3.fromRGB(40, 40, 40)
TopBarStroke.Thickness = 1
TopBarStroke.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Window Controls (Minimize / Close)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -28, 0, 4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.Parent = TopBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 24, 0, 24)
MinBtn.Position = UDim2.new(1, -56, 0, 4)
MinBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 14
MinBtn.Parent = TopBar

for _, btn in pairs({CloseBtn, MinBtn}) do
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 4) c.Parent = btn
end

-- Dragging Logic
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Navigation Tab System (Left-Side Compact Sidebar)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 95, 1, -32)
Sidebar.Position = UDim2.new(0, 0, 0, 32)
Sidebar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Sidebar.Parent = MainFrame

local SidebarStroke = Instance.new("UIStroke")
SidebarStroke.Color = Color3.fromRGB(30, 30, 30)
SidebarStroke.Thickness = 1
SidebarStroke.Parent = Sidebar

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 1, 0)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = Sidebar

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 4)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.VerticalAlignment = Enum.VerticalAlignment.Top
UIList.Parent = TabContainer

-- Container Content Pages
local PagesContainer = Instance.new("Frame")
PagesContainer.Size = UDim2.new(1, -95, 1, -32)
PagesContainer.Position = UDim2.new(0, 95, 0, 32)
PagesContainer.BackgroundTransparency = 1
PagesContainer.Parent = MainFrame

local Pages = {
    Info = Instance.new("ScrollingFrame"),
    Features = Instance.new("ScrollingFrame"),
    Settings = Instance.new("ScrollingFrame")
}

for name, page in pairs(Pages) do
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.CanvasSize = UDim2.new(0, 0, 2, 0)
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    page.Visible = false
    page.Parent = PagesContainer
    
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 6)
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    list.Parent = page
end

-- ==========================================
-- 3. CORE UTILITIES & SYSTEM LOOPS
-- ==========================================

-- Auto-Detect Player Plot
local PlotLabel = Instance.new("TextLabel") -- Will instantiation later inside Info Page

local function scanForMyPlot()
    if not Workspace:FindFirstChild("Gardens") then return nil end
    for _, plot in pairs(Workspace.Gardens:GetChildren()) do
        if plot:GetAttribute("Owner") == lp.Name or plot.Name:find(lp.Name) then
            return plot
        end
        for _, desc in pairs(plot:GetDescendants()) do
            if desc:IsA("TextLabel") and (desc.Text:find(lp.Name) or desc.Text:find(lp.DisplayName)) then
                return plot
            end
        end
    end
    return nil
end

task.spawn(function()
    while task.wait(3) do
        local detected = scanForMyPlot()
        if detected then
            ActivePlot = detected
            PlotLabel.Text = Localization[CurrentLanguage].PlotDetect .. tostring(detected.Name)
        else
            PlotLabel.Text = Localization[CurrentLanguage].PlotScanning
        end
    end
end)

-- Safe Instant Teleport & Interact
local function instantCollect(targetPart, proximityPrompt)
    if not targetPart or not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = lp.Character.HumanoidRootPart
    local oldCFrame = hrp.CFrame
    
    hrp.CFrame = targetPart.CFrame * CFrame.new(0, 1, 0)
    task.wait(0.1)
    if proximityPrompt then
        fireproximityprompt(proximityPrompt, 1)
    end
    task.wait(0.05)
end

-- Feature 2 Logic: Dropped Items Multi-Thread Loop
task.spawn(function()
    while task.wait(0.1) do
        if Toggles.DroppedItems and Workspace:FindFirstChild("DroppedItems") then
            for _, item in pairs(Workspace.DroppedItems:GetChildren()) do
                if item:IsA("Model") or item:IsA("BasePart") then
                    local prompt = item:FindFirstChildOfClass("ProximityPrompt") or item:FindFirstChildHorizontal("ProximityPrompt")
                    if prompt then
                        instantCollect(item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) or item, prompt)
                    end
                end
            end
        end
    end
end)

-- Feature 4 Logic: SeedPack Custom Loop
task.spawn(function()
    while task.wait(0.1) do
        if Toggles.SeedPack and Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("SeedPackSpawnClient") then
            for _, pack in pairs(Workspace.Map.SeedPackSpawnClient:GetChildren()) do
                local prompt = pack:FindFirstChildOfClass("ProximityPrompt")
                instantCollect(pack, prompt)
            end
        end
    end
end)

-- Feature 6 Logic: Auto Proxy in Personal Plot Only
task.spawn(function()
    while task.wait(0.2) do
        if Toggles.AutoProxyPlot and ActivePlot then
            for _, obj in pairs(ActivePlot:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    fireproximityprompt(obj, 1)
                end
            end
        end
    end
end)

-- Wild Pet List & Data Matrix
local PetList = {
    "Frog", "Bunny", "Owl", "Deer", "Robin", "Bee", "Monkey", "Golden Dragonfly", "Unicorn", "Raccoon", "Black Dragon", "Ice Serpent"
}

-- ESP Storage
local ActiveESPs = {}
local function createESP(part, name)
    if ActiveESPs[part] then return end
    local bgui = Instance.new("BillboardGui")
    bgui.Size = UDim2.new(0, 150, 0, 30)
    bgui.AlwaysOnTop = true
    bgui.Adornee = part
    bgui.Parent = ScreenGui
    
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.Text = "[ " .. name .. " ]"
    txt.TextColor3 = Color3.fromRGB(0, 255, 150)
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 11
    txt.Parent = bgui
    
    ActiveESPs[part] = bgui
end

task.spawn(function()
    while task.wait(1) do
        if Toggles.PetESP and Workspace:FindFirstChild("WildPetSpawns") then
            for _, pet in pairs(Workspace.WildPetSpawns:GetChildren()) do
                if table.find(PetList, pet.Name) and (pet:IsA("BasePart") or pet.PrimaryPart) then
                    createESP(pet:IsA("BasePart") and pet or pet.PrimaryPart, pet.Name)
                end
            end
        else
            for part, gui in pairs(ActiveESPs) do gui:Destroy() end
            table.clear(ActiveESPs)
        end
    end
end)


-- ==========================================
-- 4. FRAMEWORK UI INTERFACE BUILDER
-- ==========================================

local function createToggle(parent, text, stateKey, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.9, 0, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    frame.Parent = parent
    
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 5) c.Parent = frame
    local s = Instance.new("UIStroke") s.Color = Color3.fromRGB(30, 30, 30) s.Parent = frame
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.7, 0, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(240, 240, 240)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 65, 0, 22)
    btn.Position = UDim2.new(1, -73, 0.5, -11)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 80, 80)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.Parent = frame
    
    local btnC = Instance.new("UICorner") btnC.CornerRadius = UDim.new(0, 4) btnC.Parent = btn
    local btnS = Instance.new("UIStroke") btnS.Color = Color3.fromRGB(50, 50, 50) btnS.Parent = btn

    btn.MouseButton1Click:Connect(function()
        Toggles[stateKey] = not Toggles[stateKey]
        if Toggles[stateKey] then
            btn.Text = "ON"
            quickTween(btn, 0.2, {BackgroundColor3 = Color3.fromRGB(255,255,255), TextColor3 = Color3.fromRGB(0,0,0)})
        else
            btn.Text = "OFF"
            quickTween(btn, 0.2, {BackgroundColor3 = Color3.fromRGB(25, 25, 25), TextColor3 = Color3.fromRGB(255, 80, 80)})
        end
        if callback then callback(Toggles[stateKey]) end
    end)
end

local function createLinkRow(parent, labelText, url)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.9, 0, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.Parent = parent
    
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 5) c.Parent = frame
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.6, 0, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 80, 0, 22)
    btn.Position = UDim2.new(1, -88, 0.5, -11)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = "Copy Link"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.Parent = frame
    
    local bc = Instance.new("UICorner") bc.CornerRadius = UDim.new(0, 4) bc.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        setclipboard(url)
        btn.Text = "Copied!"
        task.wait(2)
        btn.Text = "Copy Link"
    end)
end

-- ==========================================
-- 5. RENDERING CONTENT INTO TABS
-- ==========================================

-- TAB 1: INFO PAGE POPULATION
PlotLabel.Size = UDim2.new(0.9, 0, 0, 25)
PlotLabel.BackgroundTransparency = 1
PlotLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlotLabel.Font = Enum.Font.GothamBold
PlotLabel.TextSize = 12
PlotLabel.Parent = Pages.Info

createLinkRow(Pages.Info, "Discord Server", "https://discord.gg/rb7hCqvTD6")
createLinkRow(Pages.Info, "Telegram Channel 1", "https://t.me/axcmy")
createLinkRow(Pages.Info, "Telegram Channel 2", "https://t.me/mmcmy")

-- TAB 2: FEATURES PAGE POPULATION (THE REAL MEAT)

-- Feature 1: Plot Drops System UI Trigger
createToggle(Pages.Features, "Auto Proxy personal Plot", "AutoProxyPlot", nil)

-- Feature 2: Dropped items collector
createToggle(Pages.Features, "Collect DroppedItems (Instant)", "DroppedItems", nil)

-- Feature 3: Pet ESP Toggle
createToggle(Pages.Features, "Wild Pets ESP Track", "PetESP", nil)

-- Feature 4: SeedPack Teleporter
createToggle(Pages.Features, "Auto Collect SeedPack", "SeedPack", nil)

-- Feature 5: Night Stealer Loader
createToggle(Pages.Features, "Night Stealer (Requires Night)", "NightStealer", function(state)
    if state then
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/projects/refs/heads/main/Games/GrowAGarden/PlantStealer.luau"))()
        end)
    end
end)

-- Dynamic Dropdown for Plot TeleportATION
local function createDropdown(parent, text, items, callback)
    local ddFrame = Instance.new("Frame")
    ddFrame.Size = UDim2.new(0.9, 0, 0, 30)
    ddFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ddFrame.ClipsDescendants = true
    ddFrame.Parent = parent
    
    local ddc = Instance.new("UICorner") ddc.CornerRadius = UDim.new(0, 5) ddc.Parent = ddFrame
    
    local mainBtn = Instance.new("TextButton")
    mainBtn.Size = UDim2.new(1, 0, 0, 30)
    mainBtn.BackgroundTransparency = 1
    mainBtn.Text = text .. " v"
    mainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainBtn.Font = Enum.Font.GothamBold
    mainBtn.TextSize = 11
    mainBtn.Parent = ddFrame
    
    local subContainer = Instance.new("Frame")
    subContainer.Size = UDim2.new(1, 0, 0, #items * 25)
    subContainer.Position = UDim2.new(0, 0, 0, 30)
    subContainer.BackgroundTransparency = 1
    subContainer.Parent = ddFrame
    
    local open = false
    mainBtn.MouseButton1Click:Connect(function()
        open = not open
        quickTween(ddFrame, 0.25, {Size = open and UDim2.new(0.9, 0, 0, 30 + (#items * 25)) or UDim2.new(0.9, 0, 0, 30)})
    end)
    
    for idx, name in pairs(items) do
        local ibtn = Instance.new("TextButton")
        ibtn.Size = UDim2.new(1, 0, 0, 25)
        ibtn.Position = UDim2.new(0, 0, 0, (idx - 1) * 25)
        ibtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        ibtn.Text = tostring(name)
        ibtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ibtn.Font = Enum.Font.Gotham
        ibtn.TextSize = 10
        ibtn.Parent = subContainer
        
        ibtn.MouseButton1Click:Connect(function()
            open = false
            quickTween(ddFrame, 0.25, {Size = UDim2.new(0.9, 0, 0, 30)})
            mainBtn.Text = text .. " [ " .. tostring(name) .. " ]"
            if callback then callback(name) end
        end)
    end
end

-- Teleport Dropdown for Plots 1-8
local plotsTable = {"Plot1", "Plot2", "Plot3", "Plot4", "Plot5", "Plot6", "Plot7", "Plot8"}
createDropdown(Pages.Features, "Teleport to Plots", plotsTable, function(selected)
    if Workspace:FindFirstChild("Gardens") and Workspace.Gardens:FindFirstChild(selected) then
        local target = Workspace.Gardens[selected]
        instantCollect(target:FindFirstChildWhichIsA("BasePart") or target)
    end
end)

-- Teleport & Collect Wild Pets Dropdown
createDropdown(Pages.Features, "Grab Wild Pet (Instant)", PetList, function(selectedPet)
    if Workspace:FindFirstChild("WildPetSpawns") then
        local foundPet = Workspace.WildPetSpawns:FindFirstChild(selectedPet)
        if foundPet then
            local prompt = foundPet:FindFirstChildOfClass("ProximityPrompt") or foundPet:FindFirstChildHorizontal("ProximityPrompt")
            instantCollect(foundPet:IsA("BasePart") and foundPet or foundPet.PrimaryPart, prompt)
        end
    end
end)


-- ==========================================
-- 6. SYSTEM TRANSLATION LAYER ARCHITECTURE
-- ==========================================
local function updateLanguage(langCode)
    CurrentLanguage = langCode
    local dict = Localization[langCode]
    
    TitleLabel.Text = dict.Title
    Pages.Info:FindFirstChildOfClass("TextLabel").Text = dict.PlotScanning
    
    -- Update Navigation Buttons Text dynamically
    for _, btn in pairs(TabContainer:GetChildren()) do
        if btn:IsA("TextButton") then
            if btn.Name == "Info" then btn.Text = dict.TabInfo end
            if btn.Name == "Features" then btn.Text = dict.TabFeatures end
            if btn.Name == "Settings" then btn.Text = dict.TabSettings end
        end
    end
end

-- TAB 3: SETTINGS CONFIGURATION
local LangSwitchBtn = Instance.new("TextButton")
LangSwitchBtn.Size = UDim2.new(0.9, 0, 0, 35)
LangSwitchBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LangSwitchBtn.Text = "تغيير اللغة / Switch Language"
LangSwitchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LangSwitchBtn.Font = Enum.Font.GothamBold
LangSwitchBtn.TextSize = 12
LangSwitchBtn.Parent = Pages.Settings
local lc = Instance.new("UICorner") lc.CornerRadius = UDim.new(0, 5) lc.Parent = LangSwitchBtn

LangSwitchBtn.MouseButton1Click:Connect(function()
    if CurrentLanguage == "AR" then updateLanguage("EN") else updateLanguage("AR") end
end)


-- ==========================================
-- 7. TAB NAVIGATION CONTROLLER SYSTEM
-- ==========================================
local function setupTab(name, pageRef)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0.9, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.Parent = TabContainer
    
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 4) c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(TabContainer:GetChildren()) do
            if b:IsA("TextButton") then
                quickTween(b, 0.2, {BackgroundColor3 = Color3.fromRGB(15, 15, 15), TextColor3 = Color3.fromRGB(150, 150, 150)})
            end
        end
        pageRef.Visible = true
        quickTween(btn, 0.2, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), TextColor3 = Color3.fromRGB(0, 0, 0)})
    end)
end

setupTab("Info", Pages.Info)
setupTab("Features", Pages.Features)
setupTab("Settings", Pages.Settings)


-- Initialization Logic triggers after lang selection
local function initApp(lang)
    LoadingFrame:Destroy()
    updateLanguage(lang)
    MainFrame.Visible = true
    Pages.Features.Visible = true
    
    -- Auto click features tab highlight
    local fBtn = TabContainer:FindFirstChild("Features")
    if fBtn then
        quickTween(fBtn, 0.1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), TextColor3 = Color3.fromRGB(0, 0, 0)})
    end
end

BtnAR.MouseButton1Click:Connect(function() initApp("AR") end)
BtnEN.MouseButton1Click:Connect(function() initApp("EN") end)

-- Window Actions (Close / Minimize Setup)
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Minimized = false
MinBtn.MouseButton1Click:Connect(function()
    Minimized = not Minimized
    if Minimized then
        quickTween(MainFrame, 0.3, {Size = UDim2.new(0, 408, 0, 32)})
        PagesContainer.Visible = false
        Sidebar.Visible = false
    else
        quickTween(MainFrame, 0.3, {Size = UDim2.new(0, 408, 0, 256)})
        PagesContainer.Visible = true
        Sidebar.Visible = true
    end
end)
