local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local Farm = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local Egg = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local Zone = Window:MakeTab({
Name = "Zone",
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
wait(0.5)
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
wait(0.5)
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
wait(0.5)
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
         wait(0.5)
         end
    end    
 })
 
 _G.Rebirth = false
 Farm:AddToggle({
     Name = "Auto Rebirth",
     Default = false,
     Callback = function(Value)
         _G.Rebirth = Value
         
         while _G.Rebirth do
         game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
         wait(0.5)
         end
    end    
 })
 
 local SyncEgg = {}
for _,SyncEggScript in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    table.insert(SyncEgg, SyncEggScript.Name)
end

local AsyncEggServer = ""
Egg:AddDropdown({
     Name = "Select Egg",
     Default = "",
     Options = SyncEgg,
     Callback = function(Value)
         AsyncEggServer = Value
   end    
})

_G.Hatch = false
Egg:AddToggle({
     Name = "Auto Hatch (1X)",
     Default = false,
     Callback = function(Value)
         _G.Hatch = Value
         
         while _G.Hatch do
         local args = {
    [1] = AsyncEggServer,
    [2] = 1
}

game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
         wait()
         end
    end    
 })
 
 _G.Triple = false
 Egg:AddToggle({
     Name = "Auto Hatch (3X)",
     Default = false,
     Callback = function(Value)
         _G.Triple = Value
         
         while _G.Triple do
         local args = {
    [1] = AsyncEggServer,
    [2] = 3
}

game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
         wait()
         end
    end    
 })
