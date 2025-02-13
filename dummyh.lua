-- Gui to Lua
-- Version: 3.2

-- Instances:

local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

--Properties:

Frame.Parent = game.StarterGui.ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.185040593, 0, 0.192976356, 0)
Frame.Size = UDim2.new(0, 856, 0, 320)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0257009342, 0, 0.721875012, 0)
TextButton.Size = UDim2.new(0, 255, 0, 65)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Check Key"
TextButton.TextColor3 = Color3.fromRGB(0, 255, 17)
TextButton.TextSize = 26.000

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.605140209, 0, 0.721875012, 0)
TextButton_2.Size = UDim2.new(0, 255, 0, 65)
TextButton_2.Font = Enum.Font.SourceSansBold
TextButton_2.Text = "Get Key"
TextButton_2.TextColor3 = Color3.fromRGB(0, 255, 17)
TextButton_2.TextSize = 26.000

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(218, 218, 218)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0841121525, 0, 0.253125012, 0)
TextBox.Size = UDim2.new(0, 661, 0, 96)
TextBox.Font = Enum.Font.SourceSansBold
TextBox.Text = "Input Key"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 50.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.205607474, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 454, 0, 68)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Hoax Key System"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 40.000

local UserInputService = game:GetService("UserInputService")
local keyToCopy = "BreadAtlantis" -- Chuỗi cần sao chép
local validKeys = {"BreadAtlantis"} -- Danh sách key hợp lệ

TextButton_2.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(keyToCopy)
    elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
        -- Nếu setclipboard không hoạt động, có thể hiển thị thông báo hướng dẫn
        print("Copy manually: " .. keyToCopy)
    end
end)

TextButton.MouseButton1Click:Connect(function()
    local inputKey = TextBox.Text
    for _, key in ipairs(validKeys) do
        if inputKey == key then
            print("Key is valid! Loading...")
            -- Thực hiện hành động khi key hợp lệ
            break
        end
    end
end)
