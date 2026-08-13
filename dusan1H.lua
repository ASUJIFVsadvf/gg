print("Loading...")
local Rank_Name = "Dusan1H The Goat"
local Player_Name = ""


while true do
    if pcall(function() game.Players.LocalPlayer.leaderstats:WaitForChild("Blocks Mined") end) then
        if pcall(function() game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Coins:FindFirstChild("Amount") end) then
            if game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Tokens.Amount.Text ~= "Loading..." then
                break
            end
        end
    end
    wait()
end

repeat wait() until game:IsLoaded()
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
while game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("LoadingFrame") do
    pcall(function()
        for i, connection in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.Quality.LowQuality.MouseButton1Down)) do
            connection:Fire()
        end
    end)
    wait()
end

local Running = false
local startvalue = 0
local endvalue = 0
local start = false
local minute = false
local fiveminute = false
local minutewait = 60
local fiveminutewait = 300
local waitime = 0
local mined = 0
local customwait = false
local customwaittime = 0
local selected = false
local waittodisplay = 0
local rebsstart = 0
local rebsend = 0
local rebsdone = 0 
local displaystoponly = false
local stopminedinwait = 0
local function BuildTrackerPanel()
    local Screen = game.Players.LocalPlayer.PlayerGui.ScreenGui

    local Existing = Screen:FindFirstChild("TrackerPanel")
    if Existing then Existing:Destroy() end

    local Panel = Instance.new("Frame")
    Panel.Name = "TrackerPanel"
    Panel.AnchorPoint = Vector2.new(1, 1)
    Panel.Position = UDim2.new(1, -7, 1, -407)
    Panel.Size = UDim2.new(0, 230, 0, 316)
    Panel.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
    Panel.BackgroundTransparency = 0.12
    Panel.BorderSizePixel = 0
    Panel.Active = true
    Panel.Parent = Screen

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Panel

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(255, 255, 255)
    Stroke.Transparency = 0.82
    Stroke.Thickness = 1
    Stroke.Parent = Panel

    local StatusDot = Instance.new("Frame")
    StatusDot.Size = UDim2.new(0, 8, 0, 8)
    StatusDot.Position = UDim2.new(0, 12, 0, 22)
    StatusDot.BackgroundColor3 = Color3.fromRGB(110, 200, 130)
    StatusDot.BorderSizePixel = 0
    StatusDot.Parent = Panel
    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = StatusDot

    local Tracker = Instance.new("TextLabel")
    Tracker.BackgroundTransparency = 1
    Tracker.Size = UDim2.new(1, -38, 0, 36)
    Tracker.Position = UDim2.new(0, 26, 0, 8)
    Tracker.Font = Enum.Font.GothamSemibold
    Tracker.TextScaled = true
    Tracker.TextWrapped = true
    Tracker.TextSize = 14
    Tracker.TextColor3 = Color3.fromRGB(255, 255, 255)
    Tracker.TextXAlignment = Enum.TextXAlignment.Left
    Tracker.TextYAlignment = Enum.TextYAlignment.Center
    Tracker.Text = "Select Time And Press Start"
    Tracker.Parent = Panel

    local Line = Instance.new("Frame")
    Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Line.BackgroundTransparency = 0.85
    Line.BorderSizePixel = 0
    Line.Size = UDim2.new(1, -24, 0, 1)
    Line.Position = UDim2.new(0, 12, 0, 50)
    Line.Parent = Panel

    local function AddStatRow(y, label)
        local Row = Instance.new("Frame")
        Row.BackgroundTransparency = 1
        Row.Size = UDim2.new(1, -24, 0, 20)
        Row.Position = UDim2.new(0, 12, 0, y)
        Row.Parent = Panel

        local Label = Instance.new("TextLabel")
        Label.BackgroundTransparency = 1
        Label.Size = UDim2.new(0, 130, 1, 0)
        Label.Font = Enum.Font.GothamMedium
        Label.TextSize = 12
        Label.TextColor3 = Color3.fromRGB(160, 165, 175)
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.TextYAlignment = Enum.TextYAlignment.Center
        Label.Text = label
        Label.Parent = Row

        local Value = Instance.new("TextLabel")
        Value.BackgroundTransparency = 1
        Value.Size = UDim2.new(1, -130, 1, 0)
        Value.Position = UDim2.new(0, 130, 0, 0)
        Value.Font = Enum.Font.GothamSemibold
        Value.TextSize = 13
        Value.TextColor3 = Color3.fromRGB(255, 255, 255)
        Value.TextXAlignment = Enum.TextXAlignment.Right
        Value.TextYAlignment = Enum.TextYAlignment.Center
        Value.Text = "0"
        Value.Parent = Row

        return Value
    end

    local BlocksText = AddStatRow(56, "Blocks Mined:")
    local JoinBlocksText = AddStatRow(80, "Blocks This Session:")
    local RebsText = AddStatRow(104, "Rebirths:")
    local DepthValue = AddStatRow(128, "Depth:")
    local CframeValue = AddStatRow(152, "Cframe:")
    local FpsText = AddStatRow(176, "FPS:")

    local CreditLabel = Instance.new("TextLabel")
    CreditLabel.BackgroundTransparency = 1
    CreditLabel.Size = UDim2.new(1, -24, 0, 16)
    CreditLabel.Position = UDim2.new(0, 12, 0, 300)
    CreditLabel.Font = Enum.Font.Gotham
    CreditLabel.TextSize = 11
    CreditLabel.TextColor3 = Color3.fromRGB(120, 125, 135)
    CreditLabel.TextXAlignment = Enum.TextXAlignment.Center
    CreditLabel.Text = "Credits: Cole1H - uv.a"
    CreditLabel.Parent = Panel

    return Tracker, BlocksText, RebsText, DepthValue, CframeValue, FpsText, JoinBlocksText, StatusDot, Panel
end

    local Tracker, BlocksText, RebsText, DepthValue, CframeValue, FpsText, JoinBlocksText, StatusDot, Panel = BuildTrackerPanel()

local joinstartvalue = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined").Value

local function SetStatus(text, color)
    Tracker.Text = text
    if color then StatusDot.BackgroundColor3 = color end
end

local function GetDepthNumber()
    local TopInfo = game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("TopInfoFrame")
    if TopInfo then
        local Depth = TopInfo:FindFirstChild("Depth")
        if Depth then
            local Text = (Depth:IsA("TextLabel") and Depth.Text) or ""
            local ContentText = Depth:FindFirstChild("ContentText")
            if ContentText and ContentText:IsA("TextLabel") then Text = ContentText.Text end
            local num = tonumber(Text:split(" ")[1])
            if num then return tostring(num) end
            if Text ~= "" then return Text end
        end
    end
    return "0"
end

local function GetPlayerPosition()
    local Character = game.Players.LocalPlayer.Character
    if Character then
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            local P = HumanoidRootPart.Position
            return string.format("%.0f, %.0f, %.0f", P.X, P.Y, P.Z)
        end
    end
    return "0, 0, 0"
end

task.spawn(function()
    while true do
        DepthValue.Text = GetDepthNumber()
        CframeValue.Text = GetPlayerPosition()
        pcall(function()
            local Blocks = game.Players.LocalPlayer.leaderstats:FindFirstChild("Blocks Mined")
            if Blocks then
                JoinBlocksText.Text = comma(Blocks.Value - joinstartvalue)
            end
        end)
        task.wait(0.5)
    end
end)

local RunService = game:GetService("RunService")
local fpsFrames = 0
local fpsTime = 0
RunService.RenderStepped:Connect(function(dt)
    fpsTime += dt
    fpsFrames += 1
    if fpsTime >= 0.5 then
        FpsText.Text = string.format("%.0f", fpsFrames / fpsTime)
        fpsFrames = 0
        fpsTime = 0
    end
end)

local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStartPos
local panelStartPos

local function IsOverButton(input)
    local success, Objects = pcall(function()
        return Panel:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
    end)
    if not success then return false end
    for _, Obj in ipairs(Objects) do
        if Obj:IsA("TextButton") or Obj:IsA("TextBox") then
            return true
        end
    end
    return false
end

local function IsOverPanel(input)
    if not Panel.Visible then return false end
    local AbsPos = Panel.AbsolutePosition
    local AbsSize = Panel.AbsoluteSize
    return input.Position.X >= AbsPos.X and input.Position.X <= AbsPos.X + AbsSize.X
       and input.Position.Y >= AbsPos.Y and input.Position.Y <= AbsPos.Y + AbsSize.Y
end

local function TryStartDrag(input)
    if IsOverPanel(input) and not IsOverButton(input) then
        dragging = true
        dragStartPos = input.Position
        panelStartPos = Panel.Position
    end
end

local function UpdateDrag(input)
    if dragging then
        local delta = input.Position - dragStartPos
        Panel.Position = UDim2.new(panelStartPos.X.Scale, panelStartPos.X.Offset + delta.X, panelStartPos.Y.Scale, panelStartPos.Y.Offset + delta.Y)
    end
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        TryStartDrag(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        UpdateDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        Panel.Visible = not Panel.Visible
    end
end)
local sell = game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame:FindFirstChild("Sell")

if sell then
    sell.Position = UDim2.new(-10,0,-10,0)
else 
    print("xd")
end

function comma(amount)
    while true do
        amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break

        end
    end 
    return amount
end




local function MakeButton(text, size, position)
    local Button = Instance.new("TextButton")
    Button.BackgroundColor3 = Color3.fromRGB(45, 50, 62)
    Button.BorderSizePixel = 0
    Button.Size = size
    Button.Position = position
    Button.Font = Enum.Font.GothamSemibold
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.Parent = Panel
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = Button
    return Button
end

local minutebutton = MakeButton("1 Min", UDim2.new(0, 99, 0, 24), UDim2.new(0, 12, 0, 234))
local fiveminutebutton = MakeButton("5 Min", UDim2.new(0, 99, 0, 24), UDim2.new(0, 119, 0, 234))
local setbutton = MakeButton("Set", UDim2.new(0, 80, 0, 24), UDim2.new(0, 138, 0, 204))
local StartButton = MakeButton("Start", UDim2.new(0, 206, 0, 28), UDim2.new(0, 12, 0, 264))
StartButton.Name = "StartButton"

local TextBox = Instance.new("TextBox")
TextBox.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(0, 118, 0, 24)
TextBox.Position = UDim2.new(0, 12, 0, 204)
TextBox.Font = Enum.Font.GothamMedium
TextBox.Text = "Enter Time (Sec)"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 13
TextBox.PlaceholderText = "Custom time (sec)"
TextBox.ClearTextOnFocus = true
TextBox.Parent = Panel
local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 8)
TextBoxCorner.Parent = TextBox

minutebutton.MouseButton1Click:Connect(function()
    if Running then print("Cant Change while Running") return end
    if fiveminute then print("You can only select 1 option") return end
    if customwait then print("You can only select 1 option") return end
    if minute then
        waitime = 0
        minute = false
        minutebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        waitime = minutewait
        minutebutton.TextColor3 = Color3.fromRGB(85, 255, 0)
        minute = true
        waittodisplay = minutewait
    end
end)

fiveminutebutton.MouseButton1Click:Connect(function()
    if Running then print("Cant Change while Running") return end
    if minute then print("You can only select 1 option") return end
    if customwait then print("You can only select 1 option") return end
    if fiveminute then
        fiveminute = false
        waitime = 0
        fiveminutebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        waitime = fiveminutewait
        fiveminutebutton.TextColor3 = Color3.fromRGB(85, 255, 0)
        fiveminute = true
        waittodisplay = fiveminutewait
    end
end)

setbutton.MouseButton1Click:Connect(function()
    if Running then print("Cant Change while Running") return end
    if fiveminute then print("You can only select 1 option") return end
    if minute then print("You can only select 1 option") return end
    if customwait == false then
        customwaittime = TextBox.Text
        local stringtonumber = tonumber(customwaittime)
        waitime = stringtonumber
        waittodisplay = stringtonumber
        setbutton.TextColor3 = Color3.fromRGB(85, 255, 0)
        customwait = true
    else
        waitime = 0
        setbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        customwait = false
    end
end)

StartButton.MouseButton1Click:Connect(function()
    if waitime > 0 then
        if Running then 
            displaystoponly = true
            waitime = 1
            Running = false
            SetStatus("Stopping...", Color3.fromRGB(235, 90, 90))
            wait(1)
            stopminedinwait -= 1
            SetStatus("You Mined "..comma(mined).." Blocks and did "..comma(rebsdone).." Rebirths in "..stopminedinwait.."S", Color3.fromRGB(110, 200, 130))
            StartButton.Text = 'Start'
            StartButton.TextColor3 = Color3.fromRGB(255,255,255)
            wait(0.1)
            stopminedinwait = 0
            fiveminutebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
            minutebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
            minute = false
            fiveminute = false
            displaystoponly = false
            customwait = false
            TextBox.Text = "Enter Time (In Sec)"
            customwaittime = 0
            setbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        return end
            SetStatus("Starting...", Color3.fromRGB(235, 180, 90))
        Running = true
        wait(5)
        StartButton.Text = 'Stop'
        StartButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        startvalue = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined").Value
        rebsstart = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value
        repeat
            wait(1)
            waitime -= 1
            stopminedinwait +=1
            if displaystoponly == false then
                SetStatus(waitime.."s left", Color3.fromRGB(235, 180, 90))
                end
        until waitime == 0
        if displaystoponly then
            endvalue = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined").Value
            rebsend = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value
            mined = endvalue - startvalue
            rebsdone = rebsend - rebsstart
        else    
        endvalue = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined").Value
        rebsend = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value
        mined = endvalue - startvalue
        rebsdone = rebsend - rebsstart
        wait(0.2)
        SetStatus("Hold on...", Color3.fromRGB(235, 180, 90))
        wait(1)
        SetStatus("You Mined "..comma(mined).." Blocks and did "..comma(rebsdone).." Rebirths in "..waittodisplay.."S", Color3.fromRGB(110, 200, 130))
        startvalue = 0
        endvalue = 0
        StartButton.Text = 'Start'
        StartButton.TextColor3 = Color3.fromRGB(255,255,255)
        waitime = 0
        fiveminutebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        minutebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        minute = false
        fiveminute = false
        Running = false
        customwait = false
        TextBox.Text = "Enter Time (In Sec)"
        customwaittime = 0
        setbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        end    
    else
        SetStatus("Select an option to start", Color3.fromRGB(235, 180, 90))
    end
end)

function comma(amount)
    while true do
        amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break

        end
    end
    return amount
end


BlocksText.Text = comma(game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined").Value)
RebsText.Text = comma(game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value)

game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined"):GetPropertyChangedSignal("Value"):Connect(function()
    BlocksText.Text = comma(game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Blocks Mined").Value)
end)

game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths"):GetPropertyChangedSignal("Value"):Connect(function()
    RebsText.Text = comma(game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value)
end)
for Index, Value in next, debug do
    if not getgenv()[Index] then
        getgenv()[Index] = Value
    end
end
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local CollapseUI = LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("Collapse")
if CollapseUI then
    if not CollapseUI.Visible then CollapseUI.Visible = true end
end

local ScreenGui = LocalPlayer.PlayerGui.ScreenGui

local function HideCollapsedCave()
    local Cave = ScreenGui:FindFirstChild("CollapsedCave")
    if Cave and Cave.Visible then Cave.Visible = false end
end

HideCollapsedCave()
task.wait(0.1)
HideCollapsedCave()

ScreenGui.ChildAdded:Connect(function(Child)
    if Child.Name == "CollapsedCave" then
        if Child.Visible then Child.Visible = false end
    end
end)

local MainButtons = ScreenGui:FindFirstChild("MainButtons")
if MainButtons then
    for _, Name in ipairs({"Surface", "Shop"}) do
        local Btn = MainButtons:FindFirstChild(Name)
        if Btn then Btn.Visible = false end
    end
end

local StatsFrame = ScreenGui:FindFirstChild("StatsFrame")
if StatsFrame then
    local SubButtons = StatsFrame:FindFirstChild("SubButtons")
    if SubButtons then
        local Quests = SubButtons:FindFirstChild("Quests")
        if Quests then Quests.Visible = false end
    end
end

local function FindTag()
    local function Scan(inst, depth)
        if depth > 5 then return nil end
        for _, child in ipairs(inst:GetChildren()) do
            if child.Name == "CustomPlayerTag" then return child end
            local found = Scan(child, depth + 1)
            if found then return found end
        end
        return nil
    end
    return Scan(workspace.MiningAreas, 0)
end
local function ApplyTag()
    local Tag = FindTag()
    if not Tag then return false end
    local MinerRank = Tag:FindFirstChild("MinerRank")
    local PlayerName = Tag:FindFirstChild("PlayerName")
    if MinerRank then
        MinerRank.Text = Rank_Name
        MinerRank.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
    if PlayerName then
        PlayerName.Text = Player_Name
    end
    return true
end
local deadline = os.clock() + 10
local applied = false
repeat
    applied = ApplyTag()
    if not applied and os.clock() < deadline then task.wait(0.5) end
until applied or os.clock() >= deadline
if not applied then
    warn("CustomPlayerTag not found after 10s - tag edit skipped")
end
task.spawn(function()
    while true do
        task.wait(1)
        ApplyTag()
    end
end)

LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local Data = getsenv(LocalPlayer.PlayerGui.ScreenGui.ClientScript).updatePasses
local Values = getupvalue(Data, 8)
local Remote = Values["RemoteEvent"]

local TARGET_DEPTH = 405 
local COLLAPSED = workspace:WaitForChild("Collapsed")
local START_POS = Vector3.new(24, 12, 30036)
local TARGET_GRAVITY = 1200 

COLLAPSED.Changed:Connect(function()
    if COLLAPSED.Value then
        local Cave = LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("CollapsedCave")
        if Cave and Cave.Visible then Cave.Visible = false end
    end
end)

local PATH_START = Vector3.new(2, 8.9, 30147)
local PATH_END = Vector3.new(24, 8.9, 30047)
local PATH_WIDTH = 35
local PATH_Y = 8.9
local PATH_NAME = "InvisPath"

local function PlaceInvisPath()
    if workspace:FindFirstChild(PATH_NAME) then return end

    local CenterX = PATH_START.X + PATH_WIDTH / 2
    local CenterZ = (PATH_START.Z + PATH_END.Z) / 2
    local Distance = math.abs(PATH_START.Z - PATH_END.Z)

    local Part = Instance.new("Part")
    Part.Name = PATH_NAME
    Part.Size = Vector3.new(PATH_WIDTH, 1, Distance)
    Part.CFrame = CFrame.new(CenterX, PATH_Y - 0.5, CenterZ)
    Part.Anchored = true
    Part.Transparency = 1
    Part.CanCollide = true
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Parent = workspace
end

local function MoveToStartGradual()
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChild("Humanoid")
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    
    if not Humanoid or not Root then return end

    PlaceInvisPath()
    Remote:FireServer("MoveTo", {{"CyberSpawn"}})
    task.wait(0.2) 

    Humanoid.WalkSpeed = 30

    Humanoid:MoveTo(START_POS)
    
    local timeout = 0
    while (Root.Position - START_POS).Magnitude > 3 and timeout < 20 do
        if (Root.Position - PATH_END).Magnitude <= 3 and Humanoid.WalkSpeed ~= 24 then
            Humanoid.WalkSpeed = 24
        end
        Humanoid:MoveTo(START_POS)
        task.wait(0.2)
        timeout = timeout + 1
    end

    if Humanoid.WalkSpeed ~= 24 then
        Humanoid.WalkSpeed = 24
    end
end

local function WaitAtStartPos()
    while true do
        local Character = LocalPlayer.Character
        local Root = Character and Character:FindFirstChild("HumanoidRootPart")
        if Root then
            local Distance = (Root.Position - START_POS).Magnitude
            if Distance <= 0.5 then
                return
            end
            local Humanoid = Character:FindFirstChild("Humanoid")
            if Humanoid then Humanoid:MoveTo(START_POS) end
        end
        task.wait(0.1)
    end
end

local function MineLoop()
    while not COLLAPSED.Value do
        if game.Workspace.Gravity ~= TARGET_GRAVITY then
            game.Workspace.Gravity = TARGET_GRAVITY
        end

        local Character = LocalPlayer.Character
        local Root = Character and Character:FindFirstChild("HumanoidRootPart")
        local BlocksFolder = workspace:FindFirstChild("Blocks")
        
        if not Root or not BlocksFolder then
            task.wait(0.2)
            continue
        end

        if (Root.Position - START_POS).Magnitude > 1.5 then
            local Humanoid = Character:FindFirstChild("Humanoid")
            if Humanoid then Humanoid:MoveTo(START_POS) end
        end

        local DepthText = LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text
        local CurrentDepth = tonumber(DepthText:split(" ")[1]) or (TARGET_DEPTH + 1)
        
        local Bounds = (CurrentDepth < TARGET_DEPTH) and Vector3.new(1, 20, 1) or Vector3.new(10, 10, 10)
        
        local Overlap = OverlapParams.new()
        Overlap.FilterType = Enum.RaycastFilterType.Include
        Overlap.FilterDescendantsInstances = {BlocksFolder}
        
        local Parts = workspace:GetPartBoundsInBox(Root.CFrame, Bounds, Overlap, 100)
        if CurrentDepth >= TARGET_DEPTH then
            pcall(function()
                table.sort(Parts, function(a, b)
                    local ax, az = a.Position.X - Root.Position.X, a.Position.Z - Root.Position.Z
                    local bx, bz = b.Position.X - Root.Position.X, b.Position.Z - Root.Position.Z
                    local ad, bd = ax * ax + az * az, bx * bx + bz * bz
                    if ad ~= bd then return ad > bd end
                    return a.Position.Y < b.Position.Y
                end)
            end)
        end
        
        if #Parts > 0 then
            for _, block in pairs(Parts) do
                if block and block.Parent then
                    Remote:FireServer("MineBlock", {{block.Parent}})
                end
            end

            local UnderRay = RaycastParams.new()
            UnderRay.FilterType = Enum.RaycastFilterType.Include
            UnderRay.FilterDescendantsInstances = {BlocksFolder}
            local UnderHit = workspace:Raycast(Root.Position, Vector3.new(0, -60, 0), UnderRay)
            if UnderHit and UnderHit.Instance and UnderHit.Instance.Parent then
                local Skip = RaycastParams.new()
                Skip.FilterType = Enum.RaycastFilterType.Exclude
                local Block = UnderHit.Instance
                for i = 1, 20 do
                    Skip.FilterDescendantsInstances = {Block.Parent}
                    local Hit = workspace:Raycast(Block.Position, Vector3.new(0, -60, 0), Skip)
                    if not (Hit and Hit.Instance and Hit.Instance.Parent) then
                        break
                    end
                    if Hit.Instance.Position.Y - Hit.Instance.Size.Y / 2 < Root.Position.Y - 20 then
                        break
                    end
                    if not table.find(Parts, Hit.Instance) then
                        Remote:FireServer("MineBlock", {{Hit.Instance.Parent}})
                    end
                    Block = Hit.Instance
                end
            end
        else
            task.wait(0.05)
        end
        
        task.wait(1 / 60)
    end
end

task.spawn(function()
    game.Workspace.Gravity = TARGET_GRAVITY

    while true do
        if not COLLAPSED.Value then
            MoveToStartGradual()
            WaitAtStartPos()
            MineLoop()
        end
        task.wait(0.2)
    end
end)
