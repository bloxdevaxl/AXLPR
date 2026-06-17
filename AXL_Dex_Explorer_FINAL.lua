-- ╔══════════════════════════════════════════════════════════════════╗
-- ║               AXL GARDEN 2 - VIP SCRIPT                        ║
-- ║           Made by AXL | @ex_axl | t.me/axcmy                   ║
-- ╚══════════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- ══════════════════════════════════════════════════════════
--                    LANGUAGE SYSTEM
-- ══════════════════════════════════════════════════════════
local LANG = "EN"
local TRANSLATIONS = {
    EN = {
        loading = "AXL GARDEN 2",
        loading_sub = "Initializing VIP Systems...",
        choose_lang = "Choose Language",
        info_tab = "Info",
        player_tab = "Player",
        features_tab = "Features",
        settings_tab = "Settings",
        copyright = "© AXL GARDEN 2 - All Rights Reserved",
        discord = "Discord",
        telegram_axl = "Telegram AXL",
        telegram_mm = "Telegram MM",
        copy = "Copy",
        copied = "Copied!",
        plot_finder = "Plot Finder",
        your_plot = "Your Plot:",
        not_found = "Not Found",
        navigate_to = "Navigate to Plot:",
        dropped_items = "Dropped Items",
        dropped_toggle = "Auto Collect Dropped Items",
        wild_pets = "Wild Pet ESP",
        auto_buy = "Auto Buy Pet",
        auto_teleport = "Auto Teleport to Pet",
        seed_pack = "Seed Pack Collector",
        seed_toggle = "Auto Collect Seed Packs",
        auto_harvest = "Auto Harvest All Farms",
        auto_proxy = "Auto Proxy (My Garden)",
        proxy_toggle = "Enable Auto Proxy",
        settings_title = "Settings",
        language = "Language",
        transparency = "GUI Transparency",
        notifications = "Notifications",
        notif_on = "ON",
        notif_off = "OFF",
        player_info = "Player Information",
        username = "Username",
        userid = "User ID",
        gamemode = "Game",
        status_active = "✓ ACTIVE",
        status_inactive = "✗ INACTIVE",
        minimize = "Minimize",
        close = "Close",
        found_in = "Found in",
    },
    AR = {
        loading = "AXL GARDEN 2",
        loading_sub = "جاري تهيئة أنظمة VIP...",
        choose_lang = "اختر اللغة",
        info_tab = "معلومات",
        player_tab = "اللاعب",
        features_tab = "مميزات",
        settings_tab = "الإعدادات",
        copyright = "© AXL GARDEN 2 - جميع الحقوق محفوظة",
        discord = "ديسكورد",
        telegram_axl = "تيليغرام AXL",
        telegram_mm = "تيليغرام MM",
        copy = "نسخ",
        copied = "تم النسخ!",
        plot_finder = "باحث المزرعة",
        your_plot = "مزرعتك:",
        not_found = "غير موجود",
        navigate_to = "انتقل إلى:",
        dropped_items = "العناصر الساقطة",
        dropped_toggle = "التقاط تلقائي للعناصر",
        wild_pets = "رادار الحيوانات البرية",
        auto_buy = "شراء تلقائي",
        auto_teleport = "انتقال تلقائي للحيوان",
        seed_pack = "جامع حزم البذور",
        seed_toggle = "التقاط تلقائي للبذور",
        auto_harvest = "حصاد تلقائي لكل المزارع",
        auto_proxy = "بروكسي تلقائي (مزرعتي)",
        proxy_toggle = "تفعيل البروكسي التلقائي",
        settings_title = "الإعدادات",
        language = "اللغة",
        transparency = "شفافية الواجهة",
        notifications = "الإشعارات",
        notif_on = "مفعّل",
        notif_off = "معطّل",
        player_info = "معلومات اللاعب",
        username = "اسم المستخدم",
        userid = "معرف المستخدم",
        gamemode = "اللعبة",
        status_active = "✓ مفعّل",
        status_inactive = "✗ معطّل",
        minimize = "تصغير",
        close = "إغلاق",
        found_in = "موجود في",
    },
    KU = {
        loading = "AXL GARDEN 2",
        loading_sub = "سیستەمی VIP دەستپێدەکات...",
        choose_lang = "زمان هەڵبژێرە",
        info_tab = "زانیاری",
        player_tab = "یاریزان",
        features_tab = "تایبەتمەندی",
        settings_tab = "ڕێکخستن",
        copyright = "© AXL GARDEN 2 - هەموو مافەکان پارێزراون",
        discord = "دیسکۆرد",
        telegram_axl = "تێلێگرام AXL",
        telegram_mm = "تێلێگرام MM",
        copy = "کۆپی",
        copied = "کۆپی کرا!",
        plot_finder = "دۆزەرەوەی زەوی",
        your_plot = "زەویت:",
        not_found = "نەدۆزرایەوە",
        navigate_to = "بڕۆ بۆ:",
        dropped_items = "شتە کەوتووەکان",
        dropped_toggle = "کۆکردنەوەی خۆکار",
        wild_pets = "ESP ئاژەڵی کێوی",
        auto_buy = "کڕینی خۆکار",
        auto_teleport = "گواستنەوەی خۆکار",
        seed_pack = "کۆکەرەوەی تۆوەکان",
        seed_toggle = "کۆکردنەوەی تۆوی خۆکار",
        auto_harvest = "چنینی خۆکاری هەموو زەوییەکان",
        auto_proxy = "پرۆکسی خۆکار (زەویم)",
        proxy_toggle = "چالاककردنی پرۆکسی",
        settings_title = "ڕێکخستن",
        language = "زمان",
        transparency = "ڕووناکی",
        notifications = "ئاگادارکردنەوەکان",
        notif_on = "چالاک",
        notif_off = "ناچالاک",
        player_info = "زانیاری یاریزان",
        username = "ناوی بەکارهێنەر",
        userid = "ناسنامەی بەکارهێنەر",
        gamemode = "یاری",
        status_active = "✓ چالاک",
        status_inactive = "✗ ناچالاک",
        minimize = "بچووک بکەرەوە",
        close = "داخستن",
        found_in = "دۆزرایەوە لە",
    }
}

local function T(key)
    return TRANSLATIONS[LANG][key] or TRANSLATIONS["EN"][key] or key
end

-- ══════════════════════════════════════════════════════════
--                    COLORS & THEME
-- ══════════════════════════════════════════════════════════
local COLORS = {
    BG          = Color3.fromRGB(5, 5, 5),
    BG_DARK     = Color3.fromRGB(0, 0, 0),
    BG_CARD     = Color3.fromRGB(10, 10, 10),
    BORDER      = Color3.fromRGB(255, 255, 255),
    ACCENT      = Color3.fromRGB(220, 180, 50),
    ACCENT2     = Color3.fromRGB(255, 215, 0),
    TEXT        = Color3.fromRGB(255, 255, 255),
    TEXT_DIM    = Color3.fromRGB(160, 160, 160),
    TEXT_GOLD   = Color3.fromRGB(220, 180, 50),
    TAB_ACTIVE  = Color3.fromRGB(20, 20, 20),
    TAB_IDLE    = Color3.fromRGB(5, 5, 5),
    SUCCESS     = Color3.fromRGB(50, 200, 100),
    DANGER      = Color3.fromRGB(220, 60, 60),
    BTN_DARK    = Color3.fromRGB(15, 15, 15),
    TOGGLE_ON   = Color3.fromRGB(50, 200, 100),
    TOGGLE_OFF  = Color3.fromRGB(60, 60, 60),
    TRANSPARENT = Color3.fromRGB(0, 0, 0),
}

-- ══════════════════════════════════════════════════════════
--                    STATE
-- ══════════════════════════════════════════════════════════
local State = {
    currentTab = "info",
    isMinimized = false,
    selectedPlot = "Plot1",
    myPlot = "Searching...",
    droppedItemsToggle = false,
    autoHarvestToggle = false,
    autoProxyToggle = false,
    seedPackToggle = false,
    wildPetESP = {},
    petAutoSettings = {},
    notifications = true,
    droppedConnections = {},
    espBillboards = {},
}

-- Pet rarities and prices
local WILD_PETS = {
    {name="Frog",           rarity="Common",    price=10000,    egg="Common Egg (30%)"},
    {name="Bunny",          rarity="Common",    price=20000,    egg="Common Egg (30%)"},
    {name="Owl",            rarity="Uncommon",  price=25000,    egg=nil},
    {name="Deer",           rarity="Rare",      price=50000,    egg="Common Egg (20%)"},
    {name="Robin",          rarity="Legendary", price=75000,    egg="Common Egg (4.5%)"},
    {name="Bee",            rarity="Legendary", price=1000000,  egg="Common Egg (4.5%)"},
    {name="Monkey",         rarity="Mythic",    price=3000000,  egg=nil},
    {name="Golden Dragonfly",rarity="Mythic",   price=9000000,  egg=nil},
    {name="Unicorn",        rarity="Mythic",    price=12000000, egg="Common Egg (0.3%)"},
    {name="Raccoon",        rarity="Super",     price=15000000, egg="Common Egg (0.2%)"},
    {name="Black Dragon",   rarity="Super",     price=1000000,  egg=nil},
    {name="Ice Serpent",    rarity="Super",     price=0,        egg="Guild Reward"},
}

local RARITY_COLORS = {
    Common    = Color3.fromRGB(180,180,180),
    Uncommon  = Color3.fromRGB(80,200,80),
    Rare      = Color3.fromRGB(80,120,220),
    Legendary = Color3.fromRGB(220,160,40),
    Mythic    = Color3.fromRGB(180,60,220),
    Super     = Color3.fromRGB(220,60,60),
}

-- ══════════════════════════════════════════════════════════
--                    UTILITY FUNCTIONS
-- ══════════════════════════════════════════════════════════
local function Tween(obj, props, t, style, dir)
    local info = TweenInfo.new(t or 0.25, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out)
    TweenService:Create(obj, info, props):Play()
end

local function Notify(msg)
    if not State.notifications then return end
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "AXL GARDEN 2",
            Text = msg,
            Duration = 3,
        })
    end)
end

local function SafeTeleport(pos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

local function CopyToClipboard(text)
    pcall(function() setclipboard(text) end)
end

local function FormatPrice(n)
    if n == 0 then return "Guild Reward" end
    if n >= 1000000 then return string.format("%.1fM ₪", n/1000000) end
    if n >= 1000 then return string.format("%.0fK ₪", n/1000) end
    return tostring(n) .. " ₪"
end

-- ══════════════════════════════════════════════════════════
--                    GAME FUNCTIONS
-- ══════════════════════════════════════════════════════════
local function FindMyPlot()
    local char = LocalPlayer.Character
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end

    local gardensFolder = Workspace:FindFirstChild("Gardens")
    if not gardensFolder then
        -- Try to find it anywhere
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name == "Gardens" and v:IsA("Folder") then
                gardensFolder = v
                break
            end
        end
    end
    if not gardensFolder then return nil end

    local closest, closestDist = nil, math.huge
    for i = 1, 8 do
        local plot = gardensFolder:FindFirstChild("Plot"..i)
        if plot then
            local primary = plot:FindFirstChildWhichIsA("BasePart", true)
            if primary then
                local dist = (hrp.Position - primary.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closest = "Plot"..i
                end
            end
        end
    end
    return closest, closestDist
end

local function TeleportToPlot(plotName)
    local gardensFolder = Workspace:FindFirstChild("Gardens")
    if not gardensFolder then return end
    local plot = gardensFolder:FindFirstChild(plotName)
    if plot then
        local part = plot:FindFirstChildWhichIsA("BasePart", true)
        if part then
            SafeTeleport(part.Position + Vector3.new(0, 5, 0))
            Notify("Teleported to " .. plotName)
        end
    end
end

local function CollectDroppedItem(item)
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local part = item:FindFirstChildWhichIsA("BasePart")
        if part then
            for i = 1, 5 do
                hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 2, 0))
                task.wait(0.05)
                local remotes = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Events")
                if remotes then
                    local collect = remotes:FindFirstChild("CollectItem") or remotes:FindFirstChild("Collect")
                    if collect then
                        pcall(function() collect:FireServer(item) end)
                    end
                end
                task.wait(0.05)
            end
        end
    end)
end

local function StartDroppedItemsLoop()
    if State.droppedItemsLoop then
        State.droppedItemsLoop = false
        task.wait(0.1)
    end
    State.droppedItemsLoop = true
    task.spawn(function()
        while State.droppedItemsLoop and State.droppedItemsToggle do
            pcall(function()
                local dropped = Workspace:FindFirstChild("DroppedItems")
                if dropped then
                    for _, item in ipairs(dropped:GetChildren()) do
                        if State.droppedItemsToggle then
                            CollectDroppedItem(item)
                        end
                    end
                end
            end)
            task.wait(0.3)
        end
    end)
end

local function ClearESP()
    for _, bb in ipairs(State.espBillboards) do
        pcall(function() bb:Destroy() end)
    end
    State.espBillboards = {}
end

local function CreateESPBillboard(part, petName, rarity)
    local bb = Instance.new("BillboardGui")
    bb.Name = "AXL_ESP_"..petName
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 180, 0, 50)
    bb.StudsOffset = Vector3.new(0, 4, 0)
    bb.Adornee = part
    bb.Parent = part

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 1
    frame.BorderColor3 = RARITY_COLORS[rarity] or Color3.fromRGB(255,255,255)
    frame.Parent = bb

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = "🐾 " .. petName .. "\n[" .. rarity .. "]"
    label.TextColor3 = RARITY_COLORS[rarity] or Color3.fromRGB(255,255,255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = frame

    table.insert(State.espBillboards, bb)
    return bb
end

local function ScanWildPets()
    ClearESP()
    pcall(function()
        for _, petData in ipairs(WILD_PETS) do
            if State.wildPetESP[petData.name] then
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj.Name:lower():find(petData.name:lower()) and obj:IsA("Model") then
                        local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                        if primary then
                            CreateESPBillboard(primary, petData.name, petData.rarity)
                        end
                    end
                end
            end
        end
    end)
end

local function StartSeedPackLoop()
    if State.seedPackLoop then
        State.seedPackLoop = false
        task.wait(0.1)
    end
    State.seedPackLoop = true
    task.spawn(function()
        while State.seedPackLoop and State.seedPackToggle do
            pcall(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj.Name == "SeedPackSpawnClient" or obj.Name:find("SeedPack") then
                        local part = obj:FindFirstChildWhichIsA("BasePart") or (obj:IsA("BasePart") and obj)
                        if part then
                            SafeTeleport(part.Position + Vector3.new(0, 3, 0))
                            task.wait(0.1)
                            local remotes = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Events")
                            if remotes then
                                local collect = remotes:FindFirstChild("CollectSeedPack") or remotes:FindFirstChild("Collect")
                                if collect then
                                    pcall(function() collect:FireServer(obj) end)
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(0.5)
        end
    end)
end

local function StartAutoHarvest()
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/projects/refs/heads/main/Games/GrowAGarden/PlantStealer.luau"))()
        end)
    end)
end

local function StartAutoProxy()
    if State.autoProxyLoop then
        State.autoProxyLoop = false
        task.wait(0.1)
    end
    State.autoProxyLoop = true
    task.spawn(function()
        while State.autoProxyLoop and State.autoProxyToggle do
            pcall(function()
                local myPlotName = FindMyPlot()
                if myPlotName then
                    local gardensFolder = Workspace:FindFirstChild("Gardens")
                    if gardensFolder then
                        local plot = gardensFolder:FindFirstChild(myPlotName)
                        if plot then
                            for _, item in ipairs(plot:GetDescendants()) do
                                if item:IsA("BasePart") and item.Name:find("Collectible") then
                                    CollectDroppedItem(item)
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)
end

-- ══════════════════════════════════════════════════════════
--              GUI BUILDER
-- ══════════════════════════════════════════════════════════
-- Remove old GUI if exists
if LocalPlayer.PlayerGui:FindFirstChild("AXL_GARDEN_2_GUI") then
    LocalPlayer.PlayerGui.AXL_GARDEN_2_GUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AXL_GARDEN_2_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LocalPlayer.PlayerGui

-- ══════════════════════════════════════════════════════════
--              LOADING SCREEN
-- ══════════════════════════════════════════════════════════
local LoadFrame = Instance.new("Frame")
LoadFrame.Name = "LoadScreen"
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.Position = UDim2.new(0, 0, 0, 0)
LoadFrame.BackgroundColor3 = COLORS.BG_DARK
LoadFrame.BorderSizePixel = 0
LoadFrame.ZIndex = 100
LoadFrame.Parent = ScreenGui

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(0, 500, 0, 80)
LoadTitle.Position = UDim2.new(0.5, -250, 0.35, 0)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "AXL GARDEN 2"
LoadTitle.TextColor3 = COLORS.ACCENT2
LoadTitle.TextScaled = true
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.ZIndex = 101
LoadTitle.Parent = LoadFrame

local LoadSub = Instance.new("TextLabel")
LoadSub.Size = UDim2.new(0, 500, 0, 35)
LoadSub.Position = UDim2.new(0.5, -250, 0.47, 0)
LoadSub.BackgroundTransparency = 1
LoadSub.Text = T("loading_sub")
LoadSub.TextColor3 = COLORS.TEXT_DIM
LoadSub.TextScaled = true
LoadSub.Font = Enum.Font.Gotham
LoadSub.ZIndex = 101
LoadSub.Parent = LoadFrame

-- Language selector on load screen
local LangFrame = Instance.new("Frame")
LangFrame.Size = UDim2.new(0, 360, 0, 60)
LangFrame.Position = UDim2.new(0.5, -180, 0.58, 0)
LangFrame.BackgroundTransparency = 1
LangFrame.ZIndex = 101
LangFrame.Parent = LoadFrame

local langBtns = {
    {lang="EN", label="🇬🇧 English"},
    {lang="AR", label="🇸🇦 العربية"},
    {lang="KU", label="🏴 کوردی"},
}

for i, lb in ipairs(langBtns) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 110, 0, 50)
    btn.Position = UDim2.new(0, (i-1)*125, 0, 0)
    btn.BackgroundColor3 = COLORS.BG_CARD
    btn.BorderSizePixel = 1
    btn.BorderColor3 = COLORS.BORDER
    btn.Text = lb.label
    btn.TextColor3 = COLORS.TEXT
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 102
    btn.Parent = LangFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        LANG = lb.lang
        LoadSub.Text = T("loading_sub")
        Tween(btn, {BackgroundColor3 = COLORS.ACCENT}, 0.15)
        task.wait(0.15)
        Tween(btn, {BackgroundColor3 = COLORS.BG_CARD}, 0.15)
    end)
end

-- Progress bar
local ProgressBG = Instance.new("Frame")
ProgressBG.Size = UDim2.new(0, 400, 0, 6)
ProgressBG.Position = UDim2.new(0.5, -200, 0.72, 0)
ProgressBG.BackgroundColor3 = Color3.fromRGB(30,30,30)
ProgressBG.BorderSizePixel = 1
ProgressBG.BorderColor3 = COLORS.BORDER
ProgressBG.ZIndex = 101
ProgressBG.Parent = LoadFrame

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = COLORS.ACCENT2
ProgressBar.BorderSizePixel = 0
ProgressBar.ZIndex = 102
ProgressBar.Parent = ProgressBG

local ProgressLabel = Instance.new("TextLabel")
ProgressLabel.Size = UDim2.new(0, 400, 0, 30)
ProgressLabel.Position = UDim2.new(0.5, -200, 0.74, 0)
ProgressLabel.BackgroundTransparency = 1
ProgressLabel.Text = "0%"
ProgressLabel.TextColor3 = COLORS.TEXT_DIM
ProgressLabel.TextScaled = true
ProgressLabel.Font = Enum.Font.GothamBold
ProgressLabel.ZIndex = 101
ProgressLabel.Parent = LoadFrame

-- Animate progress
task.spawn(function()
    for i = 1, 100 do
        Tween(ProgressBar, {Size = UDim2.new(i/100, 0, 1, 0)}, 0.03, Enum.EasingStyle.Linear)
        ProgressLabel.Text = i .. "%"
        task.wait(0.04)
    end
    task.wait(0.3)
    Tween(LoadFrame, {BackgroundTransparency = 1}, 0.6)
    for _, v in ipairs(LoadFrame:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("Frame") then
            pcall(function()
                Tween(v, {BackgroundTransparency = 1, TextTransparency = 1}, 0.5)
            end)
        end
    end
    task.wait(0.7)
    LoadFrame:Destroy()
end)

-- ══════════════════════════════════════════════════════════
--              MAIN GUI FRAME
-- ══════════════════════════════════════════════════════════
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 680, 0, 440)
MainFrame.Position = UDim2.new(0.5, -340, 0.5, -220)
MainFrame.BackgroundColor3 = COLORS.BG
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = COLORS.BORDER
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Animate in
MainFrame.Position = UDim2.new(0.5, -340, -0.5, 0)
task.delay(4.5, function()
    Tween(MainFrame, {Position = UDim2.new(0.5, -340, 0.5, -220)}, 0.5, Enum.EasingStyle.Back)
end)

-- TITLE BAR
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 42)
TitleBar.BackgroundColor3 = COLORS.BG_DARK
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Left gold accent line
local GoldLine = Instance.new("Frame")
GoldLine.Size = UDim2.new(0, 3, 1, 0)
GoldLine.BackgroundColor3 = COLORS.ACCENT2
GoldLine.BorderSizePixel = 0
GoldLine.Parent = TitleBar

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Size = UDim2.new(0, 32, 0, 32)
TitleIcon.Position = UDim2.new(0, 12, 0, 5)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Text = "🌱"
TitleIcon.TextScaled = true
TitleIcon.Font = Enum.Font.GothamBold
TitleIcon.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 200, 1, 0)
TitleLabel.Position = UDim2.new(0, 48, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "AXL GARDEN 2"
TitleLabel.TextColor3 = COLORS.ACCENT2
TitleLabel.TextScaled = false
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local VIPBadge = Instance.new("TextLabel")
VIPBadge.Size = UDim2.new(0, 50, 0, 22)
VIPBadge.Position = UDim2.new(0, 252, 0, 10)
VIPBadge.BackgroundColor3 = COLORS.ACCENT
VIPBadge.BorderSizePixel = 0
VIPBadge.Text = "VIP"
VIPBadge.TextColor3 = COLORS.BG_DARK
VIPBadge.TextScaled = true
VIPBadge.Font = Enum.Font.GothamBold
VIPBadge.Parent = TitleBar
Instance.new("UICorner", VIPBadge).CornerRadius = UDim.new(0, 3)

-- Window control buttons (macOS-style)
local function MakeWinBtn(icon, xOff, bgColor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 14, 0, 14)
    btn.Position = UDim2.new(1, xOff, 0.5, -7)
    btn.BackgroundColor3 = bgColor
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 8
    btn.TextColor3 = COLORS.BG_DARK
    btn.Parent = TitleBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

    btn.MouseEnter:Connect(function()
        btn.Text = icon
        Tween(btn, {Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(1, xOff-1, 0.5, -8)}, 0.1)
    end)
    btn.MouseLeave:Connect(function()
        btn.Text = ""
        Tween(btn, {Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(1, xOff, 0.5, -7)}, 0.1)
    end)
    return btn
end

local CloseBtn   = MakeWinBtn("✕", -22, Color3.fromRGB(220,60,60))
local MinBtn     = MakeWinBtn("−", -42, Color3.fromRGB(220,180,50))

-- Minimize
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, 0, 1, -42)
ContentArea.Position = UDim2.new(0, 0, 0, 42)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

MinBtn.MouseButton1Click:Connect(function()
    if State.isMinimized then
        State.isMinimized = false
        Tween(MainFrame, {Size = UDim2.new(0, 680, 0, 440)}, 0.3, Enum.EasingStyle.Back)
    else
        State.isMinimized = true
        Tween(MainFrame, {Size = UDim2.new(0, 680, 0, 42)}, 0.3, Enum.EasingStyle.Quart)
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    task.wait(0.35)
    ScreenGui:Destroy()
    -- Clean up
    State.droppedItemsToggle = false
    State.droppedItemsLoop = false
    State.autoHarvestToggle = false
    State.autoProxyToggle = false
    State.autoProxyLoop = false
    State.seedPackToggle = false
    State.seedPackLoop = false
    ClearESP()
end)

-- Drag
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Bottom border accent
local BottomAccent = Instance.new("Frame")
BottomAccent.Size = UDim2.new(1, 0, 0, 1)
BottomAccent.Position = UDim2.new(0, 0, 1, -1)
BottomAccent.BackgroundColor3 = COLORS.ACCENT2
BottomAccent.BorderSizePixel = 0
BottomAccent.Parent = MainFrame

-- ══════════════════════════════════════════════════════════
--                    TAB BAR
-- ══════════════════════════════════════════════════════════
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 38)
TabBar.Position = UDim2.new(0, 0, 0, 0)
TabBar.BackgroundColor3 = COLORS.BG_DARK
TabBar.BorderSizePixel = 0
TabBar.Parent = ContentArea

local TabSeparator = Instance.new("Frame")
TabSeparator.Size = UDim2.new(1, 0, 0, 1)
TabSeparator.Position = UDim2.new(0, 0, 1, -1)
TabSeparator.BackgroundColor3 = COLORS.BORDER
TabSeparator.BorderSizePixel = 0
TabSeparator.Parent = TabBar

-- Tab pages container
local Pages = Instance.new("Frame")
Pages.Size = UDim2.new(1, 0, 1, -38)
Pages.Position = UDim2.new(0, 0, 0, 38)
Pages.BackgroundTransparency = 1
Pages.ClipsDescendants = true
Pages.Parent = ContentArea

local TabButtons = {}
local TabPages = {}

local TABS = {
    {id="info",     icon="ℹ", labelKey="info_tab"},
    {id="player",   icon="👤", labelKey="player_tab"},
    {id="features", icon="⚡", labelKey="features_tab"},
    {id="settings", icon="⚙", labelKey="settings_tab"},
}

local function MakePage(id)
    local page = Instance.new("ScrollingFrame")
    page.Name = id.."_page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = COLORS.ACCENT
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = Pages

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 12)
    pad.PaddingRight = UDim.new(0, 12)
    pad.PaddingTop = UDim.new(0, 12)
    pad.PaddingBottom = UDim.new(0, 12)
    pad.Parent = page

    return page
end

local function SwitchTab(id)
    State.currentTab = id
    for tabId, page in pairs(TabPages) do
        page.Visible = (tabId == id)
    end
    for tabId, btn in pairs(TabButtons) do
        if tabId == id then
            Tween(btn, {BackgroundColor3 = COLORS.TAB_ACTIVE}, 0.15)
            btn.TextColor3 = COLORS.ACCENT2
        else
            Tween(btn, {BackgroundColor3 = COLORS.TAB_IDLE}, 0.15)
            btn.TextColor3 = COLORS.TEXT_DIM
        end
    end
end

local tabW = 1 / #TABS
for i, tab in ipairs(TABS) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(tabW, -2, 1, -6)
    btn.Position = UDim2.new((i-1)*tabW, 1, 0, 3)
    btn.BackgroundColor3 = COLORS.TAB_IDLE
    btn.BorderSizePixel = 0
    btn.Text = tab.icon .. " " .. T(tab.labelKey)
    btn.TextColor3 = COLORS.TEXT_DIM
    btn.TextScaled = false
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = TabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    local underline = Instance.new("Frame")
    underline.Size = UDim2.new(0, 0, 0, 2)
    underline.Position = UDim2.new(0.5, 0, 1, 0)
    underline.AnchorPoint = Vector2.new(0.5, 0)
    underline.BackgroundColor3 = COLORS.ACCENT2
    underline.BorderSizePixel = 0
    underline.Parent = btn

    TabButtons[tab.id] = btn
    TabPages[tab.id] = MakePage(tab.id)

    btn.MouseButton1Click:Connect(function()
        SwitchTab(tab.id)
        Tween(underline, {Size = UDim2.new(0.8, 0, 0, 2)}, 0.2)
        task.delay(0.3, function()
            if State.currentTab ~= tab.id then
                Tween(underline, {Size = UDim2.new(0, 0, 0, 2)}, 0.2)
            end
        end)
    end)
end

-- ══════════════════════════════════════════════════════════
--                    UI HELPERS
-- ══════════════════════════════════════════════════════════
local function MakeCard(parent, layoutOrder)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = COLORS.BG_CARD
    card.BorderSizePixel = 1
    card.BorderColor3 = Color3.fromRGB(35, 35, 35)
    card.LayoutOrder = layoutOrder or 0
    card.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = card

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = card

    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 12)
    pad.PaddingRight = UDim.new(0, 12)
    pad.PaddingTop = UDim.new(0, 10)
    pad.PaddingBottom = UDim.new(0, 10)
    pad.Parent = card

    return card
end

local function MakeSectionTitle(parent, text, layoutOrder)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 22)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = COLORS.ACCENT2
    label.TextScaled = false
    label.TextSize = 12
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = layoutOrder or 0
    label.Parent = parent
    return label
end

local function MakeRow(parent, labelText, valueText, layoutOrder)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 26)
    row.BackgroundTransparency = 1
    row.LayoutOrder = layoutOrder or 0
    row.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.45, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = COLORS.TEXT_DIM
    lbl.TextScaled = false
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local val = Instance.new("TextLabel")
    val.Size = UDim2.new(0.55, 0, 1, 0)
    val.Position = UDim2.new(0.45, 0, 0, 0)
    val.BackgroundTransparency = 1
    val.Text = valueText or ""
    val.TextColor3 = COLORS.TEXT
    val.TextScaled = false
    val.TextSize = 12
    val.Font = Enum.Font.GothamBold
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.Parent = row

    return row, val
end

local function MakeButton(parent, text, layoutOrder)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = COLORS.BTN_DARK
    btn.BorderSizePixel = 1
    btn.BorderColor3 = COLORS.BORDER
    btn.Text = text
    btn.TextColor3 = COLORS.TEXT
    btn.TextScaled = false
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.LayoutOrder = layoutOrder or 0
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

    btn.MouseEnter:Connect(function()
        Tween(btn, {BackgroundColor3 = Color3.fromRGB(25,25,25), BorderColor3 = COLORS.ACCENT2}, 0.15)
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, {BackgroundColor3 = COLORS.BTN_DARK, BorderColor3 = COLORS.BORDER}, 0.15)
    end)
    btn.MouseButton1Click:Connect(function()
        Tween(btn, {BackgroundColor3 = COLORS.ACCENT, TextColor3 = COLORS.BG_DARK}, 0.08)
        task.delay(0.12, function()
            Tween(btn, {BackgroundColor3 = COLORS.BTN_DARK, TextColor3 = COLORS.TEXT}, 0.12)
        end)
    end)
    return btn
end

local function MakeToggle(parent, labelText, initialState, layoutOrder, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 34)
    row.BackgroundColor3 = COLORS.BTN_DARK
    row.BorderSizePixel = 1
    row.BorderColor3 = Color3.fromRGB(35,35,35)
    row.LayoutOrder = layoutOrder or 0
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -70, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = COLORS.TEXT
    lbl.TextScaled = false
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local toggleBG = Instance.new("Frame")
    toggleBG.Size = UDim2.new(0, 44, 0, 22)
    toggleBG.Position = UDim2.new(1, -54, 0.5, -11)
    toggleBG.BackgroundColor3 = initialState and COLORS.TOGGLE_ON or COLORS.TOGGLE_OFF
    toggleBG.BorderSizePixel = 0
    toggleBG.Parent = row
    Instance.new("UICorner", toggleBG).CornerRadius = UDim.new(1, 0)

    local toggleKnob = Instance.new("Frame")
    toggleKnob.Size = UDim2.new(0, 18, 0, 18)
    toggleKnob.Position = initialState and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    toggleKnob.BackgroundColor3 = COLORS.TEXT
    toggleKnob.BorderSizePixel = 0
    toggleKnob.Parent = toggleBG
    Instance.new("UICorner", toggleKnob).CornerRadius = UDim.new(1, 0)

    local currentState = initialState
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(1, 0, 1, 0)
    toggleBtn.BackgroundTransparency = 1
    toggleBtn.Text = ""
    toggleBtn.Parent = row

    toggleBtn.MouseButton1Click:Connect(function()
        currentState = not currentState
        Tween(toggleBG, {BackgroundColor3 = currentState and COLORS.TOGGLE_ON or COLORS.TOGGLE_OFF}, 0.2)
        Tween(toggleKnob, {Position = currentState and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)}, 0.2)
        if callback then callback(currentState) end
    end)
    return row, function() return currentState end
end

local function MakeDropdown(parent, options, selected, layoutOrder, callback)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 34)
    holder.BackgroundTransparency = 1
    holder.LayoutOrder = layoutOrder or 0
    holder.ClipsDescendants = false
    holder.Parent = parent

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = COLORS.BTN_DARK
    btn.BorderSizePixel = 1
    btn.BorderColor3 = COLORS.BORDER
    btn.Text = "▼  " .. selected
    btn.TextColor3 = COLORS.TEXT
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.Parent = holder
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

    local dropFrame = Instance.new("Frame")
    dropFrame.Size = UDim2.new(1, 0, 0, 0)
    dropFrame.Position = UDim2.new(0, 0, 0, 36)
    dropFrame.BackgroundColor3 = Color3.fromRGB(12,12,12)
    dropFrame.BorderSizePixel = 1
    dropFrame.BorderColor3 = COLORS.BORDER
    dropFrame.ClipsDescendants = true
    dropFrame.ZIndex = 10
    dropFrame.Visible = false
    dropFrame.Parent = holder
    Instance.new("UICorner", dropFrame).CornerRadius = UDim.new(0, 5)

    local dLayout = Instance.new("UIListLayout")
    dLayout.SortOrder = Enum.SortOrder.LayoutOrder
    dLayout.Parent = dropFrame

    local isOpen = false
    local currentSel = selected

    for i, opt in ipairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, 0, 0, 30)
        optBtn.BackgroundColor3 = Color3.fromRGB(12,12,12)
        optBtn.BorderSizePixel = 0
        optBtn.Text = opt
        optBtn.TextColor3 = COLORS.TEXT
        optBtn.TextSize = 12
        optBtn.Font = Enum.Font.Gotham
        optBtn.AutoButtonColor = false
        optBtn.LayoutOrder = i
        optBtn.ZIndex = 11
        optBtn.Parent = dropFrame

        optBtn.MouseEnter:Connect(function()
            Tween(optBtn, {BackgroundColor3 = Color3.fromRGB(22,22,22)}, 0.1)
        end)
        optBtn.MouseLeave:Connect(function()
            Tween(optBtn, {BackgroundColor3 = Color3.fromRGB(12,12,12)}, 0.1)
        end)
        optBtn.MouseButton1Click:Connect(function()
            currentSel = opt
            btn.Text = "▼  " .. opt
            isOpen = false
            Tween(dropFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
            task.wait(0.16)
            dropFrame.Visible = false
            if callback then callback(opt) end
        end)
    end

    btn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            dropFrame.Visible = true
            local targetH = math.min(#options * 30, 150)
            Tween(dropFrame, {Size = UDim2.new(1, 0, 0, targetH)}, 0.2, Enum.EasingStyle.Back)
        else
            Tween(dropFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
            task.wait(0.16)
            dropFrame.Visible = false
        end
    end)
    return holder
end

local function MakeLinkRow(parent, icon, labelText, url, layoutOrder)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 36)
    row.BackgroundColor3 = COLORS.BTN_DARK
    row.BorderSizePixel = 1
    row.BorderColor3 = Color3.fromRGB(35,35,35)
    row.LayoutOrder = layoutOrder or 0
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)

    local iconL = Instance.new("TextLabel")
    iconL.Size = UDim2.new(0, 30, 1, 0)
    iconL.BackgroundTransparency = 1
    iconL.Text = icon
    iconL.TextScaled = true
    iconL.Font = Enum.Font.GothamBold
    iconL.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -120, 1, 0)
    lbl.Position = UDim2.new(0, 32, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = COLORS.TEXT
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local copyBtn = Instance.new("TextButton")
    copyBtn.Size = UDim2.new(0, 70, 0, 26)
    copyBtn.Position = UDim2.new(1, -78, 0.5, -13)
    copyBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    copyBtn.BorderSizePixel = 1
    copyBtn.BorderColor3 = COLORS.BORDER
    copyBtn.Text = T("copy")
    copyBtn.TextColor3 = COLORS.TEXT
    copyBtn.TextSize = 11
    copyBtn.Font = Enum.Font.GothamBold
    copyBtn.AutoButtonColor = false
    copyBtn.Parent = row
    Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 4)

    copyBtn.MouseButton1Click:Connect(function()
        CopyToClipboard(url)
        copyBtn.Text = T("copied")
        copyBtn.TextColor3 = COLORS.SUCCESS
        task.delay(1.5, function()
            copyBtn.Text = T("copy")
            copyBtn.TextColor3 = COLORS.TEXT
        end)
    end)
    return row
end

-- ══════════════════════════════════════════════════════════
--                    INFO PAGE
-- ══════════════════════════════════════════════════════════
local infoPage = TabPages["info"]

-- Copyright card
local copyrightCard = MakeCard(infoPage, 1)

MakeSectionTitle(copyrightCard, "© " .. T("copyright"), 1)

local divInfo = Instance.new("Frame")
divInfo.Size = UDim2.new(1, 0, 0, 1)
divInfo.BackgroundColor3 = Color3.fromRGB(30,30,30)
divInfo.BorderSizePixel = 0
divInfo.LayoutOrder = 2
divInfo.Parent = copyrightCard

-- Version row
local _, versionVal = MakeRow(copyrightCard, "Version", "2.0 VIP", 3)
versionVal.TextColor3 = COLORS.ACCENT2

local _, devVal = MakeRow(copyrightCard, "Developer", "@ex_axl", 4)
devVal.TextColor3 = COLORS.ACCENT

local _, gameVal = MakeRow(copyrightCard, "Game", "Grow A Garden", 5)

-- Links card
local linksCard = MakeCard(infoPage, 2)
MakeSectionTitle(linksCard, "🔗 Links", 1)

MakeLinkRow(linksCard, "💬", "discord.gg/rb7hCqvTD6", "https://discord.gg/rb7hCqvTD6", 2)
MakeLinkRow(linksCard, "📱", "t.me/axcmy", "https://t.me/axcmy", 3)
MakeLinkRow(linksCard, "📱", "t.me/mmcmy", "https://t.me/mmcmy", 4)

-- Info note card
local noteCard = MakeCard(infoPage, 3)
local noteLabel = Instance.new("TextLabel")
noteLabel.Size = UDim2.new(1, 0, 0, 0)
noteLabel.AutomaticSize = Enum.AutomaticSize.Y
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "⚠️ This script is for educational use only.\nAll rights reserved — AXL GARDEN 2\nTelegram: @axcmy | @mmcmy"
noteLabel.TextColor3 = COLORS.TEXT_DIM
noteLabel.TextSize = 11
noteLabel.Font = Enum.Font.Gotham
noteLabel.TextXAlignment = Enum.TextXAlignment.Left
noteLabel.TextWrapped = true
noteLabel.LayoutOrder = 2
noteLabel.Parent = noteCard

-- ══════════════════════════════════════════════════════════
--                    PLAYER PAGE
-- ══════════════════════════════════════════════════════════
local playerPage = TabPages["player"]

local playerCard = MakeCard(playerPage, 1)
MakeSectionTitle(playerCard, "👤 " .. T("player_info"), 1)

local _, unameVal   = MakeRow(playerCard, T("username"),  LocalPlayer.Name, 2)
local _, uidVal     = MakeRow(playerCard, T("userid"),    tostring(LocalPlayer.UserId), 3)
local _, gameVal2   = MakeRow(playerCard, T("gamemode"),  "Grow A Garden", 4)

local plotCard = MakeCard(playerPage, 2)
MakeSectionTitle(plotCard, "🌿 " .. T("plot_finder"), 1)

local _, myPlotVal = MakeRow(plotCard, T("your_plot"), T("not_found"), 2)
myPlotVal.TextColor3 = COLORS.ACCENT2

-- Plot dropdown
local plotOptions = {}
for i = 1, 8 do table.insert(plotOptions, "Plot"..i) end

MakeSectionTitle(plotCard, T("navigate_to"), 3)
local plotDropdown = MakeDropdown(plotCard, plotOptions, "Plot1", 4, function(opt)
    State.selectedPlot = opt
    TeleportToPlot(opt)
end)

local findPlotBtn = MakeButton(plotCard, "🔍 " .. T("plot_finder"), 5)
findPlotBtn.MouseButton1Click:Connect(function()
    local plotName, dist = FindMyPlot()
    if plotName then
        State.myPlot = plotName
        myPlotVal.Text = plotName .. (dist and string.format(" (%.0fm)", dist) or "")
        Notify(T("found_in") .. " " .. plotName)
    else
        myPlotVal.Text = T("not_found")
    end
end)

-- Auto find plot loop
task.spawn(function()
    while true do
        local plotName, dist = FindMyPlot()
        if plotName then
            State.myPlot = plotName
            if myPlotVal and myPlotVal.Parent then
                myPlotVal.Text = plotName .. (dist and string.format(" (%.0fm)", dist) or "")
            end
        end
        task.wait(3)
    end
end)

-- ══════════════════════════════════════════════════════════
--                    FEATURES PAGE
-- ══════════════════════════════════════════════════════════
local featPage = TabPages["features"]

-- ─── Feature 1: Gardens / Plot Finder ───
local gCard = MakeCard(featPage, 1)
MakeSectionTitle(gCard, "🌱 Feat 1 — Gardens / Plot Finder", 1)
MakeSectionTitle(gCard, "Select & Navigate to any Plot (1-8)", 2)

local gDrop = MakeDropdown(gCard, plotOptions, "Plot1", 3, function(opt)
    TeleportToPlot(opt)
end)

local gFindBtn = MakeButton(gCard, "📍 Find My Plot Now", 4)
gFindBtn.MouseButton1Click:Connect(function()
    local p, d = FindMyPlot()
    if p then
        Notify("You are at: " .. p)
    else
        Notify(T("not_found"))
    end
end)

-- ─── Feature 2: Dropped Items ───
local diCard = MakeCard(featPage, 2)
MakeSectionTitle(diCard, "📦 Feat 2 — " .. T("dropped_items"), 1)

MakeToggle(diCard, T("dropped_toggle"), false, 2, function(state)
    State.droppedItemsToggle = state
    if state then
        StartDroppedItemsLoop()
        Notify("DroppedItems Collector: ON")
    else
        State.droppedItemsLoop = false
        Notify("DroppedItems Collector: OFF")
    end
end)

-- ─── Feature 3: Wild Pet Spawns ESP ───
local wpCard = MakeCard(featPage, 3)
MakeSectionTitle(wpCard, "🐾 Feat 3 — " .. T("wild_pets"), 1)

for i, pet in ipairs(WILD_PETS) do
    State.wildPetESP[pet.name] = false
    State.petAutoSettings[pet.name] = {autoBuy=false, autoTp=false}

    local petRow = Instance.new("Frame")
    petRow.Size = UDim2.new(1, 0, 0, 0)
    petRow.AutomaticSize = Enum.AutomaticSize.Y
    petRow.BackgroundColor3 = Color3.fromRGB(8,8,8)
    petRow.BorderSizePixel = 1
    petRow.BorderColor3 = Color3.fromRGB(25,25,25)
    petRow.LayoutOrder = i + 1
    petRow.Parent = wpCard
    Instance.new("UICorner", petRow).CornerRadius = UDim.new(0, 4)

    local pLayout = Instance.new("UIListLayout")
    pLayout.Padding = UDim.new(0, 3)
    pLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pLayout.Parent = petRow
    local pPad = Instance.new("UIPadding")
    pPad.PaddingLeft = UDim.new(0, 8)
    pPad.PaddingRight = UDim.new(0, 8)
    pPad.PaddingTop = UDim.new(0, 6)
    pPad.PaddingBottom = UDim.new(0, 6)
    pPad.Parent = petRow

    local headerRow = Instance.new("Frame")
    headerRow.Size = UDim2.new(1, 0, 0, 22)
    headerRow.BackgroundTransparency = 1
    headerRow.LayoutOrder = 1
    headerRow.Parent = petRow

    local petName = Instance.new("TextLabel")
    petName.Size = UDim2.new(0.5, 0, 1, 0)
    petName.BackgroundTransparency = 1
    petName.Text = pet.name
    petName.TextColor3 = RARITY_COLORS[pet.rarity] or COLORS.TEXT
    petName.TextSize = 12
    petName.Font = Enum.Font.GothamBold
    petName.TextXAlignment = Enum.TextXAlignment.Left
    petName.Parent = headerRow

    local rarityLbl = Instance.new("TextLabel")
    rarityLbl.Size = UDim2.new(0.25, 0, 1, 0)
    rarityLbl.Position = UDim2.new(0.5, 0, 0, 0)
    rarityLbl.BackgroundTransparency = 1
    rarityLbl.Text = "[" .. pet.rarity .. "]"
    rarityLbl.TextColor3 = RARITY_COLORS[pet.rarity] or COLORS.TEXT
    rarityLbl.TextSize = 10
    rarityLbl.Font = Enum.Font.Gotham
    rarityLbl.TextXAlignment = Enum.TextXAlignment.Center
    rarityLbl.Parent = headerRow

    local priceLbl = Instance.new("TextLabel")
    priceLbl.Size = UDim2.new(0.25, 0, 1, 0)
    priceLbl.Position = UDim2.new(0.75, 0, 0, 0)
    priceLbl.BackgroundTransparency = 1
    priceLbl.Text = FormatPrice(pet.price)
    priceLbl.TextColor3 = COLORS.TEXT_DIM
    priceLbl.TextSize = 10
    priceLbl.Font = Enum.Font.Gotham
    priceLbl.TextXAlignment = Enum.TextXAlignment.Right
    priceLbl.Parent = headerRow

    -- ESP toggle
    MakeToggle(petRow, "ESP " .. pet.name, false, 2, function(state)
        State.wildPetESP[pet.name] = state
        ScanWildPets()
    end)

    -- Auto Teleport toggle
    MakeToggle(petRow, T("auto_teleport") .. " — " .. pet.name, false, 3, function(state)
        State.petAutoSettings[pet.name].autoTp = state
        if state then
            task.spawn(function()
                while State.petAutoSettings[pet.name].autoTp do
                    pcall(function()
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            if obj.Name:lower():find(pet.name:lower()) and obj:IsA("Model") then
                                local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                                if primary then
                                    SafeTeleport(primary.Position + Vector3.new(0, 4, 0))
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end)

    -- Auto Buy toggle
    MakeToggle(petRow, T("auto_buy") .. " — " .. pet.name, false, 4, function(state)
        State.petAutoSettings[pet.name].autoBuy = state
        if state then
            task.spawn(function()
                while State.petAutoSettings[pet.name].autoBuy do
                    pcall(function()
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            if obj.Name:lower():find(pet.name:lower()) and obj:IsA("Model") then
                                local remotes = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Events")
                                if remotes then
                                    local buy = remotes:FindFirstChild("BuyPet") or remotes:FindFirstChild("Purchase")
                                    if buy then
                                        pcall(function() buy:FireServer(obj) end)
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(2)
                end
            end)
        end
    end)
end

-- ─── Feature 4: Seed Pack Spawns ───
local spCard = MakeCard(featPage, 4)
MakeSectionTitle(spCard, "🌾 Feat 4 — " .. T("seed_pack"), 1)

MakeToggle(spCard, T("seed_toggle"), false, 2, function(state)
    State.seedPackToggle = state
    if state then
        StartSeedPackLoop()
        Notify("Seed Pack Collector: ON")
    else
        State.seedPackLoop = false
        Notify("Seed Pack Collector: OFF")
    end
end)

-- ─── Feature 5: Auto Harvest ───
local ahCard = MakeCard(featPage, 5)
MakeSectionTitle(ahCard, "🌙 Feat 5 — " .. T("auto_harvest"), 1)

local harvestNote = Instance.new("TextLabel")
harvestNote.Size = UDim2.new(1, 0, 0, 30)
harvestNote.BackgroundTransparency = 1
harvestNote.Text = "⚠️ Run at night time in-game for best results"
harvestNote.TextColor3 = COLORS.ACCENT
harvestNote.TextSize = 11
harvestNote.Font = Enum.Font.Gotham
harvestNote.TextXAlignment = Enum.TextXAlignment.Left
harvestNote.TextWrapped = true
harvestNote.LayoutOrder = 2
harvestNote.Parent = ahCard

MakeToggle(ahCard, T("auto_harvest"), false, 3, function(state)
    State.autoHarvestToggle = state
    if state then
        StartAutoHarvest()
        Notify("Auto Harvest: ON")
    else
        Notify("Auto Harvest: OFF (re-execute to stop)")
    end
end)

-- ─── Feature 6: Auto Proxy ───
local apCard = MakeCard(featPage, 6)
MakeSectionTitle(apCard, "🔄 Feat 6 — " .. T("auto_proxy"), 1)

MakeToggle(apCard, T("proxy_toggle"), false, 2, function(state)
    State.autoProxyToggle = state
    if state then
        StartAutoProxy()
        Notify("Auto Proxy: ON")
    else
        State.autoProxyLoop = false
        Notify("Auto Proxy: OFF")
    end
end)

-- ══════════════════════════════════════════════════════════
--                    SETTINGS PAGE
-- ══════════════════════════════════════════════════════════
local settPage = TabPages["settings"]

local langCard = MakeCard(settPage, 1)
MakeSectionTitle(langCard, "🌐 " .. T("language"), 1)

local langOptions = {"🇬🇧 English", "🇸🇦 العربية", "🏴 کوردی"}
local langMap = {["🇬🇧 English"]="EN", ["🇸🇦 العربية"]="AR", ["🏴 کوردی"]="KU"}

MakeDropdown(langCard, langOptions, "🇬🇧 English", 2, function(opt)
    LANG = langMap[opt] or "EN"
    Notify("Language changed! Reload for full effect.")
end)

local notifCard = MakeCard(settPage, 2)
MakeSectionTitle(notifCard, "🔔 " .. T("notifications"), 1)

MakeToggle(notifCard, T("notifications"), true, 2, function(state)
    State.notifications = state
end)

local espCard = MakeCard(settPage, 3)
MakeSectionTitle(espCard, "🎯 ESP Scanner", 1)

local scanBtn = MakeButton(espCard, "🔄 Scan Wild Pets Now", 2)
scanBtn.MouseButton1Click:Connect(function()
    ScanWildPets()
    Notify("ESP Scan complete!")
end)

local clearESPBtn = MakeButton(espCard, "❌ Clear All ESP", 3)
clearESPBtn.TextColor3 = COLORS.DANGER
clearESPBtn.MouseButton1Click:Connect(function()
    ClearESP()
    Notify("ESP Cleared")
end)

local credCard = MakeCard(settPage, 4)
MakeSectionTitle(credCard, "👑 Credits", 1)
local credTxt = Instance.new("TextLabel")
credTxt.Size = UDim2.new(1, 0, 0, 50)
credTxt.BackgroundTransparency = 1
credTxt.Text = "AXL GARDEN 2 — VIP Edition\nDeveloped by @ex_axl\ndiscord.gg/rb7hCqvTD6"
credTxt.TextColor3 = COLORS.TEXT_DIM
credTxt.TextSize = 11
credTxt.Font = Enum.Font.Gotham
credTxt.TextXAlignment = Enum.TextXAlignment.Left
credTxt.TextWrapped = true
credTxt.LayoutOrder = 2
credTxt.Parent = credCard

-- ══════════════════════════════════════════════════════════
--                    START ON INFO TAB
-- ══════════════════════════════════════════════════════════
SwitchTab("info")

-- Wild pet ESP auto-scan loop
task.spawn(function()
    while true do
        local anyESP = false
        for _, v in pairs(State.wildPetESP) do
            if v then anyESP = true break end
        end
        if anyESP then ScanWildPets() end
        task.wait(5)
    end
end)

print("✅ AXL GARDEN 2 VIP - Loaded Successfully!")
print("📱 Discord: discord.gg/rb7hCqvTD6")
print("📱 Telegram: t.me/axcmy | t.me/mmcmy")

