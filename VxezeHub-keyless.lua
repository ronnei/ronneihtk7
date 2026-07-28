-- [[ HỆ THỐNG GETKEY VXEZE HUB - UPDATE TEXT GETKEY ]] --

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local parentUI = nil
local success, err = pcall(function()
    parentUI = CoreGui
end)
if not success or not parentUI then
    parentUI = LocalPlayer:WaitForChild("PlayerGui")
end

-- Xóa UI cũ nếu đang chạy
if parentUI:FindFirstChild("VxezeHub_GetKey_System") then
    parentUI["VxezeHub_GetKey_System"]:Destroy()
end

-- Hàm giải mã Hex bảo mật
local function decode(hex)
    local str = ""
    for i = 1, #hex, 2 do
        str = str .. string.char(tonumber(string.sub(hex, i, i+1), 16))
    end
    return str
end

-- Dữ liệu bảo mật (Mã hóa Hex)
local enc_key = "5678657a652d43373634343336463530413545313543" -- Key: Vxeze-C764436F50A5E15C
local enc_link = "68747470733a2f2f6c696e6b346d2e6e65742f4136585a52" -- Link: https://link4m.net/A6XZR
local enc_script = "68747470733a2f2f676973742e67697468756275736572636f6e74656e742e636f6d2f616e67657279792d7476792f33623665363864383839343063653136303838353836656564366530653631382f7261772f416e696d6545787065646974696f6e732d5678657a65"

-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VxezeHub_GetKey_System"
ScreenGui.Parent = parentUI
ScreenGui.ResetOnSpawn = false

-- Thông báo nổi (Notification) Cyan Neon
local function showNotify(text)
    local NotifyGui = Instance.new("ScreenGui")
    NotifyGui.Name = "VxezeNotify"
    NotifyGui.Parent = parentUI
    
    local Label = Instance.new("TextLabel")
    Label.Parent = NotifyGui
    Label.Size = UDim2.new(0, 400, 0, 50)
    Label.Position = UDim2.new(0.5, -200, 0.18, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(0, 240, 255)
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 18
    Label.TextStrokeTransparency = 0.2
    Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    task.spawn(function()
        task.wait(3.5)
        NotifyGui:Destroy()
    end)
end

-- Khung Menu chính (#0B0813 - Tím đen cực tối)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#0B0813")
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -155)
MainFrame.Size = UDim2.new(0, 360, 0, 310)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Khung viền cầu vồng nháy màu (Rainbow Stroke)
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = MainFrame

task.spawn(function()
    local hue = 0
    while task.wait(0.03) do
        hue = (hue + 0.01) % 1
        UIStroke.Color = Color3.fromHSV(hue, 0.8, 1)
    end
end)

-- Tiêu đề Menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "Hệ Thống GetKey Vxeze Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundTransparency = 1

-- Ô nhập Key (#161224 - Tím xám)
local KeyInput = Instance.new("TextBox")
KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = "Nhập key tại đây..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromHex("#161224")
KeyInput.Position = UDim2.new(0.08, 0, 0.16, 0)
KeyInput.Size = UDim2.new(0.84, 0, 0, 36)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 13

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = KeyInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromHex("#2F264A")
InputStroke.Parent = KeyInput

-- Nút GET KEY (#00F0FF - Cyan Neon, chữ đen)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Parent = MainFrame
GetKeyBtn.Text = ""
GetKeyBtn.BackgroundColor3 = Color3.fromHex("#00F0FF")
GetKeyBtn.Position = UDim2.new(0.08, 0, 0.30, 5)
GetKeyBtn.Size = UDim2.new(0.84, 0, 0, 38)

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = GetKeyBtn

-- Dòng chính: GetKey Vĩnh Viễn ∞
local MainBtnText = Instance.new("TextLabel")
MainBtnText.Name = "MainText"
MainBtnText.Parent = GetKeyBtn
MainBtnText.Size = UDim2.new(1, 0, 0.55, 0)
MainBtnText.Position = UDim2.new(0, 0, 0.05, 0)
MainBtnText.BackgroundTransparency = 1
MainBtnText.Text = "GetKey Vĩnh Viễn ∞"
MainBtnText.Font = Enum.Font.GothamBold
MainBtnText.TextSize = 13
MainBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Dòng chữ phụ: (Link4m 1 lần)
local SubBtnText = Instance.new("TextLabel")
SubBtnText.Name = "SubText"
SubBtnText.Parent = GetKeyBtn
SubBtnText.Size = UDim2.new(1, 0, 0.4, 0)
SubBtnText.Position = UDim2.new(0, 0, 0.55, 0)
SubBtnText.BackgroundTransparency = 1
SubBtnText.Text = "(Link4m 1 lần)"
SubBtnText.Font = Enum.Font.GothamBold
SubBtnText.TextSize = 10
SubBtnText.TextColor3 = Color3.fromRGB(30, 30, 30)

-- Nút XÁC NHẬN KEY
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = MainFrame
SubmitBtn.Text = "XÁC NHẬN KEY"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextColor3 = Color3.fromHex("#0B0813")
SubmitBtn.Position = UDim2.new(0.08, 0, 0.46, 10)
SubmitBtn.Size = UDim2.new(0.84, 0, 0, 36)

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitBtn

-- Chữ Note nhỏ ở dưới
local NoteLabel = Instance.new("TextLabel")
NoteLabel.Parent = MainFrame
NoteLabel.Text = "script chỉ nokey trong 2 tiếng từ khi video được đăng lên đã quá 2 tiếng kể từ khi video được đăng lên nên mình xin phép được thêm key vào nhé\nViệc lấy Key Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!"
NoteLabel.Font = Enum.Font.GothamMedium
NoteLabel.TextColor3 = Color3.fromHex("#E08B46")
NoteLabel.Position = UDim2.new(0.05, 0, 0.65, 5)
NoteLabel.Size = UDim2.new(0.9, 0, 0, 95)
NoteLabel.BackgroundTransparency = 1
NoteLabel.TextWrapped = true
NoteLabel.TextYAlignment = Enum.TextYAlignment.Top
NoteLabel.TextSize = 9.5

-- Logic nút GET KEY
GetKeyBtn.MouseButton1Click:Connect(function()
    MainBtnText.Text = "ĐÃ SAO CHÉP LINK!"
    SubBtnText.Text = "Hãy dán vào trình duyệt"
    
    setclipboard(decode(enc_link))
    showNotify("dán lên trình duyệt để getkey")
    
    task.wait(2)
    MainBtnText.Text = "GetKey Vĩnh Viễn ∞"
    SubBtnText.Text = "(Link4m 1 lần)"
end)

-- Logic xác nhận Key và nạp Script
SubmitBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text
    local correctKey = decode(enc_key)
    
    if input == correctKey then
        SubmitBtn.Text = "KÍCH HOẠT THÀNH CÔNG!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.wait(1)
        ScreenGui:Destroy()
        
        local scriptUrl = decode(enc_script)
        local success, runErr = pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
        if not success then
            warn("Lỗi khi tải script chính: " .. tostring(runErr))
        end
    else
        SubmitBtn.Text = "SAI KEY! VUI LÒNG THỬ LẠI"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.wait(2)
        SubmitBtn.Text = "XÁC NHẬN KEY"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SubmitBtn.TextColor3 = Color3.fromHex("#0B0813")
    end
end)
