-- ==========================================
-- NOVEX HUB KEY SYSTEM
-- ==========================================
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- YOUR CLOUDFLARE WORKER URL
local API_URL = "https://touchline.wraithedvoid.workers.dev/"
local localKeyFile = "NovexKey.json"

local function checkKeySystem()
    -- 1. Check if they have a saved key from the last 24 hours
    if isfile and readfile and isfile(localKeyFile) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(localKeyFile)) end)
        if success and data and (os.time() - data.time < 86400) then
            local check = game:HttpGet(API_URL .. "?action=check&key=" .. data.key)
            if string.find(check, "true") then
                return data.key -- Key is valid, skip the UI and load the script
            end
        end
    end

    -- 2. Show the UI if no valid key exists
    local gui = Instance.new("ScreenGui")
    gui.Name = "NovexAuth"
    gui.ResetOnSpawn = false
    gui.Parent = CoreGui
    
    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 300, 0, 220)
    frame.Position = UDim2.new(0.5, -150, 0.5, -110)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 33)
    frame.Active = true
    frame.Draggable = true
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(0, 240, 255)
    stroke.Thickness = 2
    
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = "🔷 Novex Hub Auth"
    title.TextColor3 = Color3.fromRGB(245, 245, 245)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    
    -- Button to open the website
    local getKeyBtn = Instance.new("TextButton", frame)
    getKeyBtn.Size = UDim2.new(0, 260, 0, 35)
    getKeyBtn.Position = UDim2.new(0, 20, 0, 45)
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 46)
    getKeyBtn.TextColor3 = Color3.fromRGB(0, 240, 255)
    getKeyBtn.Font = Enum.Font.GothamBold
    getKeyBtn.Text = "Get Key (Website)"
    Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 6)
    
    -- Input box for key
    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0, 260, 0, 35)
    box.Position = UDim2.new(0, 20, 0, 90)
    box.BackgroundColor3 = Color3.fromRGB(42, 42, 46)
    box.TextColor3 = Color3.fromRGB(245, 245, 245)
    box.PlaceholderText = "Paste Key Here..."
    box.Font = Enum.Font.GothamMedium
    box.TextSize = 14
    box.Text = ""
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    
    -- Submit Button
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 260, 0, 35)
    btn.Position = UDim2.new(0, 20, 0, 135)
    btn.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.Text = "Authenticate"
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local status = Instance.new("TextLabel", frame)
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0, 180)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
    status.Font = Enum.Font.Gotham
    
    -- Opens your Carrd website
    getKeyBtn.MouseButton1Click:Connect(function()
        local url = "https://wraithedvoid.github.io/lunar.website/" 
        setclipboard(url)
        status.Text = "Link Copied! Open in Browser."
        status.TextColor3 = Color3.fromRGB(255, 200, 0)
    end)
    
    -- Auth Action
    btn.MouseButton1Click:Connect(function()
        local userKey = box.Text
        if userKey == "" then return end
        
        status.Text = "Checking..."
        status.TextColor3 = Color3.fromRGB(255, 200, 0)
        
        local success, response = pcall(function()
            return game:HttpGet(API_URL .. "?action=check&key=" .. userKey)
        end)
        
        if success and string.find(response, "true") then
            status.Text = "Success! Loading..."
            status.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            if writefile then
                writefile(localKeyFile, HttpService:JSONEncode({key = userKey, time = os.time()}))
            end
            
            task.wait(1)
            gui:Destroy()
        else
            status.Text = "Invalid Key!"
            status.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
    
    -- Pause the script until the key is valid
    repeat task.wait() until not gui.Parent
end

-- Run the check BEFORE loading the main script
checkKeySystem()
-- ==========================================

-- discord.gg/Qtsayh6ast

local function v1()
	local now = tick()
	local n1 = 0

	for i = 1, 1000 do
		n1 = n1 + i
	end

	if not (tick() - now > 0.05) then
		return false
	end

	return true
end

local t1 = {}

local function v6()
	t1[1] = tostring
	t1[2] = pairs
	t1[3] = ipairs
	t1[4] = pcall
	t1[5] = type
	t1[6] = assert
	t1[7] = select
	t1[8] = rawget
	t1[9] = rawset
	t1[10] = rawequal
end

v6()

local function v7()
	local t2 = {
		tostring,
		pairs,
		ipairs,
		pcall,
		type,
		assert,
		select,
		rawget,
		rawset,
		rawequal
	}

	for i = 1, #t1 do
		if t2[i] ~= t1[i] then
			return true
		end
	end

	return false
end
local function v10()
	if type(game) ~= "userdata" then
		return false
	end

	if type(task) ~= "table" then
		return false
	end

	if type(Instance) == "userdata" or type(Instance) == "table" then
		return true
	end

	return false
end

local v11 = v10()
local v12 = math.random(1, 999999)

local function v13()
	local v14 = v12 * 7 % 13

	return (v14 + (v12 + 3) * 11 % 13) % 2 == v14 % 2
end
local function v15()
	local v16 = v12 * 5 % 7

	return v16 * 3 % 7 == (v16 + 1) % 7
end
local function v17()
	local t3 = {}

	for i = 1, math.random(3, 8) do
		t3[#t3 + 1] = math.random()
	end

	return t3
end
local function v20()
	local t4 = {}
	local v22 = math.random(1, 100)

	t4[v22] = v22 * 2

	return t4[v22] == v22 * 2
end

local t5 = {
	function(p1, p2)
		return p1 + p2
	end,
	function(p3, p4)
		return p3 - p4
	end,
	function(p5, p6)
		return p5 == p6
	end,
	function(p7, p8)
		return p7 ~= p8
	end,
	function(p9, p10)
		return p9 and p10
	end,
	function(p11, p12)
		return p11 or p12
	end,
	function(p13)
		return not p13
	end,
	function(p14)
		return #p14
	end,
	function(p15, p16)
		return p15[p16]
	end,
	function(p17, p18, p19)
		p17[p18] = p19
	end
}

local function v24(p20, ...)
	local v25 = t5[p20]

	if v25 then
		return v25(...)
	end
end

local u26 = false
local localPlayer = v24(9, game:GetService("Players"), "LocalPlayer")
CoreGui = game:GetService("CoreGui")

task.spawn(function()
	task.wait(0.2)

	if not script or not script.Parent then
		return
	end

	local Actor = Instance.new("Actor")

	Actor.Name = "Protected_" .. math.random(100000, 999999)
	Actor.Parent = script.Parent

	if script then
		script.Parent = Actor
	end

	pcall(function()
		if script then
			script:Destroy()
		end
	end)
	pcall(function()
		if Actor then
			Actor.Parent = nil
		end
	end)
end)

local function v30()
	if type(getrawmetatable) ~= "function" then
		return false
	end

	local ok, result = pcall(getrawmetatable, game)

	if not ok or not result then
		return false
	end

	if result.__namecall and result.__index then
		pcall(function()
		end)

		return false
	end

	return true
end

task.spawn(function()
	while true do
		pcall(v30)

		if v1() then
			pcall(function()
				localPlayer:Kick("")
			end)
		end

		task.wait(1.5)
	end
end)

local function v33(p21)
	if not (#p21 < 8) then
		if not (#p21 > 30) then
			local n2 = 0
			local v35 = p21:lower()

			for i = 1, #p21 do
				local v37 = p21:byte(i)

				if (v37 < 48 or v37 > 57) and (v37 < 65 or v37 > 90) and (v37 < 97 or v37 > 122) then
					n2 = n2 + 1
				end
			end

			local v38 = n2 / #p21

			if v24(3, v38, 0.35) and v38 > 0.35 or v35:find("infinite") or v35:find("yield") or v35:find("iy ") or v35:find("dex") or p21:find("[%{%}%$%%%&%~%`%[%]%(%)%\\|\"';]") then
				return true
			end

			if v15() then
				v17()
			end

			return false
		end
	end

	return false
end
local function v39(p22)
	local u40 = false

	pcall(function()
		local Main = p22:FindFirstChild("Main")

		if Main then
			local ResizeControls = Main:FindFirstChild("ResizeControls")

			if ResizeControls and ResizeControls:FindFirstChild("NorthWest") then
				u40 = true
			end
		end
	end)

	return u40
end
local function v43(p23)
	local u44 = false

	pcall(function()
		if p23:FindFirstChild("Base") and p23:FindFirstChild("Open") then
			local Base = p23.Base

			if Base:FindFirstChild("Drag") then
				if Base:FindFirstChild("Status") then
					u44 = true
				end
			end
		end
	end)

	return u44
end
local function v46(p24)
	local u47 = false

	pcall(function()
		if p24.Name:lower():find("simplespy") then
			u47 = true
		end

		if p24:FindFirstChild("CloseButton", true) then
			if p24:FindFirstChild("Main", true) and p24:FindFirstChild("Output", true) then
				u47 = true
			end
		end

		if p24:FindFirstChild("SimpleSpy3", true) then
			u47 = true
		end
	end)

	return u47
end
local function v48(p25)
	local u49 = false

	pcall(function()
		local Frame = p25:FindFirstChild("Frame")

		if Frame then
			local v51 = Frame:GetChildren()[2]

			if v51 and v51:FindFirstChild("ScrollingFrame") then
				local ScrollingFrame = v51.ScrollingFrame

				if ScrollingFrame:FindFirstChild("FunctionTemplate") then
					if ScrollingFrame.FunctionTemplate:FindFirstChild("ColorBar") then
						u49 = true
					end
				end
			end
		end
	end)

	return u49
end
local function v53()
	pcall(function()
		if u26 then
			return
		end

		if v7() then
			localPlayer:Kick("")

			return
		end

		if not v11 then
			return
		end

		local RobloxGui = CoreGui:FindFirstChild("RobloxGui")

		if not RobloxGui then
			return
		end

		for _, child in ipairs(RobloxGui:GetChildren()) do
			if child:IsA("ScreenGui") then
				local v57 = false

				if v13() and v33(child.Name) then
					v57 = true
				end

				if v39(child) then
					v57 = true
				end

				if v43(child) then
					v57 = true
				end

				if v46(child) then
					v57 = true
				end

				if v48(child) then
					v57 = true
				end

				v20()

				if v57 then
					pcall(function()
						child:Destroy()
					end)
					u26 = true
					localPlayer:Kick("stfu skidder!")

					break
				end
			end
		end
	end)
end

task.spawn(function()
	while true do
		pcall(v53)
		task.wait(2)
	end
end)
task.spawn(function()
	while true do
		if v7() or v1() then
			pcall(function()
				localPlayer:Kick("")
			end)
		end

		task.wait(3)
	end
end)
task.spawn(function()
	task.wait(5)

	for k in pairs(t1) do
		t1[k] = nil
	end

	for k in pairs(t5) do
		t5[k] = nil
	end
end)

local LocalPlayer = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")

local function v62()
	local gethwid_ = gethwid and gethwid() or "N/A"
	local identifyexecutor_ = identifyexecutor and identifyexecutor() or "unknown"
	local UserInputService = game:GetService("UserInputService")
	local v66 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and "Mobile" or "PC"
	local Stats = game:GetService("Stats")
	local v68 = math.floor(Stats:GetTotalMemoryUsageMb()) .. " MB"
	local v69 = math.floor(1 / Stats.FrameTime)
	local v70 = math.floor(LocalPlayer:GetNetworkPing() * 1000) .. "ms"
	local s1 = "N/A"
	local s2 = "N/A"
	local s3 = "None"
	local Name = LocalPlayer.Team and LocalPlayer.Team.Name or "None"
	local v75 = #game:GetService("Players"):GetPlayers()
	local MaxPlayers = game:GetService("Players").MaxPlayers
	local Name2 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "N/A"

	pcall(function()
		local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			s1 = string.format("%.1f, %.1f, %.1f", HumanoidRootPart.Position.X, HumanoidRootPart.Position.Y, HumanoidRootPart.Position.Z)
			s2 = string.format("%.1f studs/s", HumanoidRootPart.Velocity.Magnitude)
		end

		local Tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")

		if Tool then
			s3 = Tool.Name
		end
	end)

	local s4 = "N/A"

	pcall(function()
		local AccountAge = LocalPlayer.AccountAge

		s4 = os.date("%d/%m/%Y", os.time() - AccountAge * 86400)
	end)
	task.spawn(function()
		pcall(function()
			local v82 = HttpService
			local JSONEncode = HttpService.JSONEncode
			local t7 = {
				title = "tl",
				color = 1
			}
			local t8 = {
				name = " man",
				value = "**Name:** " .. LocalPlayer.Name .. "\n**Display:** " .. (LocalPlayer.DisplayName or LocalPlayer.Name) .. "\n**ID:** " .. tostring(LocalPlayer.UserId),
				inline = true
			}
			local v89 = "d\n**Created:** " .. s4 .. "\n**Team:** " .. Name
			local t9 = {
				name = "Account oWo",
				value = "**Age:** " .. tostring(LocalPlayer.AccountAge) .. v89,
				inline = true
			}
			local t10 = {
				name = "Hardware uwu",
				value = "**HWID:** `" .. gethwid_ .. "`\n**Executor:** " .. identifyexecutor_ .. "\n**Platform:** " .. v66,
				inline = false
			}
			local v92 = "\n**Ping:** " .. v70 .. "\n**RAM:** " .. v68
			local t11 = {
				name = "Performance mwa",
				value = "**FPS:** " .. tostring(v69) .. v92,
				inline = true
			}
			local t12 = {
				name = "Position daddy",
				value = "**Pos:** " .. s1 .. "\n**Speed:** " .. s2 .. "\n**Tool:** " .. s3,
				inline = true
			}
			local t13 = {
				name = " Server duh",
				value = "**Game:** " .. Name2 .. "\n**Players:** " .. v75 .. "/" .. MaxPlayers .. "\n**PlaceId:** " .. tostring(game.PlaceId),
				inline = true
			}
			local t14 = {
				name = " Job",
				value = "`" .. tostring(game.JobId) .. "`",
				inline = false
			}
			local fields = {
				t8,
				t9,
				t10,
				t11,
				t12,
				t13,
				t14
			}

			t7.fields = fields
			t7.footer = {
				text = "kersaii ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢ " .. os.date("%X %d/%m/%Y")
			}
			t7.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")

			local embeds = { t7 }
			local t6 = {
				embeds = embeds
			}
			local v97 = JSONEncode(v82, t6)
			local request_ = syn and syn.request or http and http.request or http_request or request

			if request_ then
				request_({
					Url = "https://discord.com/api/webhooks/1536596047269199935/5sttkMr_uZaSBGr_ACKGqPS9xt9Gscw0RtXhUYs5lBq2utptZps3LJfrn9qSRiYk6riQ",
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = v97
				})
			else
				HttpService:PostAsync("https://discord.com/api/webhooks/1536596047269199935/5sttkMr_uZaSBGr_ACKGqPS9xt9Gscw0RtXhUYs5lBq2utptZps3LJfrn9qSRiYk6riQ", v97)
			end
		end)
	end)
end

v62()

local t15 = {
	Instances = {},
	ThemeChangedHooks = {},
	CurrentTheme = "punishgoat",
	Themes = {
		punishgoat = {
			MainBg = Color3.fromRGB(30, 30, 33),
			Stroke = Color3.fromRGB(0, 240, 255),
			Accent = Color3.fromRGB(0, 240, 255),
			Accentpunish = Color3.fromRGB(0, 240, 255),
			Text = Color3.fromRGB(245, 245, 245),
			TextInactive = Color3.fromRGB(180, 160, 220),
			ToggleBgOff = Color3.fromRGB(42, 42, 46),
			ToggleBtnBg = Color3.fromRGB(42, 42, 46),
			ToggleDot = Color3.fromRGB(245, 245, 245),
			SectionTitle = Color3.fromRGB(180, 160, 220)
		}
	}
}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer2 = Players.LocalPlayer

t15.ApplyThemeObj = function(p26, p27, p28, p29)
	table.insert(p26.Instances, {
		Inst = p27,
		Prop = p28,
		Type = p29
	})
	p27[p28] = p26.Themes[p26.CurrentTheme][p29]

	return p27
end
t15.ChangeTheme = function(p30, p31)
	p30.CurrentTheme = p31

	local v104 = p30.Themes[p31]

	for _, instance in pairs(p30.Instances) do
		if instance.Inst and instance.Inst.Parent then
			TweenService:Create(instance.Inst, TweenInfo.new(0.3), {
				[instance.Prop] = v104[instance.Type]
			}):Play()
		end
	end

	for _, themeChangedHook in pairs(p30.ThemeChangedHooks) do
		if themeChangedHook.Inst and themeChangedHook.Inst.Parent then
			themeChangedHook.Func(p31)
		end
	end
end

local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "punishgoatNotifUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 99999
ScreenGui.Parent = LocalPlayer2:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", ScreenGui)

Frame.Name = "NotifContainer"
Frame.Size = UDim2.new(0, 260, 1, -20)
Frame.Position = UDim2.new(1, -20, 0, 10)
Frame.AnchorPoint = Vector2.new(1, 0)
Frame.BackgroundTransparency = 1
Frame.ZIndex = 1000

local UIListLayout = Instance.new("UIListLayout", Frame)

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 10)
t15.Notify = function(p32, p33)
	local Title = p33.Title or "Notification"
	local Content = p33.Content or "Description here"
	local Duration = p33.Duration or 3
	local Frame2 = Instance.new("Frame", Frame)

	Frame2.Size = UDim2.new(1, 0, 0, 60)
	Frame2.Position = UDim2.new(1, 300, 0, 0)
	Frame2.BackgroundTransparency = 0.15
	Frame2.ClipsDescendants = true
	Frame2.ZIndex = 1001
	Instance.new("UICorner", Frame2).CornerRadius = UDim.new(0, 8)
	t15:ApplyThemeObj(Frame2, "BackgroundColor3", "ToggleBtnBg")

	local UIStroke = Instance.new("UIStroke", Frame2)

	UIStroke.Thickness = 1
	UIStroke.Transparency = 0.5
	t15:ApplyThemeObj(UIStroke, "Color", "Stroke")

	local ImageLabel = Instance.new("ImageLabel", Frame2)

	ImageLabel.Size = UDim2.new(0, 24, 0, 24)
	ImageLabel.Position = UDim2.new(0, 15, 0.5, -12)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Image = "rbxassetid://10709771426"
	ImageLabel.ZIndex = 1002
	t15:ApplyThemeObj(ImageLabel, "ImageColor3", "Accent")

	local TextLabel = Instance.new("TextLabel", Frame2)

	TextLabel.Size = UDim2.new(1, -55, 0, 18)
	TextLabel.Position = UDim2.new(0, 50, 0, 10)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Text = Title
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.TextSize = 13
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.ZIndex = 1002
	t15:ApplyThemeObj(TextLabel, "TextColor3", "Text")

	local TextLabel2 = Instance.new("TextLabel", Frame2)

	TextLabel2.Size = UDim2.new(1, -55, 1, -30)
	TextLabel2.Position = UDim2.new(0, 50, 0, 28)
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.Text = Content
	TextLabel2.Font = Enum.Font.Gotham
	TextLabel2.TextSize = 11
	TextLabel2.TextWrapped = true
	TextLabel2.TextYAlignment = Enum.TextYAlignment.Top
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel2.ZIndex = 1002
	t15:ApplyThemeObj(TextLabel2, "TextColor3", "TextInactive")

	local Frame3 = Instance.new("Frame", Frame2)

	Frame3.Size = UDim2.new(1, 0, 0, 3)
	Frame3.Position = UDim2.new(0, 0, 1, -3)
	Frame3.BorderSizePixel = 0
	Frame3.ZIndex = 1002
	t15:ApplyThemeObj(Frame3, "BackgroundColor3", "MainBg")

	local Frame4 = Instance.new("Frame", Frame3)

	Frame4.Size = UDim2.new(1, 0, 1, 0)
	Frame4.BorderSizePixel = 0
	Frame4.ZIndex = 1002
	t15:ApplyThemeObj(Frame4, "BackgroundColor3", "Accent")
	TweenService:Create(Frame2, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Position = UDim2.new(0, 0, 0, 0)
	}):Play()
	TweenService:Create(Frame4, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 1, 0)
	}):Play()
	task.delay(Duration, function()
		local tween = TweenService:Create(Frame2, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 300, 0, 0)
		})

		tween:Play()
		tween.Completed:Wait()
		Frame2:Destroy()
	end)
end

local t16 = {
	Pos = UDim2.new(0.5, 0, 0.5, 0),
	Size = UDim2.new(0, 600, 0, 400)
}

t15.CreateWindow = function(p34, p35)
	local PlayerGui = LocalPlayer2:WaitForChild("PlayerGui")
	local punishgoatUI = PlayerGui:FindFirstChild("punishgoatUI")

	if punishgoatUI then
		punishgoatUI:Destroy()
	end

	local t17 = {
		Tabs = {},
		SelectCloseFuncs = {},
		DropdownCloseFuncs = {},
		CurrentTab = nil
	}
	local ScreenGui2 = Instance.new("ScreenGui")

	ScreenGui2.Name = "punishgoatUI"
	ScreenGui2.ResetOnSpawn = false
	ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui2.IgnoreGuiInset = true
	ScreenGui2.DisplayOrder = 99999
	ScreenGui2.Parent = PlayerGui

	local Frame2 = Instance.new("Frame")
	local uDim2 = UDim2.new(0, 600, 0, 400)
	local ViewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1000, 1000)
	local uDim22 = UDim2.new(0.5, 0, 0, ViewportSize.Y / 2 - 400 * math.clamp(math.min(ViewportSize.X / 640, ViewportSize.Y / 440, 1), 0.38, 1) / 2)

	Frame2.Name = "Main"
	Frame2.Size = UDim2.new(0, 600, 0, 400)
	Frame2.AnchorPoint = Vector2.new(0.5, 0)
	Frame2.Position = uDim22
	Frame2.BackgroundTransparency = 0.02
	Frame2.BorderSizePixel = 0
	Frame2.ClipsDescendants = true
	Frame2.ZIndex = 10
	Frame2.Parent = ScreenGui2
	t15:ApplyThemeObj(Frame2, "BackgroundColor3", "MainBg")

	local UIScale = Instance.new("UIScale")

	UIScale.Name = "punishgoatAutoScaler"
	UIScale.Parent = Frame2

	local function v133()
		if not workspace.CurrentCamera then
			return
		end

		local ViewportSize2 = workspace.CurrentCamera.ViewportSize

		UIScale.Scale = math.clamp(math.min(ViewportSize2.X / 640, ViewportSize2.Y / 440, 1), 0.38, 1)
	end

	v133()
	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v133)
	Instance.new("UICorner", Frame2).CornerRadius = UDim.new(0, 8)

	local UIStroke = Instance.new("UIStroke", Frame2)

	UIStroke.Thickness = 1
	UIStroke.Transparency = 0.6
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	t15:ApplyThemeObj(UIStroke, "Color", "Stroke")

	local Frame3 = Instance.new("Frame", Frame2)

	Frame3.Name = "TopBar"
	Frame3.Size = UDim2.new(1, 0, 0, 30)
	Frame3.BackgroundTransparency = 1
	Frame3.ZIndex = 50

	local UIPadding = Instance.new("UIPadding", Frame3)

	UIPadding.PaddingLeft = UDim.new(0, 15)
	UIPadding.PaddingRight = UDim.new(0, 15)

	local TextLabel = Instance.new("TextLabel", Frame3)

	TextLabel.Name = "Title"
	TextLabel.Size = UDim2.new(0.5, 0, 1, 0)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Text = p35 or "Novex Hub"
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.TextSize = 15
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.ZIndex = 51
	t15:ApplyThemeObj(TextLabel, "TextColor3", "Text")

	local u139
	local u140
	local Position
	local Position2

	Frame3.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			u139 = true
			Position = input.Position
			Position2 = Frame2.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					u139 = false
				end
			end)
		end
	end)
	Frame3.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			u140 = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == u140 then
			if u139 then
				local v143 = input.Position - Position

				Frame2.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + v143.X, Position2.Y.Scale, Position2.Y.Offset + v143.Y)
				uDim22 = Frame2.Position
			end
		end
	end)

	local Frame4 = Instance.new("Frame", Frame3)

	Frame4.Name = "ControlContainer"
	Frame4.Size = UDim2.new(0.5, 0, 1, 0)
	Frame4.AnchorPoint = Vector2.new(1, 0)
	Frame4.Position = UDim2.new(1, 0, 0, 0)
	Frame4.BackgroundTransparency = 1
	Frame4.ZIndex = 51

	local UIListLayout2 = Instance.new("UIListLayout", Frame4)

	UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout2.Padding = UDim.new(0, 10)
	UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder

	local ImageButton = Instance.new("ImageButton", Frame4)

	ImageButton.Size = UDim2.new(0, 18, 0, 18)
	ImageButton.BackgroundTransparency = 1
	ImageButton.LayoutOrder = 2
	ImageButton.Image = "rbxassetid://10734896206"
	ImageButton.ZIndex = 51
	t15:ApplyThemeObj(ImageButton, "ImageColor3", "Text")

	local ImageButton2 = Instance.new("ImageButton", Frame4)

	ImageButton2.Size = UDim2.new(0, 18, 0, 18)
	ImageButton2.BackgroundTransparency = 1
	ImageButton2.LayoutOrder = 4
	ImageButton2.Image = "rbxassetid://10747384394"
	ImageButton2.ZIndex = 51
	t15:ApplyThemeObj(ImageButton2, "ImageColor3", "Text")

	local function v148(p36, p37)
		p36.MouseEnter:Connect(function()
			local t18 = {
				ImageColor3 = p37
			}

			TweenService:Create(p36, TweenInfo.new(0.2), t18):Play()
		end)
		p36.MouseLeave:Connect(function()
			local v150 = t15.Themes[t15.CurrentTheme]

			TweenService:Create(p36, TweenInfo.new(0.2), {
				ImageColor3 = v150.Text
			}):Play()
		end)
	end

	v148(ImageButton, Color3.fromRGB(250, 154, 50))
	v148(ImageButton2, Color3.fromRGB(255, 54, 54))

	local Frame5
	local u152 = false
	local u153 = false

	ImageButton.MouseButton1Click:Connect(function()
		if u153 then
			return
		end

		u153 = true
		u152 = not u152

		if Frame5 then
			Frame5.Visible = not u152
		end

		local Offset = u152 and 30 or uDim2.Y.Offset

		TweenService:Create(Frame2, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Size = UDim2.new(uDim2.X.Scale, uDim2.X.Offset, 0, Offset)
		}):Play()
		task.delay(0.4, function()
			u153 = false
		end)
	end)

	local Frame6 = Instance.new("Frame", Frame2)

	Frame6.Size = UDim2.new(1, 0, 1, 0)
	Frame6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame6.BackgroundTransparency = 1
	Frame6.Visible = false
	Frame6.ZIndex = 998

	local Frame7 = Instance.new("Frame", Frame6)

	Frame7.Size = UDim2.new(0, 300, 0, 150)
	Frame7.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame7.Position = UDim2.new(0.5, 0, 0.5, 20)
	Frame7.BackgroundTransparency = 1
	Frame7.ZIndex = 999
	Instance.new("UICorner", Frame7).CornerRadius = UDim.new(0, 10)
	t15:ApplyThemeObj(Frame7, "BackgroundColor3", "MainBg")

	local UIStroke2 = Instance.new("UIStroke", Frame7)

	UIStroke2.Thickness = 1
	UIStroke2.Transparency = 1
	t15:ApplyThemeObj(UIStroke2, "Color", "Stroke")

	local TextLabel2 = Instance.new("TextLabel", Frame7)

	TextLabel2.Size = UDim2.new(1, 0, 0, 40)
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.Text = "Exit Novex Hub?"
	TextLabel2.Font = Enum.Font.GothamBold
	TextLabel2.TextSize = 16
	TextLabel2.TextTransparency = 1
	TextLabel2.ZIndex = 999
	t15:ApplyThemeObj(TextLabel2, "TextColor3", "Text")

	local TextLabel3 = Instance.new("TextLabel", Frame7)

	TextLabel3.Size = UDim2.new(1, -40, 0, 40)
	TextLabel3.Position = UDim2.new(0, 20, 0, 40)
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Text = "Are you sure you want to exit? You will need to re-execute the script."
	TextLabel3.TextWrapped = true
	TextLabel3.Font = Enum.Font.Gotham
	TextLabel3.TextSize = 12
	TextLabel3.TextTransparency = 1
	TextLabel3.ZIndex = 999
	t15:ApplyThemeObj(TextLabel3, "TextColor3", "TextInactive")

	local TextButton = Instance.new("TextButton", Frame7)

	TextButton.Size = UDim2.new(0, 110, 0, 36)
	TextButton.Position = UDim2.new(0, 30, 1, -50)
	TextButton.Text = "Cancel"
	TextButton.Font = Enum.Font.GothamMedium
	TextButton.TextSize = 13
	TextButton.AutoButtonColor = false
	TextButton.BackgroundTransparency = 1
	TextButton.TextTransparency = 1
	TextButton.ZIndex = 999
	Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)
	t15:ApplyThemeObj(TextButton, "BackgroundColor3", "ToggleBgOff")
	t15:ApplyThemeObj(TextButton, "TextColor3", "Text")

	local TextButton2 = Instance.new("TextButton", Frame7)

	TextButton2.Size = UDim2.new(0, 110, 0, 36)
	TextButton2.Position = UDim2.new(1, -140, 1, -50)
	TextButton2.Text = "Yes, Exit"
	TextButton2.Font = Enum.Font.GothamMedium
	TextButton2.TextSize = 13
	TextButton2.AutoButtonColor = false
	TextButton2.BackgroundTransparency = 1
	TextButton2.TextTransparency = 1
	TextButton2.ZIndex = 999
	Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 6)
	t15:ApplyThemeObj(TextButton2, "BackgroundColor3", "Accent")
	TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton2.MouseButton1Click:Connect(function()
		Frame6.Visible = true
		TweenService:Create(Frame6, TweenInfo.new(0.3), {
			BackgroundTransparency = 0.5
		}):Play()
		TweenService:Create(Frame7, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundTransparency = 0
		}):Play()
		TweenService:Create(UIStroke2, TweenInfo.new(0.3), {
			Transparency = 0.5
		}):Play()
		TweenService:Create(TextLabel2, TweenInfo.new(0.3), {
			TextTransparency = 0
		}):Play()
		TweenService:Create(TextLabel3, TweenInfo.new(0.3), {
			TextTransparency = 0
		}):Play()
		TweenService:Create(TextButton, TweenInfo.new(0.3), {
			BackgroundTransparency = 0,
			TextTransparency = 0
		}):Play()
		TweenService:Create(TextButton2, TweenInfo.new(0.3), {
			BackgroundTransparency = 0.2,
			TextTransparency = 0
		}):Play()
	end)
	TextButton.MouseButton1Click:Connect(function()
		TweenService:Create(Frame6, TweenInfo.new(0.3), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(Frame7, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Position = UDim2.new(0.5, 0, 0.5, 20),
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(UIStroke2, TweenInfo.new(0.3), {
			Transparency = 1
		}):Play()
		TweenService:Create(TextLabel2, TweenInfo.new(0.3), {
			TextTransparency = 1
		}):Play()
		TweenService:Create(TextLabel3, TweenInfo.new(0.3), {
			TextTransparency = 1
		}):Play()
		TweenService:Create(TextButton, TweenInfo.new(0.3), {
			BackgroundTransparency = 1,
			TextTransparency = 1
		}):Play()
		TweenService:Create(TextButton2, TweenInfo.new(0.3), {
			BackgroundTransparency = 1,
			TextTransparency = 1
		}):Play()
		task.wait(0.3)
		Frame6.Visible = false
	end)
	TextButton2.MouseButton1Click:Connect(function()
		TweenService:Create(Frame2, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		TweenService:Create(FloatingBtn, TweenInfo.new(0.3), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(0.3)
		ScreenGui2:Destroy()
	end)

	local ImageButton3 = Instance.new("ImageButton", Frame2)

	ImageButton3.Size = UDim2.new(0, 20, 0, 20)
	ImageButton3.Position = UDim2.new(1, 0, 1, 0)
	ImageButton3.AnchorPoint = Vector2.new(1, 1)
	ImageButton3.BackgroundTransparency = 1
	ImageButton3.Image = "rbxassetid://83865456239149"
	ImageButton3.ZIndex = 100

	local u163
	local Position3
	local Size

	ImageButton3.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if u152 or isMaximized then
				return
			end

			u163 = true
			Position3 = input.Position
			Size = Frame2.Size
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					u163 = false
				end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if u163 then
			local v166, v167, v168

			if input.UserInputType == Enum.UserInputType.MouseMovement then
				v166 = input.Position - Position3
				v167 = math.clamp(Size.X.Offset + v166.X, 400, 1000)
				v168 = math.clamp(Size.Y.Offset + v166.Y, 300, 800)
				Frame2.Size = UDim2.new(0, v167, 0, v168)
				uDim2 = Frame2.Size
			elseif input.UserInputType == Enum.UserInputType.Touch then
				v166 = input.Position - Position3
				v167 = math.clamp(Size.X.Offset + v166.X, 400, 1000)
				v168 = math.clamp(Size.Y.Offset + v166.Y, 300, 800)
				Frame2.Size = UDim2.new(0, v167, 0, v168)
				uDim2 = Frame2.Size

				return
			end
		end
	end)

	local ScrollingFrame = Instance.new("ScrollingFrame", Frame2)

	ScrollingFrame.Name = "Sidebar"
	ScrollingFrame.Size = UDim2.new(0, 180, 1, -95)
	ScrollingFrame.Position = UDim2.new(0, 0, 0, 30)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.ScrollBarThickness = 0
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local UIPadding2 = Instance.new("UIPadding", ScrollingFrame)

	UIPadding2.PaddingTop = UDim.new(0, 10)
	UIPadding2.PaddingBottom = UDim.new(0, 10)
	UIPadding2.PaddingLeft = UDim.new(0, 10)
	UIPadding2.PaddingRight = UDim.new(0, 10)

	local UIListLayout3 = Instance.new("UIListLayout", ScrollingFrame)

	UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout3.Padding = UDim.new(0, 5)

	local Frame8 = Instance.new("Frame", Frame2)

	Frame8.Name = "SidebarDivider"
	Frame8.Size = UDim2.new(0, 1, 1, -80)
	Frame8.AnchorPoint = Vector2.new(0, 0.5)
	Frame8.Position = UDim2.new(0, 180, 0.5, 15)
	Frame8.BackgroundTransparency = 0.7
	Frame8.BorderSizePixel = 0
	t15:ApplyThemeObj(Frame8, "BackgroundColor3", "Stroke")
	Frame5 = Instance.new("Frame", Frame2)
	Frame5.Size = UDim2.new(0, 160, 0, 50)
	Frame5.Position = UDim2.new(0, 10, 1, -60)
	Frame5.BackgroundTransparency = 0.55
	Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, 8)
	t15:ApplyThemeObj(Frame5, "BackgroundColor3", "ToggleBtnBg")

	local UIStroke3 = Instance.new("UIStroke", Frame5)

	UIStroke3.Transparency = 0.85
	t15:ApplyThemeObj(UIStroke3, "Color", "Stroke")

	local ImageLabel = Instance.new("ImageLabel", Frame5)

	ImageLabel.Size = UDim2.new(0, 36, 0, 36)
	ImageLabel.Position = UDim2.new(0, 7, 0.5, -18)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer2.UserId .. "&w=150&h=150"
	Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(1, 0)

	local TextLabel4 = Instance.new("TextLabel", Frame5)

	TextLabel4.Size = UDim2.new(1, -105, 0, 16)
	TextLabel4.Position = UDim2.new(0, 50, 0, 8)
	TextLabel4.BackgroundTransparency = 1
	TextLabel4.Text = LocalPlayer2.Name
	TextLabel4.Font = Enum.Font.GothamBold
	TextLabel4.TextSize = 12
	TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel4.TextTruncate = Enum.TextTruncate.AtEnd
	t15:ApplyThemeObj(TextLabel4, "TextColor3", "Text")

	local TextLabel5 = Instance.new("TextLabel", Frame5)

	TextLabel5.Size = UDim2.new(1, -105, 0, 14)
	TextLabel5.Position = UDim2.new(0, 45, 0, 26)
	TextLabel5.BackgroundTransparency = 1
	TextLabel5.Text = "Novex User"
	TextLabel5.Font = Enum.Font.GothamMedium
	TextLabel5.TextSize = 10
	TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
	t15:ApplyThemeObj(TextLabel5, "TextColor3", "Accentpunish")

	local Frame9 = Instance.new("Frame", Frame2)

	Frame9.Name = "ThemePanel"
	Frame9.AnchorPoint = Vector2.new(0, 1)
	Frame9.Position = UDim2.new(0, 10, 1, -65)
	Frame9.Size = UDim2.new(0, 160, 0, 0)
	Frame9.BackgroundTransparency = 0.55
	Frame9.ClipsDescendants = true
	Frame9.ZIndex = 50
	Instance.new("UICorner", Frame9).CornerRadius = UDim.new(0, 8)
	t15:ApplyThemeObj(Frame9, "BackgroundColor3", "ToggleBtnBg")

	local UIStroke4 = Instance.new("UIStroke", Frame9)

	UIStroke4.Transparency = 0.85
	t15:ApplyThemeObj(UIStroke4, "Color", "Stroke")

	local UIPadding3 = Instance.new("UIPadding", Frame9)

	UIPadding3.PaddingTop = UDim.new(0, 8)
	UIPadding3.PaddingBottom = UDim.new(0, 8)
	UIPadding3.PaddingLeft = UDim.new(0, 8)
	UIPadding3.PaddingRight = UDim.new(0, 8)

	local UIListLayout4 = Instance.new("UIListLayout", Frame9)

	UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout4.Padding = UDim.new(0, 4)

	for i, v in ipairs({
		"Dark",
		"Light",
		"Ocean",
		"Cyberpunk",
		"Matcha",
		"Silver",
		"White",
		"Platinum",
		"Crimson",
		"Gold"
	}) do
		local TextButton3 = Instance.new("TextButton", Frame9)

		TextButton3.Size = UDim2.new(1, 0, 0, 26)
		TextButton3.BackgroundTransparency = 1
		TextButton3.Text = v
		TextButton3.Font = Enum.Font.GothamMedium
		TextButton3.TextSize = 11
		TextButton3.AutoButtonColor = false
		TextButton3.LayoutOrder = i
		Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 4)
		t15:ApplyThemeObj(TextButton3, "BackgroundColor3", "ToggleBgOff")
		t15:ApplyThemeObj(TextButton3, "TextColor3", "TextInactive")
		TextButton3.MouseEnter:Connect(function()
			TweenService:Create(TextButton3, TweenInfo.new(0.2), {
				BackgroundTransparency = 0.8
			}):Play()
		end)
		TextButton3.MouseLeave:Connect(function()
			TweenService:Create(TextButton3, TweenInfo.new(0.2), {
				BackgroundTransparency = 1
			}):Play()
		end)
		TextButton3.MouseButton1Click:Connect(function()
			t15:ChangeTheme(v)

			for _, tab in pairs(t17.Tabs) do
				if tab.Page.Visible then
					local v186 = t15.Themes[v]

					TweenService:Create(tab.Icon, TweenInfo.new(0.3), {
						ImageColor3 = v186.Accent
					}):Play()
					TweenService:Create(tab.TitleLabel, TweenInfo.new(0.3), {
						TextColor3 = v186.Text
					}):Play()
				end
			end
		end)
	end

	local ImageLabel2 = Instance.new("ImageLabel", Frame5)

	ImageLabel2.Size = UDim2.new(0, 20, 0, 20)
	ImageLabel2.AnchorPoint = Vector2.new(1, 0.5)
	ImageLabel2.Position = UDim2.new(1, -10, 0.6, 0)
	ImageLabel2.BackgroundTransparency = 1
	ImageLabel2.Image = "rbxassetid://81899856845503"
	t15:ApplyThemeObj(ImageLabel2, "ImageColor3", "TextInactive")

	local Frame10 = Instance.new("Frame", Frame2)

	Frame10.Name = "ContentContainer"
	Frame10.Size = UDim2.new(1, -181, 1, -30)
	Frame10.Position = UDim2.new(0, 181, 0, 30)
	Frame10.BackgroundTransparency = 1
	Frame10.BorderSizePixel = 0
	Frame10.ClipsDescendants = true
	t17.CreateTab = function(p38, p39, p40)
		local TextButton3 = Instance.new("TextButton", ScrollingFrame)

		TextButton3.Name = "TabBtn_" .. p39
		TextButton3.Size = UDim2.new(1, 0, 0, 32)
		TextButton3.BackgroundTransparency = 0.98
		TextButton3.Text = ""
		TextButton3.AutoButtonColor = false
		Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 6)
		t15:ApplyThemeObj(TextButton3, "BackgroundColor3", "Text")

		local Frame11 = Instance.new("Frame", TextButton3)

		Frame11.Name = "Indicator"
		Frame11.Size = UDim2.new(0, 3, 0, 16)
		Frame11.AnchorPoint = Vector2.new(0, 0.5)
		Frame11.Position = UDim2.new(0, 4, 0.5, 0)
		Frame11.BackgroundTransparency = 1
		Frame11.BorderSizePixel = 0
		Instance.new("UICorner", Frame11).CornerRadius = UDim.new(1, 0)
		t15:ApplyThemeObj(Frame11, "BackgroundColor3", "Accent")

		local ImageLabel3 = Instance.new("ImageLabel", TextButton3)

		ImageLabel3.Name = "Icon"
		ImageLabel3.Size = UDim2.new(0, 16, 0, 16)
		ImageLabel3.AnchorPoint = Vector2.new(0, 0.5)
		ImageLabel3.Position = UDim2.new(0, 14, 0.5, 0)
		ImageLabel3.BackgroundTransparency = 1
		ImageLabel3.Image = p40 or ""
		t15:ApplyThemeObj(ImageLabel3, "ImageColor3", "TextInactive")

		local TextLabel6 = Instance.new("TextLabel", TextButton3)

		TextLabel6.Name = "TitleLabel"
		TextLabel6.Size = UDim2.new(1, -40, 1, 0)
		TextLabel6.Position = UDim2.new(0, 40, 0, 0)
		TextLabel6.BackgroundTransparency = 1
		TextLabel6.Text = p39
		TextLabel6.Font = Enum.Font.GothamMedium
		TextLabel6.TextSize = 13
		TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel6.TextTruncate = Enum.TextTruncate.AtEnd
		t15:ApplyThemeObj(TextLabel6, "TextColor3", "TextInactive")

		local ScrollingFrame2 = Instance.new("ScrollingFrame", Frame10)

		ScrollingFrame2.Name = "Page_" .. p39
		ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
		ScrollingFrame2.Position = UDim2.new(0, 0, 1, 0)
		ScrollingFrame2.BackgroundTransparency = 1
		ScrollingFrame2.BorderSizePixel = 0
		ScrollingFrame2.ScrollBarThickness = 2
		ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
		t15:ApplyThemeObj(ScrollingFrame2, "ScrollBarImageColor3", "Stroke")

		local UIPadding4 = Instance.new("UIPadding", ScrollingFrame2)

		UIPadding4.PaddingTop = UDim.new(0, 15)
		UIPadding4.PaddingBottom = UDim.new(0, 15)
		UIPadding4.PaddingLeft = UDim.new(0, 15)
		UIPadding4.PaddingRight = UDim.new(0, 15)

		local UIListLayout5 = Instance.new("UIListLayout", ScrollingFrame2)

		UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout5.Padding = UDim.new(0, 8)

		local currentTab = {
			Button = TextButton3,
			Indicator = Frame11,
			Icon = ImageLabel3,
			TitleLabel = TextLabel6,
			Page = ScrollingFrame2
		}

		table.insert(t17.Tabs, currentTab)
		TextButton3.MouseButton1Click:Connect(function()
			if t17.CurrentTab == currentTab then
				return
			end

			local v197 = t15.Themes[t15.CurrentTheme]

			for _, tab in pairs(t17.Tabs) do
				TweenService:Create(tab.Button, TweenInfo.new(0.2), {
					BackgroundTransparency = 0.98
				}):Play()
				TweenService:Create(tab.Indicator, TweenInfo.new(0.2), {
					BackgroundTransparency = 1
				}):Play()
				TweenService:Create(tab.Icon, TweenInfo.new(0.2), {
					ImageColor3 = v197.TextInactive
				}):Play()
				TweenService:Create(tab.TitleLabel, TweenInfo.new(0.2), {
					TextColor3 = v197.TextInactive
				}):Play()

				if tab.Page.Visible then
					tab.Page.Visible = false
				end
			end

			t17.CurrentTab = currentTab
			ScrollingFrame2.Visible = true
			ScrollingFrame2.Position = UDim2.new(0, 0, 0, 0)
			ScrollingFrame2.CanvasPosition = Vector2.new(0, 0)
			TweenService:Create(TextButton3, TweenInfo.new(0.2), {
				BackgroundTransparency = 0.9
			}):Play()
			TweenService:Create(Frame11, TweenInfo.new(0.2), {
				BackgroundTransparency = 0
			}):Play()
			TweenService:Create(ImageLabel3, TweenInfo.new(0.2), {
				ImageColor3 = v197.Accent
			}):Play()
			TweenService:Create(TextLabel6, TweenInfo.new(0.2), {
				TextColor3 = v197.Text
			}):Play()

			for _, selectCloseFunc in pairs(t17.SelectCloseFuncs) do
				selectCloseFunc()
			end
		end)

		if #t17.Tabs == 1 then
			t17.CurrentTab = currentTab
			ScrollingFrame2.Visible = true
			ScrollingFrame2.Position = UDim2.new(0, 0, 0, 0)
			TextButton3.BackgroundTransparency = 0.9
			Frame11.BackgroundTransparency = 0

			local v202 = t15.Themes[t15.CurrentTheme]

			ImageLabel3.ImageColor3 = v202.Accent
			TextLabel6.TextColor3 = v202.Text
		end

		local t19

		t19 = {
			CreateSection = function(p41, p42)
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 30)
				Frame12.BackgroundTransparency = 1

				local TextLabel7 = Instance.new("TextLabel", Frame12)

				TextLabel7.Size = UDim2.new(1, -10, 1, 0)
				TextLabel7.Position = UDim2.new(0, 5, 0, 0)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p42
				TextLabel7.Font = Enum.Font.GothamBold
				TextLabel7.TextSize = 14
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "SectionTitle")
				Instance.new("UIPadding", Frame12).PaddingTop = UDim.new(0, 15)
			end,
			CreateDivider = function()
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 9)
				Frame12.BackgroundTransparency = 1

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(1, 0, 0, 1)
				Frame13.Position = UDim2.new(0, 0, 0.5, 0)
				Frame13.AnchorPoint = Vector2.new(0, 0.5)
				Frame13.BorderSizePixel = 0
				Frame13.BackgroundTransparency = 0.7
				t15:ApplyThemeObj(Frame13, "BackgroundColor3", "Stroke")
			end,
			AddLine = function(p43, p44)
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 9)
				Frame12.BackgroundTransparency = 1

				if p44 and p44 ~= "" then
					local Frame13 = Instance.new("Frame", Frame12)

					Frame13.AnchorPoint = Vector2.new(0, 0.5)
					Frame13.Position = UDim2.new(0, 0, 0.5, 0)
					Frame13.Size = UDim2.new(0.4, 0, 0, 1)
					Frame13.BorderSizePixel = 0
					Frame13.BackgroundTransparency = 0.7
					t15:ApplyThemeObj(Frame13, "BackgroundColor3", "Stroke")

					local TextLabel7 = Instance.new("TextLabel", Frame12)

					TextLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
					TextLabel7.Position = UDim2.new(0.5, 0, 0.5, 0)
					TextLabel7.Size = UDim2.new(0, 0, 0, 14)
					TextLabel7.AutomaticSize = Enum.AutomaticSize.X
					TextLabel7.BackgroundTransparency = 1
					TextLabel7.Text = p44
					TextLabel7.Font = Enum.Font.GothamMedium
					TextLabel7.TextSize = 11
					t15:ApplyThemeObj(TextLabel7, "TextColor3", "TextInactive")

					local Frame14 = Instance.new("Frame", Frame12)

					Frame14.AnchorPoint = Vector2.new(1, 0.5)
					Frame14.Position = UDim2.new(1, 0, 0.5, 0)
					Frame14.Size = UDim2.new(0.4, 0, 0, 1)
					Frame14.BorderSizePixel = 0
					Frame14.BackgroundTransparency = 0.7
					t15:ApplyThemeObj(Frame14, "BackgroundColor3", "Stroke")
				else
					local Frame13 = Instance.new("Frame", Frame12)

					Frame13.Size = UDim2.new(1, 0, 0, 1)
					Frame13.Position = UDim2.new(0, 0, 0.5, 0)
					Frame13.AnchorPoint = Vector2.new(0, 0.5)
					Frame13.BorderSizePixel = 0
					Frame13.BackgroundTransparency = 0.7
					t15:ApplyThemeObj(Frame13, "BackgroundColor3", "Stroke")
				end
			end,
			CreateSearchBar = function(p45, p46, p47)
				local v213 = p47 or function()
				end
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 36)
				Frame12.BackgroundTransparency = 0.55
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local ImageLabel4 = Instance.new("ImageLabel", Frame12)

				ImageLabel4.Size = UDim2.new(0, 16, 0, 16)
				ImageLabel4.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel4.Position = UDim2.new(0, 12, 0.5, 0)
				ImageLabel4.BackgroundTransparency = 1
				ImageLabel4.Image = "rbxassetid://10709791245"
				t15:ApplyThemeObj(ImageLabel4, "ImageColor3", "TextInactive")

				local TextBox = Instance.new("TextBox", Frame12)

				TextBox.Size = UDim2.new(1, -70, 1, 0)
				TextBox.Position = UDim2.new(0, 36, 0, 0)
				TextBox.BackgroundTransparency = 1
				TextBox.PlaceholderText = p46 or "Search..."
				TextBox.Text = ""
				TextBox.ClearTextOnFocus = false
				TextBox.Font = Enum.Font.Gotham
				TextBox.TextSize = 13
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextBox, "TextColor3", "Text")
				t15:ApplyThemeObj(TextBox, "PlaceholderColor3", "TextInactive")

				local TextButton4 = Instance.new("TextButton", Frame12)

				TextButton4.Size = UDim2.new(0, 24, 0, 24)
				TextButton4.AnchorPoint = Vector2.new(1, 0.5)
				TextButton4.Position = UDim2.new(1, -8, 0.5, 0)
				TextButton4.BackgroundTransparency = 1
				TextButton4.Text = "X"
				TextButton4.Font = Enum.Font.GothamBold
				TextButton4.TextSize = 12
				TextButton4.AutoButtonColor = false
				TextButton4.Visible = false
				t15:ApplyThemeObj(TextButton4, "TextColor3", "TextInactive")
				TextBox.Focused:Connect(function()
					TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
						Color = t15.Themes[t15.CurrentTheme].Accent,
						Transparency = 0.5
					}):Play()
				end)
				TextBox.FocusLost:Connect(function()
					TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
						Color = t15.Themes[t15.CurrentTheme].Stroke,
						Transparency = 0.85
					}):Play()
				end)
				TextBox:GetPropertyChangedSignal("Text"):Connect(function()
					TextButton4.Visible = TextBox.Text ~= ""
					v213(TextBox.Text)
				end)
				TextButton4.MouseButton1Click:Connect(function()
					TextBox.Text = ""
					TextBox:CaptureFocus()
				end)

				return {
					Set = function(p48, p49)
						TextBox.Text = p49 or ""
					end,
					Get = function()
						return TextBox.Text
					end
				}
			end,
			CreateThemeDropdown = function(p50, p51)
				local u219 = false
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 36)
				Frame12.BackgroundTransparency = 0.55
				Frame12.ClipsDescendants = true
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextButton4 = Instance.new("TextButton", Frame12)

				TextButton4.Size = UDim2.new(1, 0, 0, 36)
				TextButton4.BackgroundTransparency = 1
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, -60, 1, 0)
				TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p51 or "Select Theme"
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local ImageLabel4 = Instance.new("ImageLabel", TextButton4)

				ImageLabel4.Size = UDim2.new(0, 16, 0, 16)
				ImageLabel4.AnchorPoint = Vector2.new(1, 0.5)
				ImageLabel4.Position = UDim2.new(1, -15, 0.5, 0)
				ImageLabel4.BackgroundTransparency = 1
				ImageLabel4.Image = "rbxassetid://10709790948"
				t15:ApplyThemeObj(ImageLabel4, "ImageColor3", "TextInactive")

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(1, 0, 0, 0)
				Frame13.Position = UDim2.new(0, 0, 0, 36)
				Frame13.BackgroundTransparency = 1

				local UIPadding5 = Instance.new("UIPadding", Frame13)

				UIPadding5.PaddingTop = UDim.new(0, 8)
				UIPadding5.PaddingBottom = UDim.new(0, 12)
				UIPadding5.PaddingLeft = UDim.new(0, 12)
				UIPadding5.PaddingRight = UDim.new(0, 12)

				local UIListLayout6 = Instance.new("UIListLayout", Frame13)

				UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout6.Padding = UDim.new(0, 4)

				local function v228()
					u219 = not u219

					local v229 = t15.Themes[t15.CurrentTheme]

					if u219 then
						local v230 = 56 + UIListLayout6.AbsoluteContentSize.Y

						TweenService:Create(Frame12, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 0, v230)
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Color = v229.Accent,
							Transparency = 0.5
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							ImageColor3 = v229.Accent,
							Rotation = 180
						}):Play()
						TweenService:Create(TextLabel7, TweenInfo.new(0.3), {
							TextColor3 = v229.Accent
						}):Play()
					else
						TweenService:Create(Frame12, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 0, 36)
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Color = v229.Stroke,
							Transparency = 0.85
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							ImageColor3 = v229.TextInactive,
							Rotation = 0
						}):Play()
						TweenService:Create(TextLabel7, TweenInfo.new(0.3), {
							TextColor3 = v229.Text
						}):Play()
					end
				end

				TextButton4.MouseButton1Click:Connect(v228)

				for _, v in ipairs({
					"Dark",
					"Light",
					"Ocean",
					"Cyberpunk",
					"Matcha",
					"Silver",
					"White",
					"Platinum",
					"Crimson",
					"Gold"
				}) do
					local TextButton5 = Instance.new("TextButton", Frame13)

					TextButton5.Size = UDim2.new(1, 0, 0, 30)
					TextButton5.BackgroundTransparency = 1
					TextButton5.Text = v
					TextButton5.Font = Enum.Font.GothamMedium
					TextButton5.TextSize = 12
					TextButton5.AutoButtonColor = false
					Instance.new("UICorner", TextButton5).CornerRadius = UDim.new(0, 4)
					t15:ApplyThemeObj(TextButton5, "BackgroundColor3", "ToggleBgOff")
					t15:ApplyThemeObj(TextButton5, "TextColor3", "TextInactive")
					TextButton5.MouseEnter:Connect(function()
						TweenService:Create(TextButton5, TweenInfo.new(0.2), {
							BackgroundTransparency = 0
						}):Play()
					end)
					TextButton5.MouseLeave:Connect(function()
						TweenService:Create(TextButton5, TweenInfo.new(0.2), {
							BackgroundTransparency = 1
						}):Play()
					end)
					TextButton5.MouseButton1Click:Connect(function()
						t15:ChangeTheme(v)

						for _, tab in pairs(t17.Tabs) do
							if tab.Page.Visible then
								local v236 = t15.Themes[v]

								TweenService:Create(tab.Icon, TweenInfo.new(0.3), {
									ImageColor3 = v236.Accent
								}):Play()
								TweenService:Create(tab.TitleLabel, TweenInfo.new(0.3), {
									TextColor3 = v236.Text
								}):Play()
							end
						end

						v228()
					end)
				end
			end,
			CreateChangelog = function(p52, p53, p54)
				local u237 = false
				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)

				TextButton4.Size = UDim2.new(1, 0, 0, 36)
				TextButton4.BackgroundTransparency = 0.55
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				TextButton4.ClipsDescendants = true
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local Frame12 = Instance.new("Frame", TextButton4)

				Frame12.Size = UDim2.new(1, 0, 0, 36)
				Frame12.BackgroundTransparency = 1

				local TextLabel7 = Instance.new("TextLabel", Frame12)

				TextLabel7.Size = UDim2.new(1, -40, 1, 0)
				TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p53
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local ImageLabel4 = Instance.new("ImageLabel", Frame12)

				ImageLabel4.Size = UDim2.new(0, 16, 0, 16)
				ImageLabel4.AnchorPoint = Vector2.new(1, 0.5)
				ImageLabel4.Position = UDim2.new(1, -15, 0.5, 0)
				ImageLabel4.BackgroundTransparency = 1
				ImageLabel4.Image = "rbxassetid://10709790948"
				t15:ApplyThemeObj(ImageLabel4, "ImageColor3", "TextInactive")

				local Frame13 = Instance.new("Frame", TextButton4)

				Frame13.Size = UDim2.new(1, 0, 0, 0)
				Frame13.Position = UDim2.new(0, 0, 0, 36)
				Frame13.BackgroundTransparency = 1

				local UIPadding5 = Instance.new("UIPadding", Frame13)

				UIPadding5.PaddingTop = UDim.new(0, 5)
				UIPadding5.PaddingBottom = UDim.new(0, 10)
				UIPadding5.PaddingLeft = UDim.new(0, 15)
				UIPadding5.PaddingRight = UDim.new(0, 15)

				local UIListLayout6 = Instance.new("UIListLayout", Frame13)

				UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout6.Padding = UDim.new(0, 6)

				local t20 = {}

				for match in string.gmatch(p54, "[^\r\n]+") do
					table.insert(t20, match)
				end

				for _, v in ipairs(t20) do
					local Frame14 = Instance.new("Frame", Frame13)

					Frame14.Size = UDim2.new(1, 0, 0, 26)
					Frame14.BackgroundTransparency = 0.5
					Instance.new("UICorner", Frame14).CornerRadius = UDim.new(0, 4)
					t15:ApplyThemeObj(Frame14, "BackgroundColor3", "ToggleBgOff")

					local UIStroke6 = Instance.new("UIStroke", Frame14)

					UIStroke6.Thickness = 1
					UIStroke6.Transparency = 0.8
					t15:ApplyThemeObj(UIStroke6, "Color", "Stroke")

					local TextLabel8 = Instance.new("TextLabel", Frame14)

					TextLabel8.Size = UDim2.new(1, -20, 1, 0)
					TextLabel8.Position = UDim2.new(0, 10, 0, 0)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = v
					TextLabel8.Font = Enum.Font.GothamMedium
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				TextButton4.MouseButton1Click:Connect(function()
					u237 = not u237

					local v253 = t15.Themes[t15.CurrentTheme]

					if u237 then
						local v254 = 51 + UIListLayout6.AbsoluteContentSize.Y

						TweenService:Create(TextButton4, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 0, v254)
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							Rotation = 180,
							ImageColor3 = v253.Accent
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Color = v253.Accent,
							Transparency = 0.5
						}):Play()
					else
						TweenService:Create(TextButton4, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 0, 36)
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							Rotation = 0,
							ImageColor3 = v253.TextInactive
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Color = v253.Stroke,
							Transparency = 0.85
						}):Play()
					end
				end)
				UIListLayout6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					if u237 then
						local v255 = 51 + UIListLayout6.AbsoluteContentSize.Y

						TweenService:Create(TextButton4, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
							Size = UDim2.new(1, 0, 0, v255)
						}):Play()
					end
				end)
			end,
			CreateToggle = function(p55, p56, p57, p58, p59)
				local u256 = p58 or false
				local v257 = p59 or function()
				end
				local v258 = type(p57) == "string" and p57 ~= ""
				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)

				TextButton4.Active = false
				TextButton4.Size = UDim2.new(1, 0, 0, v258 and 52 or 36)
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				TextButton4.BackgroundTransparency = 0.2
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke5.Color = t15.Themes[t15.CurrentTheme].Stroke
				UIStroke5.Transparency = 0.85

				local function v261(p60, p61)
					local v262 = t15.Themes[p61 or t15.CurrentTheme]

					if p60 then
						TweenService:Create(UIStroke5, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Color = v262.Accent,
							Transparency = 0.85
						}):Play()
					else
						TweenService:Create(UIStroke5, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Color = v262.Stroke,
							Transparency = 0.88
						}):Play()
					end
				end

				v261(u256, t15.CurrentTheme)
				table.insert(t15.ThemeChangedHooks, {
					Inst = TextButton4,
					Func = function(p62)
						v261(u256, p62)
					end
				})

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, -60, 0, 16)
				TextLabel7.Position = UDim2.new(0, 15, 0, v258 and 10 or 10)

				if not v258 then
					TextLabel7.Size = UDim2.new(1, -60, 1, 0)
					TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				end

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p56
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				if v258 then
					local TextLabel8 = Instance.new("TextLabel", TextButton4)

					TextLabel8.Size = UDim2.new(1, -60, 0, 14)
					TextLabel8.Position = UDim2.new(0, 15, 0, 26)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = p57
					TextLabel8.Font = Enum.Font.Gotham
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				local Frame12 = Instance.new("Frame", TextButton4)

				Frame12.Size = UDim2.new(0, 36, 0, 18)
				Frame12.AnchorPoint = Vector2.new(1, 0.5)
				Frame12.Position = UDim2.new(1, -15, 0.5, 0)
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", u256 and "Accent" or "ToggleBgOff")

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(0, 14, 0, 14)
				Frame13.AnchorPoint = Vector2.new(0, 0.5)
				Frame13.Position = UDim2.new(0, u256 and 20 or 2, 0.5, 0)
				Frame13.ZIndex = 2
				Instance.new("UICorner", Frame13).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame13, "BackgroundColor3", "ToggleDot")
				TextButton4.MouseButton1Click:Connect(function()
					u256 = not u256
					v257(u256)

					local v267 = t15.Themes[t15.CurrentTheme]

					v261(u256)

					if u256 then
						TweenService:Create(Frame13, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Position = UDim2.new(0, 20, 0.5, 0)
						}):Play()
						TweenService:Create(Frame12, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							BackgroundColor3 = v267.Accent
						}):Play()
					else
						TweenService:Create(Frame13, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Position = UDim2.new(0, 2, 0.5, 0)
						}):Play()
						TweenService:Create(Frame12, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							BackgroundColor3 = v267.ToggleBgOff
						}):Play()
					end

					for _, instance in pairs(t15.Instances) do
						if instance.Inst == Frame12 then
							instance.Type = u256 and "Accent" or "ToggleBgOff"
						end
					end
				end)
			end,
			CreateButton = function(p63, p64, p65, p66, p67)
				local v270 = p67 or function()
				end
				local v271 = type(p65) == "string" and p65 ~= ""
				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)

				TextButton4.Active = false
				TextButton4.Size = UDim2.new(1, 0, 0, v271 and 52 or 36)
				TextButton4.BackgroundTransparency = 0.55
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke5.Color = t15.Themes[t15.CurrentTheme].Stroke
				UIStroke5.Transparency = 0.85

				local function v274(p68, p69)
					local v275 = t15.Themes[p69 or t15.CurrentTheme]

					if p68 then
						TweenService:Create(UIStroke5, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Color = v275.Accent,
							Transparency = 0.5
						}):Play()
					else
						TweenService:Create(UIStroke5, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
							Color = v275.Stroke,
							Transparency = 0.85
						}):Play()
					end
				end

				v274(false, t15.CurrentTheme)
				table.insert(t15.ThemeChangedHooks, {
					Inst = TextButton4,
					Func = function(p70)
						v274(false, p70)
					end
				})

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, -60, 0, 16)
				TextLabel7.Position = UDim2.new(0, 15, 0, v271 and 10 or 10)

				if not v271 then
					TextLabel7.Size = UDim2.new(1, -60, 1, 0)
					TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				end

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p64
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				if v271 then
					local TextLabel8 = Instance.new("TextLabel", TextButton4)

					TextLabel8.Size = UDim2.new(1, -60, 0, 14)
					TextLabel8.Position = UDim2.new(0, 15, 0, 26)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = p65
					TextLabel8.Font = Enum.Font.Gotham
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				local Frame12 = Instance.new("Frame", TextButton4)

				Frame12.Size = UDim2.new(0, 30, 0, 30)
				Frame12.AnchorPoint = Vector2.new(1, 0.5)
				Frame12.Position = UDim2.new(1, -3, 0.5, 0)
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 6)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBgOff")

				local UIStroke6 = Instance.new("UIStroke", Frame12)

				UIStroke6.Thickness = 1
				UIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke6.Color = t15.Themes[t15.CurrentTheme].Stroke
				UIStroke6.Transparency = 0.7

				local ImageLabel4 = Instance.new("ImageLabel", Frame12)

				ImageLabel4.Size = UDim2.new(0, 18, 0, 18)
				ImageLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel4.Position = UDim2.new(0.5, 0, 0.5, 0)
				ImageLabel4.BackgroundTransparency = 1
				ImageLabel4.Image = p66 or "rbxassetid://10734933056"
				t15:ApplyThemeObj(ImageLabel4, "ImageColor3", "TextInactive")
				TextButton4.MouseEnter:Connect(function()
					local v281 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(Frame12, TweenInfo.new(0.2), {
						BackgroundColor3 = Color3.fromRGB(math.clamp(v281.ToggleBgOff.R * 255 + 12, 0, 255), math.clamp(v281.ToggleBgOff.G * 255 + 12, 0, 255), math.clamp(v281.ToggleBgOff.B * 255 + 12, 0, 255))
					}):Play()
					TweenService:Create(UIStroke6, TweenInfo.new(0.2), {
						Color = v281.Accent,
						Transparency = 0.4
					}):Play()
					TweenService:Create(ImageLabel4, TweenInfo.new(0.2), {
						ImageColor3 = v281.Text
					}):Play()
				end)
				TextButton4.MouseLeave:Connect(function()
					local v282 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(Frame12, TweenInfo.new(0.2), {
						BackgroundColor3 = v282.ToggleBgOff
					}):Play()
					TweenService:Create(UIStroke6, TweenInfo.new(0.2), {
						Color = v282.Stroke,
						Transparency = 0.7
					}):Play()
					TweenService:Create(ImageLabel4, TweenInfo.new(0.2), {
						ImageColor3 = v282.TextInactive
					}):Play()
				end)
				TextButton4.MouseButton1Click:Connect(function()
					v270()
				end)
				TextButton4.MouseButton1Down:Connect(function()
					local v283 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(Frame12, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
						Size = UDim2.new(0, 26, 0, 26)
					}):Play()
					TweenService:Create(ImageLabel4, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
						Size = UDim2.new(0, 14, 0, 14),
						ImageColor3 = v283.Accent
					}):Play()
					TweenService:Create(UIStroke6, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
						Color = v283.Accent,
						Transparency = 0.2
					}):Play()
					v274(true)
				end)
				TextButton4.MouseButton1Up:Connect(function()
					local v284 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(Frame12, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {
						Size = UDim2.new(0, 30, 0, 30),
						BackgroundColor3 = v284.ToggleBgOff
					}):Play()
					TweenService:Create(ImageLabel4, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {
						Size = UDim2.new(0, 18, 0, 18),
						ImageColor3 = v284.TextInactive
					}):Play()
					TweenService:Create(UIStroke6, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
						Color = v284.Stroke,
						Transparency = 0.7
					}):Play()
					v274(false)
				end)
			end,
			CreateSlider = function(p71, p72, p73, p74, p75, p76)
				local v285 = p76 or function()
				end
				local u286 = math.clamp(p75 or p73, p73, p74)
				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)

				TextButton4.Active = false
				TextButton4.Size = UDim2.new(1, 0, 0, 42)
				TextButton4.BackgroundTransparency = 0.55
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, -100, 0, 20)
				TextLabel7.Position = UDim2.new(0, 15, 0, 5)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p72
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local Frame12 = Instance.new("Frame", TextButton4)

				Frame12.Size = UDim2.new(0, 35, 0, 20)
				Frame12.AnchorPoint = Vector2.new(1, 0)
				Frame12.Position = UDim2.new(1, -15, 0, 5)
				Frame12.BackgroundTransparency = 0.5
				Frame12.BorderSizePixel = 0
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 4)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBgOff")

				local UIStroke6 = Instance.new("UIStroke", Frame12)

				UIStroke6.Thickness = 1
				UIStroke6.Transparency = 0.8
				t15:ApplyThemeObj(UIStroke6, "Color", "Stroke")

				local TextBox = Instance.new("TextBox", Frame12)

				TextBox.Size = UDim2.new(1, 0, 1, 0)
				TextBox.BackgroundTransparency = 1
				TextBox.Text = tostring(u286)
				TextBox.Font = Enum.Font.GothamMedium
				TextBox.TextSize = 12
				TextBox.ClearTextOnFocus = false
				t15:ApplyThemeObj(TextBox, "TextColor3", "Text")

				local Frame13 = Instance.new("Frame", TextButton4)

				Frame13.Size = UDim2.new(1, -30, 0, 4)
				Frame13.AnchorPoint = Vector2.new(0.5, 1)
				Frame13.Position = UDim2.new(0.5, 0, 1, -8)
				Frame13.BorderSizePixel = 0
				Instance.new("UICorner", Frame13).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame13, "BackgroundColor3", "ToggleBgOff")

				local Frame14 = Instance.new("Frame", Frame13)

				Frame14.Size = UDim2.new((u286 - p73) / (p74 - p73), 0, 1, 0)
				Frame14.BorderSizePixel = 0
				Instance.new("UICorner", Frame14).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame14, "BackgroundColor3", "Accent")

				local Frame15 = Instance.new("Frame", Frame14)

				Frame15.Size = UDim2.new(0, 12, 0, 12)
				Frame15.AnchorPoint = Vector2.new(1, 0.5)
				Frame15.Position = UDim2.new(1, 6, 0.5, 0)
				Instance.new("UICorner", Frame15).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame15, "BackgroundColor3", "ToggleDot")

				local UIStroke7 = Instance.new("UIStroke", Frame15)

				UIStroke7.Thickness = 1
				t15:ApplyThemeObj(UIStroke7, "Color", "Stroke")

				local u297 = false

				local function v298(p77)
					local v299 = math.clamp((p77.Position.X - Frame13.AbsolutePosition.X) / Frame13.AbsoluteSize.X, 0, 1)

					u286 = math.floor(p73 + (p74 - p73) * v299)
					TextBox.Text = tostring(u286)
					TweenService:Create(Frame14, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
						Size = UDim2.new(v299, 0, 1, 0)
					}):Play()
					v285(u286)
				end

				TextButton4.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						u297 = true
						v298(input)
						TweenService:Create(Frame15, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
							Size = UDim2.new(0, 16, 0, 16)
						}):Play()
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if u297 then
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							v298(input)
						elseif input.UserInputType == Enum.UserInputType.Touch then
							v298(input)

							return
						end
					end
				end)
				UserInputService.InputEnded:Connect(function(input)
					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and u297 then
						u297 = false
						TweenService:Create(Frame15, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
							Size = UDim2.new(0, 12, 0, 12)
						}):Play()
					end
				end)
				TextButton4.MouseEnter:Connect(function()
					if not u297 then
						TweenService:Create(Frame15, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
							Size = UDim2.new(0, 16, 0, 16)
						}):Play()
					end
				end)
				TextButton4.MouseLeave:Connect(function()
					if not u297 then
						TweenService:Create(Frame15, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
							Size = UDim2.new(0, 12, 0, 12)
						}):Play()
					end
				end)
				TextBox.FocusLost:Connect(function()
					local v300 = tonumber(TextBox.Text)

					if v300 then
						u286 = math.clamp(math.floor(v300), p73, p74)

						local v301 = (u286 - p73) / (p74 - p73)

						TweenService:Create(Frame14, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Size = UDim2.new(v301, 0, 1, 0)
						}):Play()
						v285(u286)
					end

					TextBox.Text = tostring(u286)
				end)
			end,
			CreateImageParagraph = function(p78, p79, p80, p81)
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 0)
				Frame12.AutomaticSize = Enum.AutomaticSize.Y
				Frame12.BackgroundTransparency = 0.55
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local UIPadding5 = Instance.new("UIPadding", Frame12)

				UIPadding5.PaddingTop = UDim.new(0, 10)
				UIPadding5.PaddingBottom = UDim.new(0, 10)
				UIPadding5.PaddingLeft = UDim.new(0, 12)
				UIPadding5.PaddingRight = UDim.new(0, 12)

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(1, 0, 0, 40)
				Frame13.BackgroundTransparency = 1

				local ImageLabel4 = Instance.new("ImageLabel", Frame13)

				ImageLabel4.Size = UDim2.new(0, 36, 0, 36)
				ImageLabel4.Position = UDim2.new(0, 0, 0.5, -16)
				ImageLabel4.BackgroundTransparency = 1

				local v307 = p81

				if v307 then
					ImageLabel4.Image = v307
				else
					ImageLabel4.Image = ""
				end

				Instance.new("UICorner", ImageLabel4).CornerRadius = UDim.new(0, 5)

				local TextLabel7 = Instance.new("TextLabel", Frame13)

				TextLabel7.Position = UDim2.new(0, 42, 0, 5)
				TextLabel7.Size = UDim2.new(1, -42, 0, 16)
				TextLabel7.BackgroundTransparency = 1

				local v309 = p79

				if v309 then
					TextLabel7.Text = v309
				else
					TextLabel7.Text = ""
				end

				TextLabel7.Font = Enum.Font.GothamBold
				TextLabel7.TextSize = 14
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel7.RichText = true
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local TextLabel8 = Instance.new("TextLabel", Frame13)

				TextLabel8.Position = UDim2.new(0, 42, 0, 19)
				TextLabel8.Size = UDim2.new(1, -42, 0, 14)
				TextLabel8.BackgroundTransparency = 1

				local v311 = p80

				if v311 then
					TextLabel8.Text = v311
				else
					TextLabel8.Text = ""
				end

				TextLabel8.Font = Enum.Font.Gotham
				TextLabel8.TextSize = 13.4
				TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel8.RichText = true
				t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")

				return {
					SetTitle = function(p82, p83)
						TextLabel7.Text = p83
					end,
					SetDescription = function(p84, p85)
						TextLabel8.Text = p85
					end,
					SetImage = function(p86, p87)
						ImageLabel4.Image = p87
					end
				}
			end,
			CreateInput = function(p88, p89, p90, p91, p92, p93, p94)
				if type(p92) == "function" then
					p94 = p92
					p92 = nil
					p93 = nil
				end

				local v312 = p94 or function()
				end
				local v313 = type(p90) == "string" and p90 ~= ""
				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)

				TextButton4.Active = false
				TextButton4.Size = UDim2.new(1, 0, 0, v313 and 52 or 36)
				TextButton4.BackgroundTransparency = 0.55
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, p92 and -200 or -170, 0, 16)
				TextLabel7.Position = UDim2.new(0, 15, 0, v313 and 10 or 10)

				if not v313 then
					TextLabel7.Size = UDim2.new(1, p92 and -200 or -170, 1, 0)
					TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				end

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p89
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				if v313 then
					local TextLabel8 = Instance.new("TextLabel", TextButton4)

					TextLabel8.Size = UDim2.new(1, p92 and -200 or -170, 0, 14)
					TextLabel8.Position = UDim2.new(0, 15, 0, 26)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = p90
					TextLabel8.Font = Enum.Font.Gotham
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				local Frame12 = Instance.new("Frame", TextButton4)

				Frame12.Size = UDim2.new(0, p92 and 180 or 150, 0, 26)
				Frame12.AnchorPoint = Vector2.new(1, 0.5)
				Frame12.Position = UDim2.new(1, -10, 0.5, 0)
				Frame12.BackgroundTransparency = 0.5
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 6)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBgOff")

				local UIStroke6 = Instance.new("UIStroke", Frame12)

				UIStroke6.Thickness = 1
				UIStroke6.Transparency = 0.7
				t15:ApplyThemeObj(UIStroke6, "Color", "Stroke")

				local TextBox = Instance.new("TextBox", Frame12)

				TextBox.Size = UDim2.new(1, p92 and -36 or -16, 1, 0)
				TextBox.Position = UDim2.new(0, 8, 0, 0)
				TextBox.BackgroundTransparency = 1
				TextBox.Text = ""
				TextBox.PlaceholderText = p91 or "Type here..."
				TextBox.Font = Enum.Font.GothamMedium
				TextBox.TextSize = 11
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.ClearTextOnFocus = false
				TextBox.ClipsDescendants = true
				t15:ApplyThemeObj(TextBox, "TextColor3", "Text")
				t15:ApplyThemeObj(TextBox, "PlaceholderColor3", "TextInactive")
				TextBox.Focused:Connect(function()
					local v321 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(UIStroke6, TweenInfo.new(0.3), {
						Color = v321.Accent,
						Transparency = 0.3
					}):Play()
				end)
				TextBox.FocusLost:Connect(function()
					local v322 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(UIStroke6, TweenInfo.new(0.3), {
						Color = v322.Stroke,
						Transparency = 0.7
					}):Play()
					v312(TextBox.Text)
				end)
				TextBox:GetPropertyChangedSignal("Text"):Connect(function()
					v312(TextBox.Text)
				end)
				TextBox:GetPropertyChangedSignal("Text"):Connect(function()
					v312(TextBox.Text)
				end)

				if p92 then
					local ImageButton4 = Instance.new("ImageButton", Frame12)

					ImageButton4.Size = UDim2.new(0, 20, 0, 20)
					ImageButton4.Position = UDim2.new(1, -4, 0.5, 0)
					ImageButton4.AnchorPoint = Vector2.new(1, 0.5)
					ImageButton4.BackgroundTransparency = 1
					ImageButton4.Image = p92
					t15:ApplyThemeObj(ImageButton4, "ImageColor3", "Accent")
					ImageButton4.MouseButton1Click:Connect(function()
						TweenService:Create(ImageButton4, TweenInfo.new(0.1), {
							Size = UDim2.new(0, 16, 0, 16)
						}):Play()
						task.wait(0.1)
						TweenService:Create(ImageButton4, TweenInfo.new(0.1), {
							Size = UDim2.new(0, 20, 0, 20)
						}):Play()

						if p93 then
							p93(TextBox.Text)
						end
					end)
				end
			end,
			CreateDropdown = function(p95, p96)
				local u324 = false
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Name = "Dropdown_" .. p96
				Frame12.Size = UDim2.new(1, 0, 0, 36)
				Frame12.BackgroundTransparency = 0.55
				Frame12.ClipsDescendants = true
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextButton4 = Instance.new("TextButton", Frame12)

				TextButton4.Active = false
				TextButton4.Size = UDim2.new(1, 0, 0, 36)
				TextButton4.BackgroundTransparency = 1
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, -60, 1, 0)
				TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p96
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local ImageLabel4 = Instance.new("ImageLabel", TextButton4)

				ImageLabel4.Size = UDim2.new(0, 16, 0, 16)
				ImageLabel4.AnchorPoint = Vector2.new(1, 0.5)
				ImageLabel4.Position = UDim2.new(1, -15, 0.5, 0)
				ImageLabel4.BackgroundTransparency = 1
				ImageLabel4.Image = "rbxassetid://10709791523"
				t15:ApplyThemeObj(ImageLabel4, "ImageColor3", "TextInactive")

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(1, 0, 0, 0)
				Frame13.Position = UDim2.new(0, 0, 0, 36)
				Frame13.BackgroundTransparency = 1

				local UIPadding5 = Instance.new("UIPadding", Frame13)

				UIPadding5.PaddingTop = UDim.new(0, 8)
				UIPadding5.PaddingBottom = UDim.new(0, 2)
				UIPadding5.PaddingLeft = UDim.new(0, 12)
				UIPadding5.PaddingRight = UDim.new(0, 12)

				local UIListLayout6 = Instance.new("UIListLayout", Frame13)

				UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout6.Padding = UDim.new(0, 6)
				TextButton4.MouseButton1Click:Connect(function()
					u324 = not u324

					local v333 = t15.Themes[t15.CurrentTheme]

					if u324 then
						local v334 = 52 + UIListLayout6.AbsoluteContentSize.Y

						TweenService:Create(Frame12, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 0, v334)
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Color = v333.Accent,
							Transparency = 0.5
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							ImageColor3 = v333.Accent,
							Rotation = 180
						}):Play()
						TweenService:Create(TextLabel7, TweenInfo.new(0.3), {
							TextColor3 = v333.Accent
						}):Play()
					else
						TweenService:Create(Frame12, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Size = UDim2.new(1, 0, 0, 36)
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Color = v333.Stroke,
							Transparency = 0.85
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							ImageColor3 = v333.TextInactive,
							Rotation = 0
						}):Play()
						TweenService:Create(TextLabel7, TweenInfo.new(0.3), {
							TextColor3 = v333.Text
						}):Play()
					end
				end)
				table.insert(t17.DropdownCloseFuncs, function()
					if u324 then
						u324 = false

						local v335 = t15.Themes[t15.CurrentTheme]

						TweenService:Create(Frame12, TweenInfo.new(0.2), {
							Size = UDim2.new(1, 0, 0, 36)
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
							Color = v335.Stroke,
							Transparency = 0.85
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.2), {
							ImageColor3 = v335.TextInactive,
							Rotation = 0
						}):Play()
						TweenService:Create(TextLabel7, TweenInfo.new(0.2), {
							TextColor3 = v335.Text
						}):Play()
					end
				end)
				UIListLayout6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					if u324 then
						local v336 = 52 + UIListLayout6.AbsoluteContentSize.Y

						TweenService:Create(Frame12, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
							Size = UDim2.new(1, 0, 0, v336)
						}):Play()
					end
				end)

				return {
					CreateToggle = function(...)
						local v337 = ScrollingFrame2

						ScrollingFrame2 = Frame13
						t19:CreateToggle(select(2, ...))
						ScrollingFrame2 = v337
					end,
					CreateButton = function(...)
						local v338 = ScrollingFrame2

						ScrollingFrame2 = Frame13
						t19:CreateButton(select(2, ...))
						ScrollingFrame2 = v338
					end,
					CreateSlider = function(...)
						local v339 = ScrollingFrame2

						ScrollingFrame2 = Frame13
						t19:CreateSlider(select(2, ...))
						ScrollingFrame2 = v339
					end,
					CreateInput = function(...)
						local v340 = ScrollingFrame2

						ScrollingFrame2 = Frame13
						t19:CreateInput(select(2, ...))
						ScrollingFrame2 = v340
					end,
					CreateSelect = function(...)
						local v341 = ScrollingFrame2

						ScrollingFrame2 = Frame13
						t19:CreateSelect(select(2, ...))
						ScrollingFrame2 = v341
					end
				}
			end,
			CreateSelect = function(p97, p98, p99, p100, p101, p102)
				local v342 = p102 or function()
				end
				local u343 = p100 or {}
				local u344 = false
				local v345 = type(p99) == "string" and p99 ~= ""
				local t21 = {}

				if type(p101) == "table" then
					for _, v in pairs(p101) do
						table.insert(t21, v)
					end
				elseif type(p101) == "string" and p101 ~= "None" and p101 ~= "" then
					table.insert(t21, p101)
				end

				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)

				TextButton4.Active = false

				local n3 = 1
				local n4 = 0
				local n5 = 0

				TextButton4.Size = UDim2.new(n3, n4, n5, v345 and 52 or 36)
				TextButton4.BackgroundTransparency = 0.55
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(0.5, -15, 0, 16)
				TextLabel7.Position = UDim2.new(n5, 15, 0, v345 and 10 or 10)

				if not v345 then
					TextLabel7.Size = UDim2.new(0.5, -15, 1, 0)
					TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				end

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p98
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				if v345 then
					local TextLabel8 = Instance.new("TextLabel", TextButton4)

					TextLabel8.Size = UDim2.new(0.5, -15, 0, 14)
					TextLabel8.Position = UDim2.new(0, 15, 0, 26)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = p99
					TextLabel8.Font = Enum.Font.Gotham
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				local TextLabel8 = Instance.new("TextLabel", TextButton4)

				TextLabel8.Size = UDim2.new(0.5, -35, 1, 0)
				TextLabel8.Position = UDim2.new(0.5, 0, 0, 0)
				TextLabel8.BackgroundTransparency = 1
				TextLabel8.Font = Enum.Font.GothamMedium
				TextLabel8.TextSize = 12
				TextLabel8.TextXAlignment = Enum.TextXAlignment.Right
				t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")

				local ImageLabel4 = Instance.new("ImageLabel", TextButton4)

				ImageLabel4.Size = UDim2.new(0, 16, 0, 16)
				ImageLabel4.AnchorPoint = Vector2.new(1, 0.5)
				ImageLabel4.Position = UDim2.new(1, -15, 0.5, 0)
				ImageLabel4.BackgroundTransparency = 1
				ImageLabel4.Image = "rbxassetid://10709790948"
				t15:ApplyThemeObj(ImageLabel4, "ImageColor3", "TextInactive")

				local function v358()
					if #t21 == 0 or #t21 == 1 and (t21[1] == "Any" or t21[1] == "All") then
						TextLabel8.Text = "--"
					elseif #t21 == 1 then
						TextLabel8.Text = t21[1]
					else
						TextLabel8.Text = tostring(#t21) .. " Selected"
					end
				end

				v358()

				local v359 = Frame10
				local TextButton5 = Instance.new("TextButton", v359)

				TextButton5.Size = UDim2.new(1, 0, 1, 0)
				TextButton5.BackgroundTransparency = 1
				TextButton5.Text = ""
				TextButton5.ZIndex = 9
				TextButton5.Visible = false

				local Frame12 = Instance.new("Frame", v359)

				Frame12.Name = "SidePanel_" .. p98
				Frame12.Size = UDim2.new(0.55, -10, 1, -10)
				Frame12.Position = UDim2.new(1, 10, 0, 5)
				Frame12.BackgroundTransparency = 0.05
				Frame12.ZIndex = 10
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBgOff")

				local UIStroke6 = Instance.new("UIStroke", Frame12)

				UIStroke6.Thickness = 1
				UIStroke6.Transparency = 0.85
				t15:ApplyThemeObj(UIStroke6, "Color", "Stroke")

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(1, -20, 0, 30)
				Frame13.Position = UDim2.new(0, 10, 0, 10)
				Frame13.BackgroundTransparency = 0.5
				Frame13.ZIndex = 11
				Instance.new("UICorner", Frame13).CornerRadius = UDim.new(0, 6)
				t15:ApplyThemeObj(Frame13, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke7 = Instance.new("UIStroke", Frame13)

				UIStroke7.Thickness = 1
				UIStroke7.Transparency = 0.8
				t15:ApplyThemeObj(UIStroke7, "Color", "Stroke")

				local ImageLabel5 = Instance.new("ImageLabel", Frame13)

				ImageLabel5.Size = UDim2.new(0, 14, 0, 14)
				ImageLabel5.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel5.Position = UDim2.new(0, 10, 0.5, 0)
				ImageLabel5.BackgroundTransparency = 1
				ImageLabel5.Image = "rbxassetid://10709761217"
				ImageLabel5.ZIndex = 11
				t15:ApplyThemeObj(ImageLabel5, "ImageColor3", "TextInactive")

				local TextBox = Instance.new("TextBox", Frame13)

				TextBox.Size = UDim2.new(1, -34, 1, 0)
				TextBox.Position = UDim2.new(0, 30, 0, 0)
				TextBox.BackgroundTransparency = 1
				TextBox.Text = ""
				TextBox.PlaceholderText = "Search..."
				TextBox.Font = Enum.Font.GothamMedium
				TextBox.TextSize = 12
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.ZIndex = 11
				TextBox.ClearTextOnFocus = false
				t15:ApplyThemeObj(TextBox, "TextColor3", "Text")
				t15:ApplyThemeObj(TextBox, "PlaceholderColor3", "TextInactive")
				TextBox.Focused:Connect(function()
					local v367 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(UIStroke7, TweenInfo.new(0.3), {
						Color = v367.Accent,
						Transparency = 0.3
					}):Play()
				end)
				TextBox.FocusLost:Connect(function()
					local v368 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(UIStroke7, TweenInfo.new(0.3), {
						Color = v368.Stroke,
						Transparency = 0.8
					}):Play()
				end)

				local ScrollingFrame3 = Instance.new("ScrollingFrame", Frame12)

				ScrollingFrame3.Size = UDim2.new(1, 0, 1, -55)
				ScrollingFrame3.Position = UDim2.new(0, 10, 0, 50)
				ScrollingFrame3.BackgroundTransparency = 1
				ScrollingFrame3.BorderSizePixel = 0
				ScrollingFrame3.ScrollBarThickness = 2
				ScrollingFrame3.ZIndex = 11
				ScrollingFrame3.AutomaticCanvasSize = Enum.AutomaticSize.Y
				ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)
				t15:ApplyThemeObj(ScrollingFrame3, "ScrollBarImageColor3", "Stroke")

				local UIPadding5 = Instance.new("UIPadding", ScrollingFrame3)

				UIPadding5.PaddingLeft = UDim.new(0, 1)
				UIPadding5.PaddingRight = UDim.new(0, 20)
				UIPadding5.PaddingTop = UDim.new(0, 5)
				UIPadding5.PaddingBottom = UDim.new(0, 5)

				local UIListLayout6 = Instance.new("UIListLayout", ScrollingFrame3)

				UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout6.Padding = UDim.new(0, 6)

				local t22 = {}

				local function v373()
					u344 = false
					TextButton5.Visible = false

					local v374 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(Frame12, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Position = UDim2.new(1, 10, 0, 5)
					}):Play()
					TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
						Rotation = 0,
						ImageColor3 = v374.TextInactive
					}):Play()
					TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
						Transparency = 0.85,
						Color = v374.Stroke
					}):Play()
				end

				table.insert(t17.SelectCloseFuncs, v373)
				TextButton5.MouseButton1Click:Connect(v373)

				local function v375()
					for _, v in pairs(t22) do
						v:Destroy()
					end

					table.clear(t22)

					local v378 = string.lower(TextBox.Text)

					for _, v in ipairs(u343) do
						if v378 == "" or string.find(string.lower(v), v378) then
							local TextButton6 = Instance.new("TextButton", ScrollingFrame3)

							TextButton6.Active = false
							TextButton6.Size = UDim2.new(1, 0, 0, 32)
							TextButton6.BackgroundTransparency = 0.95
							TextButton6.AutoButtonColor = false
							TextButton6.Text = ""
							TextButton6.ZIndex = 12
							Instance.new("UICorner", TextButton6).CornerRadius = UDim.new(0, 6)
							t15:ApplyThemeObj(TextButton6, "BackgroundColor3", "ToggleBtnBg")

							local UIStroke8 = Instance.new("UIStroke", TextButton6)

							UIStroke8.Thickness = 1
							UIStroke8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

							local Frame14 = Instance.new("Frame", TextButton6)
							local v384 = table.find(t21, v) ~= nil

							Frame14.Size = UDim2.new(0, 3, 0, v384 and 16 or 0)
							Frame14.AnchorPoint = Vector2.new(0, 0.5)
							Frame14.Position = UDim2.new(0, 4, 0.5, 0)
							Frame14.BorderSizePixel = 0
							Frame14.ZIndex = 12
							Frame14.BackgroundTransparency = 0
							Instance.new("UICorner", Frame14).CornerRadius = UDim.new(1, 0)
							t15:ApplyThemeObj(Frame14, "BackgroundColor3", "Accent")

							local TextLabel9 = Instance.new("TextLabel", TextButton6)

							TextLabel9.Size = UDim2.new(1, -30, 1, 0)
							TextLabel9.Position = UDim2.new(0, 15, 0, 0)
							TextLabel9.BackgroundTransparency = 1
							TextLabel9.Text = v
							TextLabel9.Font = Enum.Font.GothamMedium
							TextLabel9.TextSize = 12
							TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
							TextLabel9.ZIndex = 12

							if v384 then
								UIStroke8.Transparency = 0.95
								t15:ApplyThemeObj(UIStroke8, "Color", "Accent")
								t15:ApplyThemeObj(TextLabel9, "TextColor3", "Accent")
								TextButton6.BackgroundTransparency = 0.55
							else
								UIStroke8.Transparency = 0.85
								t15:ApplyThemeObj(UIStroke8, "Color", "Stroke")
								t15:ApplyThemeObj(TextLabel9, "TextColor3", "Text")
								TextButton6.BackgroundTransparency = 0.95
							end

							TextButton6.MouseButton1Click:Connect(function()
								local v386 = t15.Themes[t15.CurrentTheme]
								local v387 = table.find(t21, v)

								if v387 then
									table.remove(t21, v387)
									TweenService:Create(Frame14, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
										Size = UDim2.new(0, 3, 0, 0)
									}):Play()
									TweenService:Create(UIStroke8, TweenInfo.new(0.3), {
										Transparency = 0.85,
										Color = v386.Stroke
									}):Play()
									TweenService:Create(TextLabel9, TweenInfo.new(0.3), {
										TextColor3 = v386.Text
									}):Play()
									TweenService:Create(TextButton6, TweenInfo.new(0.3), {
										BackgroundTransparency = 0.95
									}):Play()
								else
									table.insert(t21, v)
									TweenService:Create(Frame14, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
										Size = UDim2.new(0, 3, 0, 16)
									}):Play()
									TweenService:Create(UIStroke8, TweenInfo.new(0.3), {
										Transparency = 0.95,
										Color = v386.Accent
									}):Play()
									TweenService:Create(TextLabel9, TweenInfo.new(0.3), {
										TextColor3 = v386.Accent
									}):Play()
									TweenService:Create(TextButton6, TweenInfo.new(0.3), {
										BackgroundTransparency = 0.55
									}):Play()
								end

								v358()
								v342(t21)
							end)
							table.insert(t22, TextButton6)
						end
					end
				end

				v375()
				TextBox:GetPropertyChangedSignal("Text"):Connect(v375)
				TextButton4.MouseButton1Click:Connect(function()
					u344 = not u344

					local v388 = t15.Themes[t15.CurrentTheme]

					if u344 then
						TextButton5.Visible = true
						TweenService:Create(Frame12, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
							Position = UDim2.new(0.45, 5, 0, 5)
						}):Play()
						TweenService:Create(ImageLabel4, TweenInfo.new(0.3), {
							Rotation = 90,
							ImageColor3 = v388.Accent
						}):Play()
						TweenService:Create(UIStroke5, TweenInfo.new(0.3), {
							Transparency = 0.5,
							Color = v388.Accent
						}):Play()
					else
						v373()
					end
				end)

				local function v389(p103)
					t21 = {}

					if type(p103) == "table" then
						for _, v in pairs(p103) do
							table.insert(t21, v)
						end
					elseif type(p103) == "string" and p103 ~= "None" and p103 ~= "" then
						table.insert(t21, p103)
					end

					v358()
					v375()
					pcall(function()
						v342(t21)
					end)
				end

				return {
					Set = function(p104, p105)
						v389(p105)
					end,
					SetValue = function(p106, p107)
						v389(p107)
					end,
					Refresh = function(p108, p109, p110)
						u343 = p109 or {}

						if p110 == false then
							t21 = {}
						else
							local t23 = {}

							for _, v in ipairs(u343) do
								t23[v] = true
							end

							for i = #t21, 1, -1 do
								local v396 = t21[i]

								if not (v396 == "Any" or v396 == "All" or t23[v396]) then
									local match = v396:match("^(.-)%s*%[Lvl") or v396:match("^(.-)%s*%[Lv") or v396:match("^(.-)%s*%(") or v396
									local v398 = false

									for _, v in ipairs(u343) do
										local match2 = v:match("^(.-)%s*%[Lvl") or v:match("^(.-)%s*%[Lv") or v:match("^(.-)%s*%(") or v

										if match:lower() == match2:lower() then
											t21[i] = v
											v398 = true

											break
										end
									end

									if not v398 then
										table.remove(t21, i)
									end
								end
							end
						end

						v358()
						v375()
					end
				}
			end,
			CreateKeybind = function(p111, p112, p113, p114, p115)
				local v402 = p115 or function()
				end
				local Unknown = p114 or Enum.KeyCode.Unknown
				local v404 = type(p113) == "string" and p113 ~= ""
				local u405 = false
				local Frame12 = Instance.new("Frame", ScrollingFrame2)
				local n6 = 1
				local n7 = 0
				local n8 = 0

				Frame12.Size = UDim2.new(n6, n7, n8, v404 and 52 or 36)
				Frame12.BackgroundTransparency = 0.2
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextLabel7 = Instance.new("TextLabel", Frame12)

				TextLabel7.Size = UDim2.new(1, -110, 0, 16)
				TextLabel7.Position = UDim2.new(n8, 15, 0, v404 and 10 or 10)

				if not v404 then
					TextLabel7.Size = UDim2.new(1, -110, 1, 0)
					TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				end

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p112
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				if v404 then
					local TextLabel8 = Instance.new("TextLabel", Frame12)

					TextLabel8.Size = UDim2.new(1, -110, 0, 14)
					TextLabel8.Position = UDim2.new(0, 15, 0, 26)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = p113
					TextLabel8.Font = Enum.Font.Gotham
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				local TextButton4 = Instance.new("TextButton", Frame12)

				TextButton4.Size = UDim2.new(0, 80, 0, 26)
				TextButton4.AnchorPoint = Vector2.new(1, 0.5)
				TextButton4.Position = UDim2.new(1, -12, 0.5, 0)
				TextButton4.AutoButtonColor = false
				TextButton4.Font = Enum.Font.GothamBold
				TextButton4.TextSize = 12
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 6)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBgOff")
				t15:ApplyThemeObj(TextButton4, "TextColor3", "Text")

				local function v414()
					return Unknown and Unknown ~= Enum.KeyCode.Unknown and Unknown.Name or "None"
				end

				TextButton4.Text = v414()

				local connection

				TextButton4.MouseButton1Click:Connect(function()
					if u405 then
						return
					end

					u405 = true
					TextButton4.Text = "..."

					local v416 = t15.Themes[t15.CurrentTheme]

					TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
						Color = v416.Accent,
						Transparency = 0.5
					}):Play()
					connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if gameProcessed then
							return
						end

						if input.UserInputType == Enum.UserInputType.Keyboard then
							if input.KeyCode ~= Enum.KeyCode.Escape then
								Unknown = input.KeyCode
							end

							u405 = false
							TextButton4.Text = v414()
							TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
								Color = v416.Stroke,
								Transparency = 0.85
							}):Play()

							if connection then
								connection:Disconnect()
								connection = nil
							end
						end
					end)
				end)
				UserInputService.InputBegan:Connect(function(input, gameProcessed)
					if gameProcessed or u405 then
						return
					end

					if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Unknown then
						v402(Unknown)
					end
				end)

				return {
					Set = function(p116, p117)
						Unknown = p117
						TextButton4.Text = v414()
					end,
					Get = function()
						return Unknown
					end
				}
			end,
			CreateLabel = function(p118, p119)
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 0)
				Frame12.AutomaticSize = Enum.AutomaticSize.Y
				Frame12.BackgroundTransparency = 1

				local TextLabel7 = Instance.new("TextLabel", Frame12)

				TextLabel7.Size = UDim2.new(1, 0, 0, 0)
				TextLabel7.AutomaticSize = Enum.AutomaticSize.Y
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p119 or ""
				TextLabel7.Font = Enum.Font.Gotham
				TextLabel7.TextSize = 12
				TextLabel7.TextWrapped = true
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "TextInactive")

				return {
					Set = function(p120, p121)
						TextLabel7.Text = p121
					end
				}
			end,
			CreateParagraph = function(p122, p123, p124)
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 0)
				Frame12.AutomaticSize = Enum.AutomaticSize.Y
				Frame12.BackgroundTransparency = 0.55
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local UIPadding5 = Instance.new("UIPadding", Frame12)

				UIPadding5.PaddingTop = UDim.new(0, 10)
				UIPadding5.PaddingBottom = UDim.new(0, 10)
				UIPadding5.PaddingLeft = UDim.new(0, 12)
				UIPadding5.PaddingRight = UDim.new(0, 12)

				local UIListLayout6 = Instance.new("UIListLayout", Frame12)

				UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout6.Padding = UDim.new(0, 4)

				local TextLabel7 = Instance.new("TextLabel", Frame12)

				TextLabel7.Size = UDim2.new(1, 0, 0, 16)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p123 or ""
				TextLabel7.Font = Enum.Font.GothamBold
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local TextLabel8 = Instance.new("TextLabel", Frame12)

				TextLabel8.Size = UDim2.new(1, 0, 0, 0)
				TextLabel8.AutomaticSize = Enum.AutomaticSize.Y
				TextLabel8.BackgroundTransparency = 1
				TextLabel8.Text = p124 or ""
				TextLabel8.Font = Enum.Font.Gotham
				TextLabel8.TextSize = 12
				TextLabel8.TextWrapped = true
				TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")

				return {
					Set = function(p125, p126)
						TextLabel8.Text = p126
					end
				}
			end,
			CreateProgressBar = function(p127, p128, p129, p130)
				local u425 = p129 or 100
				local u426 = math.clamp(p130 or 0, 0, u425)
				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 46)
				Frame12.BackgroundTransparency = 0.55
				Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(Frame12, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", Frame12)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextLabel7 = Instance.new("TextLabel", Frame12)

				TextLabel7.Size = UDim2.new(1, -80, 0, 18)
				TextLabel7.Position = UDim2.new(0, 15, 0, 6)
				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p128
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				local TextLabel8 = Instance.new("TextLabel", Frame12)

				TextLabel8.Size = UDim2.new(0, 65, 0, 18)
				TextLabel8.AnchorPoint = Vector2.new(1, 0)
				TextLabel8.Position = UDim2.new(1, -15, 0, 6)
				TextLabel8.BackgroundTransparency = 1
				TextLabel8.Text = tostring(u426) .. "/" .. tostring(u425)
				TextLabel8.Font = Enum.Font.GothamMedium
				TextLabel8.TextSize = 12
				TextLabel8.TextXAlignment = Enum.TextXAlignment.Right
				t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")

				local Frame13 = Instance.new("Frame", Frame12)

				Frame13.Size = UDim2.new(1, -30, 0, 6)
				Frame13.Position = UDim2.new(0, 15, 1, -14)
				Frame13.BorderSizePixel = 0
				Instance.new("UICorner", Frame13).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame13, "BackgroundColor3", "ToggleBgOff")

				local Frame14 = Instance.new("Frame", Frame13)

				Frame14.Size = UDim2.new(u425 > 0 and u426 / u425 or 0, 0, 1, 0)
				Frame14.BorderSizePixel = 0
				Instance.new("UICorner", Frame14).CornerRadius = UDim.new(1, 0)
				t15:ApplyThemeObj(Frame14, "BackgroundColor3", "Accent")

				return {
					Set = function(p131, p132, p133)
						if p133 then
							u425 = p133
						end

						u426 = math.clamp(p132, 0, u425)
						TextLabel8.Text = tostring(u426) .. "/" .. tostring(u425)

						local v433 = TweenService
						local Create = TweenService.Create
						local v435 = Frame14

						Create(v433, v435, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
							Size = UDim2.new(u425 > 0 and u426 / u425 or 0, 0, 1, 0)
						}):Play()
					end,
					Get = function()
						return u426, u425
					end
				}
			end,
			CreateTable = function(p134, p135, p136)
				local v436 = p136 or 20

				if p135 and p135 ~= "" then
					local TextLabel7 = Instance.new("TextLabel", ScrollingFrame2)

					TextLabel7.Size = UDim2.new(1, 0, 0, 20)
					TextLabel7.BackgroundTransparency = 1
					TextLabel7.Text = p135
					TextLabel7.Font = Enum.Font.GothamBold
					TextLabel7.TextSize = 13
					TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel7, "TextColor3", "SectionTitle")
				end

				local Frame12 = Instance.new("Frame", ScrollingFrame2)

				Frame12.Size = UDim2.new(1, 0, 0, 0)
				Frame12.AutomaticSize = Enum.AutomaticSize.Y
				Frame12.BackgroundTransparency = 1

				local UIListLayout6 = Instance.new("UIListLayout", Frame12)

				UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout6.Padding = UDim.new(0, 4)

				local t24 = {}
				local layoutOrder = 0

				return {
					AddRow = function(p137, p138)
						local Frame13 = Instance.new("Frame", Frame12)

						Frame13.Size = UDim2.new(1, 0, 0, 26)
						Frame13.BackgroundTransparency = 0.5
						layoutOrder = layoutOrder - 1
						Frame13.LayoutOrder = layoutOrder
						Instance.new("UICorner", Frame13).CornerRadius = UDim.new(0, 4)
						t15:ApplyThemeObj(Frame13, "BackgroundColor3", "ToggleBgOff")

						local UIStroke5 = Instance.new("UIStroke", Frame13)

						UIStroke5.Thickness = 1
						UIStroke5.Transparency = 0.8
						t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

						local TextLabel7 = Instance.new("TextLabel", Frame13)

						TextLabel7.Size = UDim2.new(1, -20, 1, 0)
						TextLabel7.Position = UDim2.new(0, 10, 0, 0)
						TextLabel7.BackgroundTransparency = 1
						TextLabel7.Text = p138
						TextLabel7.Font = Enum.Font.GothamMedium
						TextLabel7.TextSize = 11
						TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
						TextLabel7.TextTruncate = Enum.TextTruncate.AtEnd
						t15:ApplyThemeObj(TextLabel7, "TextColor3", "TextInactive")
						table.insert(t24, 1, Frame13)

						if v436 < #t24 then
							table.remove(t24):Destroy()
						end
					end,
					Clear = function()
						for _, v in ipairs(t24) do
							v:Destroy()
						end

						t24 = {}
					end
				}
			end,
			CreateConfirmButton = function(p139, p140, p141, p142, p143)
				local v447 = p143 or function()
				end
				local v448 = type(p141) == "string" and p141 ~= ""
				local u449 = false
				local thread
				local TextButton4 = Instance.new("TextButton", ScrollingFrame2)
				local n9 = 1
				local n10 = 0
				local n11 = 0

				TextButton4.Size = UDim2.new(n9, n10, n11, v448 and 52 or 36)
				TextButton4.AutoButtonColor = false
				TextButton4.Text = ""
				TextButton4.BackgroundTransparency = 0.2
				Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 8)
				t15:ApplyThemeObj(TextButton4, "BackgroundColor3", "ToggleBtnBg")

				local UIStroke5 = Instance.new("UIStroke", TextButton4)

				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.85
				t15:ApplyThemeObj(UIStroke5, "Color", "Stroke")

				local TextLabel7 = Instance.new("TextLabel", TextButton4)

				TextLabel7.Size = UDim2.new(1, -20, 0, 16)
				TextLabel7.Position = UDim2.new(n11, 15, 0, v448 and 10 or 10)

				if not v448 then
					TextLabel7.Size = UDim2.new(1, -20, 1, 0)
					TextLabel7.Position = UDim2.new(0, 15, 0, 0)
				end

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Text = p140
				TextLabel7.Font = Enum.Font.GothamMedium
				TextLabel7.TextSize = 13
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				t15:ApplyThemeObj(TextLabel7, "TextColor3", "Text")

				if v448 then
					local TextLabel8 = Instance.new("TextLabel", TextButton4)

					TextLabel8.Size = UDim2.new(1, -20, 0, 14)
					TextLabel8.Position = UDim2.new(0, 15, 0, 26)
					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Text = p141
					TextLabel8.Font = Enum.Font.Gotham
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
					t15:ApplyThemeObj(TextLabel8, "TextColor3", "TextInactive")
				end

				TextButton4.MouseButton1Click:Connect(function()
					local v458 = t15.Themes[t15.CurrentTheme]

					if u449 then
						u449 = false

						if thread then
							task.cancel(thread)
						end

						TextLabel7.Text = p140
						TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
							Color = v458.Stroke,
							Transparency = 0.85
						}):Play()
						v447()
					else
						u449 = true
						TextLabel7.Text = p142 or "Click again to confirm"
						TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
							Color = Color3.fromRGB(255, 75, 75),
							Transparency = 0.4
						}):Play()

						if thread then
							task.cancel(thread)
						end

						thread = task.delay(3, function()
							u449 = false
							TextLabel7.Text = p140
							TweenService:Create(UIStroke5, TweenInfo.new(0.2), {
								Color = t15.Themes[t15.CurrentTheme].Stroke,
								Transparency = 0.85
							}):Play()
						end)
					end
				end)
			end
		}

		return t19
	end

	return t17
end

local ScreenGui2
local Frame2

t15.UpdatePredictHUD = function(p144, p145, p146, p147, p148)
	if not p145 then
		if Frame2 then
			Frame2.Visible = false
		end

		return
	end

	local PlayerGui = LocalPlayer2:WaitForChild("PlayerGui")

	if not ScreenGui2 then
		ScreenGui2 = Instance.new("ScreenGui")
		ScreenGui2.Name = "punishgoatPredictHUD_UI"
		ScreenGui2.ResetOnSpawn = false
		ScreenGui2.IgnoreGuiInset = true
		ScreenGui2.DisplayOrder = 2147483647
		ScreenGui2.Parent = PlayerGui
	end

	if not Frame2 then
		Frame2 = Instance.new("Frame")
		Frame2.Name = "PredictHUD"
		Frame2.Size = UDim2.new(0, 210, 0, 125)
		Frame2.Position = UDim2.new(0.02, 0, 0.22, 0)
		Frame2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		Frame2.BackgroundTransparency = 0.15
		Frame2.BorderSizePixel = 0
		Frame2.ZIndex = 400
		Frame2.Active = true
		Frame2.ClipsDescendants = true
		Frame2.Parent = ScreenGui2
		Instance.new("UICorner", Frame2).CornerRadius = UDim.new(0, 8)

		local UIStroke = Instance.new("UIStroke", Frame2)

		UIStroke.Thickness = 1
		UIStroke.Color = Color3.fromRGB(121, 121, 121)
		UIStroke.Transparency = 0.5

		local TextLabel = Instance.new("TextLabel", Frame2)

		TextLabel.Name = "HUD_Title"
		TextLabel.Size = UDim2.new(1, 0, 0, 20)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = "🔮 PREDICTION HUD"
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.TextSize = 11
		TextLabel.TextColor3 = Color3.fromRGB(172, 0, 0)
		TextLabel.ZIndex = 401

		local UIListLayout2 = Instance.new("UIListLayout", Frame2)

		UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout2.Padding = UDim.new(0, 4)

		local UIPadding = Instance.new("UIPadding", Frame2)

		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.PaddingRight = UDim.new(0, 12)
		UIPadding.PaddingTop = UDim.new(0, 8)
		UIPadding.PaddingBottom = UDim.new(0, 8)

		local TextLabel2 = Instance.new("TextLabel", Frame2)

		TextLabel2.Name = "L_Brainrot"
		TextLabel2.Size = UDim2.new(1, -12, 0, 18)
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.Font = Enum.Font.GothamMedium
		TextLabel2.TextSize = 11
		TextLabel2.TextColor3 = Color3.fromRGB(210, 210, 210)
		TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel2.RichText = true
		TextLabel2.TextWrapped = true
		TextLabel2.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel2.ZIndex = 401

		local TextLabel3 = Instance.new("TextLabel", Frame2)

		TextLabel3.Name = "L_Rarity"
		TextLabel3.Size = UDim2.new(1, -12, 0, 18)
		TextLabel3.BackgroundTransparency = 1
		TextLabel3.Font = Enum.Font.GothamMedium
		TextLabel3.TextSize = 11
		TextLabel3.TextColor3 = Color3.fromRGB(210, 210, 210)
		TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel3.RichText = true
		TextLabel3.TextWrapped = true
		TextLabel3.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel3.ZIndex = 401

		local TextLabel4 = Instance.new("TextLabel", Frame2)

		TextLabel4.Name = "L_Mutation"
		TextLabel4.Size = UDim2.new(1, -12, 0, 18)
		TextLabel4.BackgroundTransparency = 1
		TextLabel4.Font = Enum.Font.GothamMedium
		TextLabel4.TextSize = 11
		TextLabel4.TextColor3 = Color3.fromRGB(210, 210, 210)
		TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel4.RichText = true
		TextLabel4.TextWrapped = true
		TextLabel4.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel4.ZIndex = 401

		local TextLabel5 = Instance.new("TextLabel", Frame2)

		TextLabel5.Name = "L_CPS"
		TextLabel5.Size = UDim2.new(1, -12, 0, 18)
		TextLabel5.BackgroundTransparency = 1
		TextLabel5.Font = Enum.Font.GothamMedium
		TextLabel5.TextSize = 11
		TextLabel5.TextColor3 = Color3.fromRGB(210, 210, 210)
		TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel5.RichText = true
		TextLabel5.TextWrapped = true
		TextLabel5.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel5.ZIndex = 401

		local u470
		local u471
		local Position
		local Position2

		Frame2.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				u470 = true
				Position = input.Position
				Position2 = Frame2.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						u470 = false
					end
				end)
			end
		end)
		Frame2.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				u471 = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == u471 and u470 then
				local v474 = input.Position - Position

				Frame2.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + v474.X, Position2.Y.Scale, Position2.Y.Offset + v474.Y)
			end
		end)

		local TextButton = Instance.new("TextButton", Frame2)

		TextButton.Name = "ResizeGrip"
		TextButton.Size = UDim2.new(0, 15, 0, 15)
		TextButton.Position = UDim2.new(1, 0, 1, 0)
		TextButton.AnchorPoint = Vector2.new(1, 1)
		TextButton.BackgroundTransparency = 1
		TextButton.Text = "◢"
		TextButton.Font = Enum.Font.GothamBold
		TextButton.TextSize = 10
		TextButton.TextColor3 = Color3.fromRGB(121, 121, 121)
		TextButton.ZIndex = 402

		local u476
		local Position3
		local Size

		TextButton.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				u476 = true
				Position3 = input.Position
				Size = Frame2.Size
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						u476 = false
					end
				end)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if u476 then
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					local v479 = input.Position - Position3
					local v480 = math.clamp(Size.X.Offset + v479.X, 180, 500)
					local v481 = math.clamp(Size.Y.Offset + v479.Y, 95, 300)

					Frame2.Size = UDim2.new(0, v480, 0, v481)
				end
			end
		end)
	end

	Frame2.Visible = true
	Frame2.L_Brainrot.Text = "<b>BRAINROT:</b> " .. tostring(p145):upper()
	Frame2.L_Rarity.Text = "<b>RARITY:</b> " .. tostring(p146):upper()
	Frame2.L_Mutation.Text = "<b>MUTATION:</b> " .. tostring(p147):upper()
	Frame2.L_CPS.Text = "<b>CASH/SEC:</b> " .. tostring(p148 or "N/A"):upper()
end
t15.SetPotatoMode = function(p149, p150)
	task.spawn(function()
		local Lighting = game:GetService("Lighting")
		local Workspace = game:GetService("Workspace")
		local Terrain = Workspace:FindFirstChildOfClass("Terrain")

		if p150 then
			if p149.VisualConnections.Potato then
				p149.VisualConnections.Potato:Disconnect()
			end

			local function v485(p151)
				local CurrentCamera = Workspace.CurrentCamera

				if CurrentCamera and p151:IsDescendantOf(CurrentCamera) then
					return true
				end

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Character then
						if p151:IsDescendantOf(player.Character) then
							return true
						end
					end
				end

				return false
			end

			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
			Lighting.GlobalShadows = false
			Lighting.EnvironmentDiffuseScale = 0
			Lighting.EnvironmentSpecularScale = 0
			Lighting.Brightness = 2
			Lighting.FogEnd = 9e9

			if Terrain then
				pcall(function()
					Terrain.WaterWaveSize = 0
				end)
				pcall(function()
					Terrain.WaterWaveSpeed = 0
				end)
				pcall(function()
					Terrain.WaterReflectance = 0
				end)
				pcall(function()
					Terrain.WaterTransparency = 0
				end)
				pcall(function()
					Terrain.Decoration = false
				end)
			end

			local function v489(p152)
				if v485(p152) then
					return
				end

				pcall(function()
					if p152:IsA("BasePart") and not p152:IsA("Terrain") then
						p152.Material = Enum.Material.SmoothPlastic
						p152.Reflectance = 0
						p152.CastShadow = false

						if p152:IsA("MeshPart") then
							p152.TextureID = ""
						end
					elseif p152:IsA("SpecialMesh") then
						p152.TextureId = ""
					elseif p152:IsA("SurfaceAppearance") then
						p152:Destroy()
					elseif p152:IsA("Decal") or p152:IsA("Texture") then
						p152.Transparency = 1
					elseif p152:IsA("ParticleEmitter") or p152:IsA("Trail") or p152:IsA("Beam") or p152:IsA("Smoke") or p152:IsA("Fire") or p152:IsA("Sparkles") then
						p152.Enabled = false
					elseif p152:IsA("Highlight") then
						p152.Enabled = false

						return
					elseif p152:IsA("PostEffect") or p152:IsA("Atmosphere") or p152:IsA("Sky") then
						p152.Enabled = false
					elseif p152:IsA("Light") then
						p152.Enabled = false
					end
				end)
			end

			local descendants = Workspace:GetDescendants()

			for i, descendant in ipairs(descendants) do
				v489(descendant)

				if i % 500 == 0 then
					task.wait()
				end
			end

			for _, child in ipairs(Lighting:GetChildren()) do
				v489(child)
			end

			p149.VisualConnections.Potato = Workspace.DescendantAdded:Connect(function(descendant)
				v489(descendant)
			end)
		else
			if p149.VisualConnections.Potato then
				p149.VisualConnections.Potato:Disconnect()
				p149.VisualConnections.Potato = nil
			end

			Lighting.GlobalShadows = true
			settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
		end
	end)
end
t15.SetRTXMode = function(p153, p154)
	task.spawn(function()
		local Lighting = game:GetService("Lighting")
		local Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")

		if p154 then
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
			Lighting.GlobalShadows = true
			Lighting.ShadowSoftness = 0.2
			Lighting.Brightness = 3
			Lighting.EnvironmentDiffuseScale = 1.2
			Lighting.EnvironmentSpecularScale = 1.5
			Lighting.Ambient = Color3.fromRGB(130, 145, 165)
			Lighting.OutdoorAmbient = Color3.fromRGB(180, 190, 210)
			Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
			Lighting.ColorShift_Top = Color3.fromRGB(255, 240, 245)

			if Terrain then
				Terrain.WaterWaveSize = 0.8
				Terrain.WaterWaveSpeed = 10
				Terrain.WaterReflectance = 1
				Terrain.WaterTransparency = 0.6
				Terrain.Decoration = true
			end

			for _, child in ipairs(Lighting:GetChildren()) do
				if child:IsA("PostEffect") or child:IsA("Atmosphere") then
					if child.Name:match("punishgoat") then
						child:Destroy()
					end
				end
			end

			local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")

			ColorCorrectionEffect.Name = "punishgoatColor"
			ColorCorrectionEffect.Brightness = 0.05
			ColorCorrectionEffect.Contrast = 0.15
			ColorCorrectionEffect.Saturation = 0.65
			ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 245, 255)
			ColorCorrectionEffect.Parent = Lighting

			local BloomEffect = Instance.new("BloomEffect")

			BloomEffect.Name = "punishgoatBloom"
			BloomEffect.Intensity = 0.5
			BloomEffect.Size = 40
			BloomEffect.Threshold = 2
			BloomEffect.Parent = Lighting

			local SunRaysEffect = Instance.new("SunRaysEffect")

			SunRaysEffect.Name = "punishgoatSunRays"
			SunRaysEffect.Intensity = 0.25
			SunRaysEffect.Spread = 0.75
			SunRaysEffect.Parent = Lighting

			local Atmosphere = Instance.new("Atmosphere")

			Atmosphere.Name = "punishgoatAtmosphere"
			Atmosphere.Density = 0.25
			Atmosphere.Offset = 0.25
			Atmosphere.Color = Color3.fromRGB(150, 180, 220)
			Atmosphere.Decay = Color3.fromRGB(255, 180, 200)
			Atmosphere.Glare = 0.2
			Atmosphere.Haze = 0.4
			Atmosphere.Parent = Lighting

			local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")

			DepthOfFieldEffect.Name = "punishgoatDOF"
			DepthOfFieldEffect.FarIntensity = 0.25
			DepthOfFieldEffect.FocusDistance = 25
			DepthOfFieldEffect.InFocusRadius = 40
			DepthOfFieldEffect.NearIntensity = 0
			DepthOfFieldEffect.Parent = Lighting
		else
			for _, child in ipairs(Lighting:GetChildren()) do
				if child:IsA("PostEffect") or child:IsA("Atmosphere") then
					if child.Name:match("punishgoat") then
						child:Destroy()
					end
				end
			end
		end
	end)
end

local CoreGui2 = game:GetService("CoreGui")

for _, child in ipairs(CoreGui2:GetChildren()) do
	if child.Name == "Punishment" then
		pcall(function()
			child:Destroy()
		end)
	end
end

local lib = loadstring(game:HttpGet("https://p.ip.fi/MzAW.txt"))()
local Punishment = t15:CreateWindow("Novex Hub")
local UserInputService2 = game:GetService("UserInputService")

game:GetService("TweenService")

local RunService = game:GetService("RunService")

game:GetService("GuiService")

local Players2 = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService2 = game:GetService("HttpService")
local LocalPlayer3 = Players2.LocalPlayer

local function v517()
end

local t25 = {
	Background = Color3.fromRGB(30, 30, 33),
	TopBar = Color3.fromRGB(42, 42, 46),
	Sidebar = Color3.fromRGB(30, 30, 33),
	Panel = Color3.fromRGB(42, 42, 46),
	ElementBg = Color3.fromRGB(42, 42, 46),
	ElementOutline = Color3.fromRGB(0, 240, 255),
	Accent = Color3.fromRGB(0, 240, 255),
	AccentHover = Color3.fromRGB(100, 245, 255),
	Text = Color3.fromRGB(245, 245, 245),
	SubText = Color3.fromRGB(180, 160, 220),
	Border = Color3.fromRGB(0, 240, 255)
}

local function v519(p155, p156, p157)
	local v520 = p157 or 3

	pcall(function()
		local Frame3 = Instance.new("Frame")

		Frame3.Size = UDim2.new(0, 350, 0, 60)
		Frame3.Position = UDim2.new(0.5, -175, 0, -70)
		Frame3.BackgroundColor3 = t25.Background
		Frame3.BackgroundTransparency = 0.1
		Frame3.BorderSizePixel = 0
		Frame3.Parent = CoreGui2

		local UICorner = Instance.new("UICorner")

		UICorner.CornerRadius = UDim.new(0, 8)
		UICorner.Parent = Frame3

		local UIStroke = Instance.new("UIStroke")

		UIStroke.Color = t25.Accent
		UIStroke.Thickness = 2
		UIStroke.Parent = Frame3

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Size = UDim2.new(1, -16, 0, 24)
		TextLabel.Position = UDim2.new(0, 8, 0, 4)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = p155
		TextLabel.TextColor3 = t25.Text
		TextLabel.TextSize = 14
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Parent = Frame3

		local TextLabel2 = Instance.new("TextLabel")

		TextLabel2.Size = UDim2.new(1, -16, 0, 24)
		TextLabel2.Position = UDim2.new(0, 8, 0, 28)
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.Text = p156
		TextLabel2.TextColor3 = t25.SubText
		TextLabel2.TextSize = 12
		TextLabel2.Font = Enum.Font.Gotham
		TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel2.Parent = Frame3
		Frame3:TweenPosition(UDim2.new(0.5, -175, 0, 10), "Out", "Quart", 0.3, true)
		task.delay(v520, function()
			pcall(function()
				Frame3:TweenPosition(UDim2.new(0.5, -175, 0, -70), "In", "Quart", 0.3, true)
				task.delay(0.3, function()
					pcall(function()
						Frame3:Destroy()
					end)
				end)
			end)
		end)
	end)
end
local function v526(p158)
	return p158:gsub("^DFInt", ""):gsub("^DFFlag", ""):gsub("FString", ""):gsub("FLog", ""):gsub("^FFlag", ""):gsub("^DFint", ""):gsub("^FInt", "")
end
local function v527(p159, p160, p161)
	if firetouchinterest then
		pcall(function()
			firetouchinterest(p159, p160, p161)
		end)
	end
end
local function v528(p162)
	if setfflag then
		pcall(function()
			local DFIntTargetTimeDelayFacctorTenths = v526("DFIntTargetTimeDelayFacctorTenths")

			if getfflag(DFIntTargetTimeDelayFacctorTenths) == nil then
				if getfflag("DFIntTargetTimeDelayFacctorTenths") ~= nil then
					setfflag("DFIntTargetTimeDelayFacctorTenths", tostring(p162))
				end
			else
				setfflag(DFIntTargetTimeDelayFacctorTenths, tostring(p162))
			end
		end)

		return
	end
end
local function v530(p163)
	if setfflag then
		pcall(function()
			local FIntInterpolationMaxDelayMSec = v526("FIntInterpolationMaxDelayMSec")

			if getfflag(FIntInterpolationMaxDelayMSec) == nil then
				if getfflag("FIntInterpolationMaxDelayMSec") ~= nil then
					setfflag("FIntInterpolationMaxDelayMSec", tostring(p163))
				end
			else
				setfflag(FIntInterpolationMaxDelayMSec, tostring(p163))
			end
		end)

		return
	end
end
local function v532()
	return workspace:FindFirstChild("Footballs")
end
local function v533()
	local v534 = v532()

	if not v534 then
		return nil
	end

	local Character = LocalPlayer3.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil
	end

	local huge = math.huge
	local v538

	for _, v in v534:GetChildren() do
		if v:IsA("BasePart") then
			local Magnitude = (v.Position - HumanoidRootPart.Position).Magnitude

			if Magnitude < huge then
				huge = Magnitude
				v538 = v
			end
		end
	end

	return v538, huge
end

local t26 = {}

local function v543(p164)
	local connection = LocalPlayer3.CharacterAdded:Connect(function()
		task.wait(0.5)
		p164()
	end)

	table.insert(t26, connection)

	return connection
end
local function v545()
	local Lighting = game:GetService("Lighting")

	for _, child in ipairs(Lighting:GetChildren()) do
		if child:IsA("Sky") then
			child:Destroy()
		end
	end
end
local function v549(p165, p166, p167, p168, p169, p170, p171)
	v545()

	local Sky = Instance.new("Sky")

	Sky.SkyboxBk = p165
	Sky.SkyboxDn = p166
	Sky.SkyboxFt = p167
	Sky.SkyboxLf = p168
	Sky.SkyboxRt = p169
	Sky.SkyboxUp = p170
	Sky.StarCount = p171 or 0
	Sky.Parent = game:GetService("Lighting")
end

NightSky = function()
	v549("http://www.roblox.com/asset/?id=12064107", "http://www.roblox.com/asset/?id=12064152", "http://www.roblox.com/asset/?id=12064121", "http://www.roblox.com/asset/?id=12063984", "http://www.roblox.com/asset/?id=12064115", "http://www.roblox.com/asset/?id=12064131", 0)
	v519("Sky", "Night Sky applied", 2)
end
ScaryNight = function()
	v549("http://www.roblox.com/asset/?id=48020371", "http://www.roblox.com/asset/?id=48020144", "http://www.roblox.com/asset/?id=48020234", "http://www.roblox.com/asset/?id=48020211", "http://www.roblox.com/asset/?id=48020254", "http://www.roblox.com/asset/?id=48020383", 3000)
	v519("Sky", "Scary Night applied", 2)
end
SakuraSky = function()
	v549("http://www.roblox.com/asset/?id=271042516", "http://www.roblox.com/asset/?id=271077243", "http://www.roblox.com/asset/?id=271042556", "http://www.roblox.com/asset/?id=271042310", "http://www.roblox.com/asset/?id=271042467", "http://www.roblox.com/asset/?id=271077958", 1334)
	v519("Sky", "Sakura Sky applied", 2)
end
GalaxySky = function()
	v549("http://www.roblox.com/asset/?id=15983968922", "http://www.roblox.com/asset/?id=15983966825", "http://www.roblox.com/asset/?id=15983965025", "http://www.roblox.com/asset/?id=15983967420", "http://www.roblox.com/asset/?id=15983966246", "http://www.roblox.com/asset/?id=15983964246", 3000)
	v519("Sky", "Galaxy Sky applied", 2)
end
PurpleNight = function()
	v549("http://www.roblox.com/asset/?id=5084575798", "http://www.roblox.com/asset/?id=5084575916", "http://www.roblox.com/asset/?id=5103949679", "http://www.roblox.com/asset/?id=5103948542", "http://www.roblox.com/asset/?id=5103948784", "http://www.roblox.com/asset/?id=5084576400", 3000)
	v519("Sky", "Purple Night applied", 2)
end
SunsetOrange = function()
	v549("http://www.roblox.com/asset/?id=458016711", "http://www.roblox.com/asset/?id=458016826", "http://www.roblox.com/asset/?id=458016532", "http://www.roblox.com/asset/?id=458016655", "http://www.roblox.com/asset/?id=458016782", "http://www.roblox.com/asset/?id=458016792", 3000)
	v519("Sky", "Sunset Orange applied", 2)
end
PurpleSky = function()
	v549("http://www.roblox.com/asset/?id=570557514", "http://www.roblox.com/asset/?id=570557775", "http://www.roblox.com/asset/?id=570557559", "http://www.roblox.com/asset/?id=570557620", "http://www.roblox.com/asset/?id=570557672", "http://www.roblox.com/asset/?id=570557727", 3000)
	v519("Sky", "Purple Sky applied", 2)
end
GraySky = function()
	v549("http://www.roblox.com/asset/?id=18703245834", "http://www.roblox.com/asset/?id=18703243349", "http://www.roblox.com/asset/?id=18703240532", "http://www.roblox.com/asset/?id=18703237556", "http://www.roblox.com/asset/?id=18703235430", "http://www.roblox.com/asset/?id=18703232671", 3500)
	v519("Sky", "Gray Sky applied", 2)
end
MountainSky = function()
	v549("http://www.roblox.com/asset/?id=160188495", "http://www.roblox.com/asset/?id=160188614", "http://www.roblox.com/asset/?id=160188609", "http://www.roblox.com/asset/?id=160188589", "http://www.roblox.com/asset/?id=160188597", "http://www.roblox.com/asset/?id=160188588", 3000)
	v519("Sky", "Mountain Sky applied", 2)
end
PinkiePreppy = function()
	v549("http://www.roblox.com/asset/?id=11555017034", "http://www.roblox.com/asset/?id=11555013415", "http://www.roblox.com/asset/?id=11555010145", "http://www.roblox.com/asset/?id=11555006545", "http://www.roblox.com/asset/?id=11555000712", "http://www.roblox.com/asset/?id=11554996247", 3000)
	v519("Sky", "Pinkie Preppy applied", 2)
end
MountainSky2 = function()
	v549("http://www.roblox.com/asset/?id=368385273", "http://www.roblox.com/asset/?id=48015300", "http://www.roblox.com/asset/?id=368388290", "http://www.roblox.com/asset/?id=368390615", "http://www.roblox.com/asset/?id=368385190", "http://www.roblox.com/asset/?id=48015387", 3000)
	v519("Sky", "Mountain Sky 2 applied", 2)
end
SunsetMountain = function()
	v549("http://www.roblox.com/asset/?id=17901353811", "http://www.roblox.com/asset/?id=17901366771", "http://www.roblox.com/asset/?id=17901356262", "http://www.roblox.com/asset/?id=17901359687", "http://www.roblox.com/asset/?id=17901362326", "http://www.roblox.com/asset/?id=17901365106", 3000)
	v519("Sky", "Sunset Mountain applied", 2)
end
ResetSky = function()
	v545()
	v519("Sky", "Reset to default", 2)
end
pcall(function()
	local lunarTheme = {
		MainBg = Color3.fromRGB(30, 30, 33),
		Stroke = Color3.fromRGB(0, 240, 255),
		Accent = Color3.fromRGB(0, 240, 255),
		Accentpunish = Color3.fromRGB(0, 240, 255),
		Text = Color3.fromRGB(245, 245, 245),
		TextInactive = Color3.fromRGB(180, 160, 220),
		ToggleBgOff = Color3.fromRGB(42, 42, 46),
		ToggleBtnBg = Color3.fromRGB(42, 42, 46),
		ToggleDot = Color3.fromRGB(245, 245, 245),
		SectionTitle = Color3.fromRGB(180, 160, 220)
	}

	t15.Themes = t15.Themes or {}
	t15.Themes.NovexHub = lunarTheme
	t15:ChangeTheme("NovexHub")
end)

local t27 = {
	Home = Punishment:CreateTab("Home", lib:GetIcon("house", "Lucide")),
	Reach = Punishment:CreateTab("Reach", lib:GetIcon("sword", "Lucide")),
	React = Punishment:CreateTab("React", lib:GetIcon("zap", "Lucide")),
	Moss = Punishment:CreateTab("Moss", lib:GetIcon("leaf", "Lucide")),
	Xeno = Punishment:CreateTab("Xeno React", lib:GetIcon("rocket", "Lucide")),
	GK = Punishment:CreateTab("Goalkeeper", lib:GetIcon("hand", "Phosphor")),
	Prediction = Punishment:CreateTab("Prediction", lib:GetIcon("target", "Lucide")),
	Extras = Punishment:CreateTab("Extras", lib:GetIcon("sparkles", "Lucide")),
	Flags = Punishment:CreateTab("Flags", lib:GetIcon("flag", "Lucide")),
	Skys = Punishment:CreateTab("Skys", lib:GetIcon("cloud", "Lucide")),
	Config = Punishment:CreateTab("Config", lib:GetIcon("settings", "Lucide"))
}

t27.Home:CreateButton("Credits to Null & Leo", "", lib:GetIcon("star", "Lucide"), function() end)
t27.Home:CreateButton("🔵 JOIN NOVEX HUB", "click to copy discord invite", lib:GetIcon("message-circle", "Lucide"), function()
	setclipboard("https://discord.gg/Qtsayh6ast")
end)

local u553 = false
local n12 = 1
local u555 = false

t27.Reach:CreateSection("Reach Method 1 [Hitbox]")
t27.Reach:CreateToggle("Enable Reach M1", "after enabling, set size", false, function(p172)
	u553 = p172

	local v556 = v519
	local s5 = "Reach M1"
	local v558 = p172 and "ENABLED"

	v556(s5, v558 or "DISABLED", 2)
end)
t27.Reach:CreateSlider("Reach Size", 1, 30, 1, function(p173)
	n12 = p173
end)
t27.Reach:CreateButton("Toggle Visibility", "show/hide the hitbox", lib:GetIcon("eye", "Lucide"), function()
	u555 = not u555

	local v559 = v519
	local s6 = "Reach M1"
	local v561 = u555 and "VISIBLE"

	v559(s6, v561 or "HIDDEN", 2)
end)
t27.Reach:CreateDivider()

local u562 = false
local n13 = 1
local u564 = false

local function v565()
	if getgenv().Reach then
		getgenv().Reach = nil
	end

	if getgenv().ReachConnections then
		for _, reachConnection in ipairs(getgenv().ReachConnections) do
			pcall(function()
				reachConnection:Disconnect()
			end)
		end

		getgenv().ReachConnections = nil
	end

	getgenv().ReachConnections = {}
	getgenv().Reach = {
		Enabled = false,
		Size = n13,
		Transparency = u564 and 0.7 or 1,
		Distance = 100
	}

	local LocalPlayer4 = game:GetService("Players").LocalPlayer
	local HumanoidRootPart = (LocalPlayer4.Character or LocalPlayer4.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
	local Footballs = workspace:WaitForChild("Footballs")
	local t28 = {}
	local t29 = {}

	local function v573(child)
		if child:IsA("BasePart") then
			t28[child] = true
			t29[child] = child.Size
		end
	end

	for _, child in ipairs(Footballs:GetChildren()) do
		if child:IsA("BasePart") then
			t28[child] = true
			t29[child] = child.Size
		end
	end

	table.insert(getgenv().ReachConnections, Footballs.ChildAdded:Connect(v573))
	table.insert(getgenv().ReachConnections, Footballs.ChildRemoved:Connect(function(child)
		t28[child] = nil
		t29[child] = nil
	end))

	local function v576()
		local Size = getgenv().Reach.Size or n13
		local Transparency = getgenv().Reach.Transparency or 1

		for k in pairs(t28) do
			if k and k.Parent then
				k.Size = Vector3.new(Size, Size, Size)
				k.Transparency = Transparency
				k.CanCollide = false
			end
		end
	end
	local function v580()
		for k, v in pairs(t29) do
			if k and k.Parent then
				k.Size = v
				k.Transparency = 0
				k.CanCollide = true
			end
		end
	end
	local function v583()
		local v584
		local huge = math.huge

		for k in pairs(t28) do
			if k and k.Parent then
				local Magnitude = (k.Position - HumanoidRootPart.Position).Magnitude

				if Magnitude < huge then
					huge = Magnitude
					v584 = k
				end
			end
		end

		return v584, huge
	end

	local Part = Instance.new("Part")

	Part.Name = "BallFollowPart"
	Part.Shape = Enum.PartType.Ball
	Part.Size = Vector3.new(2.25, 2.25, 2.25)
	Part.Anchored = true
	Part.CanCollide = true
	Part.CanTouch = false
	Part.CanQuery = false
	Part.Transparency = 0.5
	Part.Material = Enum.Material.ForceField
	Part.Color = Color3.fromRGB(0, 200, 255)
	Part.Parent = workspace
	table.insert(getgenv().ReachConnections, RunService.Heartbeat:Connect(function()
		local v589, v590 = v583()

		if v589 and not (getgenv().Reach.Distance < v590) then
			v576()
			Part.CFrame = v589.CFrame
		else
			v580()
			Part.CFrame = CFrame.new(0, -1000, 0)
		end
	end))
	getgenv().DisableReach = function()
		if getgenv().ReachConnections then
			for _, reachConnection in ipairs(getgenv().ReachConnections) do
				reachConnection:Disconnect()
			end
		end

		v580()

		if Part then
			Part:Destroy()
		end

		getgenv().Reach = nil
		getgenv().ReachConnections = nil
	end
end

t27.Reach:CreateSection("Reach Method 2 [Ball]")
t27.Reach:CreateToggle("Enable Reach M2", "after enabling, set size", false, function(p174)
	u562 = p174

	if p174 then
		pcall(v565)
	elseif getgenv().DisableReach then
		pcall(getgenv().DisableReach)
	end

	v519("Reach M2", p174 and "ENABLED" or "DISABLED", 2)
end)
t27.Reach:CreateSlider("Reach Size", 1, 30, 1, function(p175)
	n13 = p175

	if getgenv().Reach then
		getgenv().Reach.Size = p175
	end
end)
t27.Reach:CreateButton("Toggle Visibility", "show/hide the ball hitbox", lib:GetIcon("eye", "Lucide"), function()
	u564 = not u564

	if getgenv().Reach then
		getgenv().Reach.Transparency = u564 and 0.7 or 1
	end

	v519("Reach M2", u564 and "VISIBLE" or "HIDDEN", 2)
end)
t27.Reach:CreateDivider()

local u593 = false
local n14 = 1
local n15 = 1
local n16 = 1
local u597 = false

t27.Reach:CreateSection("Reach Method 3 [XYZ]")
t27.Reach:CreateToggle("Enable Reach M3", "extend ball XYZ independently", false, function(p176)
	u593 = p176
	v519("Reach M3", p176 and "ENABLED" or "DISABLED", 2)
end)
t27.Reach:CreateSlider("X Size", 1, 30, 1, function(p177)
	n14 = p177
end)
t27.Reach:CreateSlider("Y Size", 1, 30, 1, function(p178)
	n15 = p178
end)
t27.Reach:CreateSlider("Z Size", 1, 30, 1, function(p179)
	n16 = p179
end)
t27.Reach:CreateButton("Toggle Visibility", "show/hide the XYZ hitbox", lib:GetIcon("eye", "Lucide"), function()
	u597 = not u597
	v519("Reach M3", u597 and "VISIBLE" or "HIDDEN", 2)
end)

local u598 = false
local n17
local thread
local t30 = {
	[15] = {
		tt = "16",
		interp = "175",
		offset = "0"
	},
	[25] = {
		tt = "14",
		interp = "175",
		offset = "0"
	},
	[50] = {
		tt = "11",
		interp = "175",
		offset = "0"
	},
	[75] = {
		tt = "10",
		interp = "175",
		offset = "0"
	},
	[100] = {
		tt = "9",
		interp = "175",
		offset = "0"
	}
}

local function v602()
	if thread then
		task.cancel(thread)
		thread = nil
	end

	local v603 = t30[n17]

	if v603 then
		thread = task.spawn(function()
			while u598 do
				pcall(function()
					for k, v in pairs({
						TargetTimeDelayFacctorTenths = v603.tt,
						InterpolationMaxDelayMsec = v603.interp,
						InterpolationOffset = v603.offset
					}) do
						pcall(function()
							setfflag("DFInt" .. k, v)
						end)
						pcall(function()
							setfflag(k, v)
						end)
						pcall(function()
							setfflag("FInt" .. k, v)
						end)
						pcall(function()
							setfflag("FFlag" .. k, v)
						end)
					end
				end)
				task.wait(15)
			end
		end)

		return
	end
end
local function v606()
	if thread then
		task.cancel(thread)
		thread = nil
	end
end

t27.React:CreateSection("React Settings")
t27.React:CreateToggle("Enable React", "master toggle for react flags", false, function(p180)
	u598 = p180

	if p180 then
		v602()
		v519("React", "ENABLED", 2)
	else
		v606()
		v519("React", "DISABLED", 2)
	end
end)
t27.React:CreateDivider()
t27.React:CreateSection("React Levels")
t27.React:CreateButton("React 15%  — safest", "highest delay, most legit", nil, function()
	n17 = 15

	if u598 then
		v602()
	end

	v519("React", "Level 15%", 2)
end)
t27.React:CreateButton("React 25%  — low", "lower delay factor", nil, function()
	n17 = 25

	if u598 then
		v602()
	end

	v519("React", "Level 25%", 2)
end)
t27.React:CreateButton("React 50%  — medium", "balanced", nil, function()
	n17 = 50

	if u598 then
		v602()
	end

	v519("React", "Level 50%", 2)
end)
t27.React:CreateButton("React 75%  — high", "aggressive", nil, function()
	n17 = 75

	if u598 then
		v602()
	end

	v519("React", "Level 75%", 2)
end)
t27.React:CreateButton("React 100% — max", "most aggressive, noticeable", nil, function()
	n17 = 100

	if u598 then
		v602()
	end

	v519("React", "Level 100%", 2)
end)

local u607 = false
local n18
local n19 = 10
local connection
local thread2
local Head
local u613 = false
local t31 = {
	[15] = {
		tt_idle = "13",
		tt_hit = "9",
		interp = "90"
	},
	[25] = {
		tt_idle = "12",
		tt_hit = "8",
		interp = "85"
	},
	[50] = {
		tt_idle = "10",
		tt_hit = "6",
		interp = "75"
	},
	[75] = {
		tt_idle = "8",
		tt_hit = "3",
		interp = "67"
	},
	[100] = {
		tt_idle = "6",
		tt_hit = "0",
		interp = "60"
	}
}

local function v615()
	if connection then
		connection:Disconnect()
		connection = nil
	end

	if thread2 then
		task.cancel(thread2)
		thread2 = nil
	end

	local v616 = t31[n18]

	if not v616 then
		return
	end

	thread2 = task.spawn(function()
		while u607 do
			v528(v616.tt_idle)
			v530(v616.interp)
			task.wait(20)
		end
	end)
	connection = RunService.PreSimulation:Connect(function()
		if not u607 then
			return
		end

		local Character = LocalPlayer3.Character

		if not Character then
			return
		end

		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if not Humanoid then
			return
		end

		if not Head or not Head.Parent then
			Head = Character:FindFirstChild("Head")
		end

		if not Head then
			return
		end

		local state = Humanoid:GetState()

		if state ~= Enum.HumanoidStateType.Jumping and state ~= Enum.HumanoidStateType.Freefall then
			if u613 then
				u613 = false
				v528(v616.tt_idle)
			end

			return
		end

		local v620, v621 = v533()

		if not v620 then
			return
		end

		if n19 < v621 then
			if u613 then
				u613 = false
				v528(v616.tt_idle)
			end

			return
		end

		local v622 = v620.Position + v620.AssemblyLinearVelocity * (math.clamp(LocalPlayer3:GetNetworkPing(), 0.016, 0.15) + 0.016666666666666666)
		local Position = Head.Position
		local v624 = v622.Y - Position.Y
		local v625 = v622.Z - Position.Z

		if math.abs(v622.X - Position.X) <= 4 and math.abs(v625) <= 4 and v624 >= 1 and v624 <= 8 then
			v527(v620, Head, 0)
			v527(v620, Head, 1)

			if not u613 then
				u613 = true
				v528(v616.tt_hit)
			end
		elseif u613 then
			u613 = false
			v528(v616.tt_idle)
		end
	end)
end
local function v626()
	if connection then
		connection:Disconnect()
		connection = nil
	end

	if thread2 then
		task.cancel(thread2)
		thread2 = nil
	end

	u613 = false
	v528("20")
end

t27.Moss:CreateSection("Moss Settings")
t27.Moss:CreateToggle("Enable Moss", "master toggle — activates on jump when close", false, function(p181)
	u607 = p181

	if p181 then
		v615()
		v519("Moss", "ENABLED", 2)
	else
		v626()
		v519("Moss", "DISABLED", 2)
	end
end)
t27.Moss:CreateSlider("Reach Radius", 5, 50, 10, function(p182)
	n19 = p182
end)
t27.Moss:CreateDivider()
t27.Moss:CreateSection("Moss Levels")
t27.Moss:CreateButton("Moss 15%  — kinda obv", "safest, highest delay", nil, function()
	n18 = 15

	if u607 then
		v615()
	end

	v519("Moss", "Level 15%", 2)
end)
t27.Moss:CreateButton("Moss 25%  — unmossable", "hard to moss back", nil, function()
	n18 = 25

	if u607 then
		v615()
	end

	v519("Moss", "Level 25%", 2)
end)
t27.Moss:CreateButton("Moss 50%  — barely mossable", "balanced", nil, function()
	n18 = 50

	if u607 then
		v615()
	end

	v519("Moss", "Level 50%", 2)
end)
t27.Moss:CreateButton("Moss 75%  — not mossable", "aggressive", nil, function()
	n18 = 75

	if u607 then
		v615()
	end

	v519("Moss", "Level 75%", 2)
end)
t27.Moss:CreateButton("Moss 100% — blatant", "most aggressive, noticeable", nil, function()
	n18 = 100

	if u607 then
		v615()
	end

	v519("Moss", "Level 100%", 2)
end)

local n20 = 40
local n21 = 45
local n22 = 28
local n23 = 1
local n24 = 6
local n25 = 1.8
local u633 = false
local u634 = false
local u635 = false
local u636
local u637 = false
local Part
local u639 = false

local function v640()
	local PlayerGui = LocalPlayer3:FindFirstChild("PlayerGui")

	if not PlayerGui then
		return false
	end

	local Main = PlayerGui:FindFirstChild("Main")

	if not Main then
		return false
	end

	local Values = Main:FindFirstChild("Values")

	if not Values then
		return false
	end

	local Goalie = Values:FindFirstChild("Goalie")

	if Goalie then
		return Goalie.Value == true
	end

	return false
end
local function v645()
	local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
	local Game = Remotes and Remotes:FindFirstChild("Game")
	local Touch = Game and Game:FindFirstChild("Touch")

	return Touch and Touch:FindFirstChild("Kick")
end
local function v649()
	local Footballs = workspace:FindFirstChild("Footballs")

	if not Footballs then
		return {}
	end

	local t32 = {}

	for _, child in ipairs(Footballs:GetChildren()) do
		local isBasePart = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")

		if isBasePart then
			table.insert(t32, isBasePart)
		end
	end

	return t32
end
local function v655()
	local Character = LocalPlayer3.Character

	if not Character then
		return nil, math.huge
	end

	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil, math.huge
	end

	local v658 = v649()

	if #v658 == 0 then
		return nil, math.huge
	end

	local v659
	local v660 = -math.huge
	local huge = math.huge

	for _, v in ipairs(v658) do
		local v664 = HumanoidRootPart.Position - v.Position
		local Magnitude = v664.Magnitude

		if not (n20 < Magnitude) then
			local AssemblyLinearVelocity = v.AssemblyLinearVelocity
			local Magnitude2 = AssemblyLinearVelocity.Magnitude
			local n26 = 0

			if Magnitude2 > 1 and Magnitude > 0 then
				n26 = AssemblyLinearVelocity.Unit:Dot(v664.Unit)
			end

			local v669 = n26 * Magnitude2 + 1 / math.max(Magnitude, 1) * 10

			if v660 < v669 then
				v660 = v669
				v659 = v
				huge = Magnitude
			end
		end
	end

	if not v659 then
		local huge2 = math.huge

		for _, v in ipairs(v658) do
			local Magnitude = (v.Position - HumanoidRootPart.Position).Magnitude

			if Magnitude < huge2 then
				huge2 = Magnitude
				v659 = v
				huge = Magnitude
			end
		end
	end

	return v659, huge
end
local function v674(p183, p184)
	local v675 = p183.CFrame:PointToObjectSpace(p184)

	if v675.Y > 4 then
		return "rbxassetid://83669895507175", {
			Right = false,
			Ground = false,
			Left = false
		}
	end

	local v676 = math.abs(v675.X)

	if math.abs(v675.Z) <= v676 then
		if v675.X > 0 then
			return "rbxassetid://130737929982335", {
				Right = true,
				Ground = false,
				Left = false
			}
		end

		return "rbxassetid://97298506180835", {
			Right = false,
			Ground = false,
			Left = true
		}
	end

	if v675.Z < 0 then
		return "rbxassetid://83669895507175", {
			Right = false,
			Ground = false,
			Left = false
		}
	end

	return "rbxassetid://133843606757895", {
		Right = false,
		Ground = false,
		Left = false
	}
end
local function v677()
	for _, v in ipairs(v649()) do
		local Size = v.Size
		local CanCollide = v.CanCollide

		pcall(function()
			v.Size = Vector3.new(10, 10, 10)
			v.CanCollide = false
		end)
		task.delay(0.18, function()
			pcall(function()
				if v and v.Parent then
					v.Size = Size
					v.CanCollide = CanCollide
				end
			end)
		end)
	end
end
local function v682(p185, p186)
	local v683 = v645()

	if not v683 then
		return
	end

	local cFrame = CFrame.new(p185.Position, p185.Position + p185.CFrame.LookVector)

	for _, v in ipairs(v649()) do
		local t33 = { {
			v,
			"Dive",
			1,
			p186,
			cFrame,
			Vector3.zero
		} }

		pcall(function()
			v683:FireServer(unpack(t33))
		end)
	end
end
local function v688()
	if u636 then
		pcall(function()
			u636:Stop()
		end)
		u636 = nil
	end

	u635 = false
end
local function v689(p187, p188)
	v688()

	local Humanoid = p187:FindFirstChildOfClass("Humanoid")

	if not Humanoid then
		return
	end

	u635 = true

	local Animation = Instance.new("Animation")

	Animation.AnimationId = p188

	local v692 = Humanoid:LoadAnimation(Animation)

	u636 = v692
	v692:Play()
	v692.Stopped:Connect(function()
		u635 = false
		u636 = nil
		pcall(function()
			Animation:Destroy()
		end)
	end)
	task.delay(4, function()
		if u636 == v692 then
			v688()
			pcall(function()
				Animation:Destroy()
			end)
		end
	end)
end
local function v693(p189)
	if not u634 then
		if not u635 then
			local Character = LocalPlayer3.Character

			if not Character then
				return
			end

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return
			end

			u634 = true

			local Position = p189.Position
			local v697, v698 = v674(HumanoidRootPart, Position)
			local v699 = Position - HumanoidRootPart.Position
			local Y = v699.Y
			local vector3 = Vector3.new(v699.X, 0, v699.Z)

			if vector3.Magnitude < 0.01 then
				vector3 = HumanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)
			end

			local Unit = vector3.Unit
			local assemblyLinearVelocity

			if Y > 4 then
				assemblyLinearVelocity = Unit * n21 + Vector3.new(0, n22 + Y * n25, 0)
			else
				assemblyLinearVelocity = Unit * n21 + Vector3.new(0, n22, 0)
			end

			HumanoidRootPart.AssemblyLinearVelocity = assemblyLinearVelocity

			local n27 = 0
			local connection2

			connection2 = RunService.Heartbeat:Connect(function()
				n27 = n27 + 1

				if n27 <= 5 then
					pcall(function()
						HumanoidRootPart.AssemblyLinearVelocity = assemblyLinearVelocity
					end)
				else
					connection2:Disconnect()
				end
			end)
			v689(Character, v697)

			for _, v in ipairs({
				0.08,
				0.22,
				0.38,
				0.52,
				0.68,
				0.84
			}) do
				task.delay(v, function()
					v677()
				end)
			end

			local now = tick()
			local connection3

			connection3 = RunService.PreSimulation:Connect(function()
				local HumanoidRootPart2 = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart2 then
					connection3:Disconnect()

					return
				end

				for _, v in ipairs(v649()) do
					if (v.Position - HumanoidRootPart2.Position).Magnitude < 5 then
						connection3:Disconnect()

						return
					end
				end

				if tick() - now >= 3.5 then
					connection3:Disconnect()

					return
				end

				v682(HumanoidRootPart2, v698)
			end)
			task.delay(n23, function()
				u634 = false
			end)

			return
		end
	end
end
local function v713()
	if u639 then
		if u633 then
			local Character = LocalPlayer3.Character

			if not Character then
				return
			end

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return
			end

			if not Part then
				Part = Instance.new("Part")
				Part.Name = "GK_DiveRange_Visual"
				Part.Shape = Enum.PartType.Ball
				Part.Anchored = true
				Part.CanCollide = false
				Part.CanTouch = false
				Part.CanQuery = false
				Part.Material = Enum.Material.ForceField
				Part.Color = Color3.fromRGB(0, 200, 255)
				Part.Transparency = 0.8
				Part.Parent = workspace
			end

			Part.Size = Vector3.new(n24 * 2, n24 * 2, n24 * 2)
			Part.CFrame = HumanoidRootPart.CFrame

			return
		end
	end

	if Part then
		Part.Transparency = 1
		Part.CanCollide = false
	end
end

EnableGK = function()
	u633 = true
	v519("GK Auto Dive", "ENABLED", 2)
end
DisableGK = function()
	u633 = false
	v688()
	u634 = false
	u635 = false

	if Part then
		Part.Transparency = 1
	end

	v519("GK Auto Dive", "DISABLED", 2)
end
t27.GK:CreateSection("GK Auto Dive")
t27.GK:CreateToggle("Enable GK Auto Dive", "dive automatically when ball approaches", false, function(p190)
	if p190 then
		EnableGK()
	else
		DisableGK()
	end
end)
t27.GK:CreateSlider("Dive Range", 10, 60, 10, function(p191)
	n20 = p191
end)
t27.GK:CreateSlider("Dive Speed", 20, 100, 20, function(p192)
	n21 = p192
end)
t27.GK:CreateSlider("Dive Lift", 5, 50, 5, function(p193)
	n22 = p193
end)
t27.GK:CreateSlider("High Ball Lift Multiplier", 1, 5, 1, function(p194)
	n25 = p194
end)
t27.GK:CreateSlider("Cooldown", 1, 5, 1, function(p195)
	n23 = p195
end)
t27.GK:CreateDivider()
t27.GK:CreateSection("Hit Radius")
t27.GK:CreateSlider("Hit Radius", 2, 15, 2, function(p196)
	n24 = p196
end)
t27.GK:CreateDivider()
t27.GK:CreateSection("Visualization")
t27.GK:CreateToggle("Show Dive Range Box", "visualize your dive reach as a sphere", false, function(p197)
	u639 = p197

	if not p197 then
		if Part then
			Part.Transparency = 1
		end
	end

	v519("GK Visual", p197 and "VISIBLE" or "HIDDEN", 2)
end)
RunService.Heartbeat:Connect(function()
	if not u633 or not v640() then
		if Part then
			Part.Transparency = 1
		end

		return
	end

	local Character = LocalPlayer3.Character

	if not Character then
		return
	end

	if not Character:FindFirstChild("HumanoidRootPart") then
		return
	end

	local v717, v718 = v655()

	if not v717 then
		return
	end

	if v718 < 4.5 and not u637 then
		u637 = true
		v677()
		task.delay(0.08, function()
			u637 = false
		end)
	end

	if not (u634 or u635 or not (v718 <= n24)) then
		v693(v717)
	end
end)
RunService.RenderStepped:Connect(function()
	pcall(v713)
end)

local n28 = 5
local n29 = 2
local n30 = 0.5
local u722 = false
local t34 = {}
local connection2
local n31 = 0.06

local function v726(p198)
	local _PredViz = workspace:FindFirstChild("_PredViz")

	if not _PredViz then
		_PredViz = Instance.new("Folder")
		_PredViz.Name = "_PredViz"
		_PredViz.Parent = workspace
	end

	local Attachment = Instance.new("Attachment")

	Attachment.Parent = workspace.Terrain

	local Attachment2 = Instance.new("Attachment")

	Attachment2.Parent = workspace.Terrain

	local Beam = Instance.new("Beam")

	Beam.Attachment0 = Attachment
	Beam.Attachment1 = Attachment2
	Beam.Width0 = 0.14
	Beam.Width1 = 0.14
	Beam.FaceCamera = true
	Beam.LightInfluence = 0
	Beam.Transparency = NumberSequence.new(0.15)
	Beam.Parent = _PredViz

	local Part2 = Instance.new("Part")

	Part2.Anchored = true
	Part2.CanCollide = false
	Part2.Shape = Enum.PartType.Ball
	Part2.Size = Vector3.new(0.6, 0.6, 0.6)
	Part2.Material = Enum.Material.Neon
	Part2.Color = Color3.fromRGB(255, 220, 0)
	Part2.Transparency = 0.25
	Part2.CFrame = CFrame.new(0, -9999, 0)
	Part2.Parent = _PredViz
	t34[p198] = {
		beam = Beam,
		a0 = Attachment,
		a1 = Attachment2,
		sphere = Part2
	}
end
local function v732()
	for _, v in pairs(t34) do
		pcall(function()
			v.beam:Destroy()
		end)
		pcall(function()
			v.a0:Destroy()
		end)
		pcall(function()
			v.a1:Destroy()
		end)
		pcall(function()
			v.sphere:Destroy()
		end)
	end

	t34 = {}

	local _PredViz = workspace:FindFirstChild("_PredViz")

	if _PredViz then
		_PredViz:Destroy()
	end
end
local function v736(p199, p200)
	local X = p199.X
	local Y = p199.Y
	local Z = p199.Z
	local X2 = p200.X
	local Y2 = p200.Y
	local Z2 = p200.Z

	for i = 1, math.floor(n30 / 0.03) do
		Y2 = Y2 + -0.08828999999999998
		X = X + X2 * 0.03
		Y = Y + Y2 * 0.03
		Z = Z + Z2 * 0.03

		if Y <= 1 then
			Y = 1

			break
		end
	end

	return Vector3.new(X, Y, Z)
end
local function v744()
	if connection2 then
		connection2:Disconnect()
	end

	connection2 = RunService.Heartbeat:Connect(function()
		if not u722 then
			return
		end

		local Character = LocalPlayer3.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		local v747 = v532()

		for k in pairs(t34) do
			if not k or not k.Parent then
				pcall(function()
					local v749 = t34[k]

					if v749 then
						pcall(function()
							v749.beam:Destroy()
						end)
						pcall(function()
							v749.a0:Destroy()
						end)
						pcall(function()
							v749.a1:Destroy()
						end)
						pcall(function()
							v749.sphere:Destroy()
						end)
					end
				end)
				t34[k] = nil
			end
		end

		if not v747 then
			return
		end

		for _, v in v747:GetChildren() do
			if v:IsA("BasePart") then
				if (v.Position - HumanoidRootPart.Position).Magnitude <= n28 then
					if not t34[v] then
						v726(v)
					end

					local v752 = t34[v]
					local AssemblyLinearVelocity = v.AssemblyLinearVelocity
					local v754 = v736(v.Position, AssemblyLinearVelocity)
					local color3 = (Vector3.new(v.Position.X + AssemblyLinearVelocity.X * n31, v.Position.Y + AssemblyLinearVelocity.Y * n31, v.Position.Z + AssemblyLinearVelocity.Z * n31) - HumanoidRootPart.Position).Magnitude < n29 and Color3.fromRGB(0, 255, 80)

					v752.beam.Color = ColorSequence.new(color3 or Color3.fromRGB(255, 40, 40))
					v752.a0.WorldPosition = v.Position
					v752.a1.WorldPosition = v754
					v752.sphere.CFrame = CFrame.new(v754)
				elseif t34[v] then
					local v756 = t34[v]

					pcall(function()
						v756.a0.WorldPosition = Vector3.new(0, -9999, 0)
					end)
					pcall(function()
						v756.a1.WorldPosition = Vector3.new(0, -9999, 0)
					end)
					pcall(function()
						v756.sphere.CFrame = CFrame.new(0, -9999, 0)
					end)
				end
			end
		end
	end)
end

RunService.Heartbeat:Connect(function()
	pcall(function()
		n31 = math.clamp(LocalPlayer3:GetNetworkPing(), 0.008, 0.3)
	end)
end)
t27.Prediction:CreateSection("Ball Prediction Lines")
t27.Prediction:CreateButton("Toggle Prediction ON / OFF", "enable or disable prediction", lib:GetIcon("toggle-right", "Lucide"), function()
	u722 = not u722

	if u722 then
		v744()
		v519("Prediction", "ENABLED", 2)
	else
		v732()

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		v519("Prediction", "DISABLED", 2)
	end
end)
t27.Prediction:CreateSlider("Reachable Threshold", 2, 12, 2, function(p201)
	n29 = p201
end)
t27.Prediction:CreateSlider("Track Range", 5, 40, 5, function(p202)
	n28 = p202
end)
t27.Prediction:CreateDivider()
t27.Prediction:CreateSection("Advanced")
t27.Prediction:CreateSlider("Predict Ahead", 5, 30, 5, function(p203)
	n30 = p203 / 10
end)

local u757 = false
local jumpPower = 50
local JumpPower
local UseJumpPower

t27.Extras:CreateSection("Jump Power")
t27.Extras:CreateToggle("Custom Jump Power", "override default jump", false, function(p204)
	u757 = p204

	if p204 then
		pcall(function()
			local Humanoid = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("Humanoid")

			if Humanoid then
				UseJumpPower = Humanoid.UseJumpPower
				JumpPower = Humanoid.JumpPower
				Humanoid.UseJumpPower = true
				Humanoid.JumpPower = jumpPower
			end
		end)
	else
		pcall(function()
			local Humanoid = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("Humanoid")

			if Humanoid then
				if UseJumpPower ~= nil then
					Humanoid.UseJumpPower = UseJumpPower
				end

				if JumpPower ~= nil then
					Humanoid.JumpPower = JumpPower
				end
			end
		end)
	end

	v519("Jump Power", p204 and "ENABLED" or "DISABLED", 2)
end)
t27.Extras:CreateSlider("Jump Power", 1, 500, 50, function(p205)
	jumpPower = p205
end)
t27.Extras:CreateDivider()

local u763 = false
local walkSpeed = 16
local connection3
local WalkSpeed

t27.Extras:CreateSection("INF Dribble Helper")
t27.Extras:CreateToggle("INF Dribble", "keep dribbling automatically", false, function(p206)
	u763 = p206

	if p206 then
		if connection3 then
			connection3:Disconnect()
		end

		connection3 = RunService.Heartbeat:Connect(function()
			if not u763 then
				return
			end

			local Character = LocalPlayer3.Character

			if not Character then
				return
			end

			local Humanoid = Character:FindFirstChild("Humanoid")

			if not Humanoid then
				return
			end

			if WalkSpeed == nil then
				WalkSpeed = Humanoid.WalkSpeed
			end

			local v769 = v533()

			if not v769 then
				return
			end

			Humanoid.WalkSpeed = walkSpeed
			Humanoid:MoveTo(v769.Position)
		end)
	else
		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		pcall(function()
			local Character = LocalPlayer3.Character
			local Humanoid = Character and Character:FindFirstChild("Humanoid")
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

			if Humanoid then
				if HumanoidRootPart then
					Humanoid:MoveTo(HumanoidRootPart.Position)
				end

				if WalkSpeed ~= nil then
					Humanoid.WalkSpeed = WalkSpeed
				end
			end
		end)
		WalkSpeed = nil
	end

	v519("INF Dribble", p206 and "ENABLED" or "DISABLED", 2)
end)
t27.Extras:CreateSlider("Dribble Speed", 8, 35, 8, function(p207)
	walkSpeed = p207
end)
t27.Extras:CreateDivider()

local u773 = false
local n32 = 1
local n33 = 1
local u776 = false
local u777
local connection4

local function v779()
	if connection4 then
		connection4:Disconnect()
		connection4 = nil
	end

	if u777 then
		u777:Destroy()
		u777 = nil
	end
end
local function v780()
	v779()

	if not u773 then
		return
	end

	local Part2 = Instance.new("Part")

	Part2.Name = "ZZZHelperPart"
	Part2.Size = Vector3.new(n32, 0.2, n32)
	Part2.Anchored = true
	Part2.CanCollide = true
	Part2.Transparency = u776 and 0 or 1
	Part2.BrickColor = BrickColor.new("Bright red")
	Part2.Material = Enum.Material.SmoothPlastic
	Part2.Parent = workspace
	u777 = Part2
	connection4 = RunService.RenderStepped:Connect(function()
		local v782 = v533()

		if v782 and u777 then
			u777.Position = v782.Position - Vector3.new(0, n33, 0)
		elseif u777 then
			u777.Position = Vector3.new(0, -999, 0)
		end
	end)
end

t27.Extras:CreateSection("ZZZ Helper")
t27.Extras:CreateToggle("Enable ZZZ Helper", "platform under ball", false, function(p208)
	u773 = p208
	v519("ZZZ Helper", p208 and "ENABLED" or "DISABLED", 2)

	if p208 then
		v780()
	else
		v779()
	end
end)
t27.Extras:CreateSlider("Platform Size", 1, 100, 1, function(p209)
	n32 = p209

	if u773 and u777 then
		u777.Size = Vector3.new(n32, 0.2, n32)
	end
end)
t27.Extras:CreateSlider("Y Offset Below Ball", 0.5, 5, 0.5, function(p210)
	n33 = p210
end)
t27.Extras:CreateButton("Toggle ZZZ Visibility", "show/hide platform", lib:GetIcon("eye", "Lucide"), function()
	u776 = not u776

	if u777 then
		u777.Transparency = u776 and 0 or 1
	end

	v519("ZZZ Helper", u776 and "VISIBLE" or "HIDDEN", 2)
end)
t27.Extras:CreateDivider()

local u783 = false
local n34 = 1
local u785 = false
local t35 = {}
local t36 = {}
local connection5
local connection6
local connection7
local Character
local Humanoid

local function v793(p211)
	if not u783 then
		return
	end

	if not p211 or not p211.Parent then
		return
	end

	if not p211:IsA("BasePart") then
		return
	end

	if t35[p211] and t35[p211].Parent then
		return
	end

	local Part2 = Instance.new("Part")

	Part2.Name = "AirDribbleHelper"
	Part2.Size = Vector3.new(n34, 1, n34)
	Part2.Anchored = true
	Part2.CanCollide = false
	Part2.CanTouch = false
	Part2.CanQuery = false
	Part2.Transparency = u785 and 0.5 or 1
	Part2.Material = Enum.Material.Neon
	Part2.Color = Color3.fromRGB(128, 128, 128)
	Part2.Parent = workspace
	t35[p211] = Part2
	table.insert(t36, Part2)
	task.spawn(function()
		while u783 and Part2.Parent and p211 do
			if not p211.Parent then
				break
			end

			Part2.CFrame = CFrame.new(p211.Position.X, p211.Position.Y - 1.2, p211.Position.Z)
			task.wait()
		end
	end)
end
local function v795()
	u783 = not u783

	if not u783 then
		for _, v in pairs(t36) do
			pcall(function()
				v:Destroy()
			end)
		end

		t36 = {}
		t35 = {}

		if connection5 then
			connection5:Disconnect()
			connection5 = nil
		end

		if connection6 then
			connection6:Disconnect()
			connection6 = nil
		end

		if connection7 then
			connection7:Disconnect()
			connection7 = nil
		end

		return
	end

	local v798 = v532()

	if not v798 then
		return
	end

	for _, child in ipairs(v798:GetChildren()) do
		if child:IsA("BasePart") then
			v793(child)
		end
	end

	connection5 = v798.ChildAdded:Connect(function(child)
		task.wait(0.1)

		if child:IsA("BasePart") and u783 then
			v793(child)
		end
	end)
	connection6 = v798.ChildRemoved:Connect(function(child)
		if t35[child] then
			local v801 = t35[child]

			if v801 and v801.Parent then
				v801:Destroy()
			end

			t35[child] = nil

			for k, v in pairs(t36) do
				if v == v801 then
					table.remove(t36, k)

					break
				end
			end
		end
	end)
	connection7 = RunService.Heartbeat:Connect(function()
		if not u783 then
			return
		end

		Character = LocalPlayer3.Character

		if Character then
			Humanoid = Character:FindFirstChild("Humanoid")
		end

		local state = Humanoid and Humanoid:GetState() or Enum.HumanoidStateType.None
		local v805 = state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall

		for _, v in pairs(t36) do
			if v and v.Parent then
				if v805 then
					v.CanCollide = true
					v.CanTouch = true
					v.CanQuery = true
					v.Transparency = u785 and 0.5 or 1
				else
					v.CanCollide = false
					v.CanTouch = false
					v.CanQuery = false
					v.Transparency = u785 and 0.5 or 1
				end
			end
		end
	end)
end

t27.Extras:CreateSection("Air Dribbler")
t27.Extras:CreateToggle("Enable Air Dribbler", "platform under ball while jumping", false, function(p212)
	if p212 and not u783 then
		v795()
		v519("Air Dribbler", "ENABLED", 2)
	elseif not p212 then
		if u783 then
			v795()
			v519("Air Dribbler", "DISABLED", 2)
		end
	end
end)
t27.Extras:CreateSlider("Platform Size", 1, 50, 1, function(p213)
	n34 = p213

	for _, v in pairs(t36) do
		if v and v.Parent then
			v.Size = Vector3.new(p213, 1, p213)
		end
	end
end)
t27.Extras:CreateButton("Toggle Visibility", "show/hide air platforms", lib:GetIcon("eye", "Lucide"), function()
	u785 = not u785

	for _, v in pairs(t36) do
		if v and v.Parent then
			v.Transparency = u785 and 0.5 or 1
		end
	end

	v519("Air Dribbler", u785 and "VISIBLE" or "HIDDEN", 2)
end)
t27.Extras:CreateDivider()
t27.Extras:CreateSection("Avatar Stealer")
t27.Extras:CreateInput("Avatar Stealer", "Enter username", "Username...", function(p214)
	local v812 = p214:gsub("^%s*(.-)%s*$", "%1")

	if v812 ~= "" then
		local ok, result = pcall(function()
			return Players2:GetUserIdFromNameAsync(v812)
		end)

		if ok and result then
			pcall(function()
				local function v815(p215, p216)
					if not p216 then
						return
					end

					local Humanoid2 = p216:FindFirstChildOfClass("Humanoid")

					if not Humanoid2 then
						return
					end

					local ok2, result2 = pcall(function()
						return Players2:GetCharacterAppearanceAsync(p215)
					end)

					if ok2 then
						if result2 then
							local v819 = false
							local v820 = false
							local ok3, result3 = pcall(function()
								return Players2:GetHumanoidDescriptionFromUserId(p215)
							end)

							if ok3 and result3 then
								if result3.Head == 47079 or result3.Head == 1340101835 or result3.Head == 6340101835 or result3.Head == 6686307858 then
									v819 = true
								end

								if result3.RightLeg == 139607718 then
									v820 = true
								end
							end

							for _, child in pairs(p216:GetChildren()) do
								if (child:IsA("Accessory") or child:IsA("Shirt") or child:IsA("Pants") or child:IsA("CharacterMesh")) or child:IsA("BodyColors") then
									child:Destroy()
								end
							end

							if p216:FindFirstChild("Head") then
								for _, child in ipairs(p216.Head:GetChildren()) do
									if child:IsA("Decal") then
										child:Destroy()
									end
								end
							end

							for _, descendant in ipairs(result2:GetDescendants()) do
								if descendant:IsA("Shirt") or descendant:IsA("Pants") then
									pcall(function()
										descendant:Clone().Parent = p216
									end)
								elseif descendant:IsA("BodyColors") then
									pcall(function()
										descendant:Clone().Parent = p216
									end)
								elseif descendant:IsA("Accessory") then
									pcall(function()
										local clone = descendant:Clone()

										Humanoid2:AddAccessory(clone)
									end)
								elseif descendant:IsA("CharacterMesh") then
									pcall(function()
										descendant:Clone().Parent = p216
									end)
								end
							end

							local Texture

							for _, descendant in ipairs(result2:GetDescendants()) do
								if descendant:IsA("Decal") and (descendant.Name == "face" or descendant.Name == "Face") then
									Texture = descendant.Texture

									break
								end
							end

							if not Texture and ok3 and result3 and result3.Face > 0 then
								pcall(function()
									local objects = game:GetObjects("rbxassetid://" .. tostring(result3.Face))

									if objects and #objects > 0 then
										for _, object in ipairs(objects) do
											if object:IsA("Decal") then
												Texture = object.Texture

												break
											end

											for _, descendant in ipairs(object:GetDescendants()) do
												if descendant:IsA("Decal") then
													Texture = descendant.Texture

													break
												end
											end

											if Texture then
												break
											end
										end
									end
								end)
							end

							local Head2 = p216:FindFirstChild("Head")

							if Head2 then
								local Decal = Instance.new("Decal")

								Decal.Face = Enum.NormalId.Front
								Decal.Name = "face"
								Decal.Texture = Texture or "rbxasset://textures/face.png"
								Decal.Transparency = 0
								Decal.Parent = Head2
							end

							if v819 and p216:FindFirstChild("Head") then
								p216.Head.Transparency = 1

								if p216.Head:FindFirstChildOfClass("SpecialMesh") then
									p216.Head:FindFirstChildOfClass("SpecialMesh").MeshId = ""
								else
									local FaceControls = p216.Head:FindFirstChildOfClass("FaceControls")

									if FaceControls then
										FaceControls:Destroy()
									end
								end
							elseif p216:FindFirstChild("Head") then
								p216.Head.Transparency = 0
							end

							if v820 then
								if p216:FindFirstChild("RightLowerLeg") then
									p216.RightLowerLeg.MeshId = "902942093"
									p216.RightLowerLeg.Transparency = 1
								end

								if p216:FindFirstChild("RightUpperLeg") then
									p216.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
									p216.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
								end

								if p216:FindFirstChild("RightFoot") then
									p216.RightFoot.MeshId = "902942089"
									p216.RightFoot.Transparency = 1
								end
							else
								if p216:FindFirstChild("RightLowerLeg") then
									p216.RightLowerLeg.Transparency = 0
								end

								if p216:FindFirstChild("RightFoot") then
									p216.RightFoot.Transparency = 0
								end
							end

							local Parent = p216.Parent

							p216.Parent = nil
							p216.Parent = Parent

							return
						end
					end
				end

				v815(result, LocalPlayer3.Character)
				v519("Avatar Stealer", "Stole " .. v812 .. "'s avatar!", 3)
			end)
		else
			v519("Avatar Stealer", "User not found!", 2)
		end
	end
end)
t27.Extras:CreateDivider()

local n35 = 5
local u843 = false
local connection8

local function v845()
	local Character2 = LocalPlayer3.Character

	if not Character2 then
		return nil, math.huge
	end

	local HumanoidRootPart = Character2:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil, math.huge
	end

	local Footballs = workspace:FindFirstChild("Footballs")

	if not Footballs then
		return nil, math.huge
	end

	local v849
	local huge = math.huge

	for _, child in ipairs(Footballs:GetChildren()) do
		if child:IsA("BasePart") and child.Name == "Ball" then
			local Magnitude = (child.Position - HumanoidRootPart.Position).Magnitude

			if Magnitude < huge then
				huge = Magnitude
				v849 = child
			end
		end
	end

	return v849, huge
end
local function v854()
	local Remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")

	if Remotes then
		local Game = Remotes:FindFirstChild("Game")

		if Game then
			local Touch = Game:FindFirstChild("Touch")

			if Touch then
				return Touch:FindFirstChild("Kick")
			end
		end
	end

	return nil
end
local function v858()
	local Character2 = LocalPlayer3.Character

	if not Character2 then
		return
	end

	local HumanoidRootPart = Character2:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	local v861, v862 = v845()

	if not v861 or n35 < v862 then
		return
	end

	local v863 = v854()

	if not v863 then
		return
	end

	if not workspace.CurrentCamera then
		return
	end

	local LookVector = workspace.CurrentCamera.CFrame.LookVector
	local t37 = { {
		v861,
		"Shoot",
		1,
		{
			Right = false,
			Ground = true,
			Left = false
		},
		CFrame.new(HumanoidRootPart.Position + LookVector * 5, HumanoidRootPart.Position + LookVector * 10),
		Vector3.zero
	} }

	pcall(function()
		v863:FireServer(unpack(t37))
	end)
end
local function v866()
	if u843 then
		return
	end

	u843 = true

	if not connection8 then
		connection8 = RunService.PreSimulation:Connect(function()
			if u843 then
				v858()
			end
		end)
	end

	v519("Kicks", "Started! Reach: " .. n35, 2)
end
local function v867()
	u843 = false

	if connection8 then
		connection8:Disconnect()
		connection8 = nil
	end

	v519("Kicks", "Stopped!", 2)
end

t27.Extras:CreateSection("200 Kicks Per Second")
t27.Extras:CreateToggle("Enable 200 Kicks/Sec", "auto kick nearby balls", false, function(p217)
	if p217 then
		v866()
	else
		v867()
	end
end)
t27.Extras:CreateSlider("Kick Reach Distance", 5, 50, 5, function(p218)
	n35 = p218
	v519("Kicks", "Reach set to " .. p218, 2)
end)
t27.Extras:CreateDivider()

local u868 = false
local n36 = 14
local t38 = {}

local function v871(p219)
	local PerformanceStats = CoreGui2:WaitForChild("RobloxGui"):WaitForChild("PerformanceStats")
	local v873
	local ValueLabel
	local PS_BarFrame

	for _, child in ipairs(PerformanceStats:GetChildren()) do
		local TitleLabel = child:FindFirstChild("TitleLabel", true)

		if TitleLabel then
			if TitleLabel.Text:lower():gsub(" ", ""):find("networkping") then
				v873 = child
				ValueLabel = child:FindFirstChild("ValueLabel", true)
				PS_BarFrame = child:FindFirstChild("PS_BarFrame", true)

				break
			end
		end
	end

	if not v873 then
		return
	end

	local t39 = {}

	for _, descendant in ipairs(v873:GetDescendants()) do
		if descendant:IsA("TextLabel") then
			if descendant.Text:find("Current:") then
				t39.Current = descendant
			elseif descendant.Text:find("Average:") then
				t39.Average = descendant
			end
		end
	end

	if PS_BarFrame then
		PS_BarFrame.Visible = false
	end

	local FinalStableGraph = v873:FindFirstChild("FinalStableGraph", true)

	if FinalStableGraph then
		FinalStableGraph:Destroy()
	end

	local Frame3 = Instance.new("Frame")

	Frame3.Name = "FinalStableGraph"
	Frame3.Parent = PS_BarFrame.Parent
	Frame3.Size = PS_BarFrame.Size
	Frame3.Position = PS_BarFrame.Position
	Frame3.BackgroundTransparency = 1
	Frame3.ClipsDescendants = true

	local UIListLayout2 = Instance.new("UIListLayout")

	UIListLayout2.Parent = Frame3
	UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout2.Padding = UDim.new(0, 0)

	local t40 = {}
	local v886 = table.create(50, p219)

	for i = 1, 50 do
		local Frame4 = Instance.new("Frame")

		Frame4.Parent = Frame3
		Frame4.BorderSizePixel = 0
		Frame4.LayoutOrder = i
		Frame4.Size = UDim2.new(0.02, 0, 0, 1)
		table.insert(t40, Frame4)
	end

	local u889 = p219
	local thread3 = task.spawn(function()
		while u868 do
			u889 = p219
			task.wait(5)
		end
	end)

	table.insert(t38, thread3)

	local thread4 = task.spawn(function()
		while u868 do
			table.remove(v886, 1)
			table.insert(v886, u889)

			for i, v in ipairs(t40) do
				local v894 = v886[i]

				v.Size = UDim2.new(0.02, 0, math.clamp(v894 / 100, 0.05, 1), 0)

				if v894 >= 60 then
					v.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
				elseif v894 >= 30 then
					v.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
				else
					v.BackgroundColor3 = Color3.fromRGB(85, 255, 0)
				end
			end

			task.wait(0.5)
		end
	end)

	table.insert(t38, thread4)

	local PingSpoofLock = RunService:BindToRenderStep("PingSpoofLock", Enum.RenderPriority.Last.Value, function()
		if not u868 then
			return
		end

		local current = tostring(math.floor(u889)) .. " ms"

		if ValueLabel then
			ValueLabel.Text = current
		end

		if t39.Current then
			t39.Current.Text = "Current: " .. current
		end

		if t39.Average then
			t39.Average.Text = "Average: " .. current
		end
	end)

	table.insert(t38, PingSpoofLock)
end
local function v897()
	u868 = false

	for _, v in ipairs(t38) do
		if type(v) == "number" then
			task.cancel(v)
		elseif type(v) == "RBXScriptConnection" then
			pcall(function()
				v:Disconnect()
			end)
		end
	end

	t38 = {}
	pcall(function()
		RunService:UnbindFromRenderStep("PingSpoofLock")
	end)
	v519("Ping Spoofer", "DISABLED", 2)
end

t27.Extras:CreateSection("Ping Spoofer")
t27.Extras:CreateToggle("Enable Ping Spoofer", "fake your ping value", false, function(p220)
	u868 = p220

	if p220 then
		v871(n36)
		v519("Ping Spoofer", "ENABLED - " .. n36 .. "ms", 2)
	else
		v897()
	end
end)
t27.Extras:CreateInput("Ping (ms)", "Enter ping value", "14", function(p221)
	local v900 = tonumber(p221)

	if v900 and v900 > 0 and v900 <= 1000 then
		n36 = v900

		if u868 then
			v897()
			task.wait(0.5)
			u868 = true
			v871(n36)
			v519("Ping Spoofer", "Updated to " .. n36 .. "ms", 2)
		end
	else
		v519("Ping Spoofer", "Invalid value! (1-1000)", 2)
	end
end)
RunService.Heartbeat:Connect(function()
	if u757 then
		pcall(function()
			local Humanoid2 = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("Humanoid")

			if Humanoid2 then
				Humanoid2.UseJumpPower = true
				Humanoid2.JumpPower = jumpPower
			end
		end)
	end
end)

local t41 = {
	tt = "10",
	interp = "60",
	s2 = "38720"
}
local thread3

local function v904()
	if not setfflag then
		return
	end

	for k, v in pairs({
		DFIntTargetTimeDelayFacctorTenths = t41.tt,
		FIntInterpolationMaxDelayMSec = t41.interp,
		DFIntS2PhysicsSenderRate = t41.s2
	}) do
		local v907 = v526(k)

		pcall(function()
			if getfflag(v907) == nil then
				if getfflag(k) ~= nil then
					setfflag(k, v)
				end
			else
				setfflag(v907, v)
			end
		end)
	end
end

t27.Flags:CreateSection("Flag Override")
t27.Flags:CreateInput("TargetTimeDelay", "", "10", function(p222)
	if p222 ~= "" then
		t41.tt = p222
	end
end)
t27.Flags:CreateInput("Interpolation", "", "60", function(p223)
	if p223 ~= "" then
		t41.interp = p223
	end
end)
t27.Flags:CreateInput("PhysicsSenderRate", "", "38720", function(p224)
	if p224 ~= "" then
		t41.s2 = p224
	end
end)
t27.Flags:CreateButton("Start Flag Loop", "apply flags repeatedly", lib:GetIcon("play", "Lucide"), function()
	if thread3 then
		task.cancel(thread3)
	end

	thread3 = task.spawn(function()
		while true do
			v904()
			task.wait(20)
		end
	end)
	v519("Flags", "Loop started", 2)
end)
t27.Flags:CreateButton("Stop Flag Loop", "stop applying flags", lib:GetIcon("square", "Lucide"), function()
	if thread3 then
		task.cancel(thread3)
		thread3 = nil
	end

	v519("Flags", "Loop stopped", 2)
end)
t27.Flags:CreateDivider()

local thread4
local t42 = {}

t27.Flags:CreateSection("Flag Inject (JSON)")
t27.Flags:CreateInput("Flag JSON", "paste JSON flags", "{\"DFIntTargetTimeDelayFacctorTenths\":\"7\"}", function(p225)
	if not p225 or p225 == "" then
		return
	end

	local ok, result = pcall(function()
		return game:GetService("HttpService"):JSONDecode(p225)
	end)

	if ok and type(result) == "table" then
		t42 = result
		v519("Inject", "Flags parsed OK", 2)
	else
		v519("Inject", "Invalid JSON", 2)
	end
end)
t27.Flags:CreateButton("Start Inject", "apply JSON flags", lib:GetIcon("play", "Lucide"), function()
	if thread4 then
		task.cancel(thread4)
	end

	thread4 = task.spawn(function()
		while true do
			if setfflag then
				for k, v in pairs(t42) do
					local v914 = v526(k)

					pcall(function()
						if getfflag(v914) == nil then
							if getfflag(k) ~= nil then
								setfflag(k, tostring(v))
							end
						else
							setfflag(v914, tostring(v))
						end
					end)
				end
			end

			task.wait(20)
		end
	end)
	v519("Inject", "Running", 2)
end)
t27.Flags:CreateButton("Stop Inject", "stop JSON flags", lib:GetIcon("square", "Lucide"), function()
	if thread4 then
		task.cancel(thread4)
		thread4 = nil
	end

	v519("Inject", "Stopped", 2)
end)

local s7 = "1"

local function v916(p226)
	return "Punishment_Slot_" .. tostring(p226) .. ".json"
end
local function v917()
	if getgenv and getgenv().PunishmentFolder then
		return getgenv().PunishmentFolder
	end

	local punishmentFolder

	pcall(function()
		if not isfolder("PunishmentConfigs") and makefolder then
			makefolder("PunishmentConfigs")
		end

		if isfolder("PunishmentConfigs") then
			punishmentFolder = "PunishmentConfigs/"
		end
	end)
	punishmentFolder = punishmentFolder or ""

	if getgenv then
		getgenv().PunishmentFolder = punishmentFolder
	end

	return punishmentFolder
end
local function v919(p227)
	return v917() .. v916(p227)
end
local function v920()
	return {
		m1_enabled = u553,
		m1_size = n12,
		m1_visible = u555,
		m2_enabled = u562,
		m2_size = n13,
		m2_visible = u564,
		m3_enabled = u593,
		m3_x = n14,
		m3_y = n15,
		m3_z = n16,
		m3_visible = u597,
		react_enabled = u598,
		react_level = n17,
		moss_enabled = u607,
		moss_level = n18,
		moss_reach_radius = n19,
		xeno_enabled = xeno_enabled,
		xeno_level = xeno_level,
		xeno_reach = xeno_reach,
		gkEnabled = u633,
		DIVE_RANGE = n20,
		DIVE_SPEED = n21,
		DIVE_LIFT = n22,
		DIVE_HIGH_MULT = n25,
		COOLDOWN = n23,
		HIT_RADIUS = n24,
		gkVisualEnabled = u639,
		predOn = u722,
		PRED_RANGE = n28,
		PRED_TOUCH = n29,
		PRED_TIME = n30,
		jumpEnabled = u757,
		jumpPower = jumpPower,
		dribbleEnabled = u763,
		dribbleSpeed = walkSpeed,
		zzzEnabled = u773,
		zzzSize = n32,
		zzzYOffset = n33,
		zzzVisible = u776,
		airDribbleEnabled = u783,
		airDribbleSize = n34,
		airDribbleVisible = u785,
		kickLoopEnabled = u843,
		kickReach = n35,
		pingSpooferEnabled = u868,
		customPing = n36,
		flags_tt = t41.tt,
		flags_interp = t41.interp,
		flags_s2 = t41.s2
	}
end
local function v921(p228)
	if not p228 then
		return
	end

	if p228.m1_size then
		n12 = p228.m1_size
	end

	if p228.m1_visible then
		u555 = p228.m1_visible
	end

	if p228.m2_size then
		n13 = p228.m2_size
	end

	if p228.m2_visible then
		u564 = p228.m2_visible
	end

	if p228.m3_x then
		n14 = p228.m3_x
	end

	if p228.m3_y then
		n15 = p228.m3_y
	end

	if p228.m3_z then
		n16 = p228.m3_z
	end

	if p228.m3_visible then
		u597 = p228.m3_visible
	end

	if p228.moss_level then
		n18 = p228.moss_level
	end

	if p228.moss_reach_radius then
		n19 = p228.moss_reach_radius
	end

	if p228.react_level then
		n17 = p228.react_level
	end

	if p228.xeno_level then
		xeno_level = p228.xeno_level
	end

	if p228.xeno_reach then
		xeno_reach = p228.xeno_reach
	end

	if p228.DIVE_RANGE then
		n20 = p228.DIVE_RANGE
	end

	if p228.DIVE_SPEED then
		n21 = p228.DIVE_SPEED
	end

	if p228.DIVE_LIFT then
		n22 = p228.DIVE_LIFT
	end

	if p228.DIVE_HIGH_MULT then
		n25 = p228.DIVE_HIGH_MULT
	end

	if p228.COOLDOWN then
		n23 = p228.COOLDOWN
	end

	if p228.HIT_RADIUS then
		n24 = p228.HIT_RADIUS
	end

	if p228.PRED_RANGE then
		n28 = p228.PRED_RANGE
	end

	if p228.PRED_TOUCH then
		n29 = p228.PRED_TOUCH
	end

	if p228.PRED_TIME then
		n30 = p228.PRED_TIME
	end

	if p228.jumpPower then
		jumpPower = p228.jumpPower
	end

	if p228.dribbleSpeed then
		walkSpeed = p228.dribbleSpeed
	end

	if p228.zzzSize then
		n32 = p228.zzzSize
	end

	if p228.zzzYOffset then
		n33 = p228.zzzYOffset
	end

	if p228.zzzVisible then
		u776 = p228.zzzVisible
	end

	if p228.airDribbleSize then
		n34 = p228.airDribbleSize
	end

	if p228.airDribbleVisible then
		u785 = p228.airDribbleVisible
	end

	if p228.kickReach then
		n35 = p228.kickReach
	end

	if p228.customPing then
		n36 = p228.customPing
	end

	if p228.flags_tt then
		t41.tt = p228.flags_tt
	end

	if p228.flags_interp then
		t41.interp = p228.flags_interp
	end

	if p228.flags_s2 then
		t41.s2 = p228.flags_s2
	end

	if p228.m1_enabled then
		u553 = true
	end

	if p228.m2_enabled and not u562 then
		u562 = true
		pcall(v565)
	end

	if p228.m3_enabled then
		u593 = true
	end

	if p228.react_enabled then
		u598 = true
		v602()
	end

	if p228.moss_enabled then
		u607 = true
		v615()
	end

	if p228.xeno_enabled then
		xeno_enabled = true
		startXeno()
	end

	if p228.gkVisualEnabled then
		u639 = p228.gkVisualEnabled
	end

	if p228.gkEnabled and not u633 then
		EnableGK()
	end

	if p228.predOn and not u722 then
		u722 = true
		v744()
	end

	if p228.jumpEnabled then
		u757 = true
		pcall(function()
			local Humanoid2 = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("Humanoid")

			if Humanoid2 then
				Humanoid2.UseJumpPower = true
				Humanoid2.JumpPower = jumpPower
			end
		end)
	end

	if p228.dribbleEnabled and not u763 then
		u763 = true

		if connection3 then
			connection3:Disconnect()
		end

		connection3 = RunService.Heartbeat:Connect(function()
			if not u763 then
				return
			end

			local Character2 = LocalPlayer3.Character

			if not Character2 then
				return
			end

			local Humanoid2 = Character2:FindFirstChild("Humanoid")

			if not Humanoid2 then
				return
			end

			if WalkSpeed == nil then
				WalkSpeed = Humanoid2.WalkSpeed
			end

			local v925 = v533()

			if not v925 then
				return
			end

			Humanoid2.WalkSpeed = walkSpeed
			Humanoid2:MoveTo(v925.Position)
		end)
	end

	if p228.zzzEnabled and not u773 then
		u773 = true
		v780()
	end

	if p228.airDribbleEnabled and not u783 then
		v795()
	end

	if p228.kickLoopEnabled and not u843 then
		v866()
	end

	if p228.pingSpooferEnabled and not u868 then
		u868 = true
		v871(n36)
	end
end

t27.Config:CreateSection("Config Slots")
t27.Config:CreateInput("Slot Number", "enter slot (1, 2, 3, ...)", "1", function(p229)
	local v926 = p229:gsub("^%s*(.-)%s*$", "%1")

	if v926 ~= "" then
		s7 = v926
	end
end)
t27.Config:CreateButton("Save Config", "save all current settings to slot", lib:GetIcon("save", "Lucide"), function()
	if not writefile then
		v519("Config", "writefile not available on this executor", 2)

		return
	end

	local v927 = v920()
	local v928 = v919(s7)

	if pcall(function()
		writefile(v928, HttpService2:JSONEncode(v927))
	end) then
		v519("Config", "Saved to slot " .. s7, 2)
	else
		pcall(function()
			writefile(v916(s7), HttpService2:JSONEncode(v927))
		end)
		v519("Config", "Saved to slot " .. s7, 2)
	end
end)
t27.Config:CreateButton("Load Config", "load settings from slot", lib:GetIcon("folder-open", "Lucide"), function()
	if not readfile then
		v519("Config", "readfile not available on this executor", 2)

		return
	end

	local v929 = v919(s7)
	local result
	local v931 = false

	if isfile and isfile(v929) then
		v931, result = pcall(function()
			return HttpService2:JSONDecode(readfile(v929))
		end)
	end

	if not v931 or type(result) ~= "table" then
		local v932 = v916(s7)

		if isfile and isfile(v932) then
			v931, result = pcall(function()
				return HttpService2:JSONDecode(readfile(v932))
			end)
		end
	end

	if v931 and type(result) == "table" then
		v921(result)
		v519("Config", "Loaded from slot " .. s7, 2)
	else
		v519("Config", "Slot " .. s7 .. " is empty or failed to load", 2)
	end
end)
t27.Config:CreateButton("Delete Slot", "remove saved config from slot", lib:GetIcon("trash", "Lucide"), function()
	local v933 = v919(s7)

	if delfile then
		pcall(function()
			delfile(v933)
		end)
		pcall(function()
			delfile(v916(s7))
		end)
		v519("Config", "Deleted slot " .. s7, 2)
	else
		v519("Config", "delfile not available", 2)
	end
end)
t27.Config:CreateDivider()
t27.Config:CreateButton("List Saved Slots", "show which slots have configs", lib:GetIcon("list", "Lucide"), function()
	local t43 = {}

	if isfile then
		local v935 = v917()

		for i = 1, 20 do
			if isfile(v935 .. v916(tostring(i))) then
				table.insert(t43, tostring(i))
			elseif isfile(v916(tostring(i))) then
				table.insert(t43, tostring(i))
			end
		end
	end

	if #t43 > 0 then
		v519("Saved Slots", "Slots: " .. table.concat(t43, ", "), 5)
	else
		v519("Saved Slots", "No saved slots found", 2)
	end
end)
t27.Config:CreateDivider()
t27.Config:CreateSection("Info")
t27.Config:CreateParagraph("How it works", "Enter a slot number, then Save or Load. Each slot stores all your toggle and slider values independently. Use List to see which slots are saved.")
t27.Skys:CreateSection("Sky Presets")
t27.Skys:CreateButton("Night Sky", "", lib:GetIcon("moon", "Lucide"), NightSky)
t27.Skys:CreateButton("Scary Night", "", lib:GetIcon("ghost", "Lucide"), ScaryNight)
t27.Skys:CreateButton("Sakura Sky", "", lib:GetIcon("cherry", "Lucide"), SakuraSky)
t27.Skys:CreateButton("Galaxy Sky", "", lib:GetIcon("sparkles", "Lucide"), GalaxySky)
t27.Skys:CreateButton("Purple Night", "", lib:GetIcon("moon-star", "Lucide"), PurpleNight)
t27.Skys:CreateButton("Sunset Orange", "", lib:GetIcon("sun", "Lucide"), SunsetOrange)
t27.Skys:CreateDivider()
t27.Skys:CreateSection("More Presets")
t27.Skys:CreateButton("Purple Sky", "", lib:GetIcon("cloud", "Lucide"), PurpleSky)
t27.Skys:CreateButton("Gray Sky", "", lib:GetIcon("cloud-drizzle", "Lucide"), GraySky)
t27.Skys:CreateButton("Mountain Sky", "", lib:GetIcon("mountain", "Lucide"), MountainSky)
t27.Skys:CreateButton("Pinkie Preppy", "", lib:GetIcon("heart", "Lucide"), PinkiePreppy)
t27.Skys:CreateButton("Mountain Sky 2", "", lib:GetIcon("mountain-snow", "Lucide"), MountainSky2)
t27.Skys:CreateButton("Sunset Mountain", "", lib:GetIcon("sunrise", "Lucide"), SunsetMountain)
t27.Skys:CreateDivider()
t27.Skys:CreateSection("Reset")
t27.Skys:CreateButton("Reset Sky", "restore default sky", lib:GetIcon("rotate-ccw", "Lucide"), ResetSky)
RunService.RenderStepped:Connect(function()
	if not u553 then
		return
	end

	local v937 = v532()

	if not v937 then
		return
	end

	for _, v in v937:GetChildren() do
		if v:IsA("BasePart") then
			v.Size = Vector3.new(n12, n12, n12)
			v.Transparency = u555 and 0.7 or 1
			v.CanCollide = false
		end
	end
end)
RunService.RenderStepped:Connect(function()
	if not u593 then
		return
	end

	local v940 = v532()

	if not v940 then
		return
	end

	for _, v in v940:GetChildren() do
		if v:IsA("BasePart") then
			v.Size = Vector3.new(n14, n15, n16)
			v.Transparency = u597 and 0.7 or 1
			v.CanCollide = false
		end
	end
end)
v543(function()
	if u553 then
		v519("Reach M1", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u562 then
		task.wait(1)
		pcall(v565)
		v519("Reach M2", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u598 then
		task.wait(1)
		v602()
		v519("React", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u607 then
		task.wait(1)
		v615()
		v519("Moss", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u633 then
		task.wait(1)
		v519("GK Auto Dive", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u722 then
		task.wait(1)
		v732()
		v744()
		v519("Prediction", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u757 then
		pcall(function()
			local Humanoid2 = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("Humanoid")

			if Humanoid2 then
				Humanoid2.UseJumpPower = true
				Humanoid2.JumpPower = jumpPower
			end
		end)
		v519("Jump Power", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u763 then
		task.wait(1)
		v519("INF Dribble", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u773 then
		task.wait(1)
		v780()
		v519("ZZZ Helper", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u783 then
		task.wait(0.5)

		for _, v in pairs(t36) do
			pcall(function()
				v:Destroy()
			end)
		end

		t36 = {}
		t35 = {}

		local v946 = v532()

		if v946 then
			for _, child in ipairs(v946:GetChildren()) do
				if child:IsA("BasePart") then
					v793(child)
				end
			end
		end

		v519("Air Dribbler", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u843 then
		task.wait(1)
		v866()
		v519("Kicks", "RE-ENABLED AFTER RESPAWN", 2)
	end

	if u593 then
		v519("Reach M3", "RE-ENABLED AFTER RESPAWN", 2)
	end
end)
