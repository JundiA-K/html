local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

local SellectedPlayer = nil
local Sellected = false
local hover = Instance.new("Highlight")
local CCS = nil
local Hidden = false
local LS = plr.Character
hover.OutlineColor = Color3.new(1,0,0)

local screengui = Instance.new("ScreenGui")
screengui.Parent = plr.PlayerGui
screengui.ResetOnSpawn = false
screengui.Name = "plrclient"..math.random(1000, 99999999)

local MainFrame = Instance.new("Frame")
MainFrame.Parent = screengui
MainFrame.Size = UDim2.fromOffset(150, 350)

local PlayersFrame = Instance.new("ScrollingFrame")
PlayersFrame.Parent = screengui
PlayersFrame.Visible = false
PlayersFrame.Size = UDim2.fromOffset(150, 500)
PlayersFrame.CanvasSize = UDim2.fromOffset(0, 100000000)
PlayersFrame.Position = MainFrame.Position + UDim2.fromOffset(150)

local function ClickSound()
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = "rbxassetid://6895079853"
	sound:Play()
	game.Debris:AddItem(sound, sound.TimeLength)
end

local Uilist = Instance.new("UIListLayout")
Uilist.Parent = PlayersFrame
Uilist.Padding = UDim.new(0, 250)
Uilist.VerticalAlignment = Enum.VerticalAlignment.Top
Uilist.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Sthingsframe = Instance.new("Frame")
Sthingsframe.Parent = screengui
Sthingsframe.Visible = false
Sthingsframe.Size = UDim2.fromOffset(150, 500)
Sthingsframe.Position = MainFrame.Position + UDim2.fromOffset(150)
Sthingsframe.BorderColor3 = Color3.new(1, 1, 0)

Uilist:Clone().Parent = Sthingsframe
Sthingsframe.UIListLayout.Padding = UDim.new(0, 50)

local playersbutton =  Instance.new("TextButton")
playersbutton.Parent = MainFrame
playersbutton.Size = UDim2.fromOffset(100, 50)
playersbutton.Position = MainFrame.Position + UDim2.fromOffset(0, 50)
playersbutton.Text = "فتح قائمة الاعبين"
playersbutton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playersbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
playersbutton.TextScaled = true
playersbutton.Modal = false
playersbutton.MouseButton1Click:Connect(function()
	PlayersFrame.Visible = not PlayersFrame.Visible
	ClickSound()
end)

local destroy =  Instance.new("TextButton")
destroy.Parent = MainFrame
destroy.Size = UDim2.fromOffset(100, 50)
destroy.Position = MainFrame.Position + UDim2.fromOffset(0, 100)
destroy.Text = "إغلاق"
destroy.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
destroy.TextColor3 = Color3.fromRGB(0, 170, 0)
destroy.TextScaled = true
destroy.Modal = false
destroy.MouseButton1Click:Connect(function()
	screengui:Destroy()
end)

local cuff =  Instance.new("TextButton")
cuff.Parent = MainFrame
cuff.Size = UDim2.fromOffset(100, 50)
cuff.Position = MainFrame.Position + UDim2.fromOffset(0, 200)
cuff.Text = "هاك الكلبشة"
cuff.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
cuff.TextColor3 = Color3.fromRGB(0, 170, 255)
cuff.TextScaled = true
cuff.Modal = false
cuff.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/JundiA-K/cameraaccess/1deee173cbf6f7a9cad0e3f6ce2601c7aa1cab1f/lua'))()
end)

local Sthings =  Instance.new("TextButton")
Sthings.Parent = MainFrame
Sthings.Size = UDim2.fromOffset(100, 50)
Sthings.Position = MainFrame.Position + UDim2.fromOffset(0, 150)
Sthings.Text = "ثغرات"
Sthings.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Sthings.TextColor3 = Color3.fromRGB(255, 255, 0)
Sthings.TextScaled = true
Sthings.Modal = false
Sthings.MouseButton1Click:Connect(function()
	Sthingsframe.Visible = not Sthingsframe.Visible
	ClickSound()
end)


local REF = PlayersFrame:Clone()
REF.Parent = screengui
REF.Size = UDim2.fromOffset(250, 500)
REF.Position = Sthingsframe.Position + UDim2.fromOffset(150, 0)
REF.Visible = false
REF.UIListLayout.Padding = UDim.new(0, 200)

local REFTL1 = Instance.new("TextLabel")
REFTL1.Parent = REF
REFTL1.Visible = true
REFTL1.Size = UDim2.fromOffset(250, 150)
REFTL1.TextScaled = true
REFTL1.Text = "عند الضغط على المؤشر سوف تقوم بتفعيله و يمكنك اضافة متغير عن طريق ادخال رمز عند الحاجة"

local function EventsList()
	
	for _, eb in pairs(REF:GetChildren()) do
		if eb.Name == "$EBUTT" then
			eb:Destroy()
		end
	end
	wait(1)
	for _, event in pairs(game:GetDescendants()) do
		if event:IsA("RemoteEvent") then
			local ebutt =  Instance.new("TextButton")
			local textbox = Instance.new("TextBox")
			textbox.Parent = ebutt
			textbox.Size = UDim2.fromOffset(125, 50)
			textbox.Position = ebutt.Position + UDim2.fromOffset(0, 125)
			textbox.BackgroundColor = BrickColor.White()
			textbox.Text = "اكتب رمز"
			textbox.TextScaled = true
			textbox.TextColor = BrickColor.Red()
			textbox.TextStrokeTransparency = 0
			ebutt.Parent = REF
			ebutt.Size = UDim2.fromOffset(125, 125)
			ebutt.Text = event.Name
			ebutt.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			ebutt.TextColor3 = Color3.fromRGB(255, 255, 0)
			ebutt.TextScaled = true
			ebutt.Visible = true
			ebutt.Name = "$EBUTT"
			ebutt.Modal = false
			ebutt.MouseButton1Click:Connect(function() event:FireServer(textbox.Text) end)
		end
	end

end

local teleportto = Instance.new("TextButton")
teleportto.Parent = Sthingsframe
teleportto.Size = UDim2.fromOffset(100, 50)
teleportto.TextScaled = true
teleportto.Text = "فحص مؤشرات السيرفر"
teleportto.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportto.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportto.MouseButton1Click:Connect(function()
	REF.Visible = not REF.Visible
	EventsList()
	ClickSound()
end)

local Hidebutton = Instance.new("TextButton")
Hidebutton.Parent = Sthingsframe
Hidebutton.Size = UDim2.fromOffset(100, 50)
Hidebutton.TextScaled = true
Hidebutton.Text = "إختفاء"
Hidebutton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Hidebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
Hidebutton.MouseButton1Click:Connect(function()
	
	if Hidden then
		Hidden = false
		CCS:Destroy()
		CCS = nil
		workspace.CurrentCamera.CameraSubject = LS:FindFirstChildWhichIsA("Humanoid")
		plr.Character = LS
	elseif not Hidden then
		Hidden = true
		print("1")
		spawn(function()
			local clonecharacter = Instance.new("Model")
			clonecharacter.Parent = workspace
			for _, part in pairs(plr.Character:GetChildren()) do
				part:Clone().Parent = clonecharacter
			end

			for _, c in pairs(clonecharacter:GetDescendants()) do
				if c:IsA("Motor6D") then
					if c.Name == "RootJoint" then
						c.Part0 = clonecharacter:FindFirstChild("HumanoidRootPart")
						c.Part1 = clonecharacter:FindFirstChild("Torso")
					elseif c.Name == "Left Hip" then
						c.Part0 = clonecharacter:FindFirstChild("Torso")
						c.Part1 = clonecharacter:FindFirstChild("Left Leg")
					elseif c.Name == "Right Hip" then
						c.Part0 = clonecharacter:FindFirstChild("Torso")
						c.Part1 = clonecharacter:FindFirstChild("Right Leg")
					elseif c.Name == "Neck" then
						c.Part0 = clonecharacter:FindFirstChild("Torso")
						c.Part1 = clonecharacter:FindFirstChild("Head")
					elseif c.Name == "Right Shoulder" then
						c.Part0 = clonecharacter:FindFirstChild("Torso")
						c.Part1 = clonecharacter:FindFirstChild("Right Arm")
					elseif c.Name == "Left Shoulder" then
						c.Part0 = clonecharacter:FindFirstChild("Torso")
						c.Part1 = clonecharacter:FindFirstChild("Left Arm")
					end

				end
			end

			for _, p in pairs(clonecharacter:GetChildren()) do
				if p:IsA("BasePart") then
					p.Color = Color3.new(0.411765, 0.4, 0.360784)
					p.Transparency = 0.35
				end
			end

			clonecharacter:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 24

			workspace.CurrentCamera.CameraSubject = clonecharacter:FindFirstChildWhichIsA("Humanoid")
			plr.Character = clonecharacter
			CCS = clonecharacter
			screengui.Enabled = false
			local g = Instance.new("ScreenGui")
			g.Parent = plr.PlayerGui
			local b = Instance.new("TextButton")
			b.Parent = g
			b.Size = UDim2.fromOffset(100,75)
			b.Text = "أظهار"
			b.MouseButton1Click:Connect(function()
				workspace.CurrentCamera.CameraSubject = LS:FindFirstChildWhichIsA("Humanoid")
				plr.Character = LS
				CCS:Destroy()
				CCS = nil
				screengui:Destroy()
			end)
			
		end)
	end
	ClickSound()
	
	
end)

local AntiBang = Instance.new("TextButton")
AntiBang.Parent = Sthingsframe
AntiBang.Size = UDim2.fromOffset(100, 50)
AntiBang.TextScaled = true
AntiBang.Text = "AntiBang"
AntiBang.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AntiBang.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiBang.MouseButton1Click:Connect(function()
	local tween = game.TweenService
	
	tween:Create(plr.Character.HumanoidRootPart, TweenInfo.new(5, Enum.EasingStyle.Sine), {CFrame = CFrame.new(0,-10000,0)}):Play()
end)

local Refreshbutton =  Instance.new("TextButton")
Refreshbutton.Parent = PlayersFrame
Refreshbutton.Size = UDim2.fromOffset(100, 50)
Refreshbutton.Text = "إعادة تحميل صفحة الاعبين"
Refreshbutton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Refreshbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
Refreshbutton.TextScaled = true

local function fling(canfling)
	local hrp, c, vel, movel = nil, nil, nil, 0.1
	local lp = game.Players.LocalPlayer
	local RunService = game["Run Service"]
	local hiddenfling = true
	
	while canfling do
		RunService.Heartbeat:Wait()
		if hiddenfling then
			while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
				RunService.Heartbeat:Wait()
				c = lp.Character
				hrp = c and c:FindFirstChild("HumanoidRootPart")
				if not canfling then
					break
				end
			end

			if hiddenfling then
				vel = hrp.Velocity
				hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
				RunService.RenderStepped:Wait()
				if c and c.Parent and hrp and hrp.Parent then
					hrp.Velocity = vel
					if not canfling then
						break
					end
				end
				RunService.Stepped:Wait()
				if c and c.Parent and hrp and hrp.Parent then
					hrp.Velocity = vel + Vector3.new(0, movel, 0)
					movel = movel * -1
					if not canfling then
						break
					end
				end
				if not canfling then
					break
				end
			end
		end
		if not canfling then
			break
		end
	end
end

local function RefreshPlayerList ()
	
	for _, a in pairs(PlayersFrame:GetChildren()) do
		if a.Name =="!PLRBUTTONL!" then
			a:Destroy()
		end
	end
	
	Sellected = nil
	hover.Parent = nil
	Sellected = false
	
	for _, i in pairs(game.Players:GetChildren()) do
		if i then
			if i:IsA("Player") then
				local newplayer = Instance.new("ImageLabel")
				newplayer.Name = "!PLRBUTTONL!"
				newplayer.Parent = PlayersFrame
				newplayer.BackgroundColor3 = Color3.new(255,255,255)
				newplayer.Image = game.Players:GetUserThumbnailAsync(i.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size180x180)
				newplayer.Size = UDim2.fromOffset(100, 100)
				
				local selectplayer = Instance.new("TextButton")
				selectplayer.Parent = newplayer
				selectplayer.Position = newplayer.Position + UDim2.fromOffset(0,100)
				selectplayer.Size = UDim2.fromOffset(100, 50)
				selectplayer.TextScaled = true
				selectplayer.Text = "تحديد الاعب"
				selectplayer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				selectplayer.TextColor3 = Color3.fromRGB(255, 0, 0)
				selectplayer.MouseButton1Click:Connect(function()
					if not Sellected then
						ClickSound()
						SellectedPlayer = i
						hover.Parent = i.Character
						Sellected = true
						newplayer.BackgroundColor3 = Color3.new(1,0,0)
					else
						ClickSound()
						Sellected = nil
						hover.Parent = nil
						Sellected = false
						newplayer.BackgroundColor3 = Color3.new(255,255,255)
						for _, a in pairs(PlayersFrame:GetChildren()) do
							if a.Name =="!PLRBUTTONL!" then
								a.BackgroundColor3 = Color3.new(255,255,255)
							end
						end
					end
				end)
				
				
				
				local teleportto = Instance.new("TextButton")
				teleportto.Parent = newplayer
				teleportto.Position = newplayer.Position + UDim2.fromOffset(0,150)
				teleportto.Size = UDim2.fromOffset(100, 50)
				teleportto.TextScaled = true
				teleportto.Text = "الإنتقال الى الاعب"
				teleportto.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				teleportto.TextColor3 = Color3.fromRGB(255, 255, 255)
				teleportto.MouseButton1Click:Connect(function()
					plr.Character:PivotTo(i.Character.PrimaryPart.CFrame)
					ClickSound()
				end)
				
				local flingplayer = Instance.new("TextButton")
				flingplayer.Parent = newplayer
				flingplayer.Position = newplayer.Position + UDim2.fromOffset(0,200)
				flingplayer.Size = UDim2.fromOffset(100, 50)
				flingplayer.TextScaled = true
				flingplayer.Text = "قذف الاعب - Fling"
				flingplayer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				flingplayer.TextColor3 = Color3.fromRGB(255, 255, 255)
				flingplayer.MouseButton1Click:Connect(function()
					ClickSound()
					screengui.Enabled = false
					local lp = plr.Character.PrimaryPart.CFrame
					wait()
					plr.Character:PivotTo(i.Character.PrimaryPart.CFrame)
					spawn(function()
						fling(true)
					end)
					wait(0.35)
					fling(false)
					plr.Character:PivotTo(lp)
					screengui.Enabled = true
				end)
				
				
			end
		end
	end
	
end

RefreshPlayerList()

Refreshbutton.MouseButton1Click:Connect(function()
	RefreshPlayerList()
	ClickSound()
end)
