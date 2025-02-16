-- deobfuscated by pubmain, github.com/pubmain
-- join discord https://github.com/pubmain/metadata/blob/main/discord

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))();
local Window = Rayfield:CreateWindow({
    Name =
    "PCD X-Force 🚗 ",
    Icon = 0,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by X-Force Team",
    Theme =
    "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "X-FORCE"
    },
    Discord = {
        Enabled = false,
        Invite = "y4W9QyHrV",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "PCD X-Fore Key",
        Subtitle = "Key system",
        Note = "Klucz znajdziesz na naszym dc",
        FileName = "xforce",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {
            "xforethebest"
        }
    }
});
local VisualsTab =
    Window:CreateTab("👀 Visual ", nil);
local VisualsMain = VisualsTab:CreateSection("Main");
local VisualInfiniteMoneyButton = VisualsTab:CreateButton({
    Name =
    "💸Infinite Money ",
    Callback = function()
        game.Players.LocalPlayer.leaderstats.Money.Value = 9999999999999;
    end
});
local CarExploitsTab = Window:CreateTab("💥 CarExploits ", nil);
local CarExploitsMain = CarExploitsTab:CreateSection("💥 Main");
local CarCFrameFly =
    CarExploitsTab:CreateButton({
        Name = "CFrame Speed | Ryzyko banem",
        Callback = function()
            local LocalPlayer = game.Players.LocalPlayer;
            local Character = nil;
            local MaxSpeed = 250;
            local Int_1_ = 8;
            local Int_2_ = 12;
            local CurrentSpeed = 0;
            local UserInputService = game:GetService("UserInputService");
            local RunService = game:GetService("RunService");
            local VectorModifier =
                Vector3.new(0, 0, 0);
            local FlyEnabled = false;
            local function CheckIfInVehicle()
                if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")) then
                    local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid");
                    if (Humanoid.SeatPart and Humanoid.SeatPart.Parent:IsA("Model")) then
                        Character = Humanoid.SeatPart.Parent;
                    else
                        Character = nil;
                    end
                end
            end
            RunService.RenderStepped:Connect(function(delta)
                if (Character and Character.PrimaryPart) then
                    local PrimaryPart = Character.PrimaryPart;
                    local PrimaryPartCFrame = PrimaryPart.CFrame;
                    if FlyEnabled then
                        CurrentSpeed = math.min(CurrentSpeed + Int_1_, MaxSpeed);
                    else
                        CurrentSpeed = math.max(CurrentSpeed - Int_2_, 0);
                    end
                    PrimaryPart.CFrame = PrimaryPartCFrame +
                        (((PrimaryPartCFrame.LookVector * VectorModifier.Z) + (PrimaryPartCFrame.RightVector * VectorModifier.X)) * CurrentSpeed * delta);
                end
            end);
            UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then
                    return;
                end
                if input.KeyCode == Enum.KeyCode.W then
                    VectorModifier = Vector3.new(0, 0, -1);
                    FlyEnabled = true;
                elseif input.KeyCode == Enum.KeyCode.S then
                    VectorModifier = Vector3.new(0, 0, 1);
                    FlyEnabled = true;
                elseif input.KeyCode == Enum.KeyCode.A then
                    VectorModifier = Vector3.new(-1, 0, 0);
                elseif input.KeyCode == Enum.KeyCode.D then
                    VectorModifier =
                        Vector3.new(1, 0, 0);
                end
            end);
            UserInputService.InputEnded:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S then
                    FlyEnabled = false;
                elseif input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then
                    VectorModifier =
                        Vector3.new(0, 0, 0);
                end
            end);
            while true do
                CheckIfInVehicle();
                wait(1);
            end
        end
    });
local TeleportTab = Window:CreateTab("🌎 Teleport ", nil);
local TeleportStolenCar = TeleportTab:CreateSection("🚗 Stolen car");
local TP_1 = TeleportTab
    :CreateButton({
        Name = "Domasłowice 1",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(6065.31055 - (442), 363.959999 - 249, 7341.08447, -(0.374604106 + 0), 0,
                    -(438.92718488 - (438)), 0, 1, 0, 0.92718488 + 0, 0,
                    -(1227.374604106 - (1227)));
        end
    });
local TP_2 = TeleportTab:CreateButton({
    Name = "Domasłowice 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(7107.67383 - (772), 1252.959999 - (1138), 32948.52295 - 25034, -(0.66911006 + 0), 0,
                -(0.743163466 - 0), 0, 1, 0, 0.743163466 - 0, 0, -(0.66911006 - 0));
    end
});
local TP_3 =
    TeleportTab:CreateButton({
        Name = "Domasłowice 3",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(1851.8759799999998 + 3386, 97.359985 + 19, 8149.81543 - (885), -(0.29242146 - 0), 0,
                    -(0.95628953 - 0), 0, 1, 0, 1423.95628953 - (1423), 0, -(0.29242146 - 0));
        end
    });
local TP_4 =
    TeleportTab:CreateButton({
        Name = "Domasłowice 4",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(2584.2036099999996 + 3977, 392.959999 - 278, 9600.8457 - (1747),
                    -(1463.74314785 - (1463)), 0, 1913.669127226 - (1913), 0, 1, 0, -0.669127226, 0,
                    -(0.74314785 - 0));
        end
    });
local TP_5 =
    TeleportTab:CreateButton({
        Name = "Grzybno",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(69.53223000000071 + 8322), 98.959999 + 26, 9171.70996 - 5214, -(0.453972578 - 0), 0,
                    -(236.891015649 - (236)), 0, 1, 0, 0.891015649 + 0, 0,
                    -(1413.453972578 - (1413)));
        end
    });
local TP_6 = TeleportTab:CreateButton({
    Name = "Krupy 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(917.68811 + 387), 311.959999 - 197, 13460.93848 - 3901, -(0.601814151 + 0), 0,
                -(701.798636556 - (701)), 0, 1, 0, 0.798636556 + 0, 0, -0.601814151);
    end
});
local TP_7 =
    TeleportTab:CreateButton({
        Name = "Krupy 2",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(313.6104700000001 + 781), 250.95999899999998 - 136, 10732.22949 - (849),
                    14.544665456 -
                    (14), "-0", -(376.838653445 - (376)), 0, 1, "-0", 0.838653445 + 0, 0,
                    0.544665456 - 0);
        end
    });
local TP_8 = TeleportTab:CreateButton({
    Name = "Pątnowo 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(5429.09619 + 1151), 1293.959999 - (1180), 4327.17383 + 990, -(0.978144407 - 0), 0,
                0.207926437 - 0, 0, 1, 0, -(1886.207926437 - (1886)), 0,
                -(0.978144407 - 0));
    end
});
local TP_9 = TeleportTab:CreateButton({
    Name = "Pątnowo 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(943.7026400000004 + 5944), 154.95999899999998 - 41, 5498.23291 - (97),
                -(0.998631716 + 0), 0, -(971.0522932447 - (971)), 0, 1, 0,
                438.0522932447 - (438), 0, -(0.998631716 + 0));
    end
});
local TP_10 = TeleportTab:CreateButton({
    Name =
    "Rusko 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            9129.91992 - (1721), 802.959999 - (688), 38542.603520000004 - 29818, -(0.978144407 - 0), 0,
            1206.207926437 - (1206), 0, 1, 0, -0.207926437, 0,
            -(859.978144407 - (859)));
    end
});
local TP_11 = TeleportTab:CreateButton({
    Name = "Rusko 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(1768.1826199999996 + 5557, 377.959999 - 263, 9755.73535 - (374), 0.79861635, "-0",
                -(1744.601840496 - (1744)), 0, 1, "-0", 0.601840496, 0,
                0.79861635 + 0);
    end
});
local TP_12 = TeleportTab:CreateButton({
    Name = "South Sławno 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(531.0844699999998 + 5757), 56.959998999999996 + 68, -(11595.080320000001 - 8005),
                836.629286051 - (836), 0, 202.777173758 - (202), 0, 1, 0,
                -0.777173758, 0, 0.629286051 - 0);
    end
});
local TP_13 = TeleportTab:CreateButton({
    Name = "South Sławno 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(12409.29248 - 6504), 83.959999 + 41, -(4654.26758 - 1722), -(0.390718341 - 0), 0,
                0.92051065 + 0, 0, 1, 0, -(449.92051065 - (449)), 0, -(0.390718341 - 0));
    end
});
local TP_14 =
    TeleportTab:CreateButton({
        Name = "Stary Jarosław 1",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(5864.60156 - (1493)), 509.959999 - (396), 14560.98926 - 8300, 0.882951856, 0,
                    0.469463557 + 0, 0, 1, 0, -(0.469463557 - 0), 0, 0.882951856 - 0);
        end
    });
local TP_15 =
    TeleportTab:CreateButton({
        Name = "Stary Jarosław 2",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(5814.39941 - 1677), 315.959999 - 202, 6805.40332 - (285), 1665.453972578 - (1665), 0,
                    1990.891015649 - (1990), 0, 1, 0, -(0.891015649 - 0), 0, 1824.453972578 - (1824));
        end
    });
local TP_16 =
    TeleportTab:CreateButton({
        Name = "Stary Jarosław 3",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(4982.5998500000005 - 1214), 358.959999 - (241), 7207.12109, -(780.838688731 - (780)),
                    0, -(0.544611216 + 0), 0, 1, 0, 0.544611216 + 0, 0,
                    -(1000.838688731 - (1000)));
        end
    });
local TP_17 = TeleportTab:CreateButton({
    Name = "Sławno 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(7535.54102 - (505)), 1698.959999 - (1574), -(701.7360800000001 + 1517), 0.139203906 - 0,
                "-0", -(0.99026376 - 0), 0, 1, "-0", 0.99026376 - 0, 0,
                1581.139203906 - (1581));
    end
});
local TP_18 = TeleportTab:CreateButton({
    Name = "Sławno 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(8329.32812 + 53), 18.959998999999996 + 106, -1516.59106, 560.207885921 - (560), 0,
                0.97815311 + 0, 0, 1, 0, -(0.97815311 + 0), 0, 0.207885921);
    end
});
local TP_19 =
    TeleportTab:CreateButton({
        Name = "Sławno 3",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(10017.20703 - (1156)), 299.959999 - 175, -(2691.525146 - (1784)),
                    603.882951856 - (603), 0, 0.469463557 + 0, 0, 1, 0, -0.469463557, 0, 0.882951856 + 0);
        end
    });
local TP_20 = TeleportTab:CreateButton({
    Name = "Sławno 4",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(9181.39355 - (1456)), 935.959999 - (811), -1578.2688, 0.469467044 - 0, "-0",
                -(0.882950008 - 0), 0, 1, "-0", 1024.882950008 - (1024), 0,
                1271.469467044 - (1271));
    end
});
local TP_21 = TeleportTab:CreateButton({
    Name = "Sławno 5",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(19154.23486 - 11487), 111.959999 + 13, -(2703.73059 - (700)), 1469.956294656 - (1469),
                "-0", -(0.292404652 + 0), 0, 1, "-0", 1288.292404652 - (1288), 0, 1171.956294656 - (1171));
    end
});
local TP_22 = TeleportTab:CreateButton({
    Name = "Sławno 6",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(3365.670899999999 + 5468), 13.959998999999996 + 111, -(606.9147899999998 + 1463),
                0.890994847 + 0,
                "-0", -(0.454013437 - 0), 0, 1, "-0", 0.454013437 + 0, 0, 0.890994847 + 0);
    end
});
local TP_23 =
    TeleportTab:CreateButton({
        Name = "Sławno Morska",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(5856.01904 + 2197), 1893.959999 - (1769), 76.17898600000001 + 240, -0.998631716, 0,
                    -(0.0522932447 + 0), 0, 1, 0, 0.0522932447, 0, -(0.998631716 + 0));
        end
    });
local TeleportPCDMap = TeleportTab:CreateSection("🌎Teleport PCD Map");
local MTP_1 =
    TeleportTab:CreateButton({
        Name = "Darłowo",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(1646.0956999999999 + 4863, 321.885002 - 212, 3739.2343999999994 + 7050,
                    0.890994847 - 0, "-0",
                    -(0.454013437 - 0), 0, 1, "-0", 584.454013437 - (584), 0,
                    1276.890994847 - (1276));
        end
    });
local MPT_2 = TeleportTab:CreateButton({
    Name = "Sławno",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(4991.597659999999 + 3976), 93.434998 + 27, -(655.957336 + 53), 1427.390717864 - (1427),
                "-0",
                -(551.92051065 - (551)), 0, 1, "-0", 0.92051065 + 0, 0,
                0.390717864 - 0);
    end
});
local MTP_3 = TeleportTab:CreateButton({
    Name = "Staff",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-8472.63574, 269.284943 - 148, -(5169.6167000000005 - 3384), 0.936696291 + 0, 0,
                166.350142866 - (166), 0, 1, 0, -(0.350142866 - 0), 0, 0.936696291 + 0);
    end
});
local MPT_4 =
    TeleportTab:CreateButton({
        Name = "Sławno MP (2)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(748.0356400000001 + 4421), 243.034988 - 123, -(1997.68848 - (65)),
                    -(0.0522800684 + 0), 0, -0.998632431, 0, 1, 0, 0.998632431, 0,
                    -(0.0522800684 - 0));
        end
    });
local MPT_5 = TeleportTab:CreateButton({
    Name = "Garabage",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(7111.67871 - (580)), 440.710442 - (320), -(3259.81982 + 100), 0.890994847 + 0, "-0",
                -(413.454013437 - (413)), 0, 1, "-0", 0.454013437 + 0, 0,
                0.890994847 + 0);
    end
});
local TeleportSecrets = TeleportTab:CreateSection("🤫Secrets");
local STP_1 = TeleportTab:CreateButton({
    Name =
    "Letter Stand",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            -(4690.843510000001 - (850)), 87.464417 + 24, 6479.8667 - (126), 0.694649816 + 0, "-0",
            -(738.719348073 - (738)), 0, 1, "-0", 0.719348073 + 0, 0, 0.694649816 + 0);
    end
});
local STP_2 =
    TeleportTab:CreateButton({
        Name = "List 1",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(3235.3027299999994 + 5750), 326.010506 - 202, -(4906.06299 - 2992), 0.267143548,
                    "-0",
                    -(1551.963656723 - (1551)), 0, 1, "-0", 1269.963656723 - (1269), 0, 0.267143548 - 0);
        end
    });
local STP_3 = TeleportTab:CreateButton({
    Name = "List 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(3370.1001 - (1162), 515.8284610000001 - (377), 4237.398926 - 3303, 1, 0, 0, 0, 1, 0, 0, 0,
                1);
    end
});
local STP_4 = TeleportTab:CreateButton({
    Name =
    "List 3",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            -(1280.9410133 - (1248)), 277.83844 - (158), 5694.17578 + 4084, 0, 0, -1, 0, 1, 0, 1, 0, 0);
    end
});
local STP_5 = TeleportTab:CreateButton({
    Name = "Maciuś",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(770.8621800000001 + 707), 856.001411 - (753), 3322.3876999999993 + 6134,
                -(0.890994906 - 0), 0, -(0.454013437 + 0), 0, 1, 0, 0.454013437 - 0, 0,
                -(0.890994906 - 0));
    end
});
local STP_6 = TeleportTab:CreateButton({
    Name = "Zabawka Maćka",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(922.5263669999999 - (731)), 29.595519999999993 + 80, 16676.08594 - 7193, 0.258864343 - 0,
                0, 0.965913713 + 0, 0, 1, 0, -(0.965913713 - 0), 0,
                238.258864343 - (238));
    end
});
local MiscTab = Window:CreateTab("🚀 Misc ", nil);
local MiscMain = MiscTab
    :CreateSection("Main");
-- note: this is more than a fps optimizer doesnt even use setfpscap
local FpsUnlocker = MiscTab:CreateButton({
    Name = "Fps Unlocker",
    Callback = function()
        local LocalPlayer;
        local Character;
        local HumanoidRootPart;
        local RenderDistance;
        local waitTime;
        local DistanceBasedRendering;
        Rayfield:Notify({
            Title = "FPS unlocker ",
            Content = "Wait until FPS unlocker load...",
            Duration = 6.5,
            Image = nil
        });
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end
        LocalPlayer = game.Players.LocalPlayer;
        if not LocalPlayer.Character then
            LocalPlayer.CharacterAdded:Wait()
        end
        Character = LocalPlayer.Character;
        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
        RenderDistance = 100;
        waitTime = 3600;
        function DistanceBasedRendering()
            local WorkspaceDescendants;
            local MaxLoopSize;
            local DescendantsCount;
            WorkspaceDescendants = workspace:GetDescendants();
            MaxLoopSize = 50;
            DescendantsCount = #WorkspaceDescendants;
            for i = 1, DescendantsCount, MaxLoopSize do
                for j = i, math.min((i + MaxLoopSize) - (1), DescendantsCount) do
                    local BasePart = WorkspaceDescendants[j];
                    if BasePart:IsA("BasePart") then
                        -- this check is retarted because BasePart always has position
                        local success, PartPosition = pcall(function()
                            return BasePart
                                .Position;
                        end);
                        if not success then
                            continue;
                        end
                        local Distance = (PartPosition - HumanoidRootPart.Position)
                            .Magnitude;
                        if (Distance > RenderDistance) then
                            if (BasePart.CastShadow ~= false) then
                                BasePart.CastShadow = false;
                            end
                            if (BasePart.Material ~= Enum.Material.Plastic) then
                                BasePart.Material =
                                    Enum.Material
                                    .Plastic;
                            end
                        elseif (BasePart.CastShadow ~= true) then
                            BasePart.CastShadow = true;
                        end
                    elseif (BasePart:IsA("ParticleEmitter") or BasePart:IsA("Light")) then
                        local ParticleParent;
                        ParticleParent = BasePart.Parent;
                        if (ParticleParent and ParticleParent:IsA("BasePart")) then
                            local success, PartPosition =
                                pcall(function()
                                    return
                                        ParticleParent.Position;
                                end);
                            if not success then
                                continue;
                            end
                            local Distance = (PartPosition - HumanoidRootPart.Position)
                                .Magnitude;
                            if (Distance > RenderDistance) then
                                if (BasePart.Enabled ~= false) then
                                    BasePart.Enabled = false;
                                end
                            elseif (BasePart.Enabled ~= true) then
                                BasePart.Enabled = true;
                            end
                        end
                    end
                end
                task.wait(0);
            end
        end

        while true do
            DistanceBasedRendering();
            task.wait(waitTime);
        end
    end
});
MPT_4 =
    TeleportTab:CreateButton({
        Name = "Sławno MP (2)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(748.0356400000001 + 4421), 243.034988 - 123, -(1997.68848 - (65)),
                    -(0.0522800684 + 0), 0, -0.998632431, 0, 1, 0, 0.998632431, 0,
                    -(0.0522800684 - 0));
        end
    });
local L_39_ = TeleportTab:CreateButton({
    Name = "Garabage",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(7111.67871 - (580)), 440.710442 - (320), -(3259.81982 + 100), 0.890994847 + 0, "-0",
                -(413.454013437 - (413)), 0, 1, "-0", 0.454013437 + 0, 0,
                0.890994847 + 0);
    end
});
local L_40_ = TeleportTab:CreateSection("🤫Secrets");
local L_41_ = TeleportTab:CreateButton({
    Name =
    "Letter Stand",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            -(4690.843510000001 - (850)), 87.464417 + 24, 6479.8667 - (126), 0.694649816 + 0, "-0",
            -(738.719348073 - (738)), 0, 1, "-0", 0.719348073 + 0, 0, 0.694649816 + 0);
    end
});
local L_42_ =
    TeleportTab:CreateButton({
        Name = "List 1",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-(3235.3027299999994 + 5750), 326.010506 - 202, -(4906.06299 - 2992), 0.267143548,
                    "-0",
                    -(1551.963656723 - (1551)), 0, 1, "-0", 1269.963656723 - (1269), 0, 0.267143548 - 0);
        end
    });
local L_43_ = TeleportTab:CreateButton({
    Name = "List 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(3370.1001 - (1162), 515.8284610000001 - (377), 4237.398926 - 3303, 1, 0, 0, 0, 1, 0, 0, 0,
                1);
    end
});
local L_44_ = TeleportTab:CreateButton({
    Name =
    "List 3",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            -(1280.9410133 - (1248)), 277.83844 - (158), 5694.17578 + 4084, 0, 0, -1, 0, 1, 0, 1, 0, 0);
    end
});
local L_45_ = TeleportTab:CreateButton({
    Name = "Maciuś",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(770.8621800000001 + 707), 856.001411 - (753), 3322.3876999999993 + 6134,
                -(0.890994906 - 0), 0, -(0.454013437 + 0), 0, 1, 0, 0.454013437 - 0, 0,
                -(0.890994906 - 0));
    end
});
local L_46_ = TeleportTab:CreateButton({
    Name = "Zabawka Maćka",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-(922.5263669999999 - (731)), 29.595519999999993 + 80, 16676.08594 - 7193, 0.258864343 - 0,
                0, 0.965913713 + 0, 0, 1, 0, -(0.965913713 - 0), 0,
                238.258864343 - (238));
    end
});
-- this is just double pasted :sob:
-- local MiscTab = Window:CreateTab("🚀 Misc ", nil);
-- local MiscMainSection = MiscTab
--     :CreateSection("Main");
-- local FpsUnlocker = MiscTab:CreateButton({
--     Name = "Fps Unlocker",
--     Callback = function()
--         local L_73_ = 0;
--         local L_74_;
--         local L_75_;
--         local L_76_;
--         local L_77_;
--         local L_78_;
--         local L_79_;
--         while true do
--             if ((0) == L_73_) then
--                 Rayfield:Notify({
--                     Title = "FPS unlocker ",
--                     Content = "Wait until FPS unlocker load...",
--                     Duration = 6.5,
--                     Image = nil
--                 });
--                 if not game:IsLoaded() then
--                     game.Loaded:Wait();
--                 end
--                 L_74_ = game.Players.LocalPlayer;
--                 while not L_74_ or not L_74_.Character do
--                     local L_80_ = 0;
--                     while true do
--                         if (L_80_ == (0)) then
--                             task.wait(216.1 - (216));
--                             L_74_ = game.Players.LocalPlayer;
--                             break;
--                         end
--                     end
--                 end
--                 L_73_ = 1;
--             end
--             if (L_73_ == (1)) then
--                 L_75_ = L_74_.Character;
--                 L_76_ = L_75_:WaitForChild("HumanoidRootPart");
--                 L_77_ = 100;
--                 L_78_ = 3600;
--                 L_73_ = 2;
--             end
--             if (2 == L_73_) then
--                 L_79_ = nil;
--                 function L_79_()
--                     local L_81_ = 0;
--                     local L_82_;
--                     local L_83_;
--                     local L_84_;
--                     while true do
--                         if (L_81_ == (0)) then
--                             L_82_ = workspace:GetDescendants();
--                             L_83_ = 50;
--                             L_81_ = 1;
--                         end
--                         if (L_81_ == (1)) then
--                             L_84_ = #L_82_;
--                             for L_85_forvar0 = 1, L_84_, L_83_ do
--                                 for L_86_forvar0 = L_85_forvar0, math.min((L_85_forvar0 + L_83_) - (1), L_84_) do
--                                     local L_87_ = L_82_[L_86_forvar0];
--                                     if L_87_:IsA("BasePart") then
--                                         local L_88_, L_89_ = pcall(function()
--                                             return L_87_
--                                                 .Position;
--                                         end);
--                                         if not L_88_ then
--                                             continue;
--                                         end
--                                         local L_90_ = (L_89_ - L_76_.Position)
--                                             .Magnitude;
--                                         if (L_90_ > L_77_) then
--                                             if (L_87_.CastShadow ~= false) then
--                                                 L_87_.CastShadow = false;
--                                             end
--                                             if (L_87_.Material ~= Enum.Material.Plastic) then
--                                                 L_87_.Material =
--                                                     Enum.Material
--                                                     .Plastic;
--                                             end
--                                         elseif (L_87_.CastShadow ~= true) then
--                                             L_87_.CastShadow = true;
--                                         end
--                                     elseif (L_87_:IsA("ParticleEmitter") or L_87_:IsA("Light")) then
--                                         local L_91_ = 0;
--                                         local L_92_;
--                                         while true do
--                                             if (L_91_ == 0) then
--                                                 L_92_ = L_87_.Parent;
--                                                 if (L_92_ and L_92_:IsA("BasePart")) then
--                                                     local L_93_, L_94_ =
--                                                         pcall(function()
--                                                             return
--                                                                 L_92_.Position;
--                                                         end);
--                                                     if not L_93_ then
--                                                         continue;
--                                                     end
--                                                     local L_95_ = (L_94_ - L_76_.Position)
--                                                         .Magnitude;
--                                                     if (L_95_ > L_77_) then
--                                                         if (L_87_.Enabled ~= false) then
--                                                             L_87_.Enabled = false;
--                                                         end
--                                                     elseif (L_87_.Enabled ~= true) then
--                                                         L_87_.Enabled = true;
--                                                     end
--                                                 end
--                                                 break;
--                                             end
--                                         end
--                                     end
--                                 end
--                                 task.wait(0);
--                             end
--                             break;
--                         end
--                     end
--                 end

--                 while true do
--                     local L_96_ = tick();
--                     L_79_();
--                     local L_97_ = tick() - L_96_;
--                     task.wait(L_78_);
--                 end
--                 break;
--             end
--         end
--     end
-- });
