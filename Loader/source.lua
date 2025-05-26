local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Xanti Hub",
    Icon = 0,
    LoadingTitle = "Xanti Interface",
    LoadingSubtitle = "by Axrex",
    Theme = "Ocean",
    ToggleUIKeybind = Enum.KeyCode.K,

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "XantiHubV2",
        FileName = "XantiHub"
    },

    -- Discord kısmı tamamen kaldırıldı
    -- Key sistemi devre dışı bırakıldı
    KeySystem = false
})

local TabMain = Window:CreateTab("Main", 4483362458)

TabMain:CreateButton({
    Name = "Tsb | Aim V1",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AxerBa/XantiHubV2/main/Modulas/Aim.lua'))()
    end
})

Rayfield:LoadConfiguration()
