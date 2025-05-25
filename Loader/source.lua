-- Rayfield UI Kit yükleniyor
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Ana pencere oluşturuluyor
local Window = Rayfield:CreateWindow({
    Name = "Xanti Hub",
    LoadingTitle = "Xanti Interface",
    LoadingSubtitle = "by Axrex",
    Theme = "Ocean",
    ToggleUIKeybind = Enum.KeyCode.K, -- GUI aç/kapat tuşu

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Axrex", -- Kaydedilen klasör
        FileName = "XantiHub_Config" -- Konfigürasyon dosyası
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "Xanti Hub",
        Subtitle = "Key System",
        Note = "Anahtarı giriniz: Axrex",
        FileName = "XantiHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Axrex"}
    }
})

-- Sekmeler
local TabMain = Window:CreateTab("Main", 4483362458)
local TabScripts = Window:CreateTab("Scripts", 4483362458)
local TabCredits = Window:CreateTab("Credits", 4483362458)

-- Aimbot Butonu (ÇALIŞAN URL İLE)
TabMain:CreateButton({
    Name = "Tsb | Aimbot V1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AxerBa/XantiHubV2/main/Modulas/Aim.lua"))()
    end,
})

-- Fly Script Butonu
TabScripts:CreateButton({
    Name = "Fly Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YkBUq0mC"))()
    end,
})

-- Credits
TabCredits:CreateParagraph({
    Title = "Geliştirici",
    Content = "Made by Axrex | Xanti Hub v1.0"
})

-- Yapılandırma yükleniyor
Rayfield:LoadConfiguration()
