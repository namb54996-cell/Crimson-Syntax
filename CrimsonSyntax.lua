
--[[
    CRIMSON SYNTAX
    Premium Mobile UI
    Version 1.0
    Delta Android
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local GUI = Instance.new("ScreenGui")
GUI.Name = "CrimsonSyntax"
GUI.ResetOnSpawn = false
GUI.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(310, 370)
Main.Position = UDim2.new(0.5, -155, 0.5, -185)
Main.BackgroundColor3 = Color3.fromRGB(19, 12, 19)
Main.BorderSizePixel = 0
Main.Parent = GUI

Instance.new("UICorner", Main).CornerRadius =
    UDim.new(0, 12)

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(220, 35, 75)
Stroke.Thickness = 1.5
Stroke.Parent = Main

-- Header
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, -50, 0, 48)
Header.Position = UDim2.fromOffset(12, 0)
Header.BackgroundTransparency = 1
Header.Text = "CRIMSON SYNTAX"
Header.TextColor3 = Color3.fromRGB(255, 65, 105)
Header.TextSize = 19
Header.Font = Enum.Font.GothamBold
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.Parent = Main

-- Minimize button
local Min = Instance.new("TextButton")
Min.Size = UDim2.fromOffset(35, 32)
Min.Position = UDim2.new(1, -43, 0, 8)
Min.Text = "-"
Min.TextSize = 24
Min.TextColor3 = Color3.new(1, 1, 1)
Min.BackgroundColor3 = Color3.fromRGB(120, 25, 50)
Min.Parent = Main
Instance.new("UICorner", Min).CornerRadius =
    UDim.new(0, 8)

-- Content
local Content = Instance.new("Frame")
Content.Position = UDim2.fromOffset(12, 55)
Content.Size = UDim2.new(1, -24, 1, -65)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 7)
Layout.Parent = Content

local function createButton(name, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 36)
    Button.BackgroundColor3 = Color3.fromRGB(43, 22, 35)
    Button.TextColor3 = Color3.fromRGB(255, 225, 235)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamSemibold
    Button.Text = name
    Button.Parent = Content

    Instance.new("UICorner", Button).CornerRadius =
        UDim.new(0, 7)

    Button.MouseButton1Click:Connect(function()
        if callback then callback(Button) end
    end)

    return Button
end

local function toggle(name)
    local enabled = false

    createButton(name .. " : OFF", function(button)
        enabled = not enabled
        button.Text = name .. (enabled and " : ON" or " : OFF")
        button.BackgroundColor3 = enabled
            and Color3.fromRGB(125, 25, 55)
            or Color3.fromRGB(43, 22, 35)
    end)
end

-- Main features (UI switches)
toggle("Auto Fish")
toggle("Auto Catch")
toggle("Auto Sell")
toggle("Auto Farm Money")
toggle("Fish ESP")
toggle("Item ESP")
toggle("Teleport")

createButton("Anti-Cheat Testing", function(button)
    button.Text = "Testing module - UI only"
end)

createButton("Discord Community", function()
    if setclipboard then
        setclipboard("https://discord.gg/nT6kcekdq")
    end
end)

-- Minimize
local minimized = false

Min.MouseButton1Click:Connect(function()
    minimized = not minimized
    Content.Visible = not minimized
    Main.Size = minimized
        and UDim2.fromOffset(310, 48)
        or UDim2.fromOffset(310, 370)
    Min.Text = minimized and "+" or "-"
end)

-- Touch / mouse dragging
local dragging = false
local dragStart
local startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("CRIMSON SYNTAX v1.0 loaded!")
