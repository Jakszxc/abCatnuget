local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local CheckButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

local validKeys = {"1weekGKufkgijrgit", "jrugh48tuoa", "kfjeijJjGKDOif3tigj", "hooJIGJgj2999401", "infiniteHoaxdumrij3ifjJR", "whJGIMF390r24924", "ufidjfh284if", "di9rIJFIjfi3u831"} -- Danh sách key hợp lệ
local keyToCopy = "https://discord.gg/6sjNhy68" -- Key để sao chép

-- Thiết lập GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 400, 0, 200)
Frame.Position = UDim2.new(0.5, -200, 0.5, -100)

TextLabel.Parent = Frame
TextLabel.Text = "Hoax Key System"
TextLabel.Size = UDim2.new(1, 0, 0.2, 0)
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextSize = 20

TextBox.Parent = Frame
TextBox.Size = UDim2.new(0.8, 0, 0.3, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.Text = "Enter Key"
TextBox.Font = Enum.Font.SourceSansBold
TextBox.TextSize = 18

CheckButton.Parent = Frame
CheckButton.Size = UDim2.new(0.4, 0, 0.2, 0)
CheckButton.Position = UDim2.new(0.1, 0, 0.7, 0)
CheckButton.Text = "Check Key"
CheckButton.Font = Enum.Font.SourceSansBold
CheckButton.TextSize = 18
CheckButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CheckButton.TextColor3 = Color3.fromRGB(0, 255, 17)

GetKeyButton.Parent = Frame
GetKeyButton.Size = UDim2.new(0.4, 0, 0.2, 0)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
GetKeyButton.Text = "Get Key"
GetKeyButton.Font = Enum.Font.SourceSansBold
GetKeyButton.TextSize = 18
GetKeyButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
GetKeyButton.TextColor3 = Color3.fromRGB(0, 255, 17)

-- Chức năng kiểm tra key
CheckButton.MouseButton1Click:Connect(function()
    local inputKey = TextBox.Text
    for _, key in ipairs(validKeys) do
        if inputKey == key then
            print("Key is valid! Loading...")
            TextLabel.Text = "Key Valid! Access Granted"
            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            -- Đợi 1 giây rồi ẩn GUI
            wait(0.1)
            ScreenGui:Destroy() -- Xóa GUI
            
            return
        end
    end
    print("Invalid Key!")
    TextLabel.Text = "Invalid Key! Try Again"
    TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

-- Chức năng sao chép key
GetKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(keyToCopy)
        print("Key copied to clipboard!")
        TextLabel.Text = "Please buy key in discord"
        TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    else
        print("Copy manually: " .. keyToCopy)
    end
end)
