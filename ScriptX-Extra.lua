local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Maxgat5/UiLib/main/lua')))()
local w = library:CreateWindow("ScriptX Extra")
local f = w:CreateFolder("Auto")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("About ScriptX")

f:Toggle("Rebirth",function(bool)
    shared.toggle = bool
    Rebirths = bool
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

e:Button("Delete All Doors",function()
    for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
        if string.find(v.Name,"Exit") then
            v:Destroy()
        end
    end
end)
e:Button("Speed",function()
    pcall(function()
        while wait() do
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100
        end
    end)
end)

e:Button("Super Speed",function()
    pcall(function()
        while wait() do
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 500
        end
    end)
end)


--Credits
u:Button("Click To Copy Discord Invite",function()
    setclipboard("https://dsc.gg/scriptx")
end)

while wait() do
    if AutoTakeItem == true then
        local a,b = pcall(function()
            for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    if v.Parent.Parent.Parent.Name == "DraggableItems" then
                        if v.Parent.Parent.Title.Value == SelectedItem then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,0))
                            wait(.1)
                            fireproximityprompt(v,0)
                            fireproximityprompt(v,1)
                        end
                    end
                end
            end
        end)
        print(a,b)
    end
    
    if AutoFinish == true then
        local a,b = pcall(function()
            for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
                if v.ClassName == "StringValue" then
                    if v.Value == SelectedItem then
                        if v.Parent.Parent.Name == "DraggableItems" then
                            if v.Parent.Parent.Parent:FindFirstChild("Goal") then
                                for i,v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                    for i,v1 in pairs(v:GetDescendants()) do
                                        if v1.ClassName == "Part" then
                                            v1:Destroy()
                                        end
                                    end
                                end
                                for i,v1 in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                    if v1.ClassName == "MeshPart" then
                                        v1.CFrame = CFrame.new(v.Parent.Parent.Parent.Goal.CFrame.Position + Vector3.new(0,0,0))
                                    end
                                end
                            else
                                if v.Parent.Parent.Parent:FindFirstChild("BlackWhiteTileTexture") then
                                    for i,v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                        for i,v1 in pairs(v:GetDescendants()) do
                                            if v1.ClassName == "Part" then
                                                v1:Destroy()
                                            end
                                        end
                                    end
                                    for i,v1 in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                        if v1.ClassName == "MeshPart" then
                                            v1.CFrame = CFrame.new(v.Parent.Parent.Parent.BlackWhiteTileTexture.CFrame.Position + Vector3.new(0,0,0))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
        print(a,b)
    end
    
    spawn(function()
        if Squats == true then
            game:GetService("ReplicatedStorage").StrongMan_UpgradeStrength:InvokeServer()
        end
    end)
    
    spawn(function()
        if Rebirths == true then
            game:GetService("ReplicatedStorage").StrongMan_Rebirth:FireServer()
        end
    end)
    
    spawn(function()
        if AntiAfk == true then
            local bb=game:service'VirtualUser'
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
        end
    end)
end