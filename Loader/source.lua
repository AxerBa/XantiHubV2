-- Rayfield yükleniyor
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Ana pencere oluşturuluyor
local Window = Rayfield:CreateWindow({
    Name = "Xanti Hub",
    LoadingTitle = "Xanti Interface",
    LoadingSubtitle = "by Axrex",
    Theme = "Ocean", -- Temalar: Default, Aqua, Midnight, Ocean, vb.
    ToggleUIKeybind = "K", -- "K" tuşuyla GUI aç/kapanır

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Axrex", -- Kullanıcı dizininde "Axrex" klasörü
        FileName = "AxrexHub_Config"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- Discord davet kodu (discord.gg/ yazma)
        RememberJoins = true
    },

    KeySystem = true, -- Key sistemi aktif
    KeySettings = {
        Title = "Xanti Hub",
        Subtitle = "Key System",
        Note = "Anahtarı giriniz: Axrex",
        FileName = "XantiHubKey", -- Kaydedilen key dosyası
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Axrex"} -- Kabul edilen key(ler)
    }
})

-- Sekmeler oluşturuluyor
local TabMain = Window:CreateTab("Main", 4483362458) -- Roblox logo ID
local TabScripts = Window:CreateTab("Scripts", 4483362458)
local TabCredits = Window:CreateTab("Credits", 4483362458)

-- Aimbot scripti (Main sekmesinde)
TabMain:CreateButton({
    Name = "Tsb | Aimbot V1",
    Callback = function()
        -- Aimbot scripti düzgün link ile yükleniyor
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AxerBa/XantiHubV2/main/Modulas/Aim.lua"))()
    end,
})

-- Basit Fly scripti (Scripts sekmesinde)
TabScripts:CreateButton({
    Name = "Fly Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YkBUq0mC"))()
    end,
})

-- Credit sekmesi
TabCredits:CreateParagraph({
    Title = "Geliştirici",
    Content = "Made by Axrex | Xanti Hub v1.0"
})

-- Yapılandırmayı yükle
Rayfield:LoadConfiguration()
