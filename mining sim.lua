-- ==============================================================
--  MINING SIM 2 AUTO-FARM + TELEPORT QUEUE + GITHUB AUTO-RELOAD
--  Paste this entire script into GitHub → main.lua
-- ==============================================================

if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(4)

-- ==== CONFIG ====
getgenv().Name          = "Road To 1 Million Rebiths!"
getgenv().SellThreshold = getgenv().SellThreshold or 25000
getgenv().Depth         = getgenv().Depth or 405

-- ==== GITHUB AUTO-RELOAD URL (CHANGE THIS!) ====
local GITHUB_URL = "https://raw.githubusercontent.com/ASUJIFVsadvf/gg/refs/heads/main/mining%20sim"  -- ← REPLACE THIS

-- ==== ANTI-IDLE ====
local vu = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- ==== PLAYER SETUP ====
local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HRP = Char:FindFirstChild("HumanoidRootPart")
Char.Head.CustomPlayerTag.PlayerName.Text = getgenv().Name
Char.Head.CustomPlayerTag.MinerRank.Text = "G.O.A.T"

-- ==== TELEPORT QUEUE SYSTEM ====
local TS = game:GetService("TeleportService")
local Queue = {}
local Teleporting = false

local function QueueRejoin(reason)
    table.insert(Queue, reason)
    print("[Rejoin] Queued:", reason, "| Total:", #Queue)
    if not Teleporting then
        task.spawn(function()
            Teleporting = true
            local r = table.remove(Queue, 1)
            print("[Rejoin] →", r)
            pcall(function() TS:Teleport(game.PlaceId, Player) end)
            task.wait(5)  -- anti-rate-limit
            Teleporting = false
            if #Queue > 0 then QueueRejoin("next") end
        end)
    end
end

-- Rejoin on Error Prompt
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(c)
    if c.Name == "ErrorPrompt" then
        QueueRejoin("ErrorPrompt")
    end
end)

-- Rejoin on Mine Collapse
workspace.Collapsed.Changed:Connect(function()
    if workspace.Collapsed.Value then
        QueueRejoin("MineCollapse")
    end
end)

-- Rejoin on Teleport Fail
TS.TeleportInitFailed:Connect(function()
    QueueRejoin("TeleportFailed")
end)

-- ==== AUTO-RE-EXECUTE FROM GITHUB AFTER TELEPORT ====
Player.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Arrived then
        task.spawn(function()
            task.wait(3)
            local success, err = pcall(function()
                loadstring(game:HttpGet(GITHUB_URL, true))()
            end)
            if success then
                print("[Success] Script auto-reloaded from GitHub!")
            else
                warn("[Fail] GitHub reload failed:", err)
            end
        end)
    end
end)

-- ==== UI / LOADING WAIT ====
repeat task.wait() until game:IsLoaded()
Player.PlayerGui:WaitForChild("ScreenGui")

while Player.PlayerGui.ScreenGui.LoadingFrame.BackgroundTransparency == 0 do
    for _, conn in pairs(getconnections(Player.PlayerGui.ScreenGui.LoadingFrame.Quality.LowQuality.MouseButton1Down)) do
        conn:Fire()
    end
    task.wait()
end

while true do
    if pcall(function() Player.leaderstats:WaitForChild("Blocks Mined") end)
    and pcall(function() Player.PlayerGui.ScreenGui.StatsFrame.Coins:FindFirstChild("Amount") end)
    and Player.PlayerGui.ScreenGui.StatsFrame.Tokens.Amount.Text ~= "Loading..." then
        break
    end
    task.wait(1)
end

Player.PlayerGui.ScreenGui.TeleporterFrame:Destroy()
Player.PlayerGui.ScreenGui.StatsFrame.Sell:Destroy()
Player.PlayerGui.ScreenGui.MainButtons.Surface:Destroy()

-- ==== SECOND ANTI-IDLE ====
local vuAF = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    vuAF:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vuAF:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- ==== REMOTE EVENT ====
local Remote
do
    local env = getsenv(Player.PlayerGui.ScreenGui.ClientScript)
    local data = env.displayCurrent
    local vals = getupvalue(data, 8)
    Remote = vals["RemoteEvent"]
end

-- ==== EXTERNAL SCRIPTS ====
loadstring(game:HttpGet("https://raw.githubusercontent.com/ProdHallow/Miningsimrebirthtracker/main/miningsimrebirthtracker", true))()
task.wait(1)
loadstring(game:HttpGet('https://raw.githubusercontent.com/ProdHallow/DeleteAssetMinSim1/main/deleteassetsminingsim'))()
task.wait(1)

-- ==== TELEPORT TO LAVA SPAWN ====
do
    local hrp = Player.Character.HumanoidRootPart
    Player.Character.Humanoid.WalkSpeed = 0
    Player.Character.Humanoid.JumpPower = 0
    hrp.Anchored = true
    Remote:FireServer("MoveTo", {{"LavaSpawn"}})

    local plat = Instance.new("Part", workspace)
    plat.Anchored = true
    plat.Size = Vector3.new(10, 0.5, 100)
    plat.Material = Enum.Material.ForceField
    plat.Position = Vector3.new(21, 9.5, 26285)

    task.wait(1)
    hrp.Anchored = false
    while hrp.Position.Z > 26220 do
        hrp.CFrame = CFrame.new(hrp.Position.X, 13.05, hrp.Position.Z - 0.5)
        task.wait()
    end
    hrp.CFrame = CFrame.new(17, 10, 26220)
end

-- ==== DEEP MINING TO TARGET DEPTH ====
do
    local function Split(s, d)
        local t = {}
        for m in (s..d):gmatch("(.-)"..d) do table.insert(t, m) end
        return t
    end

    local rs = game:GetService("RunService").Heartbeat
    local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
    local depth = Split(Player.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")

    while tonumber(depth[1]) < getgenv().Depth do
        local minV = hrp.CFrame.Position + Vector3.new(-1, -10, -1)
        local maxV = hrp.CFrame.Position + Vector3.new( 1,   0,  1)
        local region = Region3.new(minV, maxV)
        local blocks = workspace:FindPartsInRegion3WithWhiteList(region, {workspace.Blocks}, 5)

        for _, b in ipairs(blocks) do
            Remote:FireServer("MineBlock", {{b.Parent}})
            rs:Wait()
        end
        depth = Split(Player.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")
        task.wait()
    end
end

-- ==== MAIN MINING / SELL / REBIRTH LOOP ====
do
    local Coins = Player.leaderstats.Coins
    local function GetCoins() return tonumber(Coins.Value:gsub(",", "")) end

    local Rebirths = Player.leaderstats.Rebirths
    game:GetService("RunService"):BindToRenderStep("AutoRebirth", Enum.RenderPriority.Camera.Value, function()
        while GetCoins() >= 10000000 * (Rebirths.Value + 1) do
            Remote:FireServer("Rebirth", {{}})
            task.wait()
        end
    end)

    local Inv = Player.PlayerGui.ScreenGui.StatsFrame2.Inventory.Amount
    local function GetInv()
        local txt = Inv.Text:gsub("%s+", ""):gsub(",", "")
        local cur = txt:match("(%d+)/")
        return tonumber(cur)
    end

    local rs = game:GetService("RunService").Heartbeat
    local SellArea = CFrame.new(41.96064, 14, -1239.64648)

    local function SetPlatformStand(on)
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid.PlatformStand = on
            if on then HRP.Velocity = Vector3.new() end
        end
    end

    local recovering = false
    Player.PlayerGui.ScreenGui.TopInfoFrame.Depth.Changed:Connect(function()
        local d = Split(Player.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")
        if tonumber(d[1]) >= 1000 then
            recovering = true
            local hrp = Player.Character.HumanoidRootPart
            Player.Character.Humanoid.WalkSpeed = 0
            Player.Character.Humanoid.JumpPower = 0
            hrp.Anchored = true
            Remote:FireServer("MoveTo", {{"LavaSpawn"}})
            local p = Instance.new("Part", workspace)
            p.Anchored = true p.Size = Vector3.new(10, 0.5, 100) p.Material = Enum.Material.ForceField
            p.Position = Vector3.new(21, 9.5, 26285)
            task.wait(1)
            hrp.Anchored = false
            while hrp.Position.Z > 26220 do
                hrp.CFrame = CFrame.new(hrp.Position.X, 13.05, hrp.Position.Z - 0.5)
                task.wait()
            end
            hrp.CFrame = CFrame.new(17, 10, 26220)
            task.wait(5)
            recovering = false
        end
    end)

    while true do
        if HRP then
            local minP = HRP.Position + Vector3.new(-5, -5, -5)
            local maxP = HRP.Position + Vector3.new( 5,  5,  5)
            local region = Region3.new(minP, maxP)
            local blocks = workspace:FindPartsInRegion3WithWhiteList(region, {workspace.Blocks}, 100)

            for _, b in ipairs(blocks) do
                if b:IsA("BasePart") then
                    Remote:FireServer("MineBlock", {{b.Parent}})
                    repeat rs:Wait() until not recovering
                end

                if GetInv() >= getgenv().SellThreshold then
                    local saved = HRP.Position
                    while GetInv() >= getgenv().SellThreshold do
                        HRP.CFrame = SellArea
                        Remote:FireServer("SellItems", {{}})
                        rs:Wait()
                    end
                    SetPlatformStand(true)
                    local t0 = os.time()
                    while (HRP.Position - saved).Magnitude > 1 do
                        HRP.CFrame = CFrame.new(18, saved.Y + 2, 26220)
                        rs:Wait()
                        if os.time() - t0 > 5 then break end
                    end
                    SetPlatformStand(false)
                end
            end
        end
        rs:Wait()
    end
end
