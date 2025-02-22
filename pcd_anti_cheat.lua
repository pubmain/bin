-- Decompiled with Velocity Luau Decompiler
-- note: this script can be found in getnilinstances() or in CharacterScripts i think
game:GetService("RunService")
local v_u_1 = {
    string.reverse("rekcehC emanresU"),
    string.reverse("retemodeepS"),
    string.reverse("ECROF-X"),
    string.reverse("oryGydoB"),
    string.reverse("yticoleVralugnAydoB"),
    string.reverse("yticoleVydoB"),
    string.reverse("noitisoPydoB"),
    string.reverse("tsurhTydoB"),
    string.reverse("ecroFydoB"),
    string.reverse("ecroFeniL"),
    string.reverse("yticoleVralugnA"),
    string.reverse("ecroFrotceV"),
    string.reverse("yticoleVraeniL"),
    string.reverse("euqroT")
}
local v_u_2 = game.ReplicatedStorage.Remotes[string.reverse("etomeRniarT")]
local v_u_3 = false
function Check(p4, p5)
    -- upvalues: (ref) v_u_3, (copy) v_u_2
    if not v_u_3 then
        if not p5 then
            v_u_3 = true
            v_u_2:FireServer("del", p4.Name)
            task.wait(3)
            v_u_3 = false
        end
    end
end
function Protect(p6)
    p6.AncestryChanged:Connect(Check)
end
coroutine.wrap(function()
    -- upvalues: (ref) v_u_3, (copy) v_u_1, (copy) v_u_2
    while true do
        if not task.wait(0.1) then
            return
        end
        if not v_u_3 then
            for _, v7 in script.Parent:GetDescendants() do
                for _, v8 in v_u_1 do
                    if v7:IsA(v8) then
                        v_u_3 = true
                        v_u_2:FireServer("obj", v7.ClassName)
                        task.wait(3)
                        v_u_3 = false
                        break
                    end
                end
            end
            local v9 = script.Parent:WaitForChild("Humanoid").WalkSpeed
            if v9 >= 17 then
                v_u_3 = true
                v_u_2:FireServer("spd", v9)
                task.wait(3)
                v_u_3 = false
            end
            if script.Parent:FindFirstChild("F3X") then
                v_u_3 = true
                v_u_2:FireServer("item", "F3X")
                task.wait(3)
                v_u_3 = false
            end
        end
    end
end)()
for _, v10 in workspace[string.reverse("yawliaR")].Crossings:GetDescendants() do
    if v10:IsA("BasePart") then
        Protect(v10)
    end
end
local v11 = workspace[string.reverse("yradar")]
Protect(v11.Malechowo.Sensor)
Protect(v11.Rzyszczewo.Sensor)
Protect(v11["S\196\153czkowo"].Sensor)
Protect(v11["S\197\130awno"].Sensor)
local v_u_12 = string.reverse("onex")
game:GetService("LogService").MessageOut:Connect(function(p13)
    -- upvalues: (copy) v_u_12, (copy) v_u_2
    if p13:lower():find(v_u_12) then
        v_u_2:FireServer("log", p13)
    end
end)
local v_u_14 = {
    "137842439297855",
    "1204397029",
    "2764171053",
    "1352543873",
    "10137941941"
}
game:GetService("ContentProvider"):PreloadAsync({ game:GetService("CoreGui") }, function(p15, _)
    -- upvalues: (copy) v_u_14, (copy) v_u_2
    local v16 = p15:gsub("rbxassetid://", ""):gsub("http://www.roblox.com/asset/?id=", "")
    if table.find(v_u_14, v16) then
        v_u_2:FireServer("cg", v16)
    end
end)
