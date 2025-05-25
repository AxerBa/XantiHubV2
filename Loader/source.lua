-- Rayfield yükleniyor
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Ana pencere oluşturuluyor
local Window = Rayfield:CreateWindow({
    Name = "Xanti Hub",
    LoadingTitle = "Xanti Interface",
    LoadingSubtitle = "by Axrex",
    Theme = "Ocean", -- Tema: Default, Aqua, Midnight, Ocean, vb.
    ToggleUIKeybind = Enum.KeyCode.K, -- K tuşuyla GUI aç/kapanır

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

-- Ana sekme butonu
TabMain:CreateButton({
    Name = "Tsb | Aimbot V1",
    Callback = function()
        -- Aimbot scriptini yükle
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AxerBa/XantiHubV2/refs/heads/main/Modulas/Aim.lua'))()
    end,
})

-- Örnek başka script (Script sekmesinde)
TabScripts:CreateButton({
    Name = "Fly Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YkBUq0mC"))() -- Basit fly
    end,
})

-- Credit kısmı
TabCredits:CreateParagraph({
    Title = "Geliştirici",
    Content = "Made by Axrex | Xanti Hub v1.0"
})

-- Yapılandırmayı yükle
Rayfield:LoadConfiguration()
