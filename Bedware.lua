repeat task.wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
wait(2)
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Bedwars", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")

Section:NewButton("EmeraldTP", "Teleport to Emerald", function()
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    lplr.Character.Humanoid.Health = 0
    bedwars.ClientHandler:Get(bedwars.ResetRemote):SendToServer()
    for i,v in next, game.Workspace.ItemDrops:GetChildren() do 
        if v.Name == "emerald" then
            lplr.CharacterAdded:Connect(function()
                wait(0.3)
                local tween = tweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(0.94), {CFrame = v.CFrame})
                tween:Play()
            end)
        end
    end
end)

Section:NewButton("DiamondTP", "Teleport to Diamond", function()
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    lplr.Character.Humanoid.Health = 0
    bedwars.ClientHandler:Get(bedwars.ResetRemote):SendToServer()
    for i,v in next, game.Workspace.ItemDrops:GetChildren() do 
        if v.Name == "diamond" then
            lplr.CharacterAdded:Connect(function()
                wait(0.3)
                local tween = tweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(0.94), {CFrame = v.CFrame})
                tween:Play()
            end)
        end
    end
end)

Section:NewButton("GoldTP", "Teleport to Gold", function()
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    lplr.Character.Humanoid.Health = 0
    bedwars.ClientHandler:Get(bedwars.ResetRemote):SendToServer()
    for i,v in next, game.Workspace.ItemDrops:GetChildren() do 
        if v.Name == "gold" then
            lplr.CharacterAdded:Connect(function()
                wait(0.3)
                local tween = tweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(0.94), {CFrame = v.CFrame})
                tween:Play()
            end)
        end
    end
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
