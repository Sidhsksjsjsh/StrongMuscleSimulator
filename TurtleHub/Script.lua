local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local Farm = Window:MakeTab({
Name = "Main | Farm",
Icon = "rbxassetid://13043177474",
PremiumOnly = false
})

local Egg = Window:MakeTab({
Name = "Egg | Coming Soon!",
Icon = "rbxassetid://13040484705",
PremiumOnly = false
})

local Zone = Window:MakeTab({
Name = "Zone | Coming Soon!",
Icon = "rbxassetid://13040484705",
PremiumOnly = false
})

_G.Muscle = false
local SyncPunchType = {"Left", "Right"}

Farm:AddToggle({
     Name = "Farm Muscle",
     Default = false,
     Callback = function(Value)
         _G.Muscle = Value
         
         while _G.Muscle do
         local args = {
    [1] = "Weight1"
}

game:GetService("ReplicatedStorage").Events.Weight:FireServer(unpack(args))
        end
    end    
 })
 
 _G.Punch = false
 Farm:AddToggle({
     Name = "Auto Punch",
     Default = false,
     Callback = function(Value)
         _G.Punch = Value
         
         while _G.Punch do
         local args = {
    [1] = SyncPunchType[math.random(1, #SyncPunchType)]
}

game:GetService("ReplicatedStorage").Skills.CombatFolder.RemoteEvent:FireServer(unpack(args))
        end
    end    
 })
 
local SyncEaster = {}
 
function SyncRandomEasterEgg()
for _,SyncEasterHunt in pairs(game:GetService("Workspace").NPCS:GetChildren()) do
    table.insert(SyncEaster, SyncEasterHunt.Name)
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").NPCS[SyncEaster[math.random(1, #SyncEaster)]].Position)
end
 
 _G.PunchEaster = false
 Farm:AddToggle({
     Name = "Auto Punch [Easter Egg Hunt Version]",
     Default = false,
     Callback = function(Value)
           _G.PunchEaster = Value
           
         while _G.PunchEaster do
         local args = {
    [1] = SyncPunchType[math.random(1, #SyncPunchType)]
}

game:GetService("ReplicatedStorage").Skills.CombatFolder.RemoteEvent:FireServer(unpack(args))
SyncRandomEasterEgg()
        end
    end    
 })
 
 _G.SkillSelected = ""
Farm:AddDropdown({
      Name = "Select Skill",
      Default = "Skill 1",
      Options = {"Skill 1", "Skill 2"},
      Callback = function(Value)
           if Value == "Skill 1" then
              _G.SkillSelected = "NumberOne"
           end
           if Value == "Skill 2" then
                _G.SkillSelected = "NumberTwo"
           end
   end    
})
 
 Farm:AddToggle({
     Name = "Use skill",
     Default = false,
     Callback = function(Value)
         local args = {
    [1] = _G.SkillSelected,
    [2] = Value
}

game:GetService("ReplicatedStorage").Events.SkillToggle:FireServer(unpack(args))
         
    end    
 })
 
 _G.Spin = false
 Farm:AddToggle({
     Name = "Auto Spin",
     Default = false,
     Callback = function(Value)
         _G.Spin = Value
         
         while _G.Spin do
         game:GetService("ReplicatedStorage").Events:FindFirstChild("Spin Wheel"):FireServer()
         end
    end    
 })
