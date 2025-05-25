
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Xanti Hub",
    Icon = 0, -- İkon kullanmak istemiyorsanız 0 bırakın
    LoadingTitle = "Xanti İnterface",
    LoadingSubtitle = "by Axrex",
    Theme = "Ocean", -- Temalar: Default, Aqua, Midnight, etc.

    ToggleUIKeybind = "K", -- UI'yi aç/kapat tuşu

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Axrex", -- Klasör adı (string olmalı)
        FileName = "Axrex Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true, -- İsterseniz key sistemini açabilirsiniz
    KeySettings = {
        Title = "Xanti Hub",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Axrex"}
    }
})

-- Sekmeler (Tablar)
local Tab = Window:CreateTab("Main", 4483362458) -- Başlık, İkon ID
local TabMisc = Window:CreateTab("Script", 4483362458)
local TabCre = Window:CreateTab("Credit", 4483362458)

-- Buton örneği
local Button = Tab:CreateButton({
    Name = "Tsb | Aimbot V1",
    Callback = function()
        -- Butona basıldığında yapılacak işlemler
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AxerBa/XantiHubV2/refs/heads/main/Modulas/Aimbot.lua'))()
    end,
})

-- Kaydedilmiş yapılandırmayı yükle
Rayfield:LoadConfiguration()
