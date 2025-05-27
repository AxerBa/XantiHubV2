-- Xanti Hub (Tam Sürüm)
-- Rayfield UI + AimV1 Toggle Entegrasyonu + Hazır Script Sekmesi

-- Rayfield'i yükle
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Pencere oluştur
local Window = Rayfield:CreateWindow({
    Name = "Xanti Hub",
    Icon = 0,
    LoadingTitle = "Xanti Interface",
    LoadingSubtitle = "by Axrex",
    Theme = "Amethyst",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Axrex",
        FileName = "Axrex"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Xanti Key System",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Axrex"}
    }
})

-- Sekmeler
local TabMain = Window:CreateTab("Main", 4483362458)
local TabScripts = Window:CreateTab("Scripts", 4483362458)
local TabReadyScripts = Window:CreateTab("Hazır Script", 4483362458)
local TabCredit = Window:CreateTab("Credit", 4483362458)

-- Bildirim fonksiyonu
local function Notify(title, content)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 4,
        Image = 4483362458,
        Actions = {
            Ok = {
                Name = "Tamam",
                Callback = function() end
            }
        }
    })
end

-- GUI yüklendiğinde hoş geldin bildirimi
Notify("Discord", "Xanti Hub'e Hoş Geldin!")

-- Aim scriptini toggle ile kontrol et
local AimModule = nil
TabMain:CreateToggle({
    Name = "Tsb | Aim V1",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            AimModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/AxerBa/XantiHubV2/main/Modulas/Aim.lua"))()
            if AimModule and AimModule.EnableAim then
                AimModule.EnableAim()
                Notify("Discord", "Tsb Aim V1 aktif edildi!")
            end
        else
            if AimModule and AimModule.DisableAim then
                AimModule.DisableAim()
                Notify("Discord", "Tsb Aim V1 devre dışı bırakıldı!")
            end
        end
    end
})

-- Script sekmesine 7 toggle (alt alta ve özelleştirilmiş)
local scriptList = {
    {Name = "Tsb | Aim", Url = "https://raw.githubusercontent.com/AxerBa/XantiHubV2/main/Modulas/Aim.lua"},
    {Name = "Coming Soon", Url = "https://raw.githubusercontent.com/xQuartyx/DonateMe/main/Script.lua"},
    {Name = "Coming Soon", Url = "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Build%20A%20Boat%20For%20Treasure"},
    {Name = "Coming Soon", Url = "https://raw.githubusercontent.com/Veztiez/King-Legacy/main/Script.lua"},
    {Name = "Coming Soon", Url = "https://raw.githubusercontent.com/VeriHubX/AFS-Script/main/AFS"},
    {Name = "Coming Soon", Url = "https://raw.githubusercontent.com/VeriHubX/Arsenal-Script/main/Arsenal"},
    {Name = "Coming Soon", Url = "https://raw.githubusercontent.com/K0t1n/Public/main/PetSimX"}
}

for _, script in ipairs(scriptList) do
    TabScripts:CreateToggle({
        Name = script.Name,
        CurrentValue = false,
        Callback = function(Value)
            if Value then
                loadstring(game:HttpGet(script.Url))()
                Notify("Script", script.Name .. " yüklendi!")
            else
                Notify("Script", script.Name .. " devre dışı bırakıldı (manuel kapanabilir)!")
            end
        end
    })
end

-- Hazır Script Sekmesi (Toplanan scriptler)
local readyScripts = {
    {Name = "Tsb | jinwo", Url = "https://raw.githubusercontent.com/hamletirl/sunjingwoo/refs/heads/main/sunjingwoo"},
    {Name = "Tsb | Phantasm Hub", Url = "https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"},
    {Name = "Tsb | SpeedHub X", Url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
    {Name = "Arsenal", Url = "https://raw.githubusercontent.com/JackyPoopoo/cartel/main/0000000000000000000000000000000000000000000000000"},
    {Name = "MM2", Url = "https://raw.githubusercontent.com/Snowt-Team/SNT-HUB/refs/heads/main/MurderMystery2.txt"},
    {Name = "Fling This Peapol", Url = "https://raw.githubusercontent.com/fratelevostru9999/src/refs/heads/main/VenomX%20Fling%20Things%20And%20People"},
    {Name = "Bedwars| Vape 4", Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"},
}

for _, script in ipairs(readyScripts) do
    TabReadyScripts:CreateButton({
        Name = script.Name,
        Callback = function()
            loadstring(game:HttpGet(script.Url))()
            Notify("Hazır Script", script.Name .. " scripti yüklendi!")
        end
    })
end

-- Credit sekmesine By Axrex butonu
TabCredit:CreateButton({
    Name = "By Axrex",
    Callback = function()
        Notify("Discord", "Hazırlayan: Axrex")
    end
})

-- Yapılandırma yükle
Rayfield:LoadConfiguration()
