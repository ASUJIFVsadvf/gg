if not game:IsLoaded() then
    game.Loaded:Wait()
end

task.wait(4)

getgenv().Name = "Road To 1 Million Rebiths!"

task.wait(1)

local virtual = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    virtual:CaptureController()
    virtual:ClickButton2(Vector2.new())
end)

local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local Path1 = Instance.new("Part", game:GetService("Workspace"))
Character.Head.CustomPlayerTag.PlayerName.Text = getgenv().Name
Character.Head.CustomPlayerTag.MinerRank.Text = "G.O.A.T"

-- **REJOIN SYSTEM FROM SECOND SCRIPT (COPIED EXACTLY)**
local Players = game:GetService("Players")

-- REJOIN ON ERROR PROMPT
local po = game.CoreGui.RobloxPromptGui.promptOverlay
po.ChildAdded:connect(function(a)
    if a.Name == 'ErrorPrompt' then
        repeat
            game:GetService("TeleportService"):Teleport(game.PlaceId, Players.LocalPlayer)
            task.wait(2)
        until false
    end
end)

-- **REJOIN ON MINE COLLAPSE (FROM SECOND SCRIPT)**
workspace.Collapsed.Changed:connect(function()
    if workspace.Collapsed.Value == true then
        game:GetService("TeleportService"):Teleport(game.PlaceId, Players.LocalPlayer)
    end
end)

-- ==================================================================
-- >>>>>>>>>>>>>>>>>  AUTO-RE-EXECUTE ON REJOIN  <<<<<<<<<<<<<<<<<<<<
-- ==================================================================
do
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local PLAYER = Players.LocalPlayer
    local STORAGE_KEY = "AUTO_REEXEC_SCRIPT_SOURCE"

    -- Save the **full source** of this script (including the code you wrote)
    local function saveSelf()
        local source = debug.info(1, "s")   -- not reliable for full source, so we embed it manually
        -- ---->  EMBEDDED FULL SCRIPT SOURCE START  <----
        local embeddedSource = [[
-- <<< YOUR ORIGINAL SCRIPT STARTS HERE (DO NOT EDIT THIS BLOCK) >>>
if not game:IsLoaded() then
    game.Loaded:Wait()
end

task.wait(4)

getgenv().Name = "Road To 1 Million Rebiths!"

task.wait(1)

local virtual = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    virtual:CaptureController()
    virtual:ClickButton2(Vector2.new())
end)

local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local Path1 = Instance.new("Part", game:GetService("Workspace"))
Character.Head.CustomPlayerTag.PlayerName.Text = getgenv().Name
Character.Head.CustomPlayerTag.MinerRank.Text = "G.O.A.T"

-- **REJOIN SYSTEM FROM SECOND SCRIPT (COPIED EXACTLY)**
local Players = game:GetService("Players")

-- REJOIN ON ERROR PROMPT
local po = game.CoreGui.RobloxPromptGui.promptOverlay
po.ChildAdded:connect(function(a)
    if a.Name == 'ErrorPrompt' then
        repeat
            game:GetService("TeleportService"):Teleport(game.PlaceId, Players.LocalPlayer)
            task.wait(2)
        until false
    end
end)

-- **REJOIN ON MINE COLLAPSE (FROM SECOND SCRIPT)**
workspace.Collapsed.Changed:connect(function()
    if workspace.Collapsed.Value == true then
        game:GetService("TeleportService"):Teleport(game.PlaceId, Players.LocalPlayer)
    end
end)

-- **YOUR ORIGINAL SCRIPT CONTINUES HERE (UNCHANGED)**
do
    local Depth
    local SellThreshold

    if not getgenv().SellThreshold then
        SellThreshold = 25000
    else
        SellThreshold = getgenv().SellThreshold
    end

    if not getgenv().Depth then
        Depth = 405
    else
        Depth = getgenv().Depth
    end

    do
        repeat wait() until game:IsLoaded()
        game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
        while game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.BackgroundTransparency == 0 do
            for i, connection in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.Quality.LowQuality.MouseButton1Down)) do
                connection:Fire()
            end
            wait()
        end
        while true do
            if pcall(function() game.Players.LocalPlayer.leaderstats:WaitForChild("Blocks Mined") end) then
                if pcall(function() game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Coins:FindFirstChild("Amount") end) then
                    if game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Tokens.Amount.Text ~= "Loading..." then
                        break
                    end
                end
            end
            wait(1)
        end
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.TeleporterFrame:Destroy()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Sell:Destroy()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Surface:Destroy()
    end

    local vuAF = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vuAF:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vuAF:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    
    local Remote

    do
        local Data = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript).displayCurrent
        local Values = getupvalue(Data, 8)
        Remote = Values["RemoteEvent"]
        Data, Values = nil
    end

    do
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProdHallow/Miningsimrebirthtracker/main/miningsimrebirthtracker", true))()
    end

    wait(1)

    -- ADDED BACK: Mining Simulator Assets Deleter
    do
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ProdHallow/DeleteAssetMinSim1/main/deleteassetsminingsim'))()
    end

    wait(1)

    do
        local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
        HumanoidRootPart.Anchored = true
        Remote:FireServer("MoveTo", {{"LavaSpawn"}})
        local className = "Part"
        local parent = game.Workspace
        local part = Instance.new(className, parent)
        part.Anchored = true
        part.Size = Vector3.new(10, 0.5, 100)
        part.Material = "ForceField"
        local pos = Vector3.new(21, 9.5, 26285)
        part.Position = pos
        wait(1)
        HumanoidRootPart.Anchored = false
        while HumanoidRootPart.Position.Z > 26220 do
            HumanoidRootPart.CFrame = CFrame.new(Vector3.new(HumanoidRootPart.Position.X, 13.05, HumanoidRootPart.Position.Z - 0.5))
            wait()
        end
        HumanoidRootPart.CFrame = CFrame.new(17, 10, 26220)
    end

    -- DEEP MINING: USING HEARTBEAT
    do
        local function Split(s, delimiter)
            local result = {}
            for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
                table.insert(result, match)
            end
            return result
        end
        local RunService = game:GetService("RunService").Heartbeat
        local HumanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local depth = Split(game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")
        while tonumber(depth[1]) < Depth do
            local min = HumanoidRootPart.CFrame + Vector3.new(-1, -10, -1)
            local max = HumanoidRootPart.CFrame + Vector3.new(1, 0, 1)
            local region = Region3.new(min.Position, max.Position)
            local parts = workspace:FindPartsInRegion3WithWhiteList(region, {game.Workspace.Blocks}, 5)
            for _, block in pairs(parts) do
                Remote:FireServer("MineBlock", {{block.Parent}})
                RunService:Wait()
            end
            depth = Split(game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")
            wait()
        end
    end

    -- MAIN LOOP: USING HEARTBEAT
    do
        local CoinsAmount = game.Players.LocalPlayer.leaderstats.Coins
        local function GetCoinsAmount()
            local Amount = CoinsAmount.Value
            Amount = Amount:gsub(',', '')
            return tonumber(Amount)
        end

        local function comma_value(amount)
            local formatted = amount
            while true do
                formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
                if (k == 0) then
                    break
                end
            end
            return formatted
        end

        local function Split(s, delimiter)
            local result = {}
            for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
                table.insert(result, match)
            end
            return result
        end

        local recovering = false
        local DepthAmount = game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth
        DepthAmount.Changed:Connect(function()
            local depth = Split(DepthAmount.Text, " ")
            if tonumber(depth[1]) >= 1000 then
                recovering = true
                local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
                HumanoidRootPart.Anchored = true
                Remote:FireServer("MoveTo", {{"LavaSpawn"}})
                local className = "Part"
                local parent = game.Workspace
                local part = Instance.new(className, parent)
                part.Anchored = true
                part.Size = Vector3.new(10, 0.5, 100)
                part.Material = "ForceField"
                local pos = Vector3.new(21, 9.5, 26285)
                part.Position = pos
                wait(1)
                HumanoidRootPart.Anchored = false
                while HumanoidRootPart.Position.Z > 26220 do
                    HumanoidRootPart.CFrame = CFrame.new(Vector3.new(HumanoidRootPart.Position.X, 13.05, HumanoidRootPart.Position.Z - 0.5))
                    wait()
                end
                HumanoidRootPart.CFrame = CFrame.new(17, 10, 26220)
                wait(5)
                recovering = false
            end
        end)

        local RebirthsAmount = game.Players.LocalPlayer.leaderstats.Rebirths
        game:GetService("RunService"):BindToRenderStep("Rebirth", Enum.RenderPriority.Camera.Value, function()
            while GetCoinsAmount() >= (10000000 * (RebirthsAmount.Value + 1)) do
                Remote:FireServer("Rebirth", {{}})
                wait()
            end
        end)

        local InventoryAmount = game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame2.Inventory.Amount
        local function GetInventoryAmount()
            local Amount = InventoryAmount.Text
            Amount = Amount:gsub('%s+', '')
            Amount = Amount:gsub(',', '')
            local Inventory = Amount:split("/")
            return tonumber(Inventory[1])
        end

        local RunService = game:GetService("RunService").Heartbeat
        local HumanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local Character = game.Players.LocalPlayer.Character
        local SellArea = CFrame.new(41.96064, 14, -1239.64648, 1, 0, 0, 0, 1, 0, 0, 0, 1)

        local function setPlatformStand(state)
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.PlatformStand = state
                if state then
                    HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end

        while true do
            if HumanoidRootPart then
                local minp = HumanoidRootPart.CFrame.Position + Vector3.new(-5, -5, -5)
                local maxp = HumanoidRootPart.CFrame.Position + Vector3.new(5, 5, 5)
                local region = Region3.new(minp, maxp)
                local parts = workspace:FindPartsInRegion3WithWhiteList(region, {workspace.Blocks}, 100)

                for _, block in pairs(parts) do
                    if block:IsA("BasePart") then
                        Remote:FireServer("MineBlock", {{block.Parent}})
                        repeat
                            RunService:Wait()
                        until not recovering
                    end
                    if GetInventoryAmount() >= SellThreshold then
                        if Character then
                            if HumanoidRootPart then
                                local SavedPosition = HumanoidRootPart.Position
                                while GetInventoryAmount() >= SellThreshold do
                                    HumanoidRootPart.CFrame = SellArea
                                    Remote:FireServer("SellItems", {{}})
                                    RunService:Wait()
                                end
                                setPlatformStand(true)
                                local starttime1 = os.time()
                                while (HumanoidRootPart.Position - SavedPosition).Magnitude > 1 do
                                    HumanoidRootPart.CFrame = CFrame.new(18, SavedPosition.Y + 2, 26220)
                                    RunService:Wait()
                                    if os.time() - starttime1 > 5 then
                                        break
                                    end
                                end
                                setPlatformStand(false)
                            end
                        end
                    end
                end
            end
            RunService:Wait()
        end
    end
end
-- <<< YOUR ORIGINAL SCRIPT ENDS HERE >>>
]]
        -- ---->  EMBEDDED FULL SCRIPT SOURCE END  <----
        pcall(function()
            PLAYER:SetAttribute(STORAGE_KEY, HttpService:JSONEncode({source = embeddedSource}))
        end)
    end

    -- Load & run the saved script
    local function loadAndRun()
        local data = PLAYER:GetAttribute(STORAGE_KEY)
        if not data then return end
        local ok, tbl = pcall(HttpService.JSONDecode, HttpService, data)
        if ok and tbl.source then
            local func, err = loadstring(tbl.source)
            if func then
                print("[AutoReexec] Re-executing script after rejoin...")
                func()
            else
                warn("[AutoReexec] Compile error:", err)
            end
        end
    end

    -- Save on first run
    saveSelf()

    -- Run immediately (first load)
    loadAndRun()

    -- Re-run after any teleport (most common rejoin method)
    PLAYER.OnTeleport:Connect(function(state)
        if state == Enum.TeleportState.InProgress then
            saveSelf()               -- make sure latest copy is saved
        end
    end)

    -- Extra safety: run again when character spawns
    PLAYER.CharacterAdded:Connect(function()
        task.wait(2)
        loadAndRun()
    end)
end
-- ==================================================================
-- >>>>>>>>>>>>>>>>>  END OF AUTO-RE-EXECUTE  <<<<<<<<<<<<<<<<<<<<<<<
-- ==================================================================

-- **YOUR ORIGINAL SCRIPT CONTINUES HERE (UNCHANGED)**
do
    local Depth
    local SellThreshold

    if not getgenv().SellThreshold then
        SellThreshold = 25000
    else
        SellThreshold = getgenv().SellThreshold
    end

    if not getgenv().Depth then
        Depth = 405
    else
        Depth = getgenv().Depth
    end

    do
        repeat wait() until game:IsLoaded()
        game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
        while game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.BackgroundTransparency == 0 do
            for i, connection in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.Quality.LowQuality.MouseButton1Down)) do
                connection:Fire()
            end
            wait()
        end
        while true do
            if pcall(function() game.Players.LocalPlayer.leaderstats:WaitForChild("Blocks Mined") end) then
                if pcall(function() game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Coins:FindFirstChild("Amount") end) then
                    if game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Tokens.Amount.Text ~= "Loading..." then
                        break
                    end
                end
            end
            wait(1)
        end
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.TeleporterFrame:Destroy()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Sell:Destroy()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Surface:Destroy()
    end

    local vuAF = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vuAF:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vuAF:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    
    local Remote

    do
        local Data = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript).displayCurrent
        local Values = getupvalue(Data, 8)
        Remote = Values["RemoteEvent"]
        Data, Values = nil
    end

    do
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProdHallow/Miningsimrebirthtracker/main/miningsimrebirthtracker", true))()
    end

    wait(1)

    -- ADDED BACK: Mining Simulator Assets Deleter
    do
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ProdHallow/DeleteAssetMinSim1/main/deleteassetsminingsim'))()
    end

    wait(1)

    do
        local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
        HumanoidRootPart.Anchored = true
        Remote:FireServer("MoveTo", {{"LavaSpawn"}})
        local className = "Part"
        local parent = game.Workspace
        local part = Instance.new(className, parent)
        part.Anchored = true
        part.Size = Vector3.new(10, 0.5, 100)
        part.Material = "ForceField"
        local pos = Vector3.new(21, 9.5, 26285)
        part.Position = pos
        wait(1)
        HumanoidRootPart.Anchored = false
        while HumanoidRootPart.Position.Z > 26220 do
            HumanoidRootPart.CFrame = CFrame.new(Vector3.new(HumanoidRootPart.Position.X, 13.05, HumanoidRootPart.Position.Z - 0.5))
            wait()
        end
        HumanoidRootPart.CFrame = CFrame.new(17, 10, 26220)
    end

    -- DEEP MINING: USING HEARTBEAT
    do
        local function Split(s, delimiter)
            local result = {}
            for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
                table.insert(result, match)
            end
            return result
        end
        local RunService = game:GetService("RunService").Heartbeat
        local HumanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local depth = Split(game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")
        while tonumber(depth[1]) < Depth do
            local min = HumanoidRootPart.CFrame + Vector3.new(-1, -10, -1)
            local max = HumanoidRootPart.CFrame + Vector3.new(1, 0, 1)
            local region = Region3.new(min.Position, max.Position)
            local parts = workspace:FindPartsInRegion3WithWhiteList(region, {game.Workspace.Blocks}, 5)
            for _, block in pairs(parts) do
                Remote:FireServer("MineBlock", {{block.Parent}})
                RunService:Wait()
            end
            depth = Split(game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ")
            wait()
        end
    end

    -- MAIN LOOP: USING HEARTBEAT
    do
        local CoinsAmount = game.Players.LocalPlayer.leaderstats.Coins
        local function GetCoinsAmount()
            local Amount = CoinsAmount.Value
            Amount = Amount:gsub(',', '')
            return tonumber(Amount)
        end

        local function comma_value(amount)
            local formatted = amount
            while true do
                formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
                if (k == 0) then
                    break
                end
            end
            return formatted
        end

        local function Split(s, delimiter)
            local result = {}
            for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
                table.insert(result, match)
            end
            return result
        end

        local recovering = false
        local DepthAmount = game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth
        DepthAmount.Changed:Connect(function()
            local depth = Split(DepthAmount.Text, " ")
            if tonumber(depth[1]) >= 1000 then
                recovering = true
                local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
                HumanoidRootPart.Anchored = true
                Remote:FireServer("MoveTo", {{"LavaSpawn"}})
                local className = "Part"
                local parent = game.Workspace
                local part = Instance.new(className, parent)
                part.Anchored = true
                part.Size = Vector3.new(10, 0.5, 100)
                part.Material = "ForceField"
                local pos = Vector3.new(21, 9.5, 26285)
                part.Position = pos
                wait(1)
                HumanoidRootPart.Anchored = false
                while HumanoidRootPart.Position.Z > 26220 do
                    HumanoidRootPart.CFrame = CFrame.new(Vector3.new(HumanoidRootPart.Position.X, 13.05, HumanoidRootPart.Position.Z - 0.5))
                    wait()
                end
                HumanoidRootPart.CFrame = CFrame.new(17, 10, 26220)
                wait(5)
                recovering = false
            end
        end)

        local RebirthsAmount = game.Players.LocalPlayer.leaderstats.Rebirths
        game:GetService("RunService"):BindToRenderStep("Rebirth", Enum.RenderPriority.Camera.Value, function()
            while GetCoinsAmount() >= (10000000 * (RebirthsAmount.Value + 1)) do
                Remote:FireServer("Rebirth", {{}})
                wait()
            end
        end)

        local InventoryAmount = game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame2.Inventory.Amount
        local function GetInventoryAmount()
            local Amount = InventoryAmount.Text
            Amount = Amount:gsub('%s+', '')
            Amount = Amount:gsub(',', '')
            local Inventory = Amount:split("/")
            return tonumber(Inventory[1])
        end

        local RunService = game:GetService("RunService").Heartbeat
        local HumanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local Character = game.Players.LocalPlayer.Character
        local SellArea = CFrame.new(41.96064, 14, -1239.64648, 1, 0, 0, 0, 1, 0, 0, 0, 1)

        local function setPlatformStand(state)
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.PlatformStand = state
                if state then
                    HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end

        while true do
            if HumanoidRootPart then
                local minp = HumanoidRootPart.CFrame.Position + Vector3.new(-5, -5, -5)
                local maxp = HumanoidRootPart.CFrame.Position + Vector3.new(5, 5, 5)
                local region = Region3.new(minp, maxp)
                local parts = workspace:FindPartsInRegion3WithWhiteList(region, {workspace.Blocks}, 100)

                for _, block in pairs(parts) do
                    if block:IsA("BasePart") then
                        Remote:FireServer("MineBlock", {{block.Parent}})
                        repeat
                            RunService:Wait()
                        until not recovering
                    end
                    if GetInventoryAmount() >= SellThreshold then
                        if Character then
                            if HumanoidRootPart then
                                local SavedPosition = HumanoidRootPart.Position
                                while GetInventoryAmount() >= SellThreshold do
                                    HumanoidRootPart.CFrame = SellArea
                                    Remote:FireServer("SellItems", {{}})
                                    RunService:Wait()
                                end
                                setPlatformStand(true)
                                local starttime1 = os.time()
                                while (HumanoidRootPart.Position - SavedPosition).Magnitude > 1 do
                                    HumanoidRootPart.CFrame = CFrame.new(18, SavedPosition.Y + 2, 26220)
                                    RunService:Wait()
                                    if os.time() - starttime1 > 5 then
                                        break
                                    end
                                end
                                setPlatformStand(false)
                            end
                        end
                    end
                end
            end
            RunService:Wait()
        end
    end
end
