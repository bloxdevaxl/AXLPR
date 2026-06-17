-- ╔══════════════════════════════════════════════════════════════╗
-- ║              AXL GARDEN 2 - VIP GUI SCRIPT                  ║
-- ║         by @ex_axl | t.me/axcmy | t.me/mmcmy                ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ░░ SERVICES ░░
local Players            = game:GetService("Players")
local Workspace          = game:GetService("Workspace")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local RunService         = game:GetService("RunService")
local TweenService       = game:GetService("TweenService")
local UserInputService   = game:GetService("UserInputService")
local CoreGui            = game:GetService("CoreGui")

-- ░░ LOCALS ░░
local LocalPlayer  = Players.LocalPlayer
local Character    = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Mouse        = LocalPlayer:GetMouse()

-- Wait for character parts
local function GetHumanoid()
    return Character and Character:FindFirstChildOfClass("Humanoid")
end
local function GetRoot()
    local H = GetHumanoid()
    return H and H.RootPart
end

-- ░░ NETWORKING & MODULES ░░
local Networking, FruitValueCalc
pcall(function()
    Networking     = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
    FruitValueCalc = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("FruitValueCalc"))
end)

local Gardens = Workspace:FindFirstChild("Gardens")

-- ░░ LANGUAGE SYSTEM ░░
local LANG = "EN"
local Strings = {
    EN = {
        title         = "AXL GARDEN 2",
        loading       = "Loading...",
        chooseLanguage= "Choose Language",
        tabInfo       = "INFO",
        tabPlayer     = "PLAYER",
        tabFeatures   = "FEATURES",
        tabSettings   = "SETTINGS",
        gardens       = "Gardens",
        droppedItems  = "Dropped Items",
        wildPets      = "Wild Pet Spawns",
        seedPack      = "Seed Pack Spawner",
        autoProxy     = "Auto Proxy Farm",
        yourPlot      = "Your Plot:",
        notFound      = "Not Found",
        teleport      = "Teleport",
        status        = "Status:",
        active        = "ACTIVE",
        inactive      = "INACTIVE",
        petESP        = "Pet ESP",
        autoTp        = "Auto Teleport",
        autoBuy       = "Auto Buy",
        speed         = "Speed",
        toggle        = "Toggle",
        discord       = "Discord",
        telegram      = "Telegram",
        version       = "Version: 2.0",
        credits       = "Credits",
        selectPlot    = "Select Plot",
        plotLabel     = "Plot",
        farmLabel     = "Your Farm Code:",
        noPlot        = "No plot found",
        collecting    = "Collecting...",
        idle          = "Idle",
        autoFarm      = "Auto Farm",
        enabled       = "Enabled",
        disabled      = "Disabled",
        minimize      = "Minimize",
        close         = "Close",
        notification  = "Notification",
        found         = "Found",
        moving        = "Moving to target...",
        collected     = "Collected!",
        petFound      = "Pet Spotted:",
    },
    AR = {
        title         = "AXL GARDEN 2",
        loading       = "جاري التحميل...",
        chooseLanguage= "اختيار اللغة",
        tabInfo       = "معلومات",
        tabPlayer     = "اللاعب",
        tabFeatures   = "مميزات",
        tabSettings   = "الإعدادات",
        gardens       = "الحدائق",
        droppedItems  = "العناصر المسقطة",
        wildPets      = "ظهور الحيوانات",
        seedPack      = "حزمة البذور",
        autoProxy     = "زراعة تلقائية",
        yourPlot      = "مزرعتك:",
        notFound      = "غير موجود",
        teleport      = "انتقال",
        status        = "الحالة:",
        active        = "نشط",
        inactive      = "غير نشط",
        petESP        = "كشف الحيوانات",
        autoTp        = "انتقال تلقائي",
        autoBuy       = "شراء تلقائي",
        speed         = "السرعة",
        toggle        = "تفعيل",
        discord       = "ديسكورد",
        telegram      = "تيليغرام",
        version       = "الإصدار: 2.0",
        credits       = "حقوق",
        selectPlot    = "اختر المزرعة",
        plotLabel     = "مزرعة",
        farmLabel     = "كود مزرعتك:",
        noPlot        = "لا توجد مزرعة",
        collecting    = "جمع...",
        idle          = "خامل",
        autoFarm      = "زراعة تلقائية",
        enabled       = "مفعّل",
        disabled      = "معطّل",
        minimize      = "تصغير",
        close         = "إغلاق",
        notification  = "إشعار",
        found         = "تم إيجاد",
        moving        = "التنقل للهدف...",
        collected     = "تم الجمع!",
        petFound      = "حيوان ظهر:",
    },
    KU = {
        title         = "AXL GARDEN 2",
        loading       = "باركردن...",
        chooseLanguage= "زمان هەڵبژێرە",
        tabInfo       = "زانیاری",
        tabPlayer     = "یاریزان",
        tabFeatures   = "تایبەتمەندی",
        tabSettings   = "ڕێکخستن",
        gardens       = "باخچەکان",
        droppedItems  = "شتە کەوتووەکان",
        wildPets      = "دەرکەوتنی ئاژەڵ",
        seedPack      = "پاکێتی تۆو",
        autoProxy     = "چێشتکاری ئۆتۆماتیکی",
        yourPlot      = "زەوییەکەت:",
        notFound      = "نەدۆزرایەوە",
        teleport      = "گواستنەوە",
        status        = "دۆخ:",
        active        = "چالاک",
        inactive      = "ناچالاک",
        petESP        = "دیتنی ئاژەڵ",
        autoTp        = "گواستنەوەی ئۆتۆماتیک",
        autoBuy       = "کڕینی ئۆتۆماتیک",
        speed         = "خێرایی",
        toggle        = "کردنەوە",
        discord       = "دیسکۆرد",
        telegram      = "تێلێگرام",
        version       = "وەشان: 2.0",
        credits       = "مافەکان",
        selectPlot    = "زەوی هەڵبژێرە",
        plotLabel     = "زەوی",
        farmLabel     = "کۆدی زەوییەکەت:",
        noPlot        = "زەوی نەدۆزرایەوە",
        collecting    = "کۆکردنەوە...",
        idle          = "بەتاڵ",
        autoFarm      = "چێشتکاری ئۆتۆماتیکی",
        enabled       = "چالاک کرا",
        disabled      = "ناچالاک کرا",
        minimize      = "بچووک کردن",
        close         = "داخستن",
        notification  = "ئاگادارکردنەوە",
        found         = "دۆزرایەوە",
        moving        = "بەرەو ئامانجەوە...",
        collected     = "کۆکرایەوە!",
        petFound      = "ئاژەڵ دەرکەوت:",
    }
}
local function T(key)
    return (Strings[LANG] and Strings[LANG][key]) or (Strings["EN"][key]) or key
end

-- ░░ COLORS / THEME ░░
local C = {
    bg        = Color3.fromRGB(8,  8,  12),
    bgPanel   = Color3.fromRGB(14, 14, 20),
    bgCard    = Color3.fromRGB(20, 20, 30),
    border    = Color3.fromRGB(255,255,255),
    accent    = Color3.fromRGB(80, 180, 255),
    accentGlow= Color3.fromRGB(40, 120, 220),
    green     = Color3.fromRGB(60, 220, 120),
    red       = Color3.fromRGB(220, 60, 80),
    text      = Color3.fromRGB(230,230,240),
    textDim   = Color3.fromRGB(140,140,160),
    white     = Color3.fromRGB(255,255,255),
    tabActive = Color3.fromRGB(30, 30, 50),
    tabInact  = Color3.fromRGB(14, 14, 20),
    gold      = Color3.fromRGB(255, 200, 50),
}

-- ░░ HELPER: Create Instance ░░
local function New(class, props, children)
    local obj = Instance.new(class)
    for k,v in pairs(props) do obj[k] = v end
    if children then
        for _,child in pairs(children) do child.Parent = obj end
    end
    return obj
end

local function Tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local function MakeCorner(radius, parent)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function MakeStroke(thickness, color, parent)
    local s = Instance.new("UIStroke")
    s.Thickness = thickness
    s.Color = color
    s.Parent = parent
    return s
end

local function MakePadding(t, b, l, r, parent)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, t)
    p.PaddingBottom = UDim.new(0, b)
    p.PaddingLeft   = UDim.new(0, l)
    p.PaddingRight  = UDim.new(0, r)
    p.Parent = parent
    return p
end

-- ░░ NOTIFICATION SYSTEM ░░
local NotifHolder

local function Notify(msg, color)
    if not NotifHolder then return end
    color = color or C.accent

    local notif = New("Frame", {
        Parent          = NotifHolder,
        BackgroundColor3= C.bgCard,
        Size            = UDim2.new(1, 0, 0, 0),
        ClipsDescendants= true,
        AutomaticSize   = Enum.AutomaticSize.Y,
    })
    MakeCorner(8, notif)
    MakeStroke(1, color, notif)
    MakePadding(8, 8, 12, 12, notif)

    New("TextLabel", {
        Parent           = notif,
        Text             = "🌿 " .. msg,
        TextColor3       = C.text,
        Font             = Enum.Font.GothamMedium,
        TextSize         = 13,
        Size             = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        TextXAlignment   = Enum.TextXAlignment.Left,
        TextWrapped      = true,
    })

    notif.BackgroundTransparency = 1
    Tween(notif, TweenInfo.new(0.3), {BackgroundTransparency = 0})

    task.delay(3, function()
        Tween(notif, TweenInfo.new(0.3), {BackgroundTransparency = 1})
        task.wait(0.35)
        notif:Destroy()
    end)
end

-- ░░ TOGGLE BUTTON MAKER ░░
local function MakeToggle(parent, labelText, defaultState, callback)
    local state = defaultState or false

    local row = New("Frame", {
        Parent          = parent,
        BackgroundColor3= C.bgCard,
        Size            = UDim2.new(1, 0, 0, 44),
    })
    MakeCorner(8, row)
    MakePadding(0, 0, 12, 12, row)
    MakeStroke(1, Color3.fromRGB(40,40,60), row)

    local lbl = New("TextLabel", {
        Parent           = row,
        Text             = labelText,
        TextColor3       = C.text,
        Font             = Enum.Font.GothamMedium,
        TextSize         = 13,
        Position         = UDim2.new(0, 0, 0, 0),
        Size             = UDim2.new(1, -60, 1, 0),
        BackgroundTransparency = 1,
        TextXAlignment   = Enum.TextXAlignment.Left,
    })

    local track = New("Frame", {
        Parent          = row,
        Position        = UDim2.new(1, -54, 0.5, -11),
        Size            = UDim2.new(0, 44, 0, 22),
        BackgroundColor3= state and C.green or Color3.fromRGB(50,50,70),
    })
    MakeCorner(11, track)

    local knob = New("Frame", {
        Parent          = track,
        Position        = state and UDim2.new(1, -20, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        Size            = UDim2.new(0, 18, 0, 18),
        BackgroundColor3= C.white,
    })
    MakeCorner(9, knob)

    local btn = New("TextButton", {
        Parent               = row,
        Text                 = "",
        Size                 = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
    })

    btn.MouseButton1Click:Connect(function()
        state = not state
        Tween(track, TweenInfo.new(0.2), {BackgroundColor3 = state and C.green or Color3.fromRGB(50,50,70)})
        Tween(knob,  TweenInfo.new(0.2), {Position = state and UDim2.new(1,-20,0.5,-8) or UDim2.new(0,2,0.5,-8)})
        if callback then callback(state) end
    end)

    return {
        Frame  = row,
        GetState = function() return state end,
        SetState = function(v)
            state = v
            Tween(track, TweenInfo.new(0.2), {BackgroundColor3 = state and C.green or Color3.fromRGB(50,50,70)})
            Tween(knob,  TweenInfo.new(0.2), {Position = state and UDim2.new(1,-20,0.5,-8) or UDim2.new(0,2,0.5,-8)})
        end
    }
end

-- ░░ SECTION HEADER ░░
local function SectionHeader(parent, text)
    local f = New("Frame", {
        Parent          = parent,
        BackgroundTransparency = 1,
        Size            = UDim2.new(1, 0, 0, 28),
    })
    New("TextLabel", {
        Parent         = f,
        Text           = text,
        TextColor3     = C.accent,
        Font           = Enum.Font.GothamBold,
        TextSize       = 11,
        Size           = UDim2.new(0.6, 0, 1, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    New("Frame", {
        Parent          = f,
        Position        = UDim2.new(0.6, 8, 0.5, 0),
        Size            = UDim2.new(0.4, -8, 0, 1),
        BackgroundColor3= Color3.fromRGB(40, 40, 60),
    })
    return f
end

-- ░░ CARD LABEL ░░
local function CardLabel(parent, text, subtext)
    local f = New("Frame", {
        Parent          = parent,
        BackgroundColor3= C.bgCard,
        Size            = UDim2.new(1, 0, 0, 50),
    })
    MakeCorner(8, f)
    MakePadding(8, 8, 12, 12, f)
    MakeStroke(1, Color3.fromRGB(40,40,60), f)

    New("TextLabel", {
        Parent         = f,
        Text           = text,
        TextColor3     = C.textDim,
        Font           = Enum.Font.Gotham,
        TextSize       = 11,
        Size           = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local val = New("TextLabel", {
        Parent         = f,
        Text           = subtext or "",
        TextColor3     = C.text,
        Font           = Enum.Font.GothamBold,
        TextSize       = 14,
        Position       = UDim2.new(0, 0, 0, 18),
        Size           = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    return f, val
end

-- ░░ BUTTON ░░
local function MakeButton(parent, text, accent, callback)
    local btn = New("TextButton", {
        Parent          = parent,
        Text            = text,
        TextColor3      = C.white,
        Font            = Enum.Font.GothamBold,
        TextSize        = 13,
        BackgroundColor3= accent or C.accentGlow,
        Size            = UDim2.new(1, 0, 0, 36),
    })
    MakeCorner(8, btn)
    MakeStroke(1, accent or C.accent, btn)

    btn.MouseEnter:Connect(function()
        Tween(btn, TweenInfo.new(0.15), {BackgroundColor3 = C.accent})
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, TweenInfo.new(0.15), {BackgroundColor3 = accent or C.accentGlow})
    end)
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    return btn
end

-- ░░ DROPDOWN ░░
local function MakeDropdown(parent, labelText, options, callback)
    local selected = options[1] or ""
    local open = false

    local container = New("Frame", {
        Parent          = parent,
        BackgroundTransparency = 1,
        Size            = UDim2.new(1, 0, 0, 44),
        ClipsDescendants = false,
        ZIndex          = 10,
    })

    local header = New("Frame", {
        Parent          = container,
        BackgroundColor3= C.bgCard,
        Size            = UDim2.new(1, 0, 0, 44),
        ZIndex          = 10,
    })
    MakeCorner(8, header)
    MakeStroke(1, Color3.fromRGB(60,60,90), header)
    MakePadding(0, 0, 12, 12, header)

    New("TextLabel", {
        Parent         = header,
        Text           = labelText,
        TextColor3     = C.textDim,
        Font           = Enum.Font.Gotham,
        TextSize       = 11,
        Size           = UDim2.new(0.5, 0, 0.4, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex         = 10,
    })

    local selLabel = New("TextLabel", {
        Parent         = header,
        Text           = selected,
        TextColor3     = C.text,
        Font           = Enum.Font.GothamBold,
        TextSize       = 13,
        Position       = UDim2.new(0, 0, 0.45, 0),
        Size           = UDim2.new(0.8, 0, 0.55, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex         = 10,
    })

    local arrow = New("TextLabel", {
        Parent         = header,
        Text           = "▼",
        TextColor3     = C.accent,
        Font           = Enum.Font.GothamBold,
        TextSize       = 12,
        Position       = UDim2.new(1, -30, 0.5, -8),
        Size           = UDim2.new(0, 20, 0, 16),
        BackgroundTransparency = 1,
        ZIndex         = 10,
    })

    local dropFrame = New("Frame", {
        Parent          = container,
        BackgroundColor3= C.bgCard,
        Position        = UDim2.new(0, 0, 1, 4),
        Size            = UDim2.new(1, 0, 0, 0),
        ClipsDescendants= true,
        ZIndex          = 20,
        Visible         = false,
    })
    MakeCorner(8, dropFrame)
    MakeStroke(1, Color3.fromRGB(60,60,90), dropFrame)

    local listLayout = New("UIListLayout", {
        Parent          = dropFrame,
        SortOrder       = Enum.SortOrder.LayoutOrder,
        Padding         = UDim.new(0, 2),
    })
    MakePadding(4, 4, 4, 4, dropFrame)

    local totalH = 8
    for i, opt in ipairs(options) do
        local optBtn = New("TextButton", {
            Parent          = dropFrame,
            Text            = opt,
            TextColor3      = C.text,
            Font            = Enum.Font.GothamMedium,
            TextSize        = 13,
            BackgroundColor3= Color3.fromRGB(25,25,40),
            Size            = UDim2.new(1, 0, 0, 32),
            ZIndex          = 20,
        })
        MakeCorner(6, optBtn)
        totalH = totalH + 34

        optBtn.MouseEnter:Connect(function()
            Tween(optBtn, TweenInfo.new(0.1), {BackgroundColor3 = C.accentGlow})
        end)
        optBtn.MouseLeave:Connect(function()
            Tween(optBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(25,25,40)})
        end)
        optBtn.MouseButton1Click:Connect(function()
            selected = opt
            selLabel.Text = opt
            open = false
            Tween(dropFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)})
            task.wait(0.21)
            dropFrame.Visible = false
            if callback then callback(opt) end
        end)
    end

    local headerBtn = New("TextButton", {
        Parent               = header,
        Text                 = "",
        Size                 = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ZIndex               = 15,
    })
    headerBtn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            dropFrame.Visible = true
            dropFrame.Size = UDim2.new(1, 0, 0, 0)
            Tween(dropFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, totalH)})
            Tween(arrow, TweenInfo.new(0.2), {Rotation = 180})
        else
            Tween(dropFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)})
            Tween(arrow, TweenInfo.new(0.2), {Rotation = 0})
            task.wait(0.21)
            dropFrame.Visible = false
        end
    end)

    return container, function() return selected end
end

-- ░░ SPACER ░░
local function Spacer(parent, h)
    New("Frame", {
        Parent = parent,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, h or 8),
    })
end

-- ════════════════════════════════════════════════════════
--                 BUILD LANGUAGE SELECTOR
-- ════════════════════════════════════════════════════════
local ScreenGui = New("ScreenGui", {
    Name            = "AXL_GARDEN_2",
    ResetOnSpawn    = false,
    ZIndexBehavior  = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset  = true,
})
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer.PlayerGui end

-- ░░ LOADING SCREEN ░░
local LoadScreen = New("Frame", {
    Parent          = ScreenGui,
    Size            = UDim2.new(1, 0, 1, 0),
    BackgroundColor3= Color3.fromRGB(0, 0, 0),
    ZIndex          = 100,
})

-- Animated glow behind logo
local glowCircle = New("Frame", {
    Parent          = LoadScreen,
    Size            = UDim2.new(0, 300, 0, 300),
    Position        = UDim2.new(0.5, -150, 0.5, -180),
    BackgroundColor3= C.accentGlow,
    BackgroundTransparency = 0.85,
    ZIndex          = 100,
})
MakeCorner(150, glowCircle)

local titleLoad = New("TextLabel", {
    Parent         = LoadScreen,
    Text           = "AXL GARDEN 2",
    TextColor3     = C.white,
    Font           = Enum.Font.GothamBlack,
    TextSize       = 42,
    Position       = UDim2.new(0, 0, 0.35, 0),
    Size           = UDim2.new(1, 0, 0, 60),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Center,
    ZIndex         = 101,
})
New("TextLabel", {
    Parent         = LoadScreen,
    Text           = "🌿 VIP SCRIPT",
    TextColor3     = C.accent,
    Font           = Enum.Font.GothamBold,
    TextSize       = 18,
    Position       = UDim2.new(0, 0, 0.47, 0),
    Size           = UDim2.new(1, 0, 0, 30),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Center,
    ZIndex         = 101,
})

-- Language picker
local langTitle = New("TextLabel", {
    Parent         = LoadScreen,
    Text           = "Choose Language / اختر اللغة / زمان هەڵبژێرە",
    TextColor3     = C.textDim,
    Font           = Enum.Font.GothamMedium,
    TextSize       = 14,
    Position       = UDim2.new(0, 0, 0.58, 0),
    Size           = UDim2.new(1, 0, 0, 24),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Center,
    ZIndex         = 101,
})

local langRow = New("Frame", {
    Parent          = LoadScreen,
    Position        = UDim2.new(0.5, -180, 0.65, 0),
    Size            = UDim2.new(0, 360, 0, 48),
    BackgroundTransparency = 1,
    ZIndex          = 101,
})
New("UIListLayout", {
    Parent        = langRow,
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    Padding       = UDim.new(0, 10),
    SortOrder     = Enum.SortOrder.LayoutOrder,
})

local function LangBtn(text, code)
    local b = New("TextButton", {
        Parent          = langRow,
        Text            = text,
        TextColor3      = C.white,
        Font            = Enum.Font.GothamBold,
        TextSize        = 14,
        BackgroundColor3= C.accentGlow,
        Size            = UDim2.new(0, 106, 1, 0),
        ZIndex          = 101,
    })
    MakeCorner(10, b)
    MakeStroke(2, C.accent, b)
    return b, code
end

local btnEN, _ = LangBtn("English 🇬🇧", "EN")
local btnAR, _ = LangBtn("العربية 🇸🇦", "AR")
local btnKU, _ = LangBtn("کوردی 🟢",   "KU")

-- Progress bar
local progBg = New("Frame", {
    Parent          = LoadScreen,
    Position        = UDim2.new(0.5, -150, 0.82, 0),
    Size            = UDim2.new(0, 300, 0, 6),
    BackgroundColor3= Color3.fromRGB(30,30,50),
    ZIndex          = 101,
})
MakeCorner(3, progBg)
local progFill = New("Frame", {
    Parent          = progBg,
    Size            = UDim2.new(0, 0, 1, 0),
    BackgroundColor3= C.accent,
    ZIndex          = 102,
})
MakeCorner(3, progFill)

local progLabel = New("TextLabel", {
    Parent         = LoadScreen,
    Text           = "Loading... 0%",
    TextColor3     = C.textDim,
    Font           = Enum.Font.Gotham,
    TextSize       = 12,
    Position       = UDim2.new(0, 0, 0.85, 0),
    Size           = UDim2.new(1, 0, 0, 20),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Center,
    ZIndex         = 101,
})

New("TextLabel", {
    Parent         = LoadScreen,
    Text           = "t.me/axcmy  |  t.me/mmcmy  |  discord.gg/rb7hCqvTD6",
    TextColor3     = Color3.fromRGB(80,80,110),
    Font           = Enum.Font.Gotham,
    TextSize       = 11,
    Position       = UDim2.new(0, 0, 0.93, 0),
    Size           = UDim2.new(1, 0, 0, 20),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Center,
    ZIndex         = 101,
})

-- Glow pulse animation
task.spawn(function()
    while LoadScreen.Parent do
        Tween(glowCircle, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.7})
        task.wait(1.5)
        Tween(glowCircle, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.9})
        task.wait(1.5)
    end
end)

-- ════════════════════════════════════════════════════════
--              MAIN GUI (built after language chosen)
-- ════════════════════════════════════════════════════════
local MainBuilt = false

local function BuildMainGUI()
    if MainBuilt then return end
    MainBuilt = true

    -- Animate progress bar
    task.spawn(function()
        for i = 1, 100 do
            Tween(progFill, TweenInfo.new(0.03), {Size = UDim2.new(i/100, 0, 1, 0)})
            progLabel.Text = (LANG == "AR" and "جاري التحميل... " or LANG == "KU" and "باركردن... " or "Loading... ") .. i .. "%"
            task.wait(0.03)
        end
        task.wait(0.4)
        Tween(LoadScreen, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {BackgroundTransparency = 1})
        for _, v in pairs(LoadScreen:GetChildren()) do
            if v:IsA("GuiObject") then
                Tween(v, TweenInfo.new(0.4), {BackgroundTransparency = 1})
                pcall(function() Tween(v, TweenInfo.new(0.4), {TextTransparency = 1}) end)
            end
        end
        task.wait(0.65)
        LoadScreen:Destroy()
    end)

    -- ░░ MAIN WINDOW ░░
    local MainFrame = New("Frame", {
        Parent          = ScreenGui,
        BackgroundColor3= C.bg,
        Size            = UDim2.new(0, 480, 0, 520),
        Position        = UDim2.new(0.5, -240, 0.5, -260),
        ClipsDescendants= false,
        ZIndex          = 2,
    })
    MakeCorner(14, MainFrame)
    MakeStroke(1.5, C.border, MainFrame)

    -- Shadow
    local shadow = New("Frame", {
        Parent          = MainFrame,
        BackgroundColor3= Color3.fromRGB(0,0,0),
        Size            = UDim2.new(1, 20, 1, 20),
        Position        = UDim2.new(0, -10, 0, 10),
        BackgroundTransparency = 0.6,
        ZIndex          = 1,
    })
    MakeCorner(16, shadow)

    -- Title bar
    local TitleBar = New("Frame", {
        Parent          = MainFrame,
        BackgroundColor3= C.bgPanel,
        Size            = UDim2.new(1, 0, 0, 48),
        ZIndex          = 3,
    })
    MakeCorner(14, TitleBar)
    -- cover bottom corners
    New("Frame", {
        Parent          = TitleBar,
        BackgroundColor3= C.bgPanel,
        Position        = UDim2.new(0, 0, 0.5, 0),
        Size            = UDim2.new(1, 0, 0.5, 0),
        ZIndex          = 3,
    })

    -- Logo dot
    local logoDot = New("Frame", {
        Parent          = TitleBar,
        Size            = UDim2.new(0, 10, 0, 10),
        Position        = UDim2.new(0, 16, 0.5, -5),
        BackgroundColor3= C.accent,
        ZIndex          = 4,
    })
    MakeCorner(5, logoDot)

    New("TextLabel", {
        Parent         = TitleBar,
        Text           = "AXL GARDEN 2",
        TextColor3     = C.white,
        Font           = Enum.Font.GothamBlack,
        TextSize       = 17,
        Position       = UDim2.new(0, 34, 0, 0),
        Size           = UDim2.new(0.5, 0, 1, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex         = 4,
    })
    New("TextLabel", {
        Parent         = TitleBar,
        Text           = "🌿 VIP",
        TextColor3     = C.gold,
        Font           = Enum.Font.GothamBold,
        TextSize       = 12,
        Position       = UDim2.new(0, 34, 0, 28),
        Size           = UDim2.new(0.3, 0, 0, 16),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex         = 4,
    })

    -- Minimize / Close
    local minimized = false
    local ContentArea

    local function makeCtrlBtn(text, xOff, color, cb)
        local b = New("TextButton", {
            Parent          = TitleBar,
            Text            = text,
            TextColor3      = color,
            Font            = Enum.Font.GothamBold,
            TextSize        = 14,
            BackgroundColor3= Color3.fromRGB(30,30,50),
            Size            = UDim2.new(0, 28, 0, 28),
            Position        = UDim2.new(1, xOff, 0.5, -14),
            ZIndex          = 5,
        })
        MakeCorner(6, b)
        b.MouseButton1Click:Connect(cb)
        return b
    end

    makeCtrlBtn("✕", -12, C.red, function()
        Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,480,0,0), BackgroundTransparency=1})
        task.wait(0.35)
        MainFrame:Destroy()
    end)

    local minBtn = makeCtrlBtn("─", -46, C.textDim, function()
        minimized = not minimized
        if minimized then
            Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,480,0,48)})
        else
            Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,480,0,520)})
        end
    end)

    -- Drag
    local dragging, dragStart, startPos = false, nil, nil
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging  = true
            dragStart = input.Position
            startPos  = MainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- ░░ TAB BAR ░░
    local TabBar = New("Frame", {
        Parent          = MainFrame,
        BackgroundColor3= C.bgPanel,
        Position        = UDim2.new(0, 0, 0, 48),
        Size            = UDim2.new(1, 0, 0, 40),
        ZIndex          = 3,
    })
    New("UIListLayout", {
        Parent        = TabBar,
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder     = Enum.SortOrder.LayoutOrder,
    })

    ContentArea = New("ScrollingFrame", {
        Parent                  = MainFrame,
        BackgroundColor3        = C.bg,
        Position                = UDim2.new(0, 0, 0, 88),
        Size                    = UDim2.new(1, 0, 1, -88),
        CanvasSize              = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize     = Enum.AutomaticSize.Y,
        ScrollBarThickness      = 3,
        ScrollBarImageColor3    = C.accent,
        ClipsDescendants        = true,
        ZIndex                  = 3,
    })
    MakePadding(12, 12, 12, 12, ContentArea)
    New("UIListLayout", {
        Parent    = ContentArea,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0, 8),
    })

    -- Notification holder (bottom right)
    NotifHolder = New("Frame", {
        Parent          = ScreenGui,
        Position        = UDim2.new(1, -280, 1, -20),
        Size            = UDim2.new(0, 260, 0, 0),
        AnchorPoint     = Vector2.new(0, 1),
        BackgroundTransparency = 1,
        ZIndex          = 50,
        AutomaticSize   = Enum.AutomaticSize.Y,
    })
    New("UIListLayout", {
        Parent           = NotifHolder,
        SortOrder        = Enum.SortOrder.LayoutOrder,
        VerticalAlignment= Enum.VerticalAlignment.Bottom,
        Padding          = UDim.new(0, 6),
    })

    -- ░░ TAB SYSTEM ░░
    local tabs = {}
    local tabPages = {}
    local activeTab = nil

    local tabDefs = {
        {key="info",     icon="ℹ️",  label=T("tabInfo")},
        {key="player",   icon="👤", label=T("tabPlayer")},
        {key="features", icon="⚡", label=T("tabFeatures")},
        {key="settings", icon="⚙️", label=T("tabSettings")},
    }

    local function setTab(key)
        for k, page in pairs(tabPages) do
            page.Visible = (k == key)
        end
        for k, tb in pairs(tabs) do
            Tween(tb, TweenInfo.new(0.15), {
                BackgroundColor3 = (k == key) and C.tabActive or C.tabInact,
                TextColor3       = (k == key) and C.accent   or C.textDim,
            })
        end
        activeTab = key
    end

    for i, def in ipairs(tabDefs) do
        local tb = New("TextButton", {
            Parent          = TabBar,
            Text            = def.icon .. " " .. def.label,
            TextColor3      = C.textDim,
            Font            = Enum.Font.GothamBold,
            TextSize        = 11,
            BackgroundColor3= C.tabInact,
            Size            = UDim2.new(0.25, 0, 1, 0),
            ZIndex          = 4,
        })
        tabs[def.key] = tb

        local page = New("Frame", {
            Parent          = ContentArea,
            BackgroundTransparency = 1,
            Size            = UDim2.new(1, 0, 0, 0),
            AutomaticSize   = Enum.AutomaticSize.Y,
            Visible         = false,
            LayoutOrder     = i,
        })
        New("UIListLayout", {
            Parent    = page,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding   = UDim.new(0, 8),
        })
        tabPages[def.key] = page

        tb.MouseButton1Click:Connect(function() setTab(def.key) end)
    end

    -- ════════════════════════════════
    --  TAB: INFO
    -- ════════════════════════════════
    do
        local p = tabPages["info"]

        -- Banner
        local banner = New("Frame", {
            Parent          = p,
            BackgroundColor3= C.accentGlow,
            Size            = UDim2.new(1, 0, 0, 80),
        })
        MakeCorner(10, banner)
        New("TextLabel", {
            Parent         = banner,
            Text           = "🌿 AXL GARDEN 2",
            TextColor3     = C.white,
            Font           = Enum.Font.GothamBlack,
            TextSize       = 22,
            Size           = UDim2.new(1, 0, 0.55, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        New("TextLabel", {
            Parent         = banner,
            Text           = "VIP Script — Garden Grow a Garden",
            TextColor3     = Color3.fromRGB(180, 220, 255),
            Font           = Enum.Font.GothamMedium,
            TextSize       = 12,
            Position       = UDim2.new(0, 0, 0.6, 0),
            Size           = UDim2.new(1, 0, 0.4, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Center,
        })

        SectionHeader(p, "CREDITS")

        local links = {
            {"💬 Discord",  "discord.gg/rb7hCqvTD6"},
            {"✈️ Telegram", "t.me/axcmy"},
            {"✈️ Telegram", "t.me/mmcmy"},
        }
        for _, l in ipairs(links) do
            local f = New("Frame", {
                Parent          = p,
                BackgroundColor3= C.bgCard,
                Size            = UDim2.new(1, 0, 0, 40),
            })
            MakeCorner(8, f)
            MakePadding(0,0,12,12,f)
            New("TextLabel", {
                Parent         = f,
                Text           = l[1],
                TextColor3     = C.textDim,
                Font           = Enum.Font.Gotham,
                TextSize       = 12,
                Size           = UDim2.new(0.4, 0, 1, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
            New("TextLabel", {
                Parent         = f,
                Text           = l[2],
                TextColor3     = C.accent,
                Font           = Enum.Font.GothamBold,
                TextSize       = 13,
                Position       = UDim2.new(0.4, 0, 0, 0),
                Size           = UDim2.new(0.6, 0, 1, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        end

        New("TextLabel", {
            Parent         = p,
            Text           = "Version 2.0  |  @ex_axl",
            TextColor3     = C.textDim,
            Font           = Enum.Font.Gotham,
            TextSize       = 11,
            Size           = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
    end

    -- ════════════════════════════════
    --  TAB: PLAYER
    -- ════════════════════════════════
    do
        local p = tabPages["player"]

        SectionHeader(p, T("yourPlot"):upper())

        -- Player info cards
        local _, plotVal = CardLabel(p, T("yourPlot"), T("notFound"))
        local _, farmVal = CardLabel(p, T("farmLabel"), "---")

        -- Plot selector dropdown
        local plotOptions = {}
        for i = 1, 8 do table.insert(plotOptions, T("plotLabel") .. " " .. i) end
        local dd, getSelected = MakeDropdown(p, T("selectPlot"), plotOptions, function(opt)
            Notify(T("teleport") .. ": " .. opt, C.accent)
            -- Teleport to chosen plot
            task.spawn(function()
                if not Gardens then return end
                local idx = tonumber(opt:match("%d+"))
                if not idx then return end
                local targetPlot
                for _, plot in pairs(Gardens:GetChildren()) do
                    if plot.Name == "Plot" .. idx or tonumber(plot.Name:match("%d+")) == idx then
                        targetPlot = plot
                        break
                    end
                end
                if targetPlot then
                    local root = GetRoot()
                    local ref = targetPlot:FindFirstChild("PlotSizeReference")
                    if root and ref then
                        root.CFrame = ref.CFrame + Vector3.new(0, 5, 0)
                    end
                end
            end)
        end)

        -- Auto-detect player plot
        task.spawn(function()
            while true do
                task.wait(2)
                if not Gardens then
                    pcall(function() Gardens = Workspace:FindFirstChild("Gardens") end)
                    if not Gardens then continue end
                end
                for _, plot in pairs(Gardens:GetChildren()) do
                    if plot:GetAttribute("OwnerUserId") == LocalPlayer.UserId then
                        plotVal.Text = plot.Name
                        local code = plot:GetAttribute("PlotCode") or plot:GetAttribute("FarmCode") or plot.Name
                        farmVal.Text = tostring(code)
                        break
                    end
                end
            end
        end)

        SectionHeader(p, "PLAYER INFO")
        local _, nameVal  = CardLabel(p, "Username", LocalPlayer.Name)
        local _, idVal    = CardLabel(p, "User ID",  tostring(LocalPlayer.UserId))
        nameVal.Text = LocalPlayer.Name
        idVal.Text   = tostring(LocalPlayer.UserId)
    end

    -- ════════════════════════════════
    --  TAB: FEATURES
    -- ════════════════════════════════
    do
        local p = tabPages["features"]

        -- ── FEATURE 1: GARDENS ──
        SectionHeader(p, "🌱 " .. T("gardens"):upper())

        local plotInfoCard, plotInfoVal = CardLabel(p, T("yourPlot"), T("notFound"))
        Spacer(p, 4)

        -- ── FEATURE 2: DROPPED ITEMS ──
        SectionHeader(p, "📦 " .. T("droppedItems"):upper())

        local droppedActive = false
        local droppedLoop

        local droppedToggle = MakeToggle(p, T("droppedItems") .. " Auto Collect", false, function(state)
            droppedActive = state
            if state then
                Notify(T("droppedItems") .. " — " .. T("enabled"), C.green)
                droppedLoop = task.spawn(function()
                    while droppedActive do
                        task.wait(0.2)
                        if not Workspace:FindFirstChild("DroppedItems") then continue end
                        for _, item in pairs(Workspace.DroppedItems:GetChildren()) do
                            if not droppedActive then break end
                            local root = GetRoot()
                            if root and item:IsA("Model") then
                                local primary = item.PrimaryPart or item:FindFirstChildOfClass("BasePart")
                                if primary then
                                    -- Proxy teleport: move to item, wait, move back
                                    local originalCF = root.CFrame
                                    root.CFrame = primary.CFrame + Vector3.new(0, 3, 0)
                                    task.wait(0.05)
                                    -- Fire collect remote if exists
                                    pcall(function()
                                        local remote = ReplicatedStorage:FindFirstChild("CollectItem")
                                            or ReplicatedStorage:FindFirstChild("PickupItem")
                                        if remote then remote:FireServer(item) end
                                    end)
                                    task.wait(0.1)
                                end
                            end
                        end
                    end
                end)
            else
                Notify(T("droppedItems") .. " — " .. T("disabled"), C.red)
                if droppedLoop then task.cancel(droppedLoop) end
            end
        end)

        Spacer(p, 4)

        -- ── FEATURE 3: WILD PET SPAWNS ──
        SectionHeader(p, "🐾 " .. T("wildPets"):upper())

        local petESP_Active   = false
        local petAutoTP       = false
        local petAutoBuy      = false
        local espParts        = {}

        local PetRarities = {
            ["Frog"]           = {rarity="Common",    price=10000},
            ["Bunny"]          = {rarity="Common",    price=20000},
            ["Owl"]            = {rarity="Uncommon",  price=25000},
            ["Deer"]           = {rarity="Rare",      price=50000},
            ["Robin"]          = {rarity="Legendary", price=75000},
            ["Bee"]            = {rarity="Legendary", price=1000000},
            ["Monkey"]         = {rarity="Mythic",    price=3000000},
            ["Golden Dragonfly"]={rarity="Mythic",   price=9000000},
            ["Unicorn"]        = {rarity="Mythic",    price=12000000},
            ["Raccoon"]        = {rarity="Super",     price=15000000},
            ["Black Dragon"]   = {rarity="Super",     price=1000000},
            ["Ice Serpent"]    = {rarity="Super",     price=0},
        }
        local rarityColors = {
            Common   = Color3.fromRGB(180,180,180),
            Uncommon = Color3.fromRGB(50,200,100),
            Rare     = Color3.fromRGB(50,100,255),
            Legendary= Color3.fromRGB(255,165,0),
            Mythic   = Color3.fromRGB(180,0,255),
            Super    = Color3.fromRGB(255,50,50),
        }

        local function clearESP()
            for _, h in pairs(espParts) do pcall(function() h:Destroy() end) end
            espParts = {}
        end

        local espToggle = MakeToggle(p, "Pet ESP", false, function(state)
            petESP_Active = state
            if not state then clearESP() end
            Notify("Pet ESP — " .. (state and T("enabled") or T("disabled")), state and C.green or C.red)
        end)

        local tpToggle = MakeToggle(p, T("autoTp") .. " (Wild Pets)", false, function(state)
            petAutoTP = state
            Notify(T("autoTp") .. " — " .. (state and T("enabled") or T("disabled")), state and C.green or C.red)
        end)

        local buyToggle = MakeToggle(p, T("autoBuy") .. " (Wild Pets)", false, function(state)
            petAutoBuy = state
            Notify(T("autoBuy") .. " — " .. (state and T("enabled") or T("disabled")), state and C.green or C.red)
        end)

        -- Pet dropdown
        local petNames = {}
        for name, _ in pairs(PetRarities) do table.insert(petNames, name) end
        table.sort(petNames)
        table.insert(petNames, 1, "All Pets")
        local petDD, getPetFilter = MakeDropdown(p, "Pet Filter", petNames, function(opt)
            Notify("Filter: " .. opt, C.accent)
        end)

        -- Pet ESP & Auto loop
        task.spawn(function()
            while true do
                task.wait(0.5)
                if petESP_Active then
                    clearESP()
                    local filter = getPetFilter()
                    -- Search workspace for wild pets
                    local function searchForPets(parent)
                        if not parent then return end
                        for _, obj in pairs(parent:GetChildren()) do
                            local name = obj.Name
                            local info = PetRarities[name]
                            if info and (filter == "All Pets" or filter == name) then
                                local primary = obj.PrimaryPart or (obj:IsA("Model") and obj:FindFirstChildOfClass("BasePart"))
                                if primary then
                                    -- Create billboard ESP
                                    local bb = New("BillboardGui", {
                                        Parent      = primary,
                                        Size        = UDim2.new(0, 120, 0, 40),
                                        AlwaysOnTop = true,
                                        StudsOffset = Vector3.new(0, 3, 0),
                                    })
                                    local lbl = New("TextLabel", {
                                        Parent         = bb,
                                        Text           = name .. "\n[" .. info.rarity .. "]",
                                        TextColor3     = rarityColors[info.rarity] or C.white,
                                        Font           = Enum.Font.GothamBold,
                                        TextSize       = 13,
                                        Size           = UDim2.new(1,0,1,0),
                                        BackgroundColor3= Color3.fromRGB(0,0,0),
                                        BackgroundTransparency = 0.4,
                                        TextWrapped    = true,
                                    })
                                    MakeCorner(4, lbl)
                                    table.insert(espParts, bb)

                                    -- Notify
                                    Notify(T("petFound") .. " " .. name .. " (" .. info.rarity .. ")", rarityColors[info.rarity] or C.white)

                                    -- Auto teleport
                                    if petAutoTP then
                                        local root = GetRoot()
                                        if root then
                                            root.CFrame = primary.CFrame + Vector3.new(0, 4, 0)
                                        end
                                    end

                                    -- Auto buy
                                    if petAutoBuy and info.price > 0 then
                                        task.spawn(function()
                                            pcall(function()
                                                local buyRemote = ReplicatedStorage:FindFirstChild("BuyPet")
                                                    or ReplicatedStorage:FindFirstChild("PurchasePet")
                                                if buyRemote then
                                                    buyRemote:FireServer(name, info.price)
                                                    Notify("Bought: " .. name, C.gold)
                                                end
                                            end)
                                        end)
                                    end
                                end
                            end
                            -- Recurse
                            if obj:IsA("Folder") or obj:IsA("Model") then
                                searchForPets(obj)
                            end
                        end
                    end
                    searchForPets(Workspace)
                end
            end
        end)

        Spacer(p, 4)

        -- ── FEATURE 4: SEED PACK SPAWNER ──
        SectionHeader(p, "🌾 " .. T("seedPack"):upper())

        local seedActive = false
        local seedToggle = MakeToggle(p, T("seedPack") .. " Auto Collect", false, function(state)
            seedActive = state
            Notify(T("seedPack") .. " — " .. (state and T("enabled") or T("disabled")), state and C.green or C.red)
        end)

        task.spawn(function()
            while true do
                task.wait(0.3)
                if not seedActive then continue end
                -- Look for SeedPackSpawnClient in workspace
                local function findSeedPacks(parent)
                    if not parent then return end
                    for _, obj in pairs(parent:GetChildren()) do
                        if obj.Name:find("SeedPack") or obj.Name:find("Seed") then
                            local root = GetRoot()
                            local primary = (obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildOfClass("BasePart")))
                                         or (obj:IsA("BasePart") and obj)
                            if root and primary then
                                root.CFrame = primary.CFrame + Vector3.new(0, 4, 0)
                                task.wait(0.1)
                                pcall(function()
                                    local remote = ReplicatedStorage:FindFirstChild("CollectSeedPack")
                                        or ReplicatedStorage:FindFirstChild("PickupSeedPack")
                                        or ReplicatedStorage:FindFirstChild("CollectItem")
                                    if remote then remote:FireServer(obj) end
                                end)
                                Notify(T("collected") .. " Seed Pack!", C.green)
                                task.wait(0.1)
                            end
                        end
                        if obj:IsA("Folder") or obj:IsA("Model") then
                            findSeedPacks(obj)
                        end
                    end
                end
                findSeedPacks(Workspace)
            end
        end)

        Spacer(p, 4)

        -- ── FEATURE 5: AUTO PROXY FARM (YOUR PLOT ONLY) ──
        SectionHeader(p, "🤖 " .. T("autoProxy"):upper())

        local proxyActive = false
        local proxyToggle = MakeToggle(p, T("autoProxy") .. " (Your Plot)", false, function(state)
            proxyActive = state
            Notify(T("autoProxy") .. " — " .. (state and T("enabled") or T("disabled")), state and C.green or C.red)
        end)

        -- Status card
        local _, proxyStatusVal = CardLabel(p, T("status"), T("inactive"))

        task.spawn(function()
            while true do
                task.wait(0.3)
                if not proxyActive then
                    proxyStatusVal.Text = T("inactive")
                    proxyStatusVal.TextColor3 = C.red
                    continue
                end
                proxyStatusVal.Text = T("active")
                proxyStatusVal.TextColor3 = C.green

                if not Gardens then
                    pcall(function() Gardens = Workspace:FindFirstChild("Gardens") end)
                    if not Gardens then continue end
                end

                -- Find my plot
                local myPlot
                for _, plot in pairs(Gardens:GetChildren()) do
                    if plot:GetAttribute("OwnerUserId") == LocalPlayer.UserId then
                        myPlot = plot
                        break
                    end
                end
                if not myPlot then continue end

                local plantsFolder = myPlot:FindFirstChild("Plants")
                if not plantsFolder then continue end

                for _, plant in pairs(plantsFolder:GetChildren()) do
                    if not proxyActive then break end
                    local fruits = plant:FindFirstChild("Fruits")
                    if fruits then
                        for _, fruit in pairs(fruits:GetChildren()) do
                            if not proxyActive then break end
                            local harvestPart = fruit:FindFirstChild("HarvestPart")
                            local prompt = harvestPart and (harvestPart:FindFirstChild("HarvestPrompt") or harvestPart:FindFirstChild("ProximityPrompt"))
                            if harvestPart then
                                local root = GetRoot()
                                if root then
                                    root.CFrame = harvestPart.CFrame + Vector3.new(0, 3, 0)
                                    task.wait(0.08)
                                    pcall(function()
                                        if Networking and Networking.Harvest then
                                            Networking.Harvest:FireServer(
                                                fruit:GetAttribute("PlantId"),
                                                fruit:GetAttribute("FruitId") or ""
                                            )
                                        end
                                    end)
                                    task.wait(0.05)
                                end
                            end
                        end
                    else
                        -- Single fruit plant
                        local harvestPart = plant:FindFirstChild("HarvestPart")
                        if harvestPart then
                            local root = GetRoot()
                            if root then
                                root.CFrame = harvestPart.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.08)
                                pcall(function()
                                    if Networking and Networking.Harvest then
                                        Networking.Harvest:FireServer(
                                            plant:GetAttribute("PlantId"),
                                            ""
                                        )
                                    end
                                end)
                                task.wait(0.05)
                            end
                        end
                    end
                end
            end
        end)
    end

    -- ════════════════════════════════
    --  TAB: SETTINGS
    -- ════════════════════════════════
    do
        local p = tabPages["settings"]

        SectionHeader(p, "🌍 LANGUAGE")

        local langOptions = {"English", "العربية", "کوردی"}
        local langCodes   = {EN="English", AR="العربية", KU="کوردی"}
        local _, getLangSel = MakeDropdown(p, "Language / اللغة", langOptions, function(opt)
            if opt == "English"  then LANG = "EN"
            elseif opt == "العربية" then LANG = "AR"
            elseif opt == "کوردی"  then LANG = "KU"
            end
            Notify("Language changed — restart for full effect", C.gold)
        end)

        Spacer(p, 4)
        SectionHeader(p, "⚡ PERFORMANCE")

        MakeToggle(p, "Fast Collect Mode", true, function(state)
            Notify("Fast Collect: " .. (state and T("enabled") or T("disabled")), state and C.green or C.red)
        end)

        MakeToggle(p, "Notifications", true, function(state)
            -- Toggle notification visibility
        end)

        Spacer(p, 4)
        SectionHeader(p, "📋 ABOUT")

        local infoTexts = {
            {"Script",  "AXL GARDEN 2"},
            {"Version", "2.0 VIP"},
            {"Author",  "@ex_axl"},
            {"Discord", "discord.gg/rb7hCqvTD6"},
        }
        for _, row in ipairs(infoTexts) do
            local f = New("Frame", {
                Parent          = p,
                BackgroundColor3= C.bgCard,
                Size            = UDim2.new(1, 0, 0, 36),
            })
            MakeCorner(8, f)
            MakePadding(0,0,12,12,f)
            New("TextLabel", {
                Parent         = f,
                Text           = row[1],
                TextColor3     = C.textDim,
                Font           = Enum.Font.Gotham,
                TextSize       = 12,
                Size           = UDim2.new(0.4, 0, 1, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
            New("TextLabel", {
                Parent         = f,
                Text           = row[2],
                TextColor3     = C.text,
                Font           = Enum.Font.GothamBold,
                TextSize       = 13,
                Position       = UDim2.new(0.4, 0, 0, 0),
                Size           = UDim2.new(0.6, 0, 1, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        end
    end

    -- Activate first tab
    setTab("info")

    -- Entrance animation
    MainFrame.Size = UDim2.new(0, 480, 0, 0)
    MainFrame.BackgroundTransparency = 1
    Tween(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 480, 0, 520),
        BackgroundTransparency = 0,
    })
end

-- Language button callbacks
btnEN.MouseButton1Click:Connect(function() LANG = "EN" BuildMainGUI() end)
btnAR.MouseButton1Click:Connect(function() LANG = "AR" BuildMainGUI() end)
btnKU.MouseButton1Click:Connect(function() LANG = "KU" BuildMainGUI() end)

-- Hover effects on lang buttons
for _, b in ipairs({btnEN, btnAR, btnKU}) do
    b.MouseEnter:Connect(function()
        Tween(b, TweenInfo.new(0.15), {BackgroundColor3 = C.accent})
    end)
    b.MouseLeave:Connect(function()
        Tween(b, TweenInfo.new(0.15), {BackgroundColor3 = C.accentGlow})
    end)
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║   AXL GARDEN 2 — VIP GUI — t.me/axcmy | discord.gg/rb7hCqvTD6 ║
-- ╚══════════════════════════════════════════════════════════════╝
