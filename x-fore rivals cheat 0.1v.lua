-- deobfuscated by pubmain, github.com/pubmain
-- join discord https://github.com/pubmain/metadata/blob/main/discord

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))();
local Window = Rayfield:CreateWindow({
    Name =
    "Rivals X-Force 0.1 🔫 ",
    Icon = 0,
    LoadingTitle = "Zaaktulizowano 15.02.2025",
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
        Title = "Rivals X-Fore Key",
        Subtitle = "Key system",
        Note = "Klucz znajdziesz na naszym dc",
        FileName = "xforce",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {
            "xforethebestrivals"
        }
    }
});
local TabPlayer =
    Window:CreateTab("🧒 Player", nil);
local MainSection = TabPlayer:CreateSection("Main");
local InfiniteJumpButton = TabPlayer:CreateButton({
    Name = "Infinite Jump ",
    Callback = function()
        _G.infinjump = not _G.infinjump;
        if (_G.infinJumpStarted == nil) then
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local Mouse = LocalPlayer:GetMouse();
            Mouse.KeyDown:connect(function(key)
                if _G.infinjump then
                    -- note: byte 32 = space
                    if (key:byte() == (32)) then
                        local humanoid = game:GetService("Players")
                            .LocalPlayer.Character
                            :FindFirstChildOfClass(
                                "Humanoid");
                        humanoid
                            :ChangeState("Jumping");
                        wait();
                        humanoid
                            :ChangeState("Seated");
                    end
                end
            end);
            _G.infinJumpStarted = true;
            game.StarterGui:SetCore(
                "SendNotification",
                {
                    Title = "Youtube Hub",
                    Text = "Infinite Jump Activated!",
                    Duration = 5
                });
        end
    end
});
local SpeedSlider = TabPlayer:CreateSlider({
    Name = "Speed ",
    Range = {
        0,
        255
    },
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Slider1",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value;
    end
});
local EspTab =
    Window:CreateTab("👀 ESP ", nil);
local EspMainSection = EspTab:CreateSection("Main");
local EspBox = EspTab:CreateButton({
    Name = "⚡ ESP Box",
    Callback = function()
        local Players = game:GetService("Players");
        local RunService = game:GetService("RunService");
        local Camera = workspace.CurrentCamera;
        local LocalPlayer = Players.LocalPlayer;
        local DrawingArray = {};
        local function AddPlayerDrawing(Player)
            local NewDrawing;
            if (Player == LocalPlayer) then
                return;
            end
            NewDrawing = Drawing.new("Square");
            NewDrawing.Thickness = 2;
            NewDrawing.Filled = false;
            NewDrawing.Color = Color3.fromRGB(255, 0, 0);
            NewDrawing.Transparency = 1;
            NewDrawing.Visible = false;
            DrawingArray[Player] = NewDrawing;
        end
        local function UpdateDrawings()
            for _, player in pairs(Players:GetPlayers()) do
                local Character = player.Character;
                local PlayerDrawing = DrawingArray[player];
                if (Character and PlayerDrawing) then
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
                    local PlayerHead = Character
                        :FindFirstChild(
                            "Head");
                    if (HumanoidRootPart and PlayerHead) then
                        local HumanoidRootPartVector;
                        local HumanoidRootPartVisible;
                        local PlayerHeadVector;
                        local PlayerHeadVisible;
                        HumanoidRootPartVector, HumanoidRootPartVisible = Camera
                            :WorldToViewportPoint(
                                HumanoidRootPart
                                .Position);
                        PlayerHeadVector, PlayerHeadVisible =
                            Camera
                            :WorldToViewportPoint(PlayerHead.Position +
                                Vector3.new(0, 3.5 - 2, 0));
                        if (HumanoidRootPartVisible and PlayerHeadVisible) then
                            local height = math.abs(PlayerHeadVector.Y -
                                HumanoidRootPartVector.Y) * (2);
                            local width =
                                height / (2);
                            local DrawingPosition =
                                Vector2.new(
                                    HumanoidRootPartVector.X - (width / (2)),
                                    HumanoidRootPartVector.Y - (height / (2)));
                            PlayerDrawing.Size =
                                Vector2.new(width, height);
                            PlayerDrawing.Position = DrawingPosition;
                            PlayerDrawing.Visible = true;
                        else
                            PlayerDrawing.Visible = false;
                        end
                    else
                        PlayerDrawing.Visible = false;
                    end
                end
            end
        end
        local function RemovePlayerDrawing(Player)
            if DrawingArray[Player] then
                DrawingArray[Player]:Remove();
                DrawingArray[Player] = nil;
            end
        end
        for _, player in pairs(Players:GetPlayers()) do
            if (player ~= LocalPlayer) then
                AddPlayerDrawing(player);
            end
        end
        RunService.RenderStepped:Connect(UpdateDrawings);
        Players.PlayerAdded:Connect(AddPlayerDrawing);
        Players.PlayerRemoving:Connect(RemovePlayerDrawing);
        print("🔥 2D BOX ESP na Całą Postać Włączony!");
    end
});
local GlowButton = EspTab:CreateButton({
    Name = "🔥 Glow",
    Callback = function()
        local PlayersService = game:GetService("Players");
        repeat
            wait();
        until PlayersService.LocalPlayer
        local function AddCharacter(Character)
            if (Character and not Character:FindFirstChild("Highlight")) then
                local CharacterHighlight = Instance.new("Highlight");
                CharacterHighlight.Name = "Highlight";
                CharacterHighlight.Parent = Character;
                CharacterHighlight.FillColor = Color3.fromRGB(255, 0, 0);
                CharacterHighlight.OutlineColor = Color3.fromRGB(255, 255, 255);
                CharacterHighlight.FillTransparency = 0.3;
                CharacterHighlight.OutlineTransparency = 0;
            end
        end

        for _, Player in pairs(PlayersService:GetPlayers()) do
            if Player.Character then
                AddCharacter(Player.Character);
            end
            Player.CharacterAdded:Connect(AddCharacter);
        end
        PlayersService.PlayerAdded:Connect(function(Player)
            Player.CharacterAdded:Connect(AddCharacter);
        end);
        print("🔥 Czerwony Glow Włączony!");
    end
});
