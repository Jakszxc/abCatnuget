local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Dummy" ,
    SubTitle = "by Slorus (hoang)",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Kaitun", Icon = "" }),
}

local Toggle = Tabs.Main:AddToggle("MyToggle", { Title = "Start Kaitun", Default = false })

-- Cài đặt nhiệm vụ
local questName = "BanditQuest1" -- Tên nhiệm vụ
local questLevel = 1 -- Cấp độ nhiệm vụ

-- Biến để kiểm soát vòng lặp
local autoQuestEnabled = false

-- Hàm auto quest
local function startQuest()
    local args = {
        [1] = "StartQuest",
        [2] = questName,
        [3] = questLevel
    }
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_")
    local success, err = pcall(function()
        remote:InvokeServer(unpack(args))
    end)
    
    if not success then
        warn("Không thể bắt đầu nhiệm vụ: " .. tostring(err))
    else
        print("Đã bắt đầu nhiệm vụ: " .. questName)
    end
end

-- Hàm auto-equip
local function autoEquip()
    local character = game:GetService("Players").LocalPlayer.Character
    if character and character:FindFirstChild("Combat") and character.Combat:FindFirstChild("EquipEvent") then
        local args = {
            [1] = true
        }
        local success, err = pcall(function()
            character.Combat.EquipEvent:FireServer(unpack(args))
        end)
        
        if not success then
            warn("Không thể auto equip: " .. tostring(err))
        else
            print("Auto-equip thành công")
        end
    else
        warn("Không tìm thấy sự kiện EquipEvent trong nhân vật")
    end
end

-- Kích hoạt toggle
Toggle:OnChanged(function()
    autoQuestEnabled = Toggle.Value
    print("Auto quest:", autoQuestEnabled)

    if autoQuestEnabled then
        -- Auto equip trước khi bắt đầu
        autoEquip()

        -- Bắt đầu vòng lặp auto quest
        spawn(function()
            while autoQuestEnabled do
                startQuest()
                wait(10) -- Chỉnh thời gian giữa mỗi lần thực hiện nhiệm vụ
            end
        end)
    end
end)