local PHANTOM_ENV = getfenv()
PHANTOM_ENV.SCRIPT_VERSION = "0.1"
setfenv(0, PHANTOM_ENV)

do
	local ADONIS_BYPASSED = false
	for _, mod in getloadedmodules() do
		if mod.Name == "Anti" and not ADONIS_BYPASSED then
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/refs/heads/main/Source.lua")
			)()
			ADONIS_BYPASSED = true
		end
	end
end

_G.PTM_MODES = { NoAssets = true, NoActorHooking = true }
local function SendNotification(data)
	game:GetService("StarterGui"):SetCore("SendNotification", data)
end

do
	local REQUIRED_FUNCTIONS = { "gethui", "cloneref", "hookfunction", "iscclosure", "getconnections" }
	gethui = gethui or get_hidden_gui
	hookfunction = hookfunction or replaceclosure
	if not iscclosure then
		return SendNotification({ Title = "Executor not supported", Text = "Couldnt find iscclosure" })
	end
	local env = getfenv()
	for _, name in REQUIRED_FUNCTIONS do
		local func = env[name]
		if not func then
			return SendNotification({ Title = "Executor not supported", Text = "Couldnt find " .. name })
		end
		if not iscclosure(func) then
			return SendNotification({
				Title = "Executor not supported",
				Text = "Function " .. name .. " is not a c closure!",
			})
		end
	end
end

local AssetMap = {
	SettingsButton = "rbxassetid://1204397029",
}

--[[ MODES
noassets - safest mode, cant be detected by any ContentProvider check
]]
local PhantomModes = _G.PTM_MODES
	or {
		NoAssets = _G.PTM_MODE == "noassets",
		NoActorHooking = _G.PTM_MODE == "noactorhook",
	}

if PhantomModes.NoAssets then
	for key, _ in AssetMap do
		AssetMap[key] = ""
	end
end

local function GetService(serviceName)
	return cloneref(game:GetService(serviceName))
end

-- local CoreGui = GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HiddenInterface = gethui()
local CachedActors = (getactors or function()
	return {}
end)()

-- note: velocity v2 is ass rn
CachedActors = type(CachedActors) == "table" and CachedActors or {}

if not run_on_actor or not iscclosure(run_on_actor) then
	run_on_actor = function(_, __, ...) end

	SendNotification({ Title = "Phantom", Text = "Your executor doesnt support actor api, but the script will work!" })
end

for _, ScreenGui in HiddenInterface:GetChildren() do
	if ScreenGui:IsA("ScreenGui") and ScreenGui.Name == "Phantom" then
		ScreenGui:Destroy()
	end
end

-- note: ui initialization
local Interface = { CommandBarFocued = false }
do
	-- note: main ui
	do
		local Phantom = Instance.new("ScreenGui")
		Interface.ScreenGui = Phantom
		Phantom.DisplayOrder = -1
		local View = Instance.new("Frame")
		Interface.View = View
		local TopBar = Instance.new("Frame")
		Interface.TopBar = TopBar
		local Text = Instance.new("TextLabel")
		Interface.TopBarText = Text
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local SettingsButton = PhantomModes.NoAssets and Instance.new("TextButton") or Instance.new("ImageButton")
		Interface.SettingsButton = SettingsButton
		local CommandBar = Instance.new("TextBox")
		Interface.CommandBar = CommandBar
		local UIPadding = Instance.new("UIPadding")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		local UIListLayout = Instance.new("UIListLayout")
		local SearchResults = Instance.new("ScrollingFrame")
		Interface.SearchResults = SearchResults
		local UIGridLayout = Instance.new("UIGridLayout")

		Phantom.Name = "Phantom"
		Phantom.Parent = HiddenInterface
		Phantom.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		View.Name = "View"
		View.Parent = Phantom
		View.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		View.BackgroundTransparency = 1.000
		View.BorderColor3 = Color3.fromRGB(0, 0, 0)
		View.BorderSizePixel = 0
		-- {0.87, 0},{0.953, 0}
		-- View.Position = UDim2.new(0.870000005, 0, 0.768999994, 1)
		View.Position = UDim2.new(0.87, 0, 0.953, 1)
		View.Size = UDim2.new(0.129999995, 0, 0.230000004, 0)

		TopBar.Name = "TopBar"
		TopBar.Parent = View
		TopBar.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
		TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TopBar.BorderSizePixel = 0
		TopBar.Size = UDim2.new(1, 0, 0.100000001, 0)
		TopBar.LayoutOrder = 1

		Text.Name = "Text"
		Text.Parent = TopBar
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Text.BorderSizePixel = 0
		Text.Size = UDim2.new(1, 0, 1, 0)
		Text.Font = Enum.Font.SourceSans
		Text.Text = "Phantom v" .. PHANTOM_ENV.SCRIPT_VERSION
		Text.TextColor3 = Color3.fromRGB(236, 236, 236)
		Text.TextScaled = true
		Text.TextSize = 24.000
		Text.TextWrapped = true

		UITextSizeConstraint.Parent = Text
		UITextSizeConstraint.MaxTextSize = 23

		SettingsButton.Name = "SettingsButton"
		SettingsButton.Parent = TopBar
		SettingsButton.BackgroundColor3 = Color3.fromRGB(55, 48, 126)
		SettingsButton.BackgroundTransparency = PhantomModes.NoAssets and 0 or 1
		SettingsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SettingsButton.BorderSizePixel = 0
		SettingsButton.Position = UDim2.new(1, -24, 0, 0)
		SettingsButton.Size = UDim2.new(0, 24, 0.99000001, 0)
		if not PhantomModes.NoAssets then
			SettingsButton.Image = AssetMap.SettingsButton
		else
			SettingsButton.Text = ""
		end

		CommandBar.Name = "CommandBar"
		CommandBar.Parent = View
		CommandBar.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
		CommandBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CommandBar.BorderSizePixel = 0
		CommandBar.Size = UDim2.new(1, 0, 0.100000001, 0)
		CommandBar.Font = Enum.Font.SourceSans
		CommandBar.PlaceholderText = "Command bar (;)"
		CommandBar.Text = ""
		CommandBar.TextColor3 = Color3.fromRGB(227, 227, 227)
		CommandBar.TextSize = 14.000
		CommandBar.TextXAlignment = Enum.TextXAlignment.Left
		CommandBar.LayoutOrder = 2

		UIPadding.Parent = CommandBar
		UIPadding.PaddingBottom = UDim.new(0, 4)
		UIPadding.PaddingLeft = UDim.new(0, 8)
		UIPadding.PaddingTop = UDim.new(0, 4)

		UITextSizeConstraint_2.Parent = CommandBar
		UITextSizeConstraint_2.MaxTextSize = 24
		UITextSizeConstraint_2.MinTextSize = 20

		UIListLayout.Parent = View
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		SearchResults.Name = "SearchResults"
		SearchResults.Parent = View
		SearchResults.Active = true
		SearchResults.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		SearchResults.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchResults.BorderSizePixel = 0
		SearchResults.Size = UDim2.new(1, 0, 0.800000012, 0)
		SearchResults.BottomImage = ""
		SearchResults.CanvasSize = UDim2.new(0, 0, 0, 0)
		SearchResults.TopImage = ""
		SearchResults.LayoutOrder = 3

		UIGridLayout.Parent = SearchResults
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
		UIGridLayout.CellSize = UDim2.new(1, 0, 0.150000006, 0)
	end

	-- note: command button template
	do
		local CommandButton = Instance.new("TextButton")
		Interface.CommandButtonTemplate = CommandButton
		local UIPadding = Instance.new("UIPadding")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		CommandButton.Name = "CommandButtonTemplate"
		CommandButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CommandButton.BackgroundTransparency = 1.000
		CommandButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CommandButton.BorderSizePixel = 0
		CommandButton.Size = UDim2.new(0, 200, 0, 50)
		CommandButton.Font = Enum.Font.SourceSans
		CommandButton.Text = "copyid [plr]"
		CommandButton.TextColor3 = Color3.fromRGB(231, 231, 231)
		CommandButton.TextSize = 14.000
		CommandButton.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding.Parent = CommandButton
		UIPadding.PaddingBottom = UDim.new(0, 4)
		UIPadding.PaddingLeft = UDim.new(0, 8)
		UIPadding.PaddingTop = UDim.new(0, 4)

		UITextSizeConstraint.Parent = CommandButton
		UITextSizeConstraint.MaxTextSize = 24
		UITextSizeConstraint.MinTextSize = 20
	end
end

local API = {
	RegisteredCommands = {},
	PropertiesBlocked = {},
	MovementAPI = "roblox",
}
PHANTOM_ENV.API = API

do
	function API.addcmd(name, aliases, func, plugin)
		table.insert(API.RegisteredCommands, {
			Name = name,
			Aliases = aliases,
			Callback = func,
			Plugin = plugin,
		})
	end

	function API.findCmd(name)
		for _, cmd in API.RegisteredCommands do
			if cmd.Name:match(name) then
				return cmd
			end
			for _, alias in cmd.Aliases do
				if alias:match(name) then
					return cmd
				end
			end
		end
	end

	function API.execCmd(text, noNotification)
		local CommandName = text:split(" ")[1]
		if CommandName == "" then
			return
		end
		local Command = API.findCmd(CommandName)
		if not Command then
			return SendNotification({
				Title = "Phantom",
				Text = string.format('Couldnt find command "%s"', CommandName),
			})
		end
		local success, err = pcall(Command.Callback, unpack(text:split(" "), 2))
		if not success and not noNotification then
			SendNotification({ Title = string.format("Phantom, command %s failed", Command.Name), Text = err })
		end
	end

	function API.clearSearchResults()
		for _, child in Interface.SearchResults:GetChildren() do
			if child:IsA(Interface.CommandButtonTemplate.ClassName) then
				child:Destroy()
			end
		end
	end

	function API.createButton(cmd)
		local Button = Interface.CommandButtonTemplate:Clone()
		Button.Parent = Interface.SearchResults
		Button.Text = cmd.Name
		if #cmd.Aliases ~= 0 then
			Button.Text = Button.Text .. " ("
			for i, alias in cmd.Aliases do
				Button.Text = Button.Text .. alias
				if i ~= #cmd.Aliases then
					Button.Text = Button.Text .. ", "
				end
			end
			Button.Text = Button.Text .. ")"
		end
	end
end

-- note: comm channel api cuz atlantis sucks ass
-- do
-- 	local COMM_CHANNEL_PREFIX = "COMMCHANNEL_"
-- 	-- note: ima kys cuz atlantis is so fucking bad
-- 	function create_comm_channel()
-- 		local Identifier = game:GetService("HttpService"):GenerateGUID(false)
-- 		local Event = Instance.new("BindableEvent")
-- 		getgenv()[COMM_CHANNEL_PREFIX .. Identifier] = Event
-- 		return Identifier, Event
-- 	end
-- 	function get_comm_channel(id)
-- 		return getgenv()[COMM_CHANNEL_PREFIX .. id]
-- 	end
-- end

local Utils = {}
PHANTOM_ENV.Utils = Utils

do
	function Utils.SafeDisconnect(connection) end
	function Utils.GetBasicTag(instance, property)
		return (instance.ClassName .. "_" .. property):lower()
	end
	-- function Utils.GetInstanceHash(instance)
	-- 	local success, id = pcall(function()
	-- 		return instance.UniqueId
	-- 	end)
	-- 	if success then
	-- 		return id
	-- 	end
	-- 	return crypt.hash(tostring(instance))
	-- end
	-- function Utils.GetUniqueTag(instance, property)
	-- 	return (instance.UniqueId .. "_" .. property):lower()
	-- end
	local SpoofedProperties = {}
	function Utils.SafeSetProperty(instance, property, value)
		local DisabledConnections = {}
		for _, conn in getconnections(instance.Changed) do
			if conn.State or conn.Enabled then
				conn:Disable()
				table.insert(DisabledConnections, conn)
			end
		end
		for _, conn in getconnections(instance:GetPropertyChangedSignal(property)) do
			if conn.State or conn.Enabled then
				conn:Disable()
				table.insert(DisabledConnections, conn)
			end
		end
		local OrigValue = instance[property]
		instance[property] = value
		Utils.SpoofProperty(instance, property, OrigValue)
		for _, conn in DisabledConnections do
			conn:Enable()
		end
	end

	function Utils.SpoofProperty(instance, property, value)
		if not SpoofedProperties[instance] then
			SpoofedProperties[instance] = {}
		end
		SpoofedProperties[instance][property] = value
	end

	local __index
	__index = hookmetamethod(game, "__index", function(self, key)
		if not checkcaller() then
			if SpoofedProperties[self] then
				return SpoofedProperties[self][key] or __index(self, key)
			end
		end
		return __index(self, key)
	end)

	for _, actor in CachedActors do
		if PhantomModes.NoActorHooking then
			break
		end
		-- print("__index hook (spoof) for", actor, PhantomModes.NoActorHooking)
		run_on_actor(
			actor,
			[[
			local SpoofedProperties = ...
			if typeof(SpoofedProperties) ~= "table" then
				return error("If this error ever occurs please report it to the maintainers or try to restart the script (0x01)")
			end	
			local __index
			__index = hookmetamethod(game, "__index", function(self, key)
				if not checkcaller() then
					if SpoofedProperties[self] then
						return SpoofedProperties[self][key] or __index(self, key)
					end
				end
				return __index(self, key)
			end)
		]],
			SpoofedProperties
		)
	end

	function Utils.GetCharacter(player)
		player = player or LocalPlayer
		for _, desc in workspace:GetDescendants() do
			if desc:IsA("Model") and desc:FindFirstChild("Humanoid") and desc.Name:match(player.Name) then
				return desc
			end
		end
		if player.Character then
			return player.Character
		end
	end
	-- do
	-- 	local CachedCharacters = {}

	-- 	local old
	-- 	old = hookfunction(
	-- 		Utils.GetCharacter,
	-- 		newlclosure(function(player)
	-- 			if CachedCharacters[player] and CachedCharacters[player].Parent ~= nil then
	-- 				return CachedCharacters[player]
	-- 			end
	-- 			CachedCharacters[player] = old(player)
	-- 			return CachedCharacters[player]
	-- 		end)
	-- 	)
	-- end

	function Utils.GetProperty(instance, property)
		if SpoofedProperties[instance] and SpoofedProperties[instance][property] then
			return SpoofedProperties[instance][property]
		end
		return instance[property]
	end
end

-- note: ui lua implementation
do
	Interface.CommandBar:GetPropertyChangedSignal("Text"):Connect(function()
		API.clearSearchResults()
		local CommandName = Interface.CommandBar.Text:split(" ")[1]
		for _, cmd in API.RegisteredCommands do
			if cmd.Name:match(CommandName) then
				API.createButton(cmd)
			else
				for _, alias in cmd.Aliases do
					if alias:match(CommandName) then
						API.createButton(cmd)
						break
					end
				end
			end
		end
	end)

	local Tween = nil
	Interface.View.MouseEnter:Connect(function()
		if Tween then
			Tween:Cancel()
		end
		Tween = TweenService:Create(Interface.View, TweenInfo.new(0.4), { Position = UDim2.new(0.87, 0, 0.769, 1) })
		Tween:Play()
	end)

	Interface.View.MouseLeave:Connect(function()
		if Tween then
			Tween:Cancel()
		end
		Tween = TweenService:Create(Interface.View, TweenInfo.new(0.4), { Position = UDim2.new(0.87, 0, 0.953, 1) })
		Tween:Play()
	end)

	-- note: idk why its so unstable
	-- note: ts actually pmo
	-- for _, conn in getconnections(game:GetService("UserInputService").InputBegan) do
	-- 	if conn.Function then
	-- 		local old
	-- 		old = hookfunction(conn.Function, function(...)
	-- 			task.wait(0.1)
	-- 			if not Interface.CommandBarFocued then
	-- 				return old(...)
	-- 			end
	-- 		end)
	-- 	end
	-- end
	UserInputService.InputBegan:Connect(function(input, gpe)
		if gpe then
			return
		end
		if input.KeyCode == Enum.KeyCode.Semicolon then
			-- note: we add delay so the ; wont get captured
			task.wait(0)
			Interface.CommandBar:CaptureFocus()
		end
	end)

	Interface.CommandBar.Focused:Connect(function()
		Interface.CommandBarFocued = true
		if Tween then
			Tween:Cancel()
		end
		Tween = TweenService:Create(Interface.View, TweenInfo.new(0.4), { Position = UDim2.new(0.87, 0, 0.769, 1) })
		Tween:Play()
	end)
	Interface.CommandBar.FocusLost:Connect(function()
		Interface.CommandBarFocued = false
		if Tween then
			Tween:Cancel()
		end
		Tween = TweenService:Create(Interface.View, TweenInfo.new(0.4), { Position = UDim2.new(0.87, 0, 0.953, 1) })
		Tween:Play()
		if UserInputService:IsKeyDown(Enum.KeyCode.Return) then
			local Text = Interface.CommandBar.Text
			Interface.CommandBar.Text = ""
			API.execCmd(Text)
		end
	end)
end

API.addcmd("close", { "exit" }, function()
	Interface.ScreenGui:Destroy()
	if getgenv().ExunysDeveloperESP then
		getgenv().ExunysDeveloperESP.Settings.Enabled = false
	end
	SendNotification({ Title = "Phantom", Text = "Closing Phantom" })
end, nil)

API.addcmd("esp", {}, function()
	if identifyexecutor():find("Xeno") then
		return SendNotification({ Title = "Phantom", Text = "Xeno is not supported" })
	end
	if getgenv().ExunysDeveloperESP then
		return SendNotification({ Title = "Phantom", Text = "ESP already loaded!" })
	end
	SendNotification({ Title = "Phantom", Text = "Loading Esp..." })
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()()
	-- note: this is a fixed version of exunys esp
	-- loadstring(game:HttpGet("https://pastebin.com/raw/p5drqkud"))()()
end, nil)

API.addcmd("esptoggle", {}, function()
	if not getgenv().ExunysDeveloperESP then
		API.execCmd("esp")
		-- return SendNotification({Title = "Phantom", Text = "ESP not loaded!"})
	end
	getgenv().ExunysDeveloperESP.Settings.Enabled = not getgenv().ExunysDeveloperESP.Settings.Enabled
end)

API.addcmd("espteamcheck", {}, function()
	if not getgenv().ExunysDeveloperESP then
		API.execCmd("esp")
		-- return SendNotification({Title = "Phantom", Text = "ESP not loaded!"})
	end
	getgenv().ExunysDeveloperESP.Settings.TeamCheck = not getgenv().ExunysDeveloperESP.Settings.TeamCheck
end)

API.addcmd("esptracers", {}, function()
	if not getgenv().ExunysDeveloperESP then
		API.execCmd("esp")
		-- return SendNotification({Title = "Phantom", Text = "ESP not loaded!"})
	end
	if not getgenv().ExunysDeveloperESP.Settings.Enabled then
		SendNotification({ Title = "Phantom", Text = "ESP is disabled!" })
	end
	getgenv().ExunysDeveloperESP.Properties.Tracer.Enabled = not getgenv().ExunysDeveloperESP.Properties.Tracer.Enabled
end)

API.addcmd("esphead", {}, function()
	if not getgenv().ExunysDeveloperESP then
		API.execCmd("esp")
		-- return SendNotification({Title = "Phantom", Text = "ESP not loaded!"})
	end
	if not getgenv().ExunysDeveloperESP.Settings.Enabled then
		SendNotification({ Title = "Phantom", Text = "ESP is disabled!" })
	end
	getgenv().ExunysDeveloperESP.Properties.HeadDot.Enabled =
		not getgenv().ExunysDeveloperESP.Properties.HeadDot.Enabled
end)

API.addcmd("esphealth", {}, function()
	if not getgenv().ExunysDeveloperESP then
		API.execCmd("esp")
		-- return SendNotification({Title = "Phantom", Text = "ESP not loaded!"})
	end
	if not getgenv().ExunysDeveloperESP.Settings.Enabled then
		SendNotification({ Title = "Phantom", Text = "ESP is disabled!" })
	end
	getgenv().ExunysDeveloperESP.Properties.HealthBar.Enabled =
		not getgenv().ExunysDeveloperESP.Properties.HealthBar.Enabled
end)

Players.PlayerRemoving:Connect(function(player)
	if player == LocalPlayer then
		getgenv().ExunysDeveloperESP.Settings.Enabled = false
	end
end)

API.addcmd("walkspeed", { "speed", "ws" }, function(speed)
	assert(tonumber(speed, 10), "arg ~= number")
	-- note: fix SafeSetProperty hooking error (checkcaller is stupid)
	Utils.SafeSetProperty(
		Utils.GetCharacter():FindFirstChildWhichIsA("Humanoid", true),
		"WalkSpeed",
		tonumber(speed, 10)
	)
end, nil)

API.addcmd("jumppower", { "jumpp" }, function(int)
	assert(tonumber(int, 10), "arg ~= number")
	Utils.SafeSetProperty(Utils.GetCharacter():FindFirstChildWhichIsA("Humanoid", true), "JumpPower", tonumber(int, 10))
end, nil)

API.addcmd("jumpheight", { "jumph" }, function(int)
	assert(tonumber(int, 10), "arg ~= number")
	Utils.SafeSetProperty(
		Utils.GetCharacter():FindFirstChildWhichIsA("Humanoid", true),
		"JumpHeight",
		tonumber(int, 10)
	)
end, nil)

API.addcmd("gravity", {}, function(int)
	assert(tonumber(int, 10), "arg ~= number")
	Utils.SafeSetProperty(workspace, "Gravity", tonumber(int, 10))
end, nil)

-- note: property readonly/writeable
do
	API.addcmd("propertyreadonly", {}, function(classname, property)
		table.insert(API.PropertiesBlocked, (classname .. "_" .. property):lower())
	end)

	API.addcmd("propertywriteable", {}, function(classname, property)
		table.remove(API.PropertiesBlocked, table.find(API.PropertiesBlocked, (classname .. "_" .. property):lower()))
	end)

	local __newindex
	__newindex = hookmetamethod(game, "__newindex", function(self, key, value)
		local Tag = (self.ClassName .. "_" .. key):lower()
		if table.find(API.PropertiesBlocked, Tag) and not checkcaller() then
			return
		end
		return __newindex(self, key, value)
	end)

	for _, actor in CachedActors do
		if PhantomModes.NoActorHooking then
			break
		end
		-- print("__newindex hook for", actor)
		run_on_actor(
			actor,
			[[
			local API = ...
			local __newindex
			__newindex = hookmetamethod(game, "__newindex", function(self, key, value)
				local Tag = (self.ClassName .. "_" .. key):lower()
				if table.find(API.PropertiesBlocked, Tag) and not checkcaller() then
					return
				end
				return __newindex(self, key, value)
			end)
		]],
			API
		)
	end
end

-- note: noclip
do
	local NoclippingConnection
	local Enabled = false
	local DisabledCollisionParts = {}
	local ConnList = {}
	API.addcmd("noclip", {}, function()
		if not LocalPlayer.Character then
			return SendNotification({ Title = "Phantom", Text = "You must be alive" })
		end
		Enabled = true
		API.execCmd("propertyreadonly Part CanCollide")
		NoclippingConnection = game:GetService("RunService").Stepped:Connect(function()
			if LocalPlayer.Character and Enabled then
				for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true then
						child.CanCollide = false
						if not table.find(DisabledCollisionParts, child) then
							-- Utils.SafeSetProperty(child, "CanCollide", false)
							-- table.insert(
							-- 	ConnList,
							-- 	child:GetPropertyChangedSignal("CanCollide"):Connect(function()
							-- 		Utils.SafeSetProperty(child, "CanCollide", false)
							-- 	end)
							-- )
							table.insert(DisabledCollisionParts, child)
						end
					end
				end
			end
		end)

		SendNotification({ Title = "Phantom", Text = "Noclip enabled" })
	end)

	API.addcmd("unnoclip", {}, function()
		Enabled = false
		if NoclippingConnection then
			task.wait()
			NoclippingConnection:Disconnect()
		end
		API.execCmd("propertywriteable Part CanCollide")
		for _, conn in ConnList do
			conn:Disconnect()
		end
		table.clear(ConnList)
		for _, child in DisabledCollisionParts do
			child.CanCollide = true
			-- Utils.SafeSetProperty(child, "CanCollide", true)
		end
		table.clear(DisabledCollisionParts)
		SendNotification({ Title = "Phantom", Text = "Noclip disabled" })
	end)
end

-- note: movement api
do
	-- local CurrentWalkDirection = Vector3.zero
	-- todo: add cmd to switch movement api from roblox to custom
	-- note: client doesnt change Velocity but its updated\
	-- https://create.roblox.com/docs/reference/engine/classes/Player#Move
	API.addcmd("movementapi", { "mvapi" }, function(apiName)
		apiName = apiName:lower()
		if apiName ~= "roblox" and apiName ~= "custom" then
			error(string.format("expected roblox or custom got %s", apiName))
		end
		API.MovementAPI = apiName
	end)

	local Move
	Move = hookfunction(
		LocalPlayer.Move,
		newcclosure(function(self, walkDirection, relativeToCamera)
			if
				not self:IsA("Player")
				or typeof(walkDirection) ~= "Vector3"
				or typeof(relativeToCamera) ~= "boolean"
				or API.MovementAPI:lower() == "roblox"
			then
				return Move(self, walkDirection, relativeToCamera)
			end
			if API.MovementAPI:lower() ~= "custom" then
				API.MovementAPI = "roblox"
				error("invalid movementapi expected roblox or custom")
			end
			local Delta = RunService.Heartbeat:Wait()
			local WalkSpeed =
				Utils.GetProperty(Utils.GetCharacter():FindFirstChildWhichIsA("Humanoid", true), "WalkSpeed")

			Utils.GetCharacter().PrimaryPart.CFrame = Utils.GetCharacter().PrimaryPart.CFrame
				+ walkDirection * WalkSpeed * Delta
			-- if not relativeToCamera then
			-- 	return
			-- end
			-- note: todo replicate relativeToCamera math stuff
			-- error("TODO - implement Player.Move relativeToCamera")
		end)
	)

	-- local function CharacterAdded(char)
	-- 	char:FindFirstChild("Humanoid").Died:Once(function()
	-- 		CurrentWalkDirection = Vector3.zero
	-- 	end)
	-- end

	-- LocalPlayer.CharacterAdded:Connect(CharacterAdded)
	-- if LocalPlayer.Character then
	-- 	CharacterAdded(LocalPlayer.Character)
	-- end
end

-- note: bhop
do
	local BHOPEnabled = false
	API.addcmd("bunnyhop", { "bhop" }, function()
		BHOPEnabled = not BHOPEnabled
		SendNotification({
			Title = "Phantom",
			Text = string.format("Bhop is now %s", BHOPEnabled and "enabled" or "disabled"),
		})
	end)

	local function CharacterAdded(character)
		local Humanoid = character:FindFirstChild("Humanoid")
		Humanoid.StateChanged:Connect(function(new, old)
			if new == Enum.HumanoidStateType.Landed then
				if BHOPEnabled and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					task.wait()
					Humanoid.Jump = true
				end
			end
		end)
	end

	LocalPlayer.CharacterAdded:Connect(CharacterAdded)
	if LocalPlayer.Character then
		task.spawn(function()
			repeat
				task.wait()
			until character:FindFirstChild("Humanoid", true)
			CharacterAdded(LocalPlayer.Character)
		end)
	end
end

do
	local TriggerBotEnabled = false
	local Mouse = LocalPlayer:GetMouse()
	API.addcmd("triggerbot", {}, function()
		TriggerBotEnabled = not TriggerBotEnabled
		SendNotification({
			Title = "Phantom",
			Text = string.format("Trigger bot is now %s", TriggerBotEnabled and "Enabled" or "Disabled"),
		})
		while TriggerBotEnabled do
			RunService.Heartbeat:Wait()
			if Mouse.Target then
				local Character = Mouse.Target.Parent
				local TargetPlayer = Players:GetPlayerFromCharacter(Character)
				if TargetPlayer then
					RunService.Heartbeat:Wait()
					mouse1click()
					RunService.Heartbeat:Wait()
					mouse1release(0x01)
				end
			end
		end
	end)
end

-- note: spinbot
do
end

-- note: rejoin on kick /autorejoin

-- note: on character spawn
do
	local Command = ""
	API.addcmd("onrespawn", { "oncharacteradded" }, function(...)
		Command = table.concat({ ... }, " ")
	end)

	LocalPlayer.CharacterAdded:Connect(function()
		if Command ~= "" then
			SendNotification({ Title = "Phantom - On respawn", Text = "Executing command " .. Command })
			task.wait(0.2)
			API.execCmd(Command)
		end
	end)
end

do
	local Command = ""
	API.addcmd("loop", { "heartbeat" }, function(...)
		Command = table.concat({ ... }, " ")
	end)

	RunService.Heartbeat:Connect(function()
		if Command ~= "" then
			API.execCmd(Command, true)
		end
	end)
end
