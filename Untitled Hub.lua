local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Untitled Hub", "BloodTheme")

--Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

MainSection:NewButton("Fly", "Fly", function()
    -- Bring to you by 7alexv7
-- Enjoy the script!

-- Instances:

local FlyGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

--Properties:

FlyGui.Name = "FlyGui"
FlyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = FlyGui
Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0685602352, 0, 0.168769717, 0)
Frame.Size = UDim2.new(0.264544547, 0, 0.100000024, 0)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.06324628, 0, 0.400667697, 0)
TextButton.Size = UDim2.new(0.871157169, 0, 0.495614201, 0)
TextButton.Font = Enum.Font.ArialBold
TextButton.Text = "Fly"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextStrokeTransparency = 0.000
TextButton.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Size = UDim2.new(0, 86, 0, 24)
TextLabel.Font = Enum.Font.Oswald
TextLabel.Text = "Made by Untitled Hub"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Scripts:

local function NQWSTGE_fake_script() -- Frame.Fly 
	local script = Instance.new('LocalScript', Frame)

	local plr = script.Parent.Parent.Parent.Parent
	repeat wait() until plr and plr.Character and plr.Character:findFirstChild("HumanoidRootPart") and plr.Character:findFirstChild("Humanoid") 
	local mouse = game.Players.LocalPlayer:GetMouse()  
	repeat wait() until mouse
	
	local torso = plr.Character.HumanoidRootPart 
	local flying = false
	local deb = true 
	local ctrl = {f = 0, b = 0, l = 0, r = 0} 
	local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
	local maxspeed = 1000 
	local speed = 50
	function Fly() 
	local bg = Instance.new("BodyGyro", torso) 
	bg.P = 9e4 
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
	bg.cframe = torso.CFrame 
	local bv = Instance.new("BodyVelocity", torso) 
	bv.velocity = Vector3.new(0,0.1,0) 
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
	repeat wait() 
	plr.Character.Humanoid.PlatformStand = true 
	if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
	speed = speed+.5+(speed/maxspeed) 
	if speed > maxspeed then 
	speed = maxspeed 
	end 
	elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
	speed = speed-1 
	if speed < 0 then 
					speed = 0
				else
					speed = 50
	end 
	end 
	if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
	bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
	lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
	elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
	bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
	else 
	bv.velocity = Vector3.new(0,0.1,0) 
	end 
	bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
	until not flying 
	ctrl = {f = 0, b = 0, l = 0, r = 0} 
	lastctrl = {f = 0, b = 0, l = 0, r = 0} 
		
	bg:Destroy() 
	bv:Destroy() 
		plr.Character.Humanoid.PlatformStand = false 
		speed = 50
	end 
	
	mouse.KeyDown:connect(function(key) 
	if key:lower() == "e" then 
			if flying then flying = false 
				speed = 50
	else 
	flying = true 
	Fly()
	
	end 
	elseif key:lower() == "w" then 
	ctrl.f = 1 
	elseif key:lower() == "s" then 
	ctrl.b = -1 
	elseif key:lower() == "a" then 
	ctrl.l = -1 
	elseif key:lower() == "d" then 
	ctrl.r = 1 
	end 
	end) 
	mouse.KeyUp:connect(function(key) 
	if key:lower() == "w" then 
	ctrl.f = 0 
	elseif key:lower() == "s" then 
	ctrl.b = 0 
	elseif key:lower() == "a" then 
	ctrl.l = 0 
	elseif key:lower() == "d" then 
	ctrl.r = 0 
	end 
	end)
	
	plr.Character.Humanoid.StateChanged:Connect(function(o,n)
		if n == Enum.HumanoidStateType.Running then
			ctrl.f = 1
		else
			ctrl.f = 0
		end
	
	end)
	script.Parent.TextButton.MouseButton1Click:Connect(function()
		if flying then
			flying = false
			speed = 50
		else
			flying = true
			Fly()
		end
	end)
	
end
coroutine.wrap(NQWSTGE_fake_script)()
local function RAQA_fake_script() -- Frame.Buttons 
	local script = Instance.new('LocalScript', Frame)

	local Trigger = script.Parent.MiniTrext
	local IsMini = false
	function CreateTween(Instance,Style,Direction,Time,table,RepeatCount,CanRepeat,Delay)
		local ts = game:GetService("TweenService")
		local TweenInfo = TweenInfo.new(Time,Style,Direction,RepeatCount,CanRepeat,Delay)
		local Tween = ts:Create(Instance,TweenInfo,table)
		repeat wait() until Tween ~= nil
		return Tween
		
	end
	Trigger.MouseButton1Click:Connect(function()
		if IsMini then
			CreateTween(script.Parent,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0.5,{Size = UDim2.new(0.265, 0,0.1, 0)},0,false,0.1):Play()
			IsMini = false
			Trigger.Text = "-"
		else
			CreateTween(script.Parent,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0.5,{Size = UDim2.new(0.265, 0,0.042, 0)},0,false,0.1):Play()
			IsMini = true
			Trigger.Text = "+"
		end
	end)
	script.Parent.Delete.MouseButton1Click:Connect(function()
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(RAQA_fake_script)()
local function TKVUMP_fake_script() -- Frame.Drag Gui 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(TKVUMP_fake_script)()
end)

MainSection:NewButton("Float", "Float", function()
    Float_Height = "5" -- Your float height | 5 is default

local i=1
G=game;
_=wait;
p=G:GetService("Players").LocalPlayer.Character
p:FindFirstChild("Humanoid").HipHeight = Float_Height
_(1.5);
t=.4;
n=2;
for i=1,i do
repeat p:FindFirstChild("Humanoid").HipHeight=Float_Height-n _(t)p:FindFirstChild("Humanoid").HipHeight=Float_Height+n _(t) until
p:FindFirstChild("Humanoid").Health == 0
end
end)

MainSection:NewButton("Noclip", "Noclip", function()
    local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false

Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.195238099, 0, 0.866141737, 0)
Credit.Size = UDim2.new(0, 128, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "Created by KingLuna"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 16
Credit.TextStrokeColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true

Toggle.MouseButton1Click:connect(function()
	if Status.Text == "off" then
		Clipon = true
		Status.Text = "on"
		Status.TextColor3 = Color3.new(0,185,0)
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon == false then
				for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
			else
				Stepped:Disconnect()
			end
		end)
	elseif Status.Text == "on" then
		Clipon = false
		Status.Text = "off"
		Status.TextColor3 = Color3.new(170,0,0)
	end
end)
end)

MainSection:NewButton("Esp", "Esp", function()
    local players = game.Players:GetPlayers()

for i,v in pairs(players) do
 local esp = Instance.new("Highlight")
 esp.Name = v.Name
 esp.FillTransparency = 0.5
 esp.FillColor = Color3.new(255, 0, 0)
 esp.OutlineColor = Color3.new(0, 0, 0)
 esp.OutlineTransparency = 0
 esp.Parent = v.Character
end
end)

--Player
local Player = Window:NewTab("Local Player")
local PlayerSection = Player:NewSection("Local Player")

PlayerSection:NewSlider("Speed", "Speed", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump power", "Jump power", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Invisible R15", "Invisible", function()
--Settings:
local ScriptStarted = false
local Keybind = "Q" --Set to whatever you want, has to be the name of a KeyCode Enum.
local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
local NoClip = false --Will make your fake character no clip.

local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()

local IsInvisible = false

RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.7
      end
  end
end
local CanInvis = true
function RealCharacterDied()
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid

  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)

PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
  if IsInvisible == false then
      local StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = StoredCF
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end

      IsInvisible = true
  else
      local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
     
      RealCharacter.HumanoidRootPart.CFrame = StoredCF
     
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end

game:GetService("UserInputService").InputBegan:Connect(
  function(key, gamep)
      if gamep then
          return
      end
      if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
          if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
              Invisible()
          end
      end
  end
)
local Sound = Instance.new("Sound",game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()
game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})

end)


--Other
local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")

OtherSection:NewButton("Winged Master", "Winged Master", function()
    
--MADE BY DELECTIV/GUAVAJUICEFANCLUBFAN
--SUBSCRIBE TO DARK ECCENTRIC
function rmesh(a)
    if not (workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('Mesh') or workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('SpecialMesh')) then return end
    old=game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character=workspace[game.Players.LocalPlayer.Name]
    for i,v in next, workspace[game.Players.LocalPlayer.Name]:FindFirstChild(a).Handle:GetDescendants() do
    if v:IsA('Mesh') or v:IsA('SpecialMesh') then
    v:Remove()
    end
    end
    for i = 1 , 2 do
    game.Players.LocalPlayer.Character=old
    end
    end
    
    HumanDied = false for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do if v:IsA("BasePart") then  _G.netless=game:GetService("RunService").Heartbeat:connect(function() v.AssemblyLinearVelocity = Vector3.new(-30,0,0) sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge) sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999) end) end end  local plr = game.Players.LocalPlayer local char = plr.Character local srv = game:GetService('RunService') local ct = {}  char.Archivable = true local reanim = char:Clone() reanim.Name = 'Nexo '..plr.Name..'' fl=Instance.new('Folder',char) fl.Name ='Nexo' reanim.Animate.Disabled=true char.HumanoidRootPart:Destroy() char.Humanoid:ChangeState(16)  for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do v:Stop() end char.Animate:Remove()  function create(part, parent, p, r) Instance.new("Attachment",part) Instance.new("AlignPosition",part) Instance.new("AlignOrientation",part) Instance.new("Attachment",parent) part.Attachment.Name = part.Name parent.Attachment.Name = part.Name part.AlignPosition.Attachment0 = part[part.Name] part.AlignOrientation.Attachment0 = part[part.Name] part.AlignPosition.Attachment1 = parent[part.Name] part.AlignOrientation.Attachment1 = parent[part.Name] parent[part.Name].Position = p or Vector3.new() part[part.Name].Orientation = r or Vector3.new() part.AlignPosition.MaxForce = 999999999 part.AlignPosition.MaxVelocity = math.huge part.AlignPosition.ReactionForceEnabled = false part.AlignPosition.Responsiveness = math.huge part.AlignOrientation.Responsiveness = math.huge part.AlignPosition.RigidityEnabled = false part.AlignOrientation.MaxTorque = 999999999 end  for i,v in next, char:GetDescendants() do if v:IsA('Accessory') then v.Handle:BreakJoints() create(v.Handle,reanim[v.Name].Handle) end end  char.Torso['Left Shoulder']:Destroy() char.Torso['Right Shoulder']:Destroy() char.Torso['Left Hip']:Destroy() char.Torso['Right Hip']:Destroy()  create(char['Torso'],reanim['Torso']) create(char['Left Arm'],reanim['Left Arm']) create(char['Right Arm'],reanim['Right Arm']) create(char['Left Leg'],reanim['Left Leg']) create(char['Right Leg'],reanim['Right Leg'])  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') or v:IsA('Decal') then v.Transparency = 1 end end  reanim.Parent = fl  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  table.insert(ct,reanim.Humanoid.Died:Connect(function() plr.Character = char char:BreakJoints() reanim:Destroy() game.Players:Chat('-gr') _G.netless:Disconnect() HumanDied = true for _,v in pairs(ct) do v:Disconnect() end end))  plr.Character = reanim workspace.CurrentCamera.CameraSubject = reanim.Humanoid
    
    IT = Instance.new
    CF = CFrame.new
    VT = Vector3.new
    RAD = math.rad
    C3 = Color3.new
    UD2 = UDim2.new
    BRICKC = BrickColor.new
    ANGLES = CFrame.Angles
    EULER = CFrame.fromEulerAnglesXYZ
    COS = math.cos
    ACOS = math.acos
    SIN = math.sin
    ASIN = math.asin
    ABS = math.abs
    MRANDOM = math.random
    FLOOR = math.floor
    
    speed = 1
    sine = 1
    srv = game:GetService('RunService')
    
    reanim = game.Players.LocalPlayer.Character
    
    function hat(h,p,c1,c0,m)
    reanim[h].Handle.AccessoryWeld.Part1=reanim[p]
    reanim[h].Handle.AccessoryWeld.C1=c1 or CFrame.new()
    reanim[h].Handle.AccessoryWeld.C0=reanim[h].Handle.AccessoryWeld.C0:Lerp(c0 or CFrame.new(),1)
    if m == true then
    rmesh(h)
    end
    end
    
    m=game.Players.LocalPlayer:GetMouse()
    RJ = reanim.HumanoidRootPart.RootJoint
    RS = reanim.Torso['Right Shoulder']
    LS = reanim.Torso['Left Shoulder']
    RH = reanim.Torso['Right Hip']
    LH = reanim.Torso['Left Hip']
    Root = reanim.HumanoidRootPart
    NECK = reanim.Torso.Neck
    NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    
    -- for modes u can go in this link : https://Nexo.notxeneon15.repl.co/nexo/modes.lua
    
    coroutine.wrap(function()
    while true do -- anim changer
    if HumanDied then break end
    sine = sine + speed
    local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
    local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
    local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
    local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
    local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
    local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
    if lookvector > reanim.Humanoid.WalkSpeed then
    lookvector = reanim.Humanoid.WalkSpeed
    end
    if lookvector < -reanim.Humanoid.WalkSpeed then
    lookvector = -reanim.Humanoid.WalkSpeed
    end
    if rightvector > reanim.Humanoid.WalkSpeed then
    rightvector = reanim.Humanoid.WalkSpeed
    end
    if rightvector < -reanim.Humanoid.WalkSpeed then
    rightvector = -reanim.Humanoid.WalkSpeed
    end
    local lookvel = lookvector / reanim.Humanoid.WalkSpeed
    local rightvel = rightvector / reanim.Humanoid.WalkSpeed
    if reanim.Humanoid.Jump then -- jump
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1.47+0.5*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-45+5.58*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-24.98+0*math.cos(sine/10)),math.rad(113+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(-0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(24.98+0*math.cos(sine/10)),math.rad(-113+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(-24.98+-32.62*math.cos(sine/10)),math.rad(113+28.51*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(-1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(24.98+32.62*math.cos(sine/10)),math.rad(-113+-28.51*math.cos(sine/10))),.2)
    elseif Root.Velocity.y < -1 and reanim.Humanoid.Jump then -- fall
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1.47+0.5*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-45+5.58*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-24.98+0*math.cos(sine/10)),math.rad(113+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(-0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(24.98+0*math.cos(sine/10)),math.rad(-113+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(-24.98+-32.62*math.cos(sine/10)),math.rad(113+28.51*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(-1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(24.98+32.62*math.cos(sine/10)),math.rad(-113+-28.51*math.cos(sine/10))),.2)
    elseif Root.Velocity.Magnitude < 2 then -- idle
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.22+0.14*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-90+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-24.98+2.5*math.cos(sine/10)),math.rad(90+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(24.98+-2.5*math.cos(sine/10)),math.rad(-90+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(2.54+0*math.cos(sine/10),0+0*math.cos(sine/10),0.2+-0.14*math.cos(sine/10))*CFrame.Angles(math.rad(90+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(-2.54+0*math.cos(sine/10),0+0*math.cos(sine/10),0.2+-0.14*math.cos(sine/10))*CFrame.Angles(math.rad(90+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
    elseif Root.Velocity.Magnitude < 20 then -- walk
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1.47+0.5*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-45+5.58*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-24.98+0*math.cos(sine/10)),math.rad(113+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(-0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(24.98+0*math.cos(sine/10)),math.rad(-113+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(-24.98+-32.62*math.cos(sine/10)),math.rad(113+28.51*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(-1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(24.98+32.62*math.cos(sine/10)),math.rad(-113+-28.51*math.cos(sine/10))),.2)
    elseif Root.Velocity.Magnitude > 20 then -- run
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1.47+0.5*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-45+5.58*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-24.98+0*math.cos(sine/10)),math.rad(113+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(-0.68+0*math.cos(sine/10),0+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(24.98+0*math.cos(sine/10)),math.rad(-113+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(-24.98+-32.62*math.cos(sine/10)),math.rad(113+28.51*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(-1.7+0*math.cos(sine/10),0.5+0*math.cos(sine/10),1.4+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+28.51*math.cos(sine/10)),math.rad(24.98+32.62*math.cos(sine/10)),math.rad(-113+-28.51*math.cos(sine/10))),.2)
    end
    srv.RenderStepped:Wait()
    end
    end)()
    --Created using Nexo Animator V4
end)

OtherSection:NewButton("Da Feet", "Da Feet", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
end)

OtherSection:NewButton("Creepy Crawler", "Creepy Crawler", function()
    --[[
    Fe Creepy Crawler
    by MyWorld#4430
    discord.gg/pYVHtSJmEY
]]

if "MyWorld reanimate cool" then
    --reanimate by MyWorld#4430 discord.gg/pYVHtSJmEY
    local netboost = Vector3.new(0, 45, 0) --velocity 
    --netboost usage: 
    --set to false to disable
    --set to a vector3 value if you dont want the velocity to change
    --set to a number to change the velocity in real time with magnitude equal to the number
    local idleMag = 0.01 --used only in case netboost is set to a number value
    --if magnitude of the real velocity of a part is lower than this
    --then the fake velocity is being set to Vector3.new(0, netboost, 0)
    local noRotVel = true --parts rotation velocity set to Vector3.new(0, 0, 0)
    local simradius = "shp" --simulation radius (net bypass) method
    --"shp" - sethiddenproperty
    --"ssr" - setsimulationradius
    --false - disable
    local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
    local newanimate = true --disables the animate script and enables after reanimation
    local discharscripts = true --disables all localScripts parented to your character before reanimation
    local R15toR6 = true --tries to convert your character to r6 if its r15
    local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
    local hedafterneck = true --disable aligns for head and enable after neck is removed
    local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
    local method = 3 --reanimation method
    --methods:
    --0 - breakJoints (takes [loadtime] seconds to laod)
    --1 - limbs
    --2 - limbs + anti respawn
    --3 - limbs + breakJoints after [loadtime] seconds
    --4 - remove humanoid + breakJoints
    --5 - remove humanoid + limbs
    local alignmode = 2 --AlignPosition mode
    --modes:
    --1 - AlignPosition rigidity enabled true
    --2 - 2 AlignPositions rigidity enabled both true and false
    --3 - AlignPosition rigidity enabled false
    
    local lp = game:GetService("Players").LocalPlayer
    local rs = game:GetService("RunService")
    local stepped = rs.Stepped
    local heartbeat = rs.Heartbeat
    local renderstepped = rs.RenderStepped
    local sg = game:GetService("StarterGui")
    local ws = game:GetService("Workspace")
    local cf = CFrame.new
    local v3 = Vector3.new
    local v3_0 = v3(0, 0, 0)
    local inf = math.huge
    
    local c = lp.Character
    
    if not (c and c.Parent) then
    	return
    end
    
    c.Destroying:Connect(function()
    	c = nil
    end)
    
    local function gp(parent, name, className)
    	if typeof(parent) == "Instance" then
    		for i, v in pairs(parent:GetChildren()) do
    			if (v.Name == name) and v:IsA(className) then
    				return v
    			end
    		end
    	end
    	return nil
    end
    
    local function align(Part0, Part1)
    	Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)
    
    	local att0 = Instance.new("Attachment", Part0)
    	att0.Orientation = v3_0
    	att0.Position = v3_0
    	att0.Name = "att0_" .. Part0.Name
    	local att1 = Instance.new("Attachment", Part1)
    	att1.Orientation = v3_0
    	att1.Position = v3_0
    	att1.Name = "att1_" .. Part1.Name
    
    	if (alignmode == 1) or (alignmode == 2) then
    		local ape = Instance.new("AlignPosition", att0)
    		ape.ApplyAtCenterOfMass = false
    		ape.MaxForce = inf
    		ape.MaxVelocity = inf
    		ape.ReactionForceEnabled = false
    		ape.Responsiveness = 200
    		ape.Attachment1 = att1
    		ape.Attachment0 = att0
    		ape.Name = "AlignPositionRtrue"
    		ape.RigidityEnabled = true
    	end
    
    	if (alignmode == 2) or (alignmode == 3) then
    		local apd = Instance.new("AlignPosition", att0)
    		apd.ApplyAtCenterOfMass = false
    		apd.MaxForce = inf
    		apd.MaxVelocity = inf
    		apd.ReactionForceEnabled = false
    		apd.Responsiveness = 200
    		apd.Attachment1 = att1
    		apd.Attachment0 = att0
    		apd.Name = "AlignPositionRfalse"
    		apd.RigidityEnabled = false
    	end
    
    	local ao = Instance.new("AlignOrientation", att0)
    	ao.MaxAngularVelocity = inf
    	ao.MaxTorque = inf
    	ao.PrimaryAxisOnly = false
    	ao.ReactionTorqueEnabled = false
    	ao.Responsiveness = 200
    	ao.Attachment1 = att1
    	ao.Attachment0 = att0
    	ao.RigidityEnabled = false
    
    	if netboost then
            local steppedcon = nil
            local heartbeatcon = nil
            Part0.Destroying:Connect(function()
                Part0 = nil
                steppedcon:Disconnect()
                heartbeatcon:Disconnect()
            end)
            local vel = v3_0
            local rotvel = noRotVel and v3_0
            if typeof(netboost) == "Vector3" then
                steppedcon = stepped:Connect(function()
                    Part0.Velocity = vel
                    if rotvel then
                        Part0.RotVelocity = rotvel
                    end
                end)
                heartbeatcon = heartbeat:Connect(function()
                    vel = Part0.Velocity
                    Part0.Velocity = netboost
                    if rotvel then
                        rotvel = Part0.RotVelocity
                        Part0.RotVelocity = v3_0
                    end
                end)
            elseif typeof(netboost) == "number" then
        	    steppedcon = stepped:Connect(function()
                    Part0.Velocity = vel
                    if rotvel then
                        Part0.RotVelocity = rotvel
                    end
                end)
                heartbeatcon = heartbeat:Connect(function()
                    vel = Part0.Velocity
                    local newvel = vel
                    local mag = newvel.Magnitude
                    if mag < idleMag then
                        newvel = v3(0, netboost, 0)
                    else
                        local multiplier = netboost / mag
                        newvel *= v3(multiplier,  multiplier, multiplier)
                    end
                    Part0.Velocity = newvel
                    if rotvel then
                        rotvel = Part0.RotVelocity
                        Part0.RotVelocity = v3_0
                    end
                end)
        	end
        end
    end
    
    local function respawnrequest()
    	local ccfr = ws.CurrentCamera.CFrame
    	local c = lp.Character
    	lp.Character = nil
    	lp.Character = c
    	local con = nil
    	con = ws.CurrentCamera.Changed:Connect(function(prop)
    	    if (prop ~= "Parent") and (prop ~= "CFrame") then
    	        return
    	    end
    	    ws.CurrentCamera.CFrame = ccfr
    	    con:Disconnect()
        end)
    end
    
    local destroyhum = (method == 4) or (method == 5)
    local breakjoints = (method == 0) or (method == 4)
    local antirespawn = (method == 0) or (method == 2) or (method == 3)
    
    addtools = addtools and gp(lp, "Backpack", "Backpack")
    
    local fenv = getfenv()
    if simradius == "shp" then
    	local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
    	if shp then
    		spawn(function()
    			while c and heartbeat:Wait() do
    				shp(lp, "SimulationRadius", inf)
    			end
    		end)
    	end
    elseif simradius == "ssr" then
    	local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.set_simulation_rad or fenv.setsimulationrad
    	if ssr then
    		spawn(function()
    			while c and heartbeat:Wait() do
    				ssr(inf)
    			end
    		end)
    	end
    end
    
    antiragdoll = antiragdoll and function(v)
    	if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
    		v.Parent = nil
    	end
    end
    
    if antiragdoll then
    	for i, v in pairs(c:GetDescendants()) do
    		antiragdoll(v)
    	end
    	c.DescendantAdded:Connect(antiragdoll)
    end
    
    if antirespawn then
    	respawnrequest()
    end
    
    if method == 0 then
    	wait(loadtime)
    	if not c then
    		return
    	end
    end
    
    if discharscripts then
    	for i, v in pairs(c:GetChildren()) do
    		if v:IsA("LocalScript") then
    			v.Disabled = true
    		end
    	end
    elseif newanimate then
    	local animate = gp(c, "Animate", "LocalScript")
    	if animate and (not animate.Disabled) then
    		animate.Disabled = true
    	else
    		newanimate = false
    	end
    end
    
    local hum = c:FindFirstChildOfClass("Humanoid")
    if hum then
    	for i, v in pairs(hum:GetPlayingAnimationTracks()) do
    		v:Stop()
    	end
    end
    
    if addtools then
    	for i, v in pairs(addtools:GetChildren()) do
    		if v:IsA("Tool") then
    			v.Parent = c
    		end
    	end
    end
    
    pcall(function()
    	settings().Physics.AllowSleep = false
    	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    end)
    
    local OLDscripts = {}
    
    for i, v in pairs(c:GetDescendants()) do
    	if v.ClassName == "Script" then
    		table.insert(OLDscripts, v)
    	end
    end
    
    local scriptNames = {}
    
    for i, v in pairs(c:GetDescendants()) do
    	if v:IsA("BasePart") then
    		local newName = tostring(i)
    		local exists = true
    		while exists do
    			exists = false
    			for i, v in pairs(OLDscripts) do
    				if v.Name == newName then
    					exists = true
    				end
    			end
    			if exists then
    				newName = newName .. "_"    
    			end
    		end
    		table.insert(scriptNames, newName)
    		Instance.new("Script", v).Name = newName
    	end
    end
    
    c.Archivable = true
    local cl = c:Clone()
    for i, v in pairs(cl:GetDescendants()) do
    	if v:IsA("BasePart") then
    		v.Transparency = 1
    		v.Anchored = false
    	end
    end
    
    local model = Instance.new("Model", c)
    model.Name = model.ClassName
    
    model.Destroying:Connect(function()
    	model = nil
    end)
    
    for i, v in pairs(c:GetChildren()) do
    	if v ~= model then
    		if destroyhum and v:IsA("Humanoid") then
    			v:Destroy()
    		else
    			if addtools and v:IsA("Tool") then
    				for i1, v1 in pairs(v:GetDescendants()) do
    					if v1 and v1.Parent and v1:IsA("BasePart") then
    						local bv = Instance.new("BodyVelocity", v1)
    						bv.Velocity = v3_0
    						bv.MaxForce = v3(1000, 1000, 1000)
    						bv.P = 1250
    						bv.Name = "bv_" .. v.Name
    					end
    				end
    			end
    			v.Parent = model
    		end
    	end
    end
    local head = gp(model, "Head", "BasePart")
    local torso = gp(model, "Torso", "BasePart") or gp(model, "UpperTorso", "BasePart")
    if breakjoints then
    	model:BreakJoints()
    else
    	if head and torso then
    		for i, v in pairs(model:GetDescendants()) do
    			if v:IsA("Weld") or v:IsA("Snap") or v:IsA("Glue") or v:IsA("Motor") or v:IsA("Motor6D") then
    				local save = false
    				if (v.Part0 == torso) and (v.Part1 == head) then
    					save = true
    				end
    				if (v.Part0 == head) and (v.Part1 == torso) then
    					save = true
    				end
    				if save then
    					if hedafterneck then
    						hedafterneck = v
    					end
    				else
    					v:Destroy()
    				end
    			end
    		end
    	end
    	if method == 3 then
    		spawn(function()
    			wait(loadtime)
    			if model then
    				model:BreakJoints()
    			end
    		end)
    	end
    end
    
    cl.Parent = c
    for i, v in pairs(cl:GetChildren()) do
    	v.Parent = c
    end
    cl:Destroy()
    
    local modelDes = {}
    for i, v in pairs(model:GetDescendants()) do
    	if v:IsA("BasePart") then
    		i = tostring(i)
    		v.Destroying:Connect(function()
    			modelDes[i] = nil
    		end)
    		modelDes[i] = v
    	end
    end
    local modelcolcon = nil
    local function modelcolf()
    	if model then
    		for i, v in pairs(modelDes) do
    			v.CanCollide = false
    		end
    	else
    		modelcolcon:Disconnect()
    	end
    end
    modelcolcon = stepped:Connect(modelcolf)
    modelcolf()
    
    for i, scr in pairs(model:GetDescendants()) do
    	if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
    		local Part0 = scr.Parent
    		if Part0:IsA("BasePart") then
    			for i1, scr1 in pairs(c:GetDescendants()) do
    				if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
    					local Part1 = scr1.Parent
    					if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
    						align(Part0, Part1)
    						break
    					end
    				end
    			end
    		end
    	end
    end
    
    if (typeof(hedafterneck) == "Instance") and head then
    	local aligns = {}
    	local con = nil
    	con = hedafterneck.Changed:Connect(function(prop)
    	    if (prop == "Parent") and not hedafterneck.Parent then
    	        con:Disconnect()
        		for i, v in pairs(aligns) do
        			v.Enabled = true
        		end
    		end
    	end)
    	for i, v in pairs(head:GetDescendants()) do
    		if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
    			i = tostring(i)
    			aligns[i] = v
    			v.Destroying:Connect(function()
    			    aligns[i] = nil
    			end)
    			v.Enabled = false
    		end
    	end
    end
    
    for i, v in pairs(c:GetDescendants()) do
    	if v and v.Parent then
    		if v.ClassName == "Script" then
    			if table.find(scriptNames, v.Name) then
    				v:Destroy()
    			end
    		elseif not v:IsDescendantOf(model) then
    			if v:IsA("Decal") then
    				v.Transparency = 1
    			elseif v:IsA("ForceField") then
    				v.Visible = false
    			elseif v:IsA("Sound") then
    				v.Playing = false
    			elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
    				v.Enabled = false
    			end
    		end
    	end
    end
    
    if newanimate then
    	local animate = gp(c, "Animate", "LocalScript")
    	if animate then
    		animate.Disabled = false
    	end
    end
    
    if addtools then
    	for i, v in pairs(c:GetChildren()) do
    		if v:IsA("Tool") then
    			v.Parent = addtools
    		end
    	end
    end
    
    local hum0 = model:FindFirstChildOfClass("Humanoid")
    if hum0 then
        hum0.Destroying:Connect(function()
            hum0 = nil
        end)
    end
    
    local hum1 = c:FindFirstChildOfClass("Humanoid")
    if hum1 then
        hum1.Destroying:Connect(function()
            hum1 = nil
        end)
    end
    
    if hum1 then
    	ws.CurrentCamera.CameraSubject = hum1
    	local camSubCon = nil
    	local function camSubFunc()
    		camSubCon:Disconnect()
    		if c and hum1 then
    			ws.CurrentCamera.CameraSubject = hum1
    		end
    	end
    	camSubCon = renderstepped:Connect(camSubFunc)
    	if hum0 then
    		hum0.Changed:Connect(function(prop)
    			if hum1 and (prop == "Jump") then
    				hum1.Jump = hum0.Jump
    			end
    		end)
    	else
    		respawnrequest()
    	end
    end
    
    local rb = Instance.new("BindableEvent", c)
    rb.Event:Connect(function()
    	rb:Destroy()
    	sg:SetCore("ResetButtonCallback", true)
    	if destroyhum then
    		c:BreakJoints()
    		return
    	end
    	if hum0 and (hum0.Health > 0) then
    		model:BreakJoints()
    		hum0.Health = 0
    	end
    	if antirespawn then
    	    respawnrequest()
    	end
    end)
    sg:SetCore("ResetButtonCallback", rb)
    
    spawn(function()
    	while c do
    		if hum0 and hum1 then
    			hum1.Jump = hum0.Jump
    		end
    		wait()
    	end
    	sg:SetCore("ResetButtonCallback", true)
    end)
    
    R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
    if R15toR6 then
        local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    	if part then
    	    local cfr = part.CFrame
    		local R6parts = { 
    			head = {
    				Name = "Head",
    				Size = v3(2, 1, 1),
    				R15 = {
    					Head = 0
    				}
    			},
    			torso = {
    				Name = "Torso",
    				Size = v3(2, 2, 1),
    				R15 = {
    					UpperTorso = 0.2,
    					LowerTorso = -0.8
    				}
    			},
    			root = {
    				Name = "HumanoidRootPart",
    				Size = v3(2, 2, 1),
    				R15 = {
    					HumanoidRootPart = 0
    				}
    			},
    			leftArm = {
    				Name = "Left Arm",
    				Size = v3(1, 2, 1),
    				R15 = {
    					LeftHand = -0.85,
    					LeftLowerArm = -0.2,
    					LeftUpperArm = 0.4
    				}
    			},
    			rightArm = {
    				Name = "Right Arm",
    				Size = v3(1, 2, 1),
    				R15 = {
    					RightHand = -0.85,
    					RightLowerArm = -0.2,
    					RightUpperArm = 0.4
    				}
    			},
    			leftLeg = {
    				Name = "Left Leg",
    				Size = v3(1, 2, 1),
    				R15 = {
    					LeftFoot = -0.85,
    					LeftLowerLeg = -0.15,
    					LeftUpperLeg = 0.6
    				}
    			},
    			rightLeg = {
    				Name = "Right Leg",
    				Size = v3(1, 2, 1),
    				R15 = {
    					RightFoot = -0.85,
    					RightLowerLeg = -0.15,
    					RightUpperLeg = 0.6
    				}
    			}
    		}
    		for i, v in pairs(c:GetChildren()) do
    			if v:IsA("BasePart") then
    				for i1, v1 in pairs(v:GetChildren()) do
    					if v1:IsA("Motor6D") then
    						v1.Part0 = nil
    					end
    				end
    			end
    		end
    		part.Archivable = true
    		for i, v in pairs(R6parts) do
    			local part = part:Clone()
    			part:ClearAllChildren()
    			part.Name = v.Name
    			part.Size = v.Size
    			part.CFrame = cfr
    			part.Anchored = false
    			part.Transparency = 1
    			part.CanCollide = false
    			for i1, v1 in pairs(v.R15) do
    				local R15part = gp(c, i1, "BasePart")
    				local att = gp(R15part, "att1_" .. i1, "Attachment")
    				if R15part then
    					local weld = Instance.new("Weld", R15part)
    					weld.Name = "Weld_" .. i1
    					weld.Part0 = part
    					weld.Part1 = R15part
    					weld.C0 = cf(0, v1, 0)
    					weld.C1 = cf(0, 0, 0)
    					R15part.Massless = true
    					R15part.Name = "R15_" .. i1
    					R15part.Parent = part
    					if att then
    						att.Parent = part
    						att.Position = v3(0, v1, 0)
    					end
    				end
    			end
    			part.Parent = c
    			R6parts[i] = part
    		end
    		local R6joints = {
    			neck = {
    				Parent = R6parts.torso,
    				Name = "Neck",
    				Part0 = R6parts.torso,
    				Part1 = R6parts.head,
    				C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
    				C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
    			},
    			rootJoint = {
    				Parent = R6parts.root,
    				Name = "RootJoint" ,
    				Part0 = R6parts.root,
    				Part1 = R6parts.torso,
    				C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
    				C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
    			},
    			rightShoulder = {
    				Parent = R6parts.torso,
    				Name = "Right Shoulder",
    				Part0 = R6parts.torso,
    				Part1 = R6parts.rightArm,
    				C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    				C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    			},
    			leftShoulder = {
    				Parent = R6parts.torso,
    				Name = "Left Shoulder",
    				Part0 = R6parts.torso,
    				Part1 = R6parts.leftArm,
    				C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
    				C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    			},
    			rightHip = {
    				Parent = R6parts.torso,
    				Name = "Right Hip",
    				Part0 = R6parts.torso,
    				Part1 = R6parts.rightLeg,
    				C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    				C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    			},
    			leftHip = {
    				Parent = R6parts.torso,
    				Name = "Left Hip" ,
    				Part0 = R6parts.torso,
    				Part1 = R6parts.leftLeg,
    				C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
    				C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    			}
    		}
    		for i, v in pairs(R6joints) do
    			local joint = Instance.new("Motor6D")
    			for prop, val in pairs(v) do
    				joint[prop] = val
    			end
    			R6joints[i] = joint
    		end
    		hum1.RigType = Enum.HumanoidRigType.R6
    		hum1.HipHeight = 0
    	end
    end
end

local lp = game:GetService("Players").LocalPlayer

local c = lp.Character
if not (c and c.Parent) then
	return print("character not found")
end
c:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (c and c.Parent) then
        c = nil
    end
end)

--getPart function

local function gp(parent, name, className)
	local ret = nil
	pcall(function()
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				ret = v
				break
			end
		end
	end)
	return ret
end

--check if reanimate loaded

local model = gp(c, "Model", "Model")
if not model then return print("model not found") end

--find body parts

local head = gp(c, "Head", "BasePart")
if not head then return print("head not found") end

local torso = gp(c, "Torso", "BasePart")
if not torso then return print("torso not found") end

local humanoidRootPart = gp(c, "HumanoidRootPart", "BasePart")
if not humanoidRootPart then return print("humanoid root part not found") end

local leftArm = gp(c, "Left Arm", "BasePart")
if not leftArm then return print("left arm not found") end

local rightArm = gp(c, "Right Arm", "BasePart")
if not rightArm then return print("right arm not found") end

local leftLeg = gp(c, "Left Leg", "BasePart")
if not leftLeg then return print("left leg not found") end

local rightLeg = gp(c, "Right Leg", "BasePart")
if not rightLeg then return print("right leg not found") end

--find rig joints

local neck = gp(torso, "Neck", "Motor6D")
if not neck then return print("neck not found") end

local rootJoint = gp(humanoidRootPart, "RootJoint", "Motor6D")
if not rootJoint then return print("root joint not found") end

local leftShoulder = gp(torso, "Left Shoulder", "Motor6D")
if not leftShoulder then return print("left shoulder not found") end

local rightShoulder = gp(torso, "Right Shoulder", "Motor6D")
if not rightShoulder then return print("right shoulder not found") end

local leftHip = gp(torso, "Left Hip", "Motor6D")
if not leftHip then return print("left hip not found") end

local rightHip = gp(torso, "Right Hip", "Motor6D")
if not rightHip then return print("right hip not found") end

--humanoid

local hum = c:FindFirstChildOfClass("Humanoid")
if not hum then return print("humanoid not found") end

local animate = gp(c, "Animate", "LocalScript")
if animate then
	animate.Disabled = true
end

for i, v in pairs(hum:GetPlayingAnimationTracks()) do
	v:Stop()
end

--60 fps

local fps = 60
local event = Instance.new("BindableEvent", c)
event.Name = "60 fps"
local floor = math.floor
fps = 1 / fps
local tf = 0
local con = nil
con = game:GetService("RunService").RenderStepped:Connect(function(s)
	if not c then
		con:Disconnect()
		return
	end
	tf += s
	if tf >= fps then
		for i=1, floor(tf / fps) do
			event:Fire(c)
		end
		tf = 0
	end
end)
local event = event.Event

local function stopIfRemoved(instance)
    if not (instance and instance.Parent) then
        c = nil
        return
    end
    instance:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (instance and instance.Parent) then
            c = nil
        end
    end)
end
stopIfRemoved(c)
stopIfRemoved(hum)
for i, v in pairs({head, torso, leftArm, rightArm, leftLeg, rightLeg, humanoidRootPart}) do
    stopIfRemoved(v)
end
for i, v in pairs({neck, rootJoint, leftShoulder, rightShoulder, leftHip, rightHip}) do
    stopIfRemoved(v)
end
if not c then
    return
end
hum.WalkSpeed = 10
local cf, v3, euler, sin, sine, abs = CFrame.new, Vector3.new, CFrame.fromEulerAnglesXYZ, math.sin, 0, math.abs
while event:Wait() do
    sine += 1
    local vel = humanoidRootPart.Velocity
    if (vel*v3(1, 0, 1)).Magnitude > 2 then -- walk
		neck.C0 = neck.C0:Lerp(cf(0, 0, 0.5) * euler(0.17453292519943295, 0.03490658503988659 * sin((sine + 2.5) * 0.2), 3.141592653589793 + -0.17453292519943295 * sin((sine + -10) * 0.2)), 0.2) 
		rootJoint.C0 = rootJoint.C0:Lerp(cf(0, -1.5, 0) * euler(3.0543261909900767, 0.08726646259971647 * sin((sine + 7.5) * 0.2), -3.1590459461097367 + -0.08726646259971647 * sin(sine * 0.2)), 0.2) 
		leftShoulder.C0 = leftShoulder.C0:Lerp(cf(-1, 1.5 + 0.5 * sin((sine + 10) * 0.2), 0.3 + 0.2 * sin((sine + -10) * 0.2)) * euler(1.6580627893946132 + 0.17453292519943295 * sin((sine + 15) * 0.2), 0, -0.08726646259971647 * sin(sine * 0.2)), 0.2) 
		rightShoulder.C0 = rightShoulder.C0:Lerp(cf(1, 1.5 + 0.5 * sin((sine + -7.5) * 0.2), 0.3 + 0.2 * sin((sine + 5) * 0.2)) * euler(1.6580627893946132 + 0.17453292519943295 * sin(sine * 0.2), 0, -0.08726646259971647 * sin(sine * 0.2)), 0.2) 
		leftHip.C0 = leftHip.C0:Lerp(cf(-1, -1.5 + 0.5 * sin((sine + -7.5) * 0.2), 0.5 + 0.2 * sin((sine + 5) * 0.2)) * euler(1.6580627893946132 + 0.17453292519943295 * sin(sine * 0.2), 0, -0.08726646259971647 * sin(sine * 0.2)), 0.2) 
		rightHip.C0 = rightHip.C0:Lerp(cf(1, -1.5 + 0.5 * sin((sine + 10) * 0.2), 0.5 + 0.2 * sin((sine + -7.5) * 0.2)) * euler(1.6580627893946132 + -0.17453292519943295 * sin(sine * 0.2), 0, -0.08726646259971647 * sin(sine * 0.2)), 0.2) 
    elseif abs(vel.Y) > 2 then -- fall
		neck.C0 = neck.C0:Lerp(cf(0, 0, 0.5) * euler(0, 0, 3.141592653589793), 0.2) 
		rootJoint.C0 = rootJoint.C0:Lerp(cf(0, -1.4, 0) * euler(3.141592653589793, 0, -3.141592653589793), 0.2) 
		leftShoulder.C0 = leftShoulder.C0:Lerp(cf(-1, 1.5, 0.3) * euler(1.7453292519943295, 0, -0.17453292519943295), 0.2) 
		rightShoulder.C0 = rightShoulder.C0:Lerp(cf(1, 1.5, 0.3) * euler(1.7453292519943295, 0, 0.17453292519943295), 0.2) 
		leftHip.C0 = leftHip.C0:Lerp(cf(-1, -1.5, 0.8) * euler(1.3962634015954636, 0, -0.17453292519943295), 0.2) 
		rightHip.C0 = rightHip.C0:Lerp(cf(1, -1.5, 0.8) * euler(1.3962634015954636, 0, 0.17453292519943295), 0.2) 
    else -- idle
		neck.C0 = neck.C0:Lerp(cf(0, 0, 0.5) * euler(0.08726646259971647 * sin((sine + 20) * 0.05), 0, 3.141592653589793 + 0.3490658503988659 * sin((sine + -30) * 0.025)), 0.2) 
		rootJoint.C0 = rootJoint.C0:Lerp(cf(0, -1.5 + 0.1 * sin(sine * 0.05), 0) * euler(3.141592653589793, 0, -3.1590459461097367 + 0.05235987755982989 * sin(sine * 0.025)), 0.2) 
		leftShoulder.C0 = leftShoulder.C0:Lerp(cf(-1, 1.5, -0.1 * sin(sine * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
		rightShoulder.C0 = rightShoulder.C0:Lerp(cf(1, 1.5, -0.1 * sin(sine * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
		leftHip.C0 = leftHip.C0:Lerp(cf(-1, -1.5, 0.5 + -0.1 * sin((sine + 10) * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
		rightHip.C0 = rightHip.C0:Lerp(cf(1, -1.5, 0.5 + -0.1 * sin((sine + 10) * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
    end
end
end)

OtherSection:NewButton("Jerk off ", "Jerk off", function()
    local Me = game.Players.LocalPlayer
bin = Instance.new("HopperBin")
bin.Name = "Fap (Q and E)"
bin.Parent = Me.Backpack
 
local SIZE = 1
local DISTANCE = 1
local RAISE = 0.03
local INCLINE = 0.001
local ChaneOfEnjoyment = 10
local Auto = false
local AutoAmout = 1
 
local char = Me.Character
local Torsoz = char:findFirstChild("Torso")
local RA = char:findFirstChild("Right Arm")
local LA = char:findFirstChild("Left Arm")
local H = char:findFirstChild("Head")
local RS = Torsoz:findFirstChild("Right Shoulder")
local LS = Torsoz:findFirstChild("Left Shoulder")
local N = Torsoz:findFirstChild("Neck")
local Joint1
local Joint2
local Fap = 1
local FapCount = Instance.new("Part")
local FapCountM = Instance.new("Model")
local Points = 0
local Dks = {}
local InTenPoints = 0
local RaiseOrg = RAISE
local Tickup = false
 
Me:ClearCharacterAppearance()
wait(0.1)
Me.Character.Head.BrickColor = BrickColor.new("Cool yellow")
Me.Character.Torso.BrickColor = BrickColor.new("Cool yellow")
Me.Character["Right Arm"].BrickColor = BrickColor.new("Cool yellow")
Me.Character["Right Leg"].BrickColor = BrickColor.new("Cool yellow")
Me.Character["Left Leg"].BrickColor = BrickColor.new("Cool yellow")
Me.Character["Left Arm"].BrickColor = BrickColor.new("Cool yellow")
pcall(function() Me.Character.Torso.roblox:Destroy() end)
 
local P = Instance.new("Part")
P.Anchored = false
P.CanCollide = false
P.Name = "Part"
P.formFactor = "Custom"
P.Size = Vector3.new(0.5,0.5,0.5)
P.Locked = true
P.TopSurface = 0
P.BottomSurface = 0
 
local Model = Instance.new("Model", char)
Model.Name = "Troll"
 
local B1 = Instance.new("Part", Model)
B1.Name = "Di-ck"
B1.Size = Vector3.new(1,1,1)
B1.TopSurface = "Smooth"
B1.BottomSurface = "Smooth"
B1.Position = Vector3.new(0,10,0)
B1.BrickColor = BrickColor.new("Cool yellow")
B1.CanCollide = true
B1.Locked = true
local Mesh1 = Instance.new("SpecialMesh", B1)
Mesh1.MeshType = "Sphere"
Mesh1.Scale = Vector3.new(SIZE+0.3,SIZE+0.3,SIZE+0.3)
local Weld1 = Instance.new("Weld", B1)
Weld1.Part0 = Torsoz
Weld1.Part1 = B1
Weld1.C0 = CFrame.new(-0.2,-1,-0.6)
 
local B2 = Instance.new("Part", Model)
B2.Name = "Di-ck"
B2.Size = Vector3.new(1,1,1)
B2.TopSurface = "Smooth"
B2.BottomSurface = "Smooth"
B2.Position = Vector3.new(0,10,0)
B2.BrickColor = BrickColor.new("Cool yellow")
B2.CanCollide = true
B2.Locked = true
local Mesh2 = Instance.new("SpecialMesh", B2)
Mesh2.MeshType = "Sphere"
Mesh2.Scale = Vector3.new(SIZE+0.3,SIZE+0.3,SIZE+0.3)
local Weld2 = Instance.new("Weld", B2)
Weld2.Part0 = Torsoz
Weld2.Part1 = B2
Weld2.C0 = CFrame.new(0.2,-1,-0.6)
 
function FapPos()
        Joint1.C0 = CFrame.new(0.8,-0.1,-0.3) * CFrame.Angles(0.3,0,-math.pi/4.4)
        Joint2.C0 = CFrame.new(-0.8,-0.1,-0.3) * CFrame.Angles(0.3,0,math.pi/4.4)
end
function DoTheFap(Motherload)
        FapPos()
        Points = Points + 1
        local Dk = Instance.new("Part", Model)
        Dk.Name = "Di-ck"
        Dk.Size = Vector3.new(1,1,1)
        Dk.TopSurface = "Smooth"
        Dk.BottomSurface = "Smooth"
        Dk.Position = Vector3.new(0,10,0)
        Dk.BrickColor = BrickColor.new("Pink")
        Dk.CanCollide = true
        Dk.Locked = true
        local Mesh = Instance.new("SpecialMesh", Dk)
        Mesh.MeshType = "Sphere"
        Mesh.Scale = Vector3.new(SIZE,SIZE,SIZE)
        local Weld = Instance.new("Weld", Dk)
        Weld.Part0 = Torsoz
        Weld.Part1 = Dk
        Weld.C0 = CFrame.new(0,-0.9 * (((#Dks+1)*(RAISE * -1))+1),-0.7 * ((#Dks+1)*(DISTANCE)))
        if RAISE < 0.25 and TickUp == false then
                RAISE = RAISE + INCLINE
        else
                TickUp = true
                RAISE = (RAISE + INCLINE)-0.0005
        end
        table.insert(Dks, Dk)
        if math.random(1,ChaneOfEnjoyment) == 1 or Motherload == true then
                local Sound = Instance.new("Sound", H)
                Sound.Name = "Uhhhh yah"
                Sound.Volume = 5
                Sound.Pitch = math.random(85,105)/100
                Sound.SoundId = "rbxasset://sounds/uuhhh.wav"
                local Num = 1
                if Motherload == false then
                        Num = math.random(3,15)
                else
                        Num = math.random(15,70)
                end
                for i = 0,Num do
                        coroutine.wrap(function()
                                local Cm = Instance.new("Part", Model)
                                Cm.Name = "Cu-m"
                                Cm.Size = Vector3.new(1,1,1)
                                Cm.TopSurface = "Smooth"
                                Cm.BottomSurface = "Smooth"
                                Cm.Position = Dks[#Dks].Position + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
                                Cm.BrickColor = BrickColor.new("White")
                                Cm.Shape = "Ball"
                                Cm.Locked = true
                                local Mesh = Instance.new("SpecialMesh", Cm)
                                Mesh.MeshType = "Sphere"
                                Mesh.Scale = Vector3.new(0.45,0.45,0.45)
                                wait(math.random(10,60))
                                Cm:Destroy()
                        end)()
                end
                wait()
                Sound:Play()
                wait()
                Sound:remove()
                wait()
        end
end
 
function UnFap()
        Joint1.C0 = CFrame.new(0.8,-0.1,-0.5) * CFrame.Angles(0.7,0,-math.pi/4.4)
        Joint2.C0 = CFrame.new(-0.8,-0.1,-0.5) * CFrame.Angles(0.7,0,math.pi/4.4)
end
 
function onKeyDown(key, mouse)
        if key ~= nil then
                key:lower()
                if Auto == false then
                        if key == "e" then
                                if Fap == 1 then
                                        UnFap()
                                        Fap = 0
                                end
                        elseif key == "q" then
                                if Fap == 0 then
                                        Fap = 1
                                        if Points == 100 then
                                                DoTheFap(true)
                                        else
                                                DoTheFap(false)
                                        end
                                end
                        elseif key == "m" then
                                if Fap == 1 then
                                        UnFap()
                                        Fap = 0
                                end
                        elseif key == "n" then
                                if Fap == 0 then
                                        if #Dks > 1 then
                                                Fap = 1
                                                FapPos()
                                                Points = Points - 1
                                                for Num,Dk in pairs(Dks) do
                                                        if Num == #Dks then
                                                                table.remove(Dks, Num)
                                                                Dk:Destroy()
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
end
 
function Equip()
        local joint = Instance.new("Motor", Torsoz)
        joint.Part0 = Torsoz
        joint.Part1 = RA
        joint.C0 = CFrame.new(0.8,-0.1,-0.3) * CFrame.Angles(0.3,0,-math.pi/4.4)
        Joint1 = joint
        local joint = Instance.new("Motor", Torsoz)
        joint.Part0 = Torsoz
        joint.Part1 = LA
        joint.C0 = CFrame.new(-0.8,-0.1,-0.3) * CFrame.Angles(0.3,0,math.pi/4.4)
        Joint2 = joint
 
        local m = Instance.new("Model", char)
        m.Name = "Fap Points: "..Points
        FapCountM = m
        local p = P:Clone()
        p.Parent = m
        p.Name = "Head"
        p.Anchored = true
        p.CFrame = H.CFrame + Vector3.new(0,2,0)
        FapCount = p
        local h = Instance.new("Humanoid", m)
        h.MaxHealth = 0
        h.Name = "Durr"
end
 
function Unequip()
        for i, v in pairs(Torsoz:children()) do
                if v.className == "Motor" then
                        v:remove()
                end
        end
        RS.Parent = Torsoz
        RS.Part0 = Torsoz
        RS.Part1 = RA
        LS.Parent = Torsoz
        LS.Part0 = Torsoz
        LS.Part1 = LA
        for i, v in pairs(char:children()) do
                if v.className == "Model" and string.find(v.Name, "Fap") then
                        v:remove()
                end
        end
end
 
bin.Selected:connect(function(mouse)
        mouse.Icon = "rbxasset://textures\\GunCursor.png"
        mouse.Button1Down:connect(function() onButton1Down(mouse) end)
        mouse.KeyDown:connect(function(key) onKeyDown(key, mouse) end)
        Equip()
end)
 
bin.Deselected:connect(function()
        Unequip()
end)
 
if Auto == true then
        coroutine.wrap(function()
                Equip()
                wait(0.1)
                while true do
                        if Points == 100 then
                                DoTheFap(true)
                        else
                                DoTheFap(false)
                        end
                        wait()
                        UnFap()
                        wait()
                end
        end)()
end
 
if AutoAmout ~= 0 then
        coroutine.wrap(function()
                Equip()
                wait(0.1)
                for i = 1,AutoAmout do
                        if Points == 100 then
                                DoTheFap(true)
                        else
                                DoTheFap(false)
                        end
                        wait()
                        UnFap()
                        wait()
                end
        end)()
end
 
 
coroutine.wrap(function()
        while true do
                FapCount.CFrame = H.CFrame + Vector3.new(0,2,0)
                FapCountM.Name = "Fap Points: "..Points
                if #Dks ~= 0 then
                        for Num,Get in pairs(Dks) do
                                pcall(function()
                                        if Num == #Dks then
                                                Get.BrickColor = BrickColor.new("Pink")
                                        else
                                                Get.BrickColor = BrickColor.new("Cool yellow")
                                        end
                                end)
                        end
                end
                wait(0.03)
        end
end)()
end)

OtherSection:NewButton("Wobble pp", "Wobble pp", function()
    game["Run Service"].RenderStepped:connect(function()
        settings().Physics.AllowSleep = false
        setsimulationradius(math.huge*math.huge,math.huge*math.huge)
     end)
      
     print("Loaded Network Ownership Bypass!")
      
     --[[
     IronBrew:tm: obfuscation; Version 2.7.2
     ]]
     return(function(ajefa_IllIllll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lIIllIIIIIllIlIlllllII)local ajefa_IIIlIlIlIlIllIIllIIIIlII=string.char;local ajefa_IlIIllIIIl=string.sub;local ajefa_lllIlllllIIlI=table.concat;local ajefa_IIIlIllIlIllII=math.ldexp;local ajefa_lIlIllIlIlIlIIIlIllIllI=getfenv or function()return _ENV end;local ajefa_lllIIllIIIIIlllIlllllII=select;local ajefa_IlIIIlIIIIlIIlllI=unpack or table.unpack;local ajefa_lIIIllIlIIIIIllIlII=tonumber;local function ajefa_llIIllIIIIlI(ajefa_IllIllll)local ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lIlllIll,ajefa_IlIIIlIIIIlIIlllI="","",{}local ajefa_IIIlIllIllllIIllIlllIIll=256;local ajefa_lIIllIlIIlllII={}for ajefa_lllIIlIllIlIllllIIlIIlll=0,ajefa_IIIlIllIllllIIllIlllIIll-1 do ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_IIIlIlIlIlIllIIllIIIIlII(ajefa_lllIIlIllIlIllllIIlIIlll)end;local ajefa_lllIIlIllIlIllllIIlIIlll=1;local function ajefa_lIIIIIlIllIlllllllIIll()local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIIIllIlIIIIIllIlII(ajefa_IlIIllIIIl(ajefa_IllIllll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll),36)ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll+1;local ajefa_lIlllIll=ajefa_lIIIllIlIIIIIllIlII(ajefa_IlIIllIIIl(ajefa_IllIllll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll+ajefa_IlIIIlIllIlIlllIlIlIllll-1),36)ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll+ajefa_IlIIIlIllIlIlllIlIlIllll;return ajefa_lIlllIll end;ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IIIlIlIlIlIllIIllIIIIlII(ajefa_lIIIIIlIllIlllllllIIll())ajefa_IlIIIlIIIIlIIlllI[1]=ajefa_IlIIIlIllIlIlllIlIlIllll;while ajefa_lllIIlIllIlIllllIIlIIlll<#ajefa_IllIllll do local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIIIIlIllIlllllllIIll()if ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll]then ajefa_lIlllIll=ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll]else ajefa_lIlllIll=ajefa_IlIIIlIllIlIlllIlIlIllll..ajefa_IlIIllIIIl(ajefa_IlIIIlIllIlIlllIlIlIllll,1,1)end;ajefa_lIIllIlIIlllII[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IlIIIlIllIlIlllIlIlIllll..ajefa_IlIIllIIIl(ajefa_lIlllIll,1,1)ajefa_IlIIIlIIIIlIIlllI[#ajefa_IlIIIlIIIIlIIlllI+1],ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll,ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1 end;return table.concat(ajefa_IlIIIlIIIIlIIlllI)end;local ajefa_lIIIIIlIllIlllllllIIll=ajefa_llIIllIIIIlI('26523S27523T23L27523S26J26F26Y26F27127026926E26L23T23Y27926J26Y26L26H27027J27L27527O26Z27126D27J23W27927326H26927023V27927923C25323T28027526N26H27Y23T23Z27926026C26H26P26L26Y26Z23T23N27925G26F26J26H26C28K28M28O23T23K27925R26L27025H27E26Z26L28628723S24425K28H27M27E26E27R26Y29C29D23S23T23X27926W28328P27727925N26826H26Y26H26J29L28R29429629Y26926C26K27O26E29N28729G29N25D26Z25L29W27525L26J26J26L26Z26Z27C26P27K27925C26H26E26K26C27J24D27925Q27H26K2B528P2702A82AA25J26M25N28L2AR2A527526326W26L26J26928X25H2AQ2682AV2752BQ26Z26825D26K23T24F27926Y26I26O26H2AR29626926K24Y24N24N2572542CE25925825A2CF25A2C02C22C42C629A27G2CA2CC25825824W24X25625725625B2CH2CM27U2CO2C72CR2CB24N2582552CH25825B2DD2582592D323S2C32C52D62C92D825825424X2CV25A2DD25925729H27525O2AQ27027D2AU23M29X2AY25N26F26C26C2C926L23U29P23P2792AN2AP2AR2AT26726L2AA23T24029X27126Z27026F26D26026826P26Z26928W28Y27D2BL26Y27G2AQ23T24A28J2EX2EZ2F12602F328O2F628Q29N27I27323V1I1H2FO2FO21D28A28C23S25I28F27J29N2AX27029227925D26E2ES2AY2AP23T2E42AM2702702A226827Y29K28B2AW27Q2552DX23S2AX2AZ2B12GK29327526026F2EZ27G26F26E2GL2662BM2ET26Y2572AE27522W2FS2GI2702562GL2GN2B026L2HB29R27526427C2AS23V23I24G25W1722223H22W21J2H523S2342HU29O2HT2HM2HO2HQ2HS28A24C27925M28X26C26328V26B2A72GX2ES2A127H2G028S2GA2GC26J2GE26L29K2542BI23S25L2GB2GD2GF2702GK2EF27525G26926D28426Z25P26E26H26I2B126K23U23T23T24927925H26H26O25Q26Y2F02GW26E2HJ26Y26X27127J2F92HI2732692ES2J22J42702J62J82JA26L2BZ2G923S26526W2F425L26E26N2B12HV23K29G23R2792642JX2JZ26F27328O2KD2KF29B29D22026222023T2KK2JW2JY2702KA2KC2KE2KG29D1825V2KY2FT2FZ2DW28I2752HD2B12H429O23C2HY29D2642202H525K26G2LB2H92582HC2AY2HE2582FM2FP2FO2292532HV24S25K2M52LT2LG27Q2DH2LF2GM2LX2B12DH2LC27Q2CL2MD2LH26L2CL2MI27025B2LW2GO26L2MR2MP24W2MS2HE2MX2MP24X2MY2B12N22MD25F26L26P25O2KP2GY2MD27B26E27I2A32682ED23S24A25927923T27924O24P29D2ED23U25629P29O2432792NT2NK2762NW27524O2O22NO2AE2NJ29O2NO2ED2NO2JV2NO2FT2JV2ED2HH2872OB2NW2OE23S27T23S2O52NW2NO28I2NQ2OS23S29324O25523S2OC23S2782NZ2P12P62792H52JV2802K82JV29R23O2792PD23S2IK2O123S29R2J02PK27L2OP2OR2PP23S2OU2752PS2OY2NR2PS23Q2OQ25U2OO2Q32L02452Q32MD23S25J2PL27928I23W25B2792682OM2NM2E42PJ24O25K2PI23S2802482OO2EF2E42QH2NO28S2QE2QG2NW24O2Q22E42782JG24A2PE2PK27524Z23S2E42PF2ED23Y25S2RB23S24V2OW2QY2752RJ2OF2QF2752QV2OQ2NR2R323S24B2OQ25F2RH2E42I62JV2PF2B329D2RC2P62OR2E42E424E23S24U2752E424N2NW2C12RL23S2SG2RO27925P2R02RT2P32RV2RX2RZ23S2S12752S329O2S62ED2S82RH2SB2SD2RH2QF2NO2EP2SJ2T72QP2RP23S2SO2NO2OV2RU2RW24O28I2S92SV2PK2SY2S523S2RD2OQ2SE2T32SC2TU2TF23S2412TC2SN2SP2RH2782TJ2RY2TM2SW2TR23S2S42872T02TT2SU2T42TU2RR2422U12RQ2QI2RH2QL2862TM29R2JV2QK2NP2TU2U52UF2U82TO2UB2SZ2UA2T12TU2E42NY2792E42P22T22UX2542TU24423S2Q62TH2SR2TJ2RJ2TM2462UY2RH2V72TU2VA2UW2SS2JV28S2OR2UF28S28S2NR2S22UA2752JV2EF24Q2PG2752Q02OJ2JV2KK2WB29R2QR2OJ23S2522QO2QR2ED2QR2RH2472QO2UT23S24S2W82QO2PJ2V82UO23S2WN27824R2RH2VB2VU27528S2RW2W42SX2QO29D2VZ2UA2482642RH2X22QX2TD2RR23Y2F929R2Q62OL2SJ2XP2NK2NM29R2OG2EP27L2W729D29R2P22PH24T2UV2QB29R2W12PV2TW2X92PT2Q32O427528I2YG2UF2YH2OY2YF2YC2Q02OR2YH2RJ2YO2YC24G28729R28I2ED2JV27L24I2Y52PS2Y82YC2PF2YB29324J2WU2782Z528727L2782WM27529R24H2Q32YY23S2Y42YE2Q327L2Z328I2T52PK2932PQ2752932932PU2OX31002YK310123S2YN2ZW310024K2UF2ZX23S24L2ZC31002YX2YL2Z02ZN2YH2Z32932ZB2JV2782Z82YB2S629D2TL2P62WN27L2ZI28I2JV28I2ZM2YI2YC310K2YA2PK2782ZV2SR2782ZZ2782783102311C31042UF311F24M28728I2ZE2ZT23S310H310931002Z32782SG310Q23S2VD2YB28S2P029D29328S2ZF2YC2ZI2932JV29331112OR310A311S31152WR31182TM2ZZ2TM31022TM31052SU311J2792932V93116311O2Y5311F2Z32E42NV311Y311W2WU2PF31202872ZA310U31062ZI278310N2ZL312U2SR312W23S2572WU28S31182XD2ZZ2XD31022XD312M2XD2YQ2X62QO2YT27927831232WZ2752782582QB2X023S2NM28I25425D2SR25A23S2QF2542W727824W313Y311X27824X314B31302SR24Y23S2RA314I23S25023S251314M2782WJ2532PK2E4312A2V523S2Z328S313G2YB2PF31182PF2PF2ZZ315B31002OR315E312M315E3108315G2UA310C2WX2TS2WN2E4314127L315Q31443100311X2E4314A314C2TU314G2QR315X23S314K31602RH314O314Q2TU314T314V3164314Y2PK28S31522WV31542V02ZS2W52YD2UF2EF2EF2ZZ316Q315F275316T312M316T2QN2OR316T25L28728S2EF310F2UA311P315L2PF2Z32EF310M2W923S310P2PK2KK2ZB2792PF2KK312428S2ZI2PF2W2316I315E317B312E317E31182Q02Q02ZZ317Y316U311G31812OR3181316Z317E2Q03172317K311G31762EF3178316V23S2EF2Z32Q0317D23S2KK31332JV2QR317J318G2WL313Y2UA2ZI2EF316N316I316T318J317V318M316O2OR2KK2KK2ZZ319631823199312M3199312O318G317M2PK2Q0318F3183316K2WC2W32PK2QR25M2WU2JG31332792Q02JG31242EF2ZI2Q02JV2Q0316I31812Z32KK3157319O31942752QR2QR2ZZ31AB318231AE2YN2NR31AE316Z310831AE318A317E318T2WN2Q0314128S31AQ315V2EF311X2Q0315Z314M2Q0316231B03165314L31AX23S314O2PF31B6314T25N31B32WJ25O317H313B2ZN31992Z32QR316M2752JG31182JG2JG2ZZ31BQ318231BT312M31BT2SO2OR31BT25Q2872KK319W31A8319J31AE2Z32JG318L2F925R2WU2RW318R313Y2RW31242KK2ZI2QR318P31BH2UF31C72PK2JG31BM2O131182F92F92ZZ31CV318231CY312M31CY31BY2X92F931C127931CL2P62JV2JG319J31BT2Z32F9318L2RW318O2752I631CF2JG2I631242QR2ZI2R531BN31CN31BZ23S2JG31DE313F31CD31A92SS2RW2ZZ2RW2RW310231E4311G2OR31E731D331E123S31D631DS31CH318U2JG31412KK2WN2JG2NM31B931DS31AZ311X2JG31B231ER31B431672JG31B8314M2JG314T25C31EZ2WI23S31482JV2F9316I31CY2Z32RW31CS2I631182I62I62ZZ31FG318231FJ312M31FJ25E2UF31FJ2RY2W831DN2PK2RW319J31E72Z331DK2WU2B331CC2YB2SB31CF2RW2SB31242F92ZI2RW2JV2RW312A2NR31FX2NK2742I631CS2B331182B32B32ZZ31GN318231GQ312M31GQ31FO2OR31GQ31FR2752RW2B331762I6319J31FJ2Z32B3318L2SB31DI23S2C131CF2I62C131242RW2ZI2U92I6316I31H52PK2B331A72JV2SB31182SB2SB2ZZ31HT318231HW312M31HW31GV27531HW31GY2TN31G7318U2I631412F92WN2I62NM316331DJ23S31EQ31IF31ET31IF3166314M2I631EY311X2I631F131IM31F431F62752B3316I31GQ2Z32UH2YB2C131182C12C12ZZ31J4318231J7312M31J725G2UF31J725H2872B331HF2PK2SB319J31HW2Z331HC2WU2EP31G22PK2U031CF2SB2U031242B32ZI2SB31HQ31DT31I223S2SB31JN31922XX2Y52EP2EP2ZZ31KA318231KD312M31KD31JC2OR31KD31JF2792SB2EP31762C1319J31J72Z32EP318L2U031HA2UK31CF2C12UK31242SB2ZI2C12JV2C1316I31KS2PK2EP31HP2752U031182U02U02ZZ31LG318231LJ312M31LJ31KI31LD2TZ23S31KL2752C131JW318U2C131412B32WN2C12NM2RW311X2C131EQ31482C131ET2ED2C131IL31M431B72UA31MD31IR31MD2WJ31IU23S2EP316I31KD2Z32U031CS2UK31182UK2UK2ZZ31MU318231MX312M31MX25I2UF31MX2QA2792EP31L131JS312T2ZN31LJ2Z331KY2WU2NY31JR2JV2VF31CF2U02VF31242EP2ZI2U02JV2U0316I31NC2PK2UK31CS2NY31182NY2NY2ZZ31O0318231O3312M31O331N22OR31O331N531LP2NY31762UK319J31MX2Z32NY318L2VF31HA2Q631CF2UK2Q631242U02ZI2UK2JV31MS2Y531MX31MW23S2UK310231MZ31N331P02FU31P42UK2QA311X2UK2VF2QF31OV31K231P52UK31OI31DY2YB2VF31182VF2VF2ZZ31PN318231PQ312M31PQ31O827531PQ31OB31P531NM318U2UK31412EP2WN2UK2NM2SB31PA31IG31B52752UK31IJ31P531MC31QC31ME31EO31P531MH31QH31MJ2PK2NY316I31O32Z32VF31CS2Q631182Q62Q62ZZ31QX318231R0312M31R02602UF31R02612872NY31OQ2PK2VF319J31PQ2Z331ON2WU2VN31NH2752WP31CF2VF2WP31242NY2ZI2VF2NL29E31DT28S31RF2PK2Q631CS2VN31182VN2VN2ZZ31S4318231S7312M31S731R52OR31S731R82792VF2VN31762Q6319J31R02Z32VN318L2WP31HA2O531CF2VH313631RV2ZI2Q62JV2Q6316I31SM2PK2VN31LC23S2WP31182WP2WP2ZZ31T9318231TC312M31TC31SC31RL31T623S31SF2752Q631RP318U2Q631412NY2WN2Q62NM2U0311X2Q631IH2VG23S31QE2Q631QG31U031IO31TM314S2GM314M2Q631QN2JV2VN316I31S72Z32WP31CS2O531182O52O52ZZ31UM318231UP312M31UP2622UF31UP2632872VN2O531762WP319J31TC2Z331SS2WU2NR31RK23S2W731CF2WP2W731242VN2ZI2WP2JV2WP316I31V42PK2O531CS2PY2Y52NR2NR2ZZ31VS318231VV312M31VV31UU2OR31VV31UX2792WP2NR31762O5319J31UP2Z32NR318L2W731HA2X231CF2O52X231242WP2ZI2O52JV31UK2Y531UP31UO2TT310231UR31UV2TT31W02YE2O531UX311X2O531PC31VN31PF31WA2PK2NR31T52W731182W72W72OU26631VA31XH310231XD31E827531XK31WY31XH2W731W32YE31VE318U2O531412VN2WN2O52NM2VF31X231QA31672O531QE2O531MC31482O531IO31Y931U831F231472TT31QN2OV31W623S2XG2R1316K2NR27423Y2ZI2X22NO2NO27T31UU2752AE31YW2SR27931YZ2K823S31YZ2Q031Z12792JG31Z731IF312P316K31YS275314O2O22752O92I62762GR23S2CQ27G2KE28Q2MD2EW2EY2F028Q2K825L2E92KP2632B126L26W2OC2FT28E28G2K829527026328O2722F027J2K826227126E320C26Y320E2G72PN2622IP26K28O26327R2KB2K62GH2752672832G031ZS28L28N29V2PJ320A2BB2AB2IP2HV2892IS28U2FD32142912C12BU2JJ2J327X263321M28L2JO26226H26K2692ER2M02M12FR23T2WN23S321O26D271321Q2692GX321S321U321W29O2762FT26D27Q2BS29N26W2KP320Y23S26827126N26L2RA2W42NM31ZH31K32O22T12NR2872ED31YF31YX2QP2XT2792OJ24O314T310D2OH2YC322C2O02VX31ZC323E313Z29O2Y22YU2Y5323931ZI2RH323C2S729O2WW323N31762NO31CF2O92YB2862ZB28C2NO2NR2NO317F2QB27528024A31FE32462UF2PS27L3128323O310D2932V42ZO318H2YD29R2VN31YU2UL23S324O324Q2O52NO31YF29R2Q02KK324W313Y2JG23W2VD2NO2B32OD2NM2NO32362KK31YT2ZJ323231Z32O2286324J325C318X323N2JV2UF2O031GB3232325M2OR2862862U932482Y528028031ZK323N28031242NO2Q0323U324B2OR325C324E325E2OA23S325H2UF325J2PK3176325N2P62U9286325R3232325U322Z2P62862WN2NO318T2FT3233324431ZG2O329O31Z629P324423S2722OC2L031YK2KN27028U2KQ26Y2KS2L72AF2652LP2L82LA2KZ2KL327A2L42KR2L62KU29D25Y327J29D24S327V28724M2202JD2H52KW327Y2KL328523S2LR32872WS25K313324U2FT2U0325C2SJ328G2O629D24U324U2Q32XQ2TD27L2SM31LP3244325C32742542SL326D32332NN2P7314M2O73290325G279311X32942WH329427532982Q72OK3295329D28631ZM2NW2FT329D2ZD329F2OJ329H31003291329P2O2329N329132743291287326W32542SC329L2RK2TD32A12OW287328E2NW32A12E42SJ32A6328V32972SD32942WW2OL329C329632AJ328Z32AL2NW323Z329F29N329M324L329132A332AQ311G32AW3297329U329R2O2329T32AY32722NW32B5324P329J329X329F29D326Z32BC2O2');local ajefa_lllIIlIllIlIllllIIlIIlll=(bit or bit32);local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll and ajefa_lllIIlIllIlIllllIIlIIlll.bxor or function(ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lIlllIll)local ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lIIllIlIIlllII,ajefa_IlIIllIIIl=1,0,10 while ajefa_lllIIlIllIlIllllIIlIIlll>0 and ajefa_lIlllIll>0 do local ajefa_IlIIllIIIl,ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll%2,ajefa_lIlllIll%2 if ajefa_IlIIllIIIl~=ajefa_IIIlIllIllllIIllIlllIIll then ajefa_lIIllIlIIlllII=ajefa_lIIllIlIIlllII+ajefa_IlIIIlIllIlIlllIlIlIllll end ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll=(ajefa_lllIIlIllIlIllllIIlIIlll-ajefa_IlIIllIIIl)/2,(ajefa_lIlllIll-ajefa_IIIlIllIllllIIllIlllIIll)/2,ajefa_IlIIIlIllIlIlllIlIlIllll*2 end if ajefa_lllIIlIllIlIllllIIlIIlll<ajefa_lIlllIll then ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIlllIll end while ajefa_lllIIlIllIlIllllIIlIIlll>0 do local ajefa_lIlllIll=ajefa_lllIIlIllIlIllllIIlIIlll%2 if ajefa_lIlllIll>0 then ajefa_lIIllIlIIlllII=ajefa_lIIllIlIIlllII+ajefa_IlIIIlIllIlIlllIlIlIllll end ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_IlIIIlIllIlIlllIlIlIllll=(ajefa_lllIIlIllIlIllllIIlIIlll-ajefa_lIlllIll)/2,ajefa_IlIIIlIllIlIlllIlIlIllll*2 end return ajefa_lIIllIlIIlllII end local function ajefa_lIlllIll(ajefa_lIlllIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_IlIIIlIllIlIlllIlIlIllll)if ajefa_IlIIIlIllIlIlllIlIlIllll then local ajefa_lllIIlIllIlIllllIIlIIlll=(ajefa_lIlllIll/2^(ajefa_lllIIlIllIlIllllIIlIIlll-1))%2^((ajefa_IlIIIlIllIlIlllIlIlIllll-1)-(ajefa_lllIIlIllIlIllllIIlIIlll-1)+1);return ajefa_lllIIlIllIlIllllIIlIIlll-ajefa_lllIIlIllIlIllllIIlIIlll%1;else local ajefa_lllIIlIllIlIllllIIlIIlll=2^(ajefa_lllIIlIllIlIllllIIlIIlll-1);return(ajefa_lIlllIll%(ajefa_lllIIlIllIlIllllIIlIIlll+ajefa_lllIIlIllIlIllllIIlIIlll)>=ajefa_lllIIlIllIlIllllIIlIIlll)and 1 or 0;end;end;local ajefa_lllIIlIllIlIllllIIlIIlll=1;local function ajefa_IlIIIlIllIlIlllIlIlIllll()local ajefa_IlIIllIIIl,ajefa_IIIlIllIllllIIllIlllIIll,ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IllIllll(ajefa_lIIIIIlIllIlllllllIIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll+3);ajefa_IlIIllIIIl=ajefa_lIIllIlIIlllII(ajefa_IlIIllIIIl,136)ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIIllIlIIlllII(ajefa_IIIlIllIllllIIllIlllIIll,136)ajefa_lIlllIll=ajefa_lIIllIlIIlllII(ajefa_lIlllIll,136)ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIIllIlIIlllII(ajefa_IlIIIlIllIlIlllIlIlIllll,136)ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll+4;return(ajefa_IlIIIlIllIlIlllIlIlIllll*16777216)+(ajefa_lIlllIll*65536)+(ajefa_IIIlIllIllllIIllIlllIIll*256)+ajefa_IlIIllIIIl;end;local function ajefa_lIIIllIlIIIIIllIlII()local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIIllIlIIlllII(ajefa_IllIllll(ajefa_lIIIIIlIllIlllllllIIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll),136);ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll+1;return ajefa_IlIIIlIllIlIlllIlIlIllll;end;local function ajefa_IIIlIllIllllIIllIlllIIll()local ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lIlllIll=ajefa_IllIllll(ajefa_lIIIIIlIllIlllllllIIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll+2);ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIIllIlIIlllII(ajefa_IlIIIlIllIlIlllIlIlIllll,136)ajefa_lIlllIll=ajefa_lIIllIlIIlllII(ajefa_lIlllIll,136)ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll+2;return(ajefa_lIlllIll*256)+ajefa_IlIIIlIllIlIlllIlIlIllll;end;local function ajefa_llIIllIIIIlI()local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IlIIIlIllIlIlllIlIlIllll();local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll();local ajefa_IlIIllIIIl=1;local ajefa_lIIllIlIIlllII=(ajefa_lIlllIll(ajefa_IlIIIlIllIlIlllIlIlIllll,1,20)*(2^32))+ajefa_lllIIlIllIlIllllIIlIIlll;local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIlllIll(ajefa_IlIIIlIllIlIlllIlIlIllll,21,31);local ajefa_IlIIIlIllIlIlllIlIlIllll=((-1)^ajefa_lIlllIll(ajefa_IlIIIlIllIlIlllIlIlIllll,32));if(ajefa_lllIIlIllIlIllllIIlIIlll==0)then if(ajefa_lIIllIlIIlllII==0)then return ajefa_IlIIIlIllIlIlllIlIlIllll*0;else ajefa_lllIIlIllIlIllllIIlIIlll=1;ajefa_IlIIllIIIl=0;end;elseif(ajefa_lllIIlIllIlIllllIIlIIlll==2047)then return(ajefa_lIIllIlIIlllII==0)and(ajefa_IlIIIlIllIlIlllIlIlIllll*(1/0))or(ajefa_IlIIIlIllIlIlllIlIlIllll*(0/0));end;return ajefa_IIIlIllIlIllII(ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lllIIlIllIlIllllIIlIIlll-1023)*(ajefa_IlIIllIIIl+(ajefa_lIIllIlIIlllII/(2^52)));end;local ajefa_IIIlIllIlIllII=ajefa_IlIIIlIllIlIlllIlIlIllll;local function ajefa_IIIIllIIlllll(ajefa_IlIIIlIllIlIlllIlIlIllll)local ajefa_lIlllIll;if(not ajefa_IlIIIlIllIlIlllIlIlIllll)then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IIIlIllIlIllII();if(ajefa_IlIIIlIllIlIlllIlIlIllll==0)then return'';end;end;ajefa_lIlllIll=ajefa_IlIIllIIIl(ajefa_lIIIIIlIllIlllllllIIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll+ajefa_IlIIIlIllIlIlllIlIlIllll-1);ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll+ajefa_IlIIIlIllIlIlllIlIlIllll;local ajefa_IlIIIlIllIlIlllIlIlIllll={}for ajefa_lllIIlIllIlIllllIIlIIlll=1,#ajefa_lIlllIll do ajefa_IlIIIlIllIlIlllIlIlIllll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_IIIlIlIlIlIllIIllIIIIlII(ajefa_lIIllIlIIlllII(ajefa_IllIllll(ajefa_IlIIllIIIl(ajefa_lIlllIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lllIIlIllIlIllllIIlIIlll)),136))end return ajefa_lllIlllllIIlI(ajefa_IlIIIlIllIlIlllIlIlIllll);end;local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IlIIIlIllIlIlllIlIlIllll;local function ajefa_IIIlIllIlIllII(...)return{...},ajefa_lllIIllIIIIIlllIlllllII('#',...)end local function ajefa_IIIlIlIlIlIllIIllIIIIlII()local ajefa_lllIlllllIIlI={};local ajefa_lIIIIIlIllIlllllllIIll={};local ajefa_lllIIlIllIlIllllIIlIIlll={};local ajefa_IllIllll={[#{{712;856;40;192};"1 + 1 = 111";}]=ajefa_lIIIIIlIllIlllllllIIll,[#{"1 + 1 = 111";"1 + 1 = 111";{849;800;871;613};}]=nil,[#{{877;722;678;480};"1 + 1 = 111";{359;20;981;925};"1 + 1 = 111";}]=ajefa_lllIIlIllIlIllllIIlIIlll,[#{{339;364;315;982};}]=ajefa_lllIlllllIIlI,};local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IlIIIlIllIlIlllIlIlIllll()local ajefa_lIIllIlIIlllII={}for ajefa_lIlllIll=1,ajefa_lllIIlIllIlIllllIIlIIlll do local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIIIllIlIIIIIllIlII();local ajefa_lllIIlIllIlIllllIIlIIlll;if(ajefa_IlIIIlIllIlIlllIlIlIllll==2)then ajefa_lllIIlIllIlIllllIIlIIlll=(ajefa_lIIIllIlIIIIIllIlII()~=0);elseif(ajefa_IlIIIlIllIlIlllIlIlIllll==3)then ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_llIIllIIIIlI();elseif(ajefa_IlIIIlIllIlIlllIlIlIllll==1)then ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IIIIllIIlllll();end;ajefa_lIIllIlIIlllII[ajefa_lIlllIll]=ajefa_lllIIlIllIlIllllIIlIIlll;end;for ajefa_IllIllll=1,ajefa_IlIIIlIllIlIlllIlIlIllll()do local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIIllIlIIIIIllIlII();if(ajefa_lIlllIll(ajefa_lllIIlIllIlIllllIIlIIlll,1,1)==0)then local ajefa_IlIIllIIIl=ajefa_lIlllIll(ajefa_lllIIlIllIlIllllIIlIIlll,2,3);local ajefa_IlIIIlIIIIlIIlllI=ajefa_lIlllIll(ajefa_lllIIlIllIlIllllIIlIIlll,4,6);local ajefa_lllIIlIllIlIllllIIlIIlll={ajefa_IIIlIllIllllIIllIlllIIll(),ajefa_IIIlIllIllllIIllIlllIIll(),nil,nil};if(ajefa_IlIIllIIIl==0)then ajefa_lllIIlIllIlIllllIIlIIlll[#("yN5")]=ajefa_IIIlIllIllllIIllIlllIIll();ajefa_lllIIlIllIlIllllIIlIIlll[#("9I8k")]=ajefa_IIIlIllIllllIIllIlllIIll();elseif(ajefa_IlIIllIIIl==1)then ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]=ajefa_IlIIIlIllIlIlllIlIlIllll();elseif(ajefa_IlIIllIIIl==2)then ajefa_lllIIlIllIlIllllIIlIIlll[#("mgK")]=ajefa_IlIIIlIllIlIlllIlIlIllll()-(2^16)elseif(ajefa_IlIIllIIIl==3)then ajefa_lllIIlIllIlIllllIIlIIlll[#("aF7")]=ajefa_IlIIIlIllIlIlllIlIlIllll()-(2^16)ajefa_lllIIlIllIlIllllIIlIIlll[#("Vqbn")]=ajefa_IIIlIllIllllIIllIlllIIll();end;if(ajefa_lIlllIll(ajefa_IlIIIlIIIIlIIlllI,1,1)==1)then ajefa_lllIIlIllIlIllllIIlIIlll[#("q6")]=ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]end if(ajefa_lIlllIll(ajefa_IlIIIlIIIIlIIlllI,2,2)==1)then ajefa_lllIIlIllIlIllllIIlIIlll[#("NsI")]=ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll[#("r8a")]]end if(ajefa_lIlllIll(ajefa_IlIIIlIIIIlIIlllI,3,3)==1)then ajefa_lllIIlIllIlIllllIIlIIlll[#("gvLz")]=ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]]end ajefa_lllIlllllIIlI[ajefa_IllIllll]=ajefa_lllIIlIllIlIllllIIlIIlll;end end;for ajefa_lllIIlIllIlIllllIIlIIlll=1,ajefa_IlIIIlIllIlIlllIlIlIllll()do ajefa_lIIIIIlIllIlllllllIIll[ajefa_lllIIlIllIlIllllIIlIIlll-1]=ajefa_IIIlIlIlIlIllIIllIIIIlII();end;ajefa_IllIllll[3]=ajefa_lIIIllIlIIIIIllIlII();return ajefa_IllIllll;end;local function ajefa_lIIIllIlIIIIIllIlII(ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_IllIllll,ajefa_IlIIllIIIl)ajefa_lllIIlIllIlIllllIIlIIlll=(ajefa_lllIIlIllIlIllllIIlIIlll==true and ajefa_IIIlIlIlIlIllIIllIIIIlII())or ajefa_lllIIlIllIlIllllIIlIIlll;return(function(...)local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[1];local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[3];local ajefa_lllIlllllIIlI=ajefa_lllIIlIllIlIllllIIlIIlll[2];local ajefa_llIIllIIIIlI=ajefa_IIIlIllIlIllII local ajefa_IlIIIlIllIlIlllIlIlIllll=1;local ajefa_lIIIIIlIllIlllllllIIll=-1;local ajefa_lIlIllIlIlIlIIIlIllIllI={};local ajefa_IIIlIllIlIllII={...};local ajefa_lllIIllIIIIIlllIlllllII=ajefa_lllIIllIIIIIlllIlllllII('#',...)-1;local ajefa_IIIlIlIlIlIllIIllIIIIlII={};local ajefa_lIlllIll={};for ajefa_lllIIlIllIlIllllIIlIIlll=0,ajefa_lllIIllIIIIIlllIlllllII do if(ajefa_lllIIlIllIlIllllIIlIIlll>=ajefa_IIIlIllIllllIIllIlllIIll)then ajefa_lIlIllIlIlIlIIIlIllIllI[ajefa_lllIIlIllIlIllllIIlIIlll-ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IIIlIllIlIllII[ajefa_lllIIlIllIlIllllIIlIIlll+1];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_IIIlIllIlIllII[ajefa_lllIIlIllIlIllllIIlIIlll+#{{73;786;395;508};}];end;end;local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIllIIIIIlllIlllllII-ajefa_IIIlIllIllllIIllIlllIIll+1 local ajefa_lllIIlIllIlIllllIIlIIlll;local ajefa_IIIlIllIllllIIllIlllIIll;while true do ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("5")];if ajefa_IIIlIllIllllIIllIlllIIll<=#("uBSTJKkPag9Hp5FxCZS3Q1BcBL2PCpKWQIKxyjSvD7QW")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("vdEe9cbAdlDaPs7RFmVGm")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("Rui9rhxATk")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("2fIz")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("D")then if ajefa_IIIlIllIllllIIllIlllIIll==#("")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("e0")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("IhV")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ha")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("qcL")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("xM")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ir")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("4KY")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("IZR2")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{42;319;450;733};{221;677;268;159};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("aOr")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("olgY")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8q")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{308;677;93;803};"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Iy8n")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Tl")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("k5b")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("An9R")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("me")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("TpS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nf")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ITP")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qpdh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ji")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("NlE")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Dx")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("zZP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Gsb")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("lvbS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Gy")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QhO")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("nXyL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{670;454;543;526};"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bGn")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{877;241;483;177};{709;435;847;902};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("12")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LiJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("JknK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("e4")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fDO")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Sxxj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("yh")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{953;951;332;766};}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VH")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("5zm")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("64")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("j1M")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("nLU2")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("M0")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Umu")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("H7")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("4LM")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8Q")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("LTq")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Cv")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{786;834;756;973};{748;322;622;822};}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9D")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("N2u")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sWJ6")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1V")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("kO0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Hv")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("K0F")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("3kya")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mj")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("5Z0")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ok")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("4fh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{752;945;870;68};{907;511;639;151};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YRS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("V9yi")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2T")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1cA")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{291;962;92;738};{421;491;374;123};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("h3")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cRQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gcD7")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sB")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("MSl")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Y81d")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("U2")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HQ8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("McG2")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("dM")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("yz")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{{299;974;576;332};"1 + 1 = 111";{260;560;418;589};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("13")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3fh")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("yskH")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cA")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("QzQ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("aA")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("kZe")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("J2")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("opk")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("12")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("kyP")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("OJN")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{737;847;88;525};"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("P2")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("hbc")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("AOz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("S9of")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oX")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xPS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("g17i")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9i")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("JpC")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qsMS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Np")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bpg")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("5tuA")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("un")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("M01")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("SEFv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("d0")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("7x3")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("p7mU")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gg")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("PDh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1T")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("D4s")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("tZtI")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("R3")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("vaG")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("o9")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("AIV")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{621;582;878;587};{593;390;836;966};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Hou")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("YTV7")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gF")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5Ck")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Vfyq")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BX")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("D6L")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("fQCL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fa")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("j5T")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("eCWv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("j6")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{107;449;319;316};{11;36;510;868};{948;162;604;727};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("oF2z")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("bG")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("IzE")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ja")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("6X1")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jPmX")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{15;893;174;343};"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("C8dn")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eF")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{158;428;722;471};"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("lIx6")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("WH")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("c8W")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{25;360;710;969};"1 + 1 = 111";{959;332;416;132};}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DV")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sT1")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("JFMO")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("EQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("scF")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("2c82")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oo")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("rCV")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("s0vh")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DN")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Q2b")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("f2L9")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{238;218;151;866};{882;805;345;213};}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("UQ8")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{52;322;735;167};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LjO")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5Q")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("PHm")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uf")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("vaa")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uN")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4PL")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Ge0s")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wb")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("I7v")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{80;966;9;903};{234;142;454;834};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sBU")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("OdJF")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("TM")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZIz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("z9l7")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hP")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("pB8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("umpM")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("eW")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("9OL")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6Q")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("e82")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("PM")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZMe")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("UFoW")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("P1")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("B8Z")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("c1")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Fi")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("ueZ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("ki")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("Avc")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("i9M")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6qiT")]];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("hvS")then local ajefa_IllIllll;local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("S7")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bPX")]]+ajefa_lllIIlIllIlIllllIIlIIlll[#("XlQY")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("eCU")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("W7")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0g")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fKe")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("cYH0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{823;238;466;75};}];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vD0")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ctfK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gy")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Ty5")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("LP")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{{647;510;25;986};"1 + 1 = 111";{787;479;595;254};}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{543;270;225;247};}];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZBT")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hCqO")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("mD")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Bn")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5VN")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("tZou")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("K6")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ajp")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Nbpv")];else if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nQ")]]==ajefa_lllIIlIllIlIllllIIlIIlll[#("x5ZT")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("kJ6")];end;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("UP7V5q7")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("vj69V")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eo")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("DcS")];elseif ajefa_IIIlIllIllllIIllIlllIIll>#("cNDrxX")then local ajefa_IIIlIllIllllIIllIlllIIll;local ajefa_IlIIllIIIl;ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("A3")];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ajY")]];ajefa_lIlllIll[ajefa_IlIIllIIIl+1]=ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ntx0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("kZ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Gly")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("VH")]ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_lIlllIll[ajefa_IlIIllIIIl](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIllIIIl+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("dKf")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{398;714;8;840};"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("P2B")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("GPz5")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("pJ")]]~=ajefa_lllIIlIllIlIllllIIlIIlll[#("BAPh")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("SbN")];end;else if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bY")]]==ajefa_lllIIlIllIlIllllIIlIIlll[#("EaEk")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("6oQ")];end;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("As4UH7Zp")then local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("cG")]ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("neQ")]))elseif ajefa_IIIlIllIllllIIllIlllIIll>#("nWrAxSC8o")then if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ku")]]~=ajefa_lllIIlIllIlIllllIIlIIlll[#("87vG")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("CgJ")];end;else ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Do4")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4p")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("4LmoPDDOu82Z85O")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("vdayshoa6jSu")then if ajefa_IIIlIllIllllIIllIlllIIll==#("ulFd92Lndpq")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Gs")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("NWm")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("aJlG")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kb")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("y2W")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ql")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("eyh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xA")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("isg")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gFv8")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zB")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zyY")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("YfB2")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("WE")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DMT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Uu")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Fns")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("nxhb")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cl")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("arz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("xBPq")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("8c")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("7Va")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oo")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Y26")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5p")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("p80v")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mp")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("6yb")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0x")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("agy")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("KK")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("SP")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{{161;681;109;378};{514;511;128;706};"1 + 1 = 111";}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eN")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("KZA")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7E3M")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("9Su")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4k")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("skO")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("6eRQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("WD")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("CUt")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sL")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("F4F")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BC")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lj6")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("yKMh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nB")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3u9")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("IO5O")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RX")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("I93")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("OBjQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("S5")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{944;342;412;221};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Q0eu")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Bj")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0uZ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("0pef")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("au")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("cO0")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("D3")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("D2N")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{76;591;320;446};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Z8G")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jPCF")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Rb")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qg7")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("XZID")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{65;215;594;15};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("2G3")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{272;900;645;180};"1 + 1 = 111";{274;533;478;816};}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gH")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("TFZ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("GtmQ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zj")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qL2")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("g9vE")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("AF")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("pQy")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("iGGb")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ny")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("epe")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("b7uT")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("30")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("sgB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("TD")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{350;576;601;361};"1 + 1 = 111";{5;197;66;324};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("89On")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{50;586;634;743};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("EUW")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LZ")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZdV")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("JX")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BkG")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("0sLp")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hG")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YIJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Yd88")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ec")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("97B")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("1tbD")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zM")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Lve")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("jt8Z")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xb")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{410;462;953;82};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("rtG0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("e27")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sp")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("GpY")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("JV")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Zv0")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{270;90;807;820};"1 + 1 = 111";{976;240;621;773};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("v8")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("4dT")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eF")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("UIU")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("IKb")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("d0")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("208")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xr")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("QVF")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HP9H")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Yj")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("59p")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3E")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mfb")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Yyf3")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ex")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Tbc")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("aI")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("hoo")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ts")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mkq")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("eHIB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("l9")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Pyn")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("R614")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{418;901;777;322};{447;359;474;995};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0nI")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("PbZ4")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("29")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rR1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("HWVm")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3V")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{168;205;609;157};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gLaZ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Rs")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("YlQ")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Oo")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Gla")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0E")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HyM")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("kQ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("MBF")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Nr")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("EaU")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fe")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("VUR")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("2t")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("Ivp")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("h1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{979;356;444;332};{920;671;137;192};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{732;596;598;880};"1 + 1 = 111";{237;832;827;949};{194;447;481;445};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("tD")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("7sT")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("C5")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("EN8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("UWff")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Y9")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xS7")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("S0Ia")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gx")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("L4d")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("G0eP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lvK")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("cN37")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3D")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QTj")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("EHSy")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Eb")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{395;370;273;477};{468;672;365;816};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("xBQ3")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Vr")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("57u")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6W")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("L5Q")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("C60Q")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kb")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Rda")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5K")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("cpk")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ut")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{343;575;819;80};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("VQP1")]];else ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sz1")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wz")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{384;317;151;920};"1 + 1 = 111";{722;88;33;2};{660;121;813;678};"1 + 1 = 111";"1 + 1 = 111";{332;935;17;65};{270;996;380;513};}then if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6v")]]<ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("qdau")]])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("y6a")];end;elseif ajefa_IIIlIllIllllIIllIlllIIll==#{{866;987;443;800};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{134;25;345;560};"1 + 1 = 111";"1 + 1 = 111";{509;858;194;706};{448;989;578;132};"1 + 1 = 111";{136;646;445;240};{387;578;542;157};{354;526;253;111};}then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("JH")];local ajefa_IlIIllIIIl=ajefa_lIlllIll[ajefa_lIIllIlIIlllII]local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+2];if(ajefa_IIIlIllIllllIIllIlllIIll>0)then if(ajefa_IlIIllIIIl>ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("jQ7")];else ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end elseif(ajefa_IlIIllIIIl<ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("HYI")];else ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end else local ajefa_IllIllll;local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("IZ")];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xy1")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vq0B")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("O8")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("oVk")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("yN")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("uTY")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Igq")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("iuhn")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cF")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("sD1")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("on")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gGk")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ndRG")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ql")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("4Bj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("M5")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{847;957;262;414};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qjOY")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("RVQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ySz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{494;361;158;955};"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Mm")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("nUE")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Jz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("hKR")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("v7cS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("m6")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{996;721;195;96};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{512;738;7;56};{178;65;720;764};"1 + 1 = 111";}]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("AGy0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LX")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("mlV")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("MU")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("Ljb")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zR")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zKT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("fLp5")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Sr")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("B10")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("h5")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dst")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{193;318;158;686};"1 + 1 = 111";{140;349;506;941};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Qh")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("cGH")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wh")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("UgL")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("S8j1")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{387;891;422;468};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Tpq")]]*ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gzms")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("AD")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("DZl")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("v3rB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("6M6")];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#{"1 + 1 = 111";"1 + 1 = 111";{720;902;356;314};{848;22;955;122};"1 + 1 = 111";{509;284;853;789};"1 + 1 = 111";{274;510;416;145};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{397;287;261;375};{499;237;80;46};"1 + 1 = 111";"1 + 1 = 111";}then if ajefa_IIIlIllIllllIIllIlllIIll<=#("eobUUG6mFDeNZsS5")then ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{{622;441;9;828};"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mc")]];elseif ajefa_IIIlIllIllllIIllIlllIIll==#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{993;402;210;407};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{826;97;530;733};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{51;208;306;308};{796;987;79;184};{594;528;826;928};"1 + 1 = 111";{805;783;247;906};}then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5P")]]=#ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("14M")]];else local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("1a")];local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("krzT")];local ajefa_IlIIllIIIl=ajefa_lIIllIlIIlllII+2 local ajefa_lIIllIlIIlllII={ajefa_lIlllIll[ajefa_lIIllIlIIlllII](ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1],ajefa_lIlllIll[ajefa_IlIIllIIIl])};for ajefa_lllIIlIllIlIllllIIlIIlll=1,ajefa_IIIlIllIllllIIllIlllIIll do ajefa_lIlllIll[ajefa_IlIIllIIIl+ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll];end;local ajefa_lIIllIlIIlllII=ajefa_lIIllIlIIlllII[1]if ajefa_lIIllIlIIlllII then ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_lIIllIlIIlllII ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("23a")];else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;end;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("YfIenxXhFE4Gd0J5mtO")then local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("r4")]ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll](ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll+1])elseif ajefa_IIIlIllIllllIIllIlllIIll>#("4Zy8KgyKECncXu40FG9k")then local ajefa_IIIlIllIllllIIllIlllIIll;local ajefa_IlIIllIIIl;ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("k1")];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("S5X")]];ajefa_lIlllIll[ajefa_IlIIllIIIl+1]=ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RP1s")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("H3")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("OBc")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("AC")]ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_lIlllIll[ajefa_IlIIllIIIl](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIllIIIl+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("JNy")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cG")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sct")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("P4SU")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("kY")]]==ajefa_lllIIlIllIlIllllIIlIIlll[#("UxBP")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("POO")];end;else local ajefa_IllIllll;local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0B")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("vpO")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("ym")];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("o9E")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xYkV")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wm")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("FdG")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("0X")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("pM8")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Rp")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bFJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("btf2")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wy")]]==ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("msZs")]])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("JCF")];end;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("d3j0NvTdfYH5kd8RKEg9nNdp2TS6SBQt")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("L16oh7VPGyORhMq5j5c2lcA038")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("NWuPhnBJmcDCHvtRpzJUgCa")then if ajefa_IIIlIllIllllIIllIlllIIll>#("GOBrJCgujch2kTHEQde2RE")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("FL")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{777;759;285;149};"1 + 1 = 111";"1 + 1 = 111";}]]+ajefa_lllIIlIllIlIllllIIlIIlll[#("ZB3M")];else local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("pN")]ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]()end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("H1ukBuoXlVWjDWjaV6hrEnCG")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{32;526;429;538};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Ka2")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DU")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("pJr")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ob")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rgC")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ch08")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("q4")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("7m9")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fy")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("hI3")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lQ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eWJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("lQCx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rS")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fi2")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("9CNi")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Iq")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VJS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("vhNv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("MQ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("UPp")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("yK8D")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jK")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("krK")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("vfz0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("05")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("tGp")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("pi")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("c3J")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("D97")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{768;979;693;315};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{260;631;950;132};"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("oIT")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uF")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("BSi")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Fz")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("RyR")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Ke")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("zv4")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5k")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("6Fu")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("p8lD")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Zg")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("8nx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("y0")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("GOi")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("u2SO")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{333;110;840;809};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("KGB")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("XA")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Lr2")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("G0")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5Bd")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("VQQe")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Nd")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jD9")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("SXHs")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dF")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YIG")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Diyr")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7m")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9qA")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("grLq")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ph")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("PhC")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("FMj3")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("9J")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("04")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("J6I")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5A")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("76g")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("y5kj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{569;346;503;956};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("DTv")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8i")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("B1Q")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("XI")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("oBU")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{521;334;920;568};}]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("iBm")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("87")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("fDg")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("G1uL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{285;588;809;569};}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("009")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("c2")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jr3")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("QAut")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hS")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("5X8")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("WO")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("BAn")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("67")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("44I")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("G6GP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nL")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("C6X")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gL4I")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mD")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BtO")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{39;321;509;706};"1 + 1 = 111";"1 + 1 = 111";{479;556;667;876};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ve")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Uof")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("iGWe")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("0k")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("ZNq")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Qk")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("TMv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Tb")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8EK")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("WNxu")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ek")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("C2I")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{145;812;957;991};{879;533;736;197};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("m6z")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ic")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("4sb")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{{623;2;354;32};"1 + 1 = 111";}]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("dnt")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("30")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("NVC")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LYWx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kq")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("SDc")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("iV")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jLG")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("R6r3")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("R4")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("IyZ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sl")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("xxs")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oB")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("V55")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("IgFh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Lc")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("03K")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("XbMf")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2C")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("MxJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("oAMn")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Di")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rGG")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("jNpk")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("1d")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("b3S")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("r6")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZVI")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("26")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("AfN")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("2Klx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eg")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("EdH")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("UK")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("5Ve")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hX")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("0O0")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("pW")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("3Gl")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("04")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("cbb")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sYHs")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Dm")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{{27;627;243;365};"1 + 1 = 111";{330;743;211;874};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2b")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OtT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("g8Is")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Zg")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("xty")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Qq")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("pdc")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dA")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("02K")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("cbOl")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5A")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("CZx")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Varz")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xj")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("d3f")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("P1")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("KWK")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{635;105;539;1};{355;945;627;235};"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vV")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eMP")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("84h6")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Fn")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("gdc")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("aa")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("cet")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9FtR")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZY")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("pfJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("q2sA")]];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("1fddxh2bi3AnqP94p6gzJeRHd")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Sa")]]=(ajefa_lllIIlIllIlIllllIIlIIlll[#("DN6")]~=0);else local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("BFK")];local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIlllIll[ajefa_lIIllIlIIlllII]for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("i8eZ")]do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll..ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll];end;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5p")]]=ajefa_IlIIIlIllIlIlllIlIlIllll;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("6JlbtzYOKokUZN4ht2TWErhyorvh7")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("zHacls0gKazNfVUFhDFCUYYq0PB")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{{623;790;239;333};{224;886;2;712};}]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ke")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("tu")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ozA")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("2rXt")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DD")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("T9P")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("qY")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RG")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("ylB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Tt")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Z8E")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("VP")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("In")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("F0g")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nm")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("up1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gp5n")]];elseif ajefa_IIIlIllIllllIIllIlllIIll>#("XcdRRW0OUWCLrnsSx1mxNTj3MGdK")then local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("sC")]local ajefa_lIIllIlIIlllII,ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_llIIllIIIIlI(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll](ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll+1]))ajefa_lIIIIIlIllIlllllllIIll=ajefa_IlIIIlIllIlIlllIlIlIllll+ajefa_lllIIlIllIlIllllIIlIIlll-1 local ajefa_IlIIIlIllIlIlllIlIlIllll=0;for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lIIIIIlIllIlllllllIIll do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];end;else local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("t3")];local ajefa_lIIllIlIIlllII=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZA7")]];ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll+1]=ajefa_lIIllIlIIlllII;ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll]=ajefa_lIIllIlIIlllII[ajefa_lllIIlIllIlIllllIIlIIlll[#("B1qW")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("TmH2ctI7S5s5gVua4jGGf39Cekd2ke")then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("jW")];local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+2];local ajefa_IlIIllIIIl=ajefa_lIlllIll[ajefa_lIIllIlIIlllII]+ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lIIllIlIIlllII]=ajefa_IlIIllIIIl;if(ajefa_IIIlIllIllllIIllIlllIIll>0)then if(ajefa_IlIIllIIIl<=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("bMM")];ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end elseif(ajefa_IlIIllIIIl>=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Orx")];ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end elseif ajefa_IIIlIllIllllIIllIlllIIll>#("Sq4aK5To3UUP53CH7Z2SvHdNZneX1pQ")then if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rk")]]~=ajefa_lllIIlIllIlIllllIIlIIlll[#("i3SM")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("PTX")];end;else local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("aI")]ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll](ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll+1])end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("NUKPlVVfl5NWundJMNgcsxZlmrkx15yNe7cksX")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("meWHB4rsLjFknjNEp4zC4KyopH9Rxl3pZr4")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("G0zq58KmvUjECEWp3uCMQIq34K5Aqpv6o")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zI")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("A4C")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qRLK")]];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("8AGhH5al3GyFp3ANvF0rs8JFxudj6fznpX")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{319;31;154;27};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("mju")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("s3i2")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Qm")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("bmI")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("eMrA")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ga")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("DCA")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("RhY6")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cb")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("IDV")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("UJgy")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Vg")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("bfN")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("zLHJ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6k")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("J3i")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{933;871;555;746};{604;279;869;640};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("L0S")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("oqCD")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("JI")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("d0H")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("JB")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("XJU")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("aU")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fGJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("lRnH")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Sj")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eme")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ngcq")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LZ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1yf")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("YJ0h")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5N")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7Dp")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("afVh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9n")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rRS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("RKmk")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("zg")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("bW0")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0G")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("FWv")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("SxJr")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{359;163;207;500};{117;887;461;902};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("4al")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YjZ0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("GI")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Tfo")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("94rq")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fY")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("HYR")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("OG0i")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ug")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Z5Q")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("ZUzA")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wg")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("VHZ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("jFu1")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("qt")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Lmi")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("LEci")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jk")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("0BP")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("1HVJ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6a")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Pyt")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("W0")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1Cs")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("PUaP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ck")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("mgD")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9S")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("nTY")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ep")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9xE")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gYF1")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Um")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{452;924;775;330};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("kUeL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eG")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7Vb")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("87iS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{769;321;209;952};"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2fi")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sZ86")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("En")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("B61")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("G1is")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Mh")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("EzE")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1R")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("MYa")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YX")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("e7x")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gUqS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{405;234;573;388};{283;471;563;760};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("zOg")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1c")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("6Il")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cU")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{{584;319;527;938};"1 + 1 = 111";"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("0R")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("AL9")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("KG")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("8kB")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fTUq")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("re")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("2Q9")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("pp")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2gE")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("vaD3")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("br")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("NV3")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("MB")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("zks")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8Pv")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("1ABK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("UZj")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("3yda")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("N4")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dx7")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("0VeW")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2n")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{239;143;544;491};{357;518;618;23};{2;908;129;542};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("pPmC")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("yP")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ge8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ADvQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("hO")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("PGL")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("qb")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("e4y")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("PK")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DuS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("on2o")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("SJ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("sWi")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nY")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("YII")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fp")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{179;821;182;407};"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Ly")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("jDD")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xr")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("e9E")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("svfo")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("y7")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("lKJ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Oz")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dGX")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{421;418;63;454};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("k1")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("B6P")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("z3")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("PSS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fv")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{922;5;747;668};"1 + 1 = 111";{128;213;966;931};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("SRqL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ba")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("H5m")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{802;185;773;879};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("A0")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8fQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("QYab")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3z")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("CPi")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ydVi")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("cW")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("1yd")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2W")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("mQp")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZU")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VRM")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("PGYY")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("g2")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("mY0")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{507;46;517;109};{265;176;22;72};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Uz8")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("UH")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("4FX")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("8Z")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("xVE")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Xa")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("0lz")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("EQZV")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lk")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ym1")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("d7")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("P90")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Yg36")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("SE")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{580;195;36;689};"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("FL")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("tOK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3r")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("po1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("TmUL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{252;367;42;204};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Kqob")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("r8")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LXv")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Eud7")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uA")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mrD")]][ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cPAI")]]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("vUVYHMFOVGAubaO31g7v91aVl10oXhjpCyd3")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xP")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sZU")]]*ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("m2CW")]];elseif ajefa_IIIlIllIllllIIllIlllIIll>#("QsQXuY96abjsmIgsCGFTaMPVp0Nvk3O6VskXq")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("b5")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{117;492;7;563};"1 + 1 = 111";{83;73;602;770};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("OZlf")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lo")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("J5K")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("r86")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("K4e3")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4V")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ltS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5z")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("uvg")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("ksja")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("GG")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OFQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("J1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Oz1")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("zqXr")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("MP")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sOH")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VF")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("4Km")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("iN2i")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{463;841;180;572};}]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("CgE")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("yQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("0Ad")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("jQvf")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hQ")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0Np")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7s")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("K1o")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("1U8a")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0Y")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Sxv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Dz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("35g")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("UfjM")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vx")]]=(ajefa_lllIIlIllIlIllllIIlIIlll[#("dVZ")]~=0);ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BCY")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eY")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("KY")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hbj")]]*ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kqkz")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("PcaZlZQ6LJd792JjKeO4HEkNWgynH3ytb30CSlAZe")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("pdsn3WyLSfjxbl2yceCDzRlT5gbgBzOYZnnguJn")then local ajefa_IlIIIlIIIIlIIlllI;local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dA")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2vH")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("TGAx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("uB")];ajefa_IlIIIlIIIIlIIlllI=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Bcb")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IlIIIlIIIIlIIlllI;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IlIIIlIIIIlIIlllI[ajefa_lllIIlIllIlIllllIIlIIlll[#("6ekB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("TN")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1G")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{742;542;708;511};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("b7cL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{574;224;530;187};}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("ALW")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oTW")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("3I87")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dS")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("atR")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Cz")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("YPW")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Dx")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Rad")];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("06krjP2PKuiuyM4J1JrWUqktCvHX8VcD1ZNDG4Jq")then local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#{{908;248;597;213};{678;191;12;610};}]ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]()else local ajefa_lIIIIIlIllIlllllllIIll=ajefa_lllIlllllIIlI[ajefa_lllIIlIllIlIllllIIlIIlll[#("Zhc")]];local ajefa_IlIIIlIIIIlIIlllI;local ajefa_IIIlIllIllllIIllIlllIIll={};ajefa_IlIIIlIIIIlIIlllI=ajefa_lIIllIIIIIllIlIlllllII({},{__index=function(ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lllIIlIllIlIllllIIlIIlll)local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll];return ajefa_lllIIlIllIlIllllIIlIIlll[1][ajefa_lllIIlIllIlIllllIIlIIlll[2]];end,__newindex=function(ajefa_lIlllIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_IlIIIlIllIlIlllIlIlIllll)local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll]ajefa_lllIIlIllIlIllllIIlIIlll[1][ajefa_lllIIlIllIlIllllIIlIIlll[2]]=ajefa_IlIIIlIllIlIlllIlIlIllll;end;});for ajefa_IlIIllIIIl=1,ajefa_lllIIlIllIlIllllIIlIIlll[#("BujH")]do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if ajefa_lllIIlIllIlIllllIIlIIlll[#("S")]==82 then ajefa_IIIlIllIllllIIllIlllIIll[ajefa_IlIIllIIIl-1]={ajefa_lIlllIll,ajefa_lllIIlIllIlIllllIIlIIlll[#("4fb")]};else ajefa_IIIlIllIllllIIllIlllIIll[ajefa_IlIIllIIIl-1]={ajefa_IllIllll,ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]};end;ajefa_IIIlIlIlIlIllIIllIIIIlII[#ajefa_IIIlIlIlIlIllIIllIIIIlII+1]=ajefa_IIIlIllIllllIIllIlllIIll;end;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Fe")]]=ajefa_lIIIllIlIIIIIllIlII(ajefa_lIIIIIlIllIlllllllIIll,ajefa_IlIIIlIIIIlIIlllI,ajefa_IlIIllIIIl);end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("vHfpsAntOoVrC1JV1ZYheRZsQEI8Bd79aHzUfdj5tE")then local ajefa_IIIlIllIllllIIllIlllIIll;local ajefa_IlIIllIIIl;ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("sN")];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Pqx")]];ajefa_lIlllIll[ajefa_IlIIllIIIl+1]=ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("thkv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mg")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("pOm")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("XL")]ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_lIlllIll[ajefa_IlIIllIIIl](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIllIIIl+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("OCN")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("T1")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{143;905;634;733};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("2DEQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1p")]]==ajefa_lllIIlIllIlIllllIIlIIlll[#("Nq8O")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("lRU")];end;elseif ajefa_IIIlIllIllllIIllIlllIIll>#("Gqlz8dSOfVikPRXKY1o2KrVq4DZQXQ3YKxsbEfK5Tz1")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QG")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HzS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("WKII")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("UA")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("R5M")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("92")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sLK")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("XcIx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("lvT")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{831;894;911;818};"1 + 1 = 111";"1 + 1 = 111";{625;46;738;252};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wa")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sys")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{567;698;659;429};{944;912;795;494};}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("n9")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{985;225;495;371};"1 + 1 = 111";{848;864;439;748};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Y3ZQ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BH")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Eb9")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("JDvZ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uB")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("3I4")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("MKt7")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("10")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("NZs")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("1XLe")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("JpR")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("qJYr")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("JM")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("bsq")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Xl")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{918;451;141;223};"1 + 1 = 111";{3;18;583;125};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("KpWP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VV")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("2Pk")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("as")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("yQL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1b")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{458;769;879;403};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qxcG")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4a")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5ub")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("2V28")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("kG")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RUK")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("tQTV")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0A")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cE8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("C7pW")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("tu")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{346;128;355;93};{842;852;707;751};{112;634;258;686};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("MVZt")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{232;70;789;658};}]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("oPG")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("TL")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Db")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ygB")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("pfH5")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("j8")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("oqJ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zC")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Ocz")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fB")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("qGx")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("kE")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("0DD")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("V6")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Rhg")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("tQRB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6n")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("OfY")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QT")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{260;869;34;96};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("oIYW")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zD")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("5Xv")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mp")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("tMh")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eq")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4Tz")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{997;711;374;365};{744;86;464;914};"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ky")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kvo")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("K0d1")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lV")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("szm")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("MaaF")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{910;612;865;840};{815;134;839;281};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("baH")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("GISP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{180;186;26;611};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9bt")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Wn69")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Fi")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("CHB")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QT")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{150;5;526;667};{586;659;900;942};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("UX")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jWX")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("N9rA")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7X")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("uRE")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("CU")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("TDZ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8m")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("1gT")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("va")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("vSA")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("FL")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("pgK")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3jDT")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("s8s")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Xj")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sse")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{482;121;155;112};"1 + 1 = 111";"1 + 1 = 111";{97;60;438;736};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ic")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("KVI")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("n4")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("L8z")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9G")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("GJH")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("AcPN")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6t")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("mbs")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("tQlP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uM")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YbU")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("QZj1")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RT")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("H0n")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("18NM")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{589;993;480;386};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{374;879;801;948};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("LINP")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("1r")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("zgP")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Z9")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ylS")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DHrB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Uq")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{955;66;329;456};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{925;822;623;341};{94;480;923;994};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("U6")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sgz")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("UJsN")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("6Z")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Kde")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("7XML")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("so")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Q7J")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("eaLD")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("l8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Jmf")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("SGbu")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("PA")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("IEt")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("1zao")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Pk")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{553;362;174;499};{237;983;600;707};{333;591;690;787};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("WyVK")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("FS")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("3gi")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("kq")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{421;368;229;174};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("VhVv")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2q")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("nxJ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oy")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("BGE")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wp")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BPQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sQ9v")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("yl")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Hz1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("X5bj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0y")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("g8I")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("C5Zo")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0y")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{558;775;105;436};{536;29;368;461};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("13xS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ju")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("l9X")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("uJdS")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("2m")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("4d7")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dj")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("j8c")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Jp")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OPs")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Kccj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("rJ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{{988;519;304;110};"1 + 1 = 111";"1 + 1 = 111";}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("re")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("vE1")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ae")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("p74")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("6A")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("OTR")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Bq")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("cro")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7op6")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sZ")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Tan")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lO")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Rmr")]][ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bGQN")]]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("2xUcsEudfMTnG4FGoc1z1uKryVfTrtilBGzHSXxtvZT8NfGJKdQRICxHWCOHyLWVDIX")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("G7XCPHdcLLOspGjnNCN8i1Vpi05Ud7GfsGdNqobazu5lYur1CIia4Y0")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("mHsZLt9OfJaTDG7zANKY5JCXJerFZFkEQyAT5mzeurfouIy5L")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("KrocTNfFqHcFZKyHdegnDnnFDNEmDaQv3e53oNOXOA61c0")then if ajefa_IIIlIllIllllIIllIlllIIll==#("F1YEtZxqxdTJgj2cp1QLUPFrAAtKcqxDMk8vPHxGHYJZF")then do return end;else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xb")]]=ajefa_lIIIllIlIIIIIllIlII(ajefa_lllIlllllIIlI[ajefa_lllIIlIllIlIllllIIlIIlll[#("vPH")]],nil,ajefa_IlIIllIIIl);end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#{"1 + 1 = 111";"1 + 1 = 111";{336;242;195;500};"1 + 1 = 111";{248;588;471;447};{403;614;563;835};"1 + 1 = 111";"1 + 1 = 111";{16;222;388;552};{471;40;238;193};"1 + 1 = 111";"1 + 1 = 111";{813;709;495;834};{416;250;509;207};"1 + 1 = 111";{298;349;366;554};"1 + 1 = 111";{314;339;520;213};{950;212;601;829};"1 + 1 = 111";{603;713;987;746};{377;535;840;766};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{660;550;3;889};"1 + 1 = 111";"1 + 1 = 111";{186;881;291;43};{528;204;705;331};{436;306;439;63};{287;257;959;157};{980;591;228;220};"1 + 1 = 111";{435;697;508;421};{81;405;92;370};{519;740;128;571};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{622;176;386;796};"1 + 1 = 111";"1 + 1 = 111";}then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("G9")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("PHd")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("6x05")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{616;878;57;518};"1 + 1 = 111";}]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("e74")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fm")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("hro")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("0JGm")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Sf")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jMZ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("rIk")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("2UdR")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("o0")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("B1s")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("On")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{956;102;520;230};"1 + 1 = 111";{545;844;502;739};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("UNr1")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gC")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ltj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("NU")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("BEQ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("U32A")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cy")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("P9B")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("n5")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("mQ3u")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VV")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Vpn")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{692;292;174;613};"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("umTZ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("N0")]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Fk9")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("TT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("odT")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("8Shp")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("NM")]]=(ajefa_lllIIlIllIlIllllIIlIIlll[#("qUG")]~=0);ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("iOH")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("C7")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("5SV")];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("9TJDiogNDoa8GllWTQTSb08KFujLDcGnqbkuxNHIoomKOM05")then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("aT")];local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+2];local ajefa_IlIIllIIIl=ajefa_lIlllIll[ajefa_lIIllIlIIlllII]+ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lIIllIlIIlllII]=ajefa_IlIIllIIIl;if(ajefa_IIIlIllIllllIIllIlllIIll>0)then if(ajefa_IlIIllIIIl<=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("gf7")];ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end elseif(ajefa_IlIIllIIIl>=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("I1o")];ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end else local ajefa_IlIIIlIIIIlIIlllI;local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("9A")];ajefa_IlIIIlIIIIlIIlllI=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("dLW")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IlIIIlIIIIlIIlllI;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IlIIIlIIIIlIIlllI[ajefa_lllIIlIllIlIllllIIlIIlll[#("aGZJ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("io")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3d")]]=(ajefa_lllIIlIllIlIllllIIlIIlll[#("cvf")]~=0);ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("zE")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("E22")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("d5")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("pNY")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("bEr")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("pU")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ab")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("TIj")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ty")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("f8R")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ua")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nfo")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("mlJV")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fK")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZaU")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("zoZF")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("QztAUCjV97XeGkBSWREb1zgjkDXOy53FoBWNmYGKaKxPTDTeW114")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("3srskorOFxder0eyXG8l4arbBASTT2He8juhFubJn5FmsLCMPQ")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Xn")]]=ajefa_lIIIllIlIIIIIllIlII(ajefa_lllIlllllIIlI[ajefa_lllIIlIllIlIllllIIlIIlll[#("7kW")]],nil,ajefa_IlIIllIIIl);elseif ajefa_IIIlIllIllllIIllIlllIIll==#("v3SB2bp2VHI5N09fiF63DEz78FeS08fec3kkqSCfoDqcQa1xtFs")then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("UW")];local ajefa_IlIIllIIIl=ajefa_lIlllIll[ajefa_lIIllIlIIlllII]local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lIIllIlIIlllII+2];if(ajefa_IIIlIllIllllIIllIlllIIll>0)then if(ajefa_IlIIllIIIl>ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Irl")];else ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end elseif(ajefa_IlIIllIIIl<ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#{{511;147;567;140};"1 + 1 = 111";{731;233;331;312};}];else ajefa_lIlllIll[ajefa_lIIllIlIIlllII+3]=ajefa_IlIIllIIIl;end else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Hv")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("qt3")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("dFAJ")];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("SWG1EVDy7HcXBE2UPYZAd0O9nvr8NRzuP8xpxsRFpeiRBDMlhhRFP")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DT")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{150;331;134;591};{297;456;337;826};}]];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("d1iGOhDEUpiRhCgMxxhtk8S6JUUf0Ga4PW4Gh1PJcVu2JTvjfGUuxv")then if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("yu")]]<ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("kQl1")]])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Bip")];end;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{23;935;574;50};{77;559;887;578};}];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("fil63xxNopncvILEGRJrzOZyZzLauVPItdZx64WlPhgNvR9LEboNYdsCtYgEW")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("rDKQSrSoIL5xMqHmbiA9HtGbUpVychXsAsZNcP8S3oDOSBCb4hW8eWZ87I")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("DHulBYN7tB4jvjRgr12ssYTD5vYnOD1QFTGlIdcZfEiLa7AZxPIgeoNP")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OFW")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Pbo9")]];elseif ajefa_IIIlIllIllllIIllIlllIIll>#("1pe9zt0KnPNNGIoZcnZQiD859185VLpf1yRX70RkraWsXl0hsrbbY9Pyr")then do return end;else local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Bm")]local ajefa_lIIllIlIIlllII,ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_llIIllIIIIlI(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll](ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll+1]))ajefa_lIIIIIlIllIlllllllIIll=ajefa_IlIIIlIllIlIlllIlIlIllll+ajefa_lllIIlIllIlIllllIIlIIlll-1 local ajefa_IlIIIlIllIlIlllIlIlIllll=0;for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_lIIIIIlIllIlllllllIIll do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];end;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("aHu5YNAHWi1C1mGPyhRPiXb1MDJnr2SsFX0jZxmi3pARp1BZGjLIRNbmGEs")then local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("fK")]ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll]=ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("2iQ")]))elseif ajefa_IIIlIllIllllIIllIlllIIll>#("dlo3BI6dxvZb5JW2ytLVcUSirjM2WNOud0eSaHpS5xCjtJNi0iYm3IttDgMq")then if not ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Bp")]]then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("SFK")];end;else local ajefa_lIIIllIlIIIIIllIlII;local ajefa_lIIIIIlIllIlllllllIIll;local ajefa_IllIllll;local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{{727;114;813;742};"1 + 1 = 111";}];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vhY")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bFbn")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sY")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("5ni")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("zL")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("mkX")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7t")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("boo")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ndsJ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("DS")];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4Ri")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bghl")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Z7")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kv")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("pYz")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{281;496;636;377};}];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("xXL")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gyoR")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("BO")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Ocv")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("nS")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Fs")];ajefa_IllIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("tti")]];ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1]=ajefa_IllIllll;ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DsJa")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("sT")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Oj")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Iil")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("t8")]]=#ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Sen")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8e")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("305")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("H8")];ajefa_lIIIIIlIllIlllllllIIll=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]ajefa_lIIIllIlIIIIIllIlII=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+2];if(ajefa_lIIIllIlIIIIIllIlII>0)then if(ajefa_lIIIIIlIllIlllllllIIll>ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{467;845;921;829};"1 + 1 = 111";}];else ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+3]=ajefa_lIIIIIlIllIlllllllIIll;end elseif(ajefa_lIIIIIlIllIlllllllIIll<ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+1])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("SEI")];else ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll+3]=ajefa_lIIIIIlIllIlllllllIIll;end end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("drTSF7eEe11d3ZQrJYSHEbNYBBGHVo349W1fSBZMIOWr7iaSOb4s4UCbO5qdBISZ")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("6eh7KKh9f9Zov1sBY3TtLapt0CXjVka57tbe3UdCWsYUMWrd8NNP9Fv6YXhiW8")then local ajefa_IIIlIllIllllIIllIlllIIll;local ajefa_IllIllll;local ajefa_lIIIIIlIllIlllllllIIll;ajefa_lIIIIIlIllIlllllllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Xq")]ajefa_lIlllIll[ajefa_lIIIIIlIllIlllllllIIll]=ajefa_lIlllIll[ajefa_lIIIIIlIllIlllllllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_lIIIIIlIllIlllllllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("N9p")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("A1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ZTl")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uu8t")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9u")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("f5F")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Y2")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("ISs")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IllIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("M6N")];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_IllIllll]for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IllIllll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("l6JJ")]do ajefa_IIIlIllIllllIIllIlllIIll=ajefa_IIIlIllIllllIIllIlllIIll..ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll];end;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fl")]]=ajefa_IIIlIllIllllIIllIlllIIll;ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("NC")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("K7p")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3nLy")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("guT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("9m1y")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Ck")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("vML")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vp")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("WbY")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IllIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("3aN")];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_IllIllll]for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IllIllll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("dI93")]do ajefa_IIIlIllIllllIIllIlllIIll=ajefa_IIIlIllIllllIIllIlllIIll..ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll];end;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sG")]]=ajefa_IIIlIllIllllIIllIlllIIll;elseif ajefa_IIIlIllIllllIIllIlllIIll>#("583rc0oHdZrIsmFRdjTliIv6C7fpfM4QYe3WSEpnUfKZS7dTtge9cXfyN70eU8B")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("l3")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3TI")]]+ajefa_lllIIlIllIlIllllIIlIIlll[#("qWHu")];else local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("2A")]ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll]=ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("uvD")]))end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("5MUntT8J4FCc7GoE3v59I5Nb8FiVOkDVOi4fnZALhFeHudAgSxlzdC298SpYKm5Uc")then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("zf5")];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("zZMiqd5u2d0fQ5fbdq9eSmp4hFKMa4KuFPPKFJghESKZi2ctSJjOV88lJSbVEtu7EG")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ae")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("1pI")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mt")]]=(ajefa_lllIIlIllIlIllllIIlIIlll[#("UCe")]~=0);end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("aqFHEk1K9NAVoCp3CV5KHQDaXIuNkxNvNrbdmbQE3y8Jj6WsnA3lI5duXFU5ZoAMadi7BmRBfCRjS4")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("0WczUEBXRnRpSqUOP7vJfXZ2bTCggo4N3N3jXZQiJpBUT68jvXclvuWd6kybbuRDsevexK1Z")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("n9ZxeieUsVtmSqI10mNBOgoJ7BPK4WV6m4iv6R2bsrTKxqKXXnHxnzNhVpzODFZG9xaYi")then if ajefa_IIIlIllIllllIIllIlllIIll>#("4juLivxPmR01WRpzSYqaLRrnIYCmL9qWPLsxbNprUfdRXMSiqKPmHhMn1gcu3jemBeml")then if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("q0")]]==ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("S5bU")]])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("9xh")];end;else local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Vn")]ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll](ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll+1])end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("2xfI9pFNLB6ft6aueoH8eG4K5yLb1pSzHUymJOH2hLqQgoKnd1xZQmuxDFMMPDWuSIIKIX")then local ajefa_lIIIIIlIllIlllllllIIll=ajefa_lllIlllllIIlI[ajefa_lllIIlIllIlIllllIIlIIlll[#("tPY")]];local ajefa_IlIIIlIIIIlIIlllI;local ajefa_IIIlIllIllllIIllIlllIIll={};ajefa_IlIIIlIIIIlIIlllI=ajefa_lIIllIIIIIllIlIlllllII({},{__index=function(ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lllIIlIllIlIllllIIlIIlll)local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll];return ajefa_lllIIlIllIlIllllIIlIIlll[1][ajefa_lllIIlIllIlIllllIIlIIlll[2]];end,__newindex=function(ajefa_lIlllIll,ajefa_lllIIlIllIlIllllIIlIIlll,ajefa_IlIIIlIllIlIlllIlIlIllll)local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll]ajefa_lllIIlIllIlIllllIIlIIlll[1][ajefa_lllIIlIllIlIllllIIlIIlll[2]]=ajefa_IlIIIlIllIlIlllIlIlIllll;end;});for ajefa_IlIIllIIIl=1,ajefa_lllIIlIllIlIllllIIlIIlll[#("3f8v")]do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if ajefa_lllIIlIllIlIllllIIlIIlll[#("c")]==82 then ajefa_IIIlIllIllllIIllIlllIIll[ajefa_IlIIllIIIl-1]={ajefa_lIlllIll,ajefa_lllIIlIllIlIllllIIlIIlll[#("4Vn")]};else ajefa_IIIlIllIllllIIllIlllIIll[ajefa_IlIIllIIIl-1]={ajefa_IllIllll,ajefa_lllIIlIllIlIllllIIlIIlll[#("sOz")]};end;ajefa_IIIlIlIlIlIllIIllIIIIlII[#ajefa_IIIlIlIlIlIllIIllIIIIlII+1]=ajefa_IIIlIllIllllIIllIlllIIll;end;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0u")]]=ajefa_lIIIllIlIIIIIllIlII(ajefa_lIIIIIlIllIlllllllIIll,ajefa_IlIIIlIIIIlIIlllI,ajefa_IlIIllIIIl);elseif ajefa_IIIlIllIllllIIllIlllIIll==#("ARO1DpoEQXx7a33StAbUeb5mOZ57JR9Pqf7hbv1hob6YrFVCZZokHcRyWCmOtq59XSR45VR")then local ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("o4")];local ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("eIJe")];local ajefa_lIIllIlIIlllII=ajefa_IlIIllIIIl+2 local ajefa_IlIIllIIIl={ajefa_lIlllIll[ajefa_IlIIllIIIl](ajefa_lIlllIll[ajefa_IlIIllIIIl+1],ajefa_lIlllIll[ajefa_lIIllIlIIlllII])};for ajefa_lllIIlIllIlIllllIIlIIlll=1,ajefa_IIIlIllIllllIIllIlllIIll do ajefa_lIlllIll[ajefa_lIIllIlIIlllII+ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll];end;local ajefa_IlIIllIIIl=ajefa_IlIIllIIIl[1]if ajefa_IlIIllIIIl then ajefa_lIlllIll[ajefa_lIIllIlIIlllII]=ajefa_IlIIllIIIl ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("zrC")];else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;end;else local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Gu")]local ajefa_IlIIllIIIl={ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll+1,ajefa_lIIIIIlIllIlllllllIIll))};local ajefa_lIIllIlIIlllII=0;for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_IlIIIlIllIlIlllIlIlIllll,ajefa_lllIIlIllIlIllllIIlIIlll[#{{605;418;586;960};{28;959;277;269};{264;81;718;170};{796;247;555;953};}]do ajefa_lIIllIlIIlllII=ajefa_lIIllIlIIlllII+1;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_IlIIllIIIl[ajefa_lIIllIlIIlllII];end end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("I4Gcfh5idEiTCZhoyKvKjnX7f6aKY0GdhqMMGOrOGdKZhlH8KDHvAgYugI7igvtm8fMlnGSTrRd")then if ajefa_IIIlIllIllllIIllIlllIIll<=#{"1 + 1 = 111";{325;69;98;626};{538;750;583;527};{443;650;776;532};"1 + 1 = 111";{577;124;607;955};{59;846;232;949};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{166;81;594;467};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{174;793;744;731};{676;754;474;911};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{643;370;145;46};"1 + 1 = 111";{609;743;656;61};{394;531;89;806};"1 + 1 = 111";"1 + 1 = 111";{189;141;798;603};{526;584;250;706};{360;631;956;726};{940;909;249;154};{895;550;434;401};{535;555;644;257};{796;964;475;59};{99;744;959;68};{843;381;683;144};"1 + 1 = 111";{942;908;956;269};{881;926;683;293};{385;712;695;533};{26;724;23;110};"1 + 1 = 111";{546;311;502;982};{217;796;438;520};{954;821;987;247};"1 + 1 = 111";"1 + 1 = 111";{397;836;957;129};{654;182;641;842};{889;524;945;274};{146;517;182;696};{855;650;58;123};"1 + 1 = 111";"1 + 1 = 111";{951;830;884;280};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{20;189;255;783};"1 + 1 = 111";{31;365;650;194};"1 + 1 = 111";{973;571;961;946};"1 + 1 = 111";"1 + 1 = 111";{258;719;319;942};{673;239;105;535};{260;970;122;121};{628;740;614;358};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{392;774;214;67};{689;313;842;238};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("1fz")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("qCkW")];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("ZVEbL9MZeaW6JkvDa3SPXBxyUGN9xNExRQdLVgnvBC0LUhxWygxv6VPyzgrevMDCHzp2hUR4Qx")then local ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lllIIlIllIlIllllIIlIIlll[#("HQ")]ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll](ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll+1])else local ajefa_IIIlIllIllllIIllIlllIIll;local ajefa_IlIIllIIIl;ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("bN")];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QZ8")]];ajefa_lIlllIll[ajefa_IlIIllIIIl+1]=ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_IIIlIllIllllIIllIlllIIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Xuek")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("En")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("DiX")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#("CM")]ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_lIlllIll[ajefa_IlIIllIIIl](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIllIIIl+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("6i8")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Lb")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("LeO")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("zAnZ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kl")]]==ajefa_lllIIlIllIlIllllIIlIIlll[#("7l1L")])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("H5T")];end;end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("vLVOMj0MpphA6bQmPZi9Y9ydu2EPNACQKHtWNDP5F9mlA9s1CIbfIxzvnRsUPl9ZXC0zR3JljmFY")then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("1tE")];local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIlllIll[ajefa_lIIllIlIIlllII]for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII+1,ajefa_lllIIlIllIlIllllIIlIIlll[#{{758;762;392;255};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll..ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll];end;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HL")]]=ajefa_IlIIIlIllIlIlllIlIlIllll;elseif ajefa_IIIlIllIllllIIllIlllIIll==#("lOvJNnfyxhmi8J5j5psayz8i4kI805u2KKbd7kc84CBtNqTuOco7lYzXQmPDPhIBXuIzH2mUmug57")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("0Rq")]];else local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("c6")]ajefa_lIlllIll[ajefa_IlIIIlIllIlIlllIlIlIllll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIIlIllIlIlllIlIlIllll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("asN")]))end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("GOBntXQyQWknxUGKsX39GrTuXV0FU0SD0bRbbCXUUAPWnsFCnNctb7in4gAJ7lNZdRyvdFJ19ipgN7gEqyqh")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("zB22Dg4boXJWZSG5jyTdkt3ScK796sJ4GbPpGDKzOZVvRtYoKJgaIdNfIk02i5f6nOqYcpzQXtAvIHbSW")then if ajefa_IIIlIllIllllIIllIlllIIll<=#("zxlJxDyKSvNRpTUZiccamujBmnNrHbihgAGTUPrYADIddfeRLTz8PWGemUviZgcQmFLZnbeEVoKTWfy")then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("2x")]local ajefa_IlIIllIIIl={ajefa_lIlllIll[ajefa_lIIllIlIIlllII](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_lIIllIlIIlllII+1,ajefa_lIIIIIlIllIlllllllIIll))};local ajefa_IlIIIlIllIlIlllIlIlIllll=0;for ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII,ajefa_lllIIlIllIlIllllIIlIIlll[#("G95Z")]do ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll]=ajefa_IlIIllIIIl[ajefa_IlIIIlIllIlIlllIlIlIllll];end elseif ajefa_IIIlIllIllllIIllIlllIIll>#("j6QXNkCu4BGasi8tA21IFoEKP5nBlXsgxo82Apdcdp5WGekMpqs4oZM5DgiS6bjghzNdkf4kZZFosReK")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=#ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("81X")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{847;948;771;529};{503;308;943;517};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Rrd")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("E4UQ")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("Lk4Ez2INdAsgufbgYOgBhCkxifAuxMWbI8u1oNTGfAgQLeETDhFc7iMjaIvtDmpCOqIxUk1l5KvRvEVdLQ")then ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Kp")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7WP")]];elseif ajefa_IIIlIllIllllIIllIlllIIll==#("ohUezvl1RrAd2kOctGg8rqsgyX5YGWrSWvau4mibJtk4GHDHRCBHFRJ8YNRMAyu49RqHjthhyfA8fzL0tzg")then if(ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sq")]]==ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("qUot")]])then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("P2o")];end;else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{741;796;160;716};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("NWn")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("IbYB")]];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#{"1 + 1 = 111";{529;713;125;180};"1 + 1 = 111";{511;454;853;239};{392;54;521;908};{273;575;492;784};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{51;363;737;315};"1 + 1 = 111";{973;49;632;910};{153;787;405;430};"1 + 1 = 111";{389;58;633;833};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{618;332;869;520};"1 + 1 = 111";{471;550;204;236};{608;348;499;299};"1 + 1 = 111";{799;45;547;998};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{375;318;204;935};"1 + 1 = 111";{587;95;928;29};{711;195;990;378};"1 + 1 = 111";{410;685;963;692};"1 + 1 = 111";"1 + 1 = 111";{765;261;563;744};{314;474;986;804};"1 + 1 = 111";{176;566;620;83};"1 + 1 = 111";"1 + 1 = 111";{885;877;302;614};{941;39;280;770};{99;761;145;140};{75;724;450;79};"1 + 1 = 111";{20;440;793;567};{109;765;723;27};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{82;267;800;912};"1 + 1 = 111";"1 + 1 = 111";{748;157;36;781};{41;540;21;798};{593;220;523;499};"1 + 1 = 111";"1 + 1 = 111";{29;744;37;66};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{896;705;885;5};"1 + 1 = 111";{572;144;798;455};{231;179;437;830};"1 + 1 = 111";{459;378;479;845};{860;22;519;79};"1 + 1 = 111";"1 + 1 = 111";{450;415;345;390};{947;961;887;540};}then if ajefa_IIIlIllIllllIIllIlllIIll<=#("JIOPzK9PM5N3tsg0AHlXhors3TKcn8AsLvhjaRPLp62XObTr8d0TTlBtpvVQa6BNFus8l7ZT1LIkxEO19rejh")then local ajefa_IIIlIllIllllIIllIlllIIll;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("oO")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("vUz")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("65")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("uVQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Vq")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1uB")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("PtTQ")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("K6")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("FeI")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{156;919;227;903};{888;349;674;654};"1 + 1 = 111";{345;419;64;743};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("O8")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ri8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("d7VM")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("9M")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("27Q")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("XAo4")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Qf")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("EPIx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("vW")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("C6Z")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("na")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("eSI")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("go")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("CAj")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("n7IM")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bJ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Mr4")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{873;684;830;394};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("ubO")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("g5")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("uFc")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("5L")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("X9d")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Io")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("dsR")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3zd0")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("A5")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{775;810;684;850};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("It")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("FmJ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("lpoU")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ju")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Gts")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("t2")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("8cN")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5T")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("cdV")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("JP85")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("nO")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Q7N")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("t9MA")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4vB")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("iW4a")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("il")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#{{618;509;617;662};{986;317;844;951};"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("x2")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("TjT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("UyNt")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("zU")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("69i")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DY")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("C0e")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("O35h")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("YY")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HkFu")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("vDx")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("ZRM7")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("O1")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{233;609;11;442};"1 + 1 = 111";}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("ouhB")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Wi")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("fxb")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("gFdU")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Cl")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("WDj")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("z3Q1")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("HS")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("kki")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("lbPc")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3z")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("tUO")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("BdEQ")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Vq")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#{{497;569;439;309};"1 + 1 = 111";"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fl")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("3MV")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("7rJi")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("8V")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("0QT")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Y0")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("WjK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{27;55;543;91};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZEX")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("sjzU")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ZK")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("88v")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("zpl8")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("RS0")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("iZkN")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ix")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{656;350;901;699};{816;54;306;135};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("OEOF")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{410;868;474;856};}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Zte")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("XbJm")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("F2")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("2Ev")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mst")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("2c")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("T8K")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("k0CX")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uJ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{617;399;366;821};}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("DQ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("6ee")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{730;683;232;665};}]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("rli")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("0h")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("WUQ")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{599;324;735;775};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("ogv")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Z64F")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("1W")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("ePX")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7N")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("ht7")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("oE6m")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QZ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("Pop")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("VD")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("hZB")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Jp")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QMQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("6ZQr")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("PB")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("piN")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("L20x")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vkR")]][ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{293;873;600;923};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{79;229;113;964};"1 + 1 = 111";}]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mj2")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("rKmx")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("MG")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Mh6")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("JYzL")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("VB")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("QOR")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Lm")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("gzr")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4Q")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{593;946;686;533};"1 + 1 = 111";{264;448;679;780};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("m5QC")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("G5")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("tgD")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("NP")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("BLn")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gS")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("bh9")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("me")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("Ngd")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bl")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("xNg")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";{812;263;10;867};}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("b4")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("2G3")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("hi")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{662;253;171;857};{360;226;735;870};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("7vrK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("eu")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("0KU")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("F5")]]=ajefa_IlIIllIIIl[ajefa_lllIIlIllIlIllllIIlIIlll[#("gTI")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Dj")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Qpl")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("s9fW")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("SP")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{680;614;901;21};{695;664;234;679};{382;44;967;108};}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("l2Bc")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Di")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("PU8")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("OrJT")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OT")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("uWQ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("iBeu")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("qL")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("sde")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Qlzr")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IIIlIllIllllIIllIlllIIll=ajefa_lllIIlIllIlIllllIIlIIlll[#("Lz")]ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll]=ajefa_lIlllIll[ajefa_IIIlIllIllllIIllIlllIIll](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IIIlIllIllllIIllIlllIIll+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("mBS")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QT")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("5xf")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("4l9T")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("gK")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("yd0")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("5sMK")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7X")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("IIZ")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("JSMR")];elseif ajefa_IIIlIllIllllIIllIlllIIll>#("Kz4X3P58LsGostTVfboh1iOq6WR4RS2rGXU3ezdkX39oPilthnld5aZCVN0h7ar2BnTFK0RR7du8izMYKxWDGY")then ajefa_IllIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Cef")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QC")]];else local ajefa_IlIIllIIIl;ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("si")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("Nux")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("tEOI")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vO")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("fPG")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("29Sm")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7E")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{958;424;574;776};"1 + 1 = 111";"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("Hq6k")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("iJ")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";{919;29;202;404};"1 + 1 = 111";}]][ajefa_lllIIlIllIlIllllIIlIIlll[#("gLX5")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_IlIIllIIIl=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";}]ajefa_lIlllIll[ajefa_IlIIllIIIl]=ajefa_lIlllIll[ajefa_IlIIllIIIl](ajefa_IlIIIlIIIIlIIlllI(ajefa_lIlllIll,ajefa_IlIIllIIIl+1,ajefa_lllIIlIllIlIllllIIlIIlll[#("HZf")]))ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("x0")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("4Ck")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#{{45;517;813;749};{570;317;180;901};{601;693;940;987};"1 + 1 = 111";}]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("lE")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("3eC")]]=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("vP8J")]];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("QZ")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("7J0")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("AYyL")];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("jv")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("8mk")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#{"1 + 1 = 111";"1 + 1 = 111";{218;435;207;494};{496;803;936;743};}];ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;ajefa_lllIIlIllIlIllllIIlIIlll=ajefa_lIIllIlIIlllII[ajefa_IlIIIlIllIlIlllIlIlIllll];ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("7V")]][ajefa_lllIIlIllIlIllllIIlIIlll[#("dIq")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("5EWi")];end;elseif ajefa_IIIlIllIllllIIllIlllIIll<=#("G7siBJ6nWLgYBAQUrHFg1Q1tvbbHKoZxM2nHqSqia0IybKkz4MF5aSE0g9WzHANIVUmJmjEKqxfbhErW0NN8T4v4")then if not ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("bX")]]then ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;else ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lllIIlIllIlIllllIIlIIlll[#("0cH")];end;elseif ajefa_IIIlIllIllllIIllIlllIIll>#("yAr61MLm9MryMlUi5PONCSNRaI3WPY1yrkZTlOAVEYh1ayoB2ZYpSq5PXK5sTYIlV3fBxb7qp3iOKWRMtC4Z9MQap")then local ajefa_lIIllIlIIlllII=ajefa_lllIIlIllIlIllllIIlIIlll[#("4u")];local ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("AXp")]];ajefa_lIlllIll[ajefa_lIIllIlIIlllII+1]=ajefa_IlIIIlIllIlIlllIlIlIllll;ajefa_lIlllIll[ajefa_lIIllIlIIlllII]=ajefa_IlIIIlIllIlIlllIlIlIllll[ajefa_lllIIlIllIlIllllIIlIIlll[#("OvCE")]];else ajefa_lIlllIll[ajefa_lllIIlIllIlIllllIIlIIlll[#("f5")]]=ajefa_lllIIlIllIlIllllIIlIIlll[#("oJK")];end;ajefa_IlIIIlIllIlIlllIlIlIllll=ajefa_IlIIIlIllIlIlllIlIlIllll+1;end;end);end;return ajefa_lIIIllIlIIIIIllIlII(true,{},ajefa_lIlIllIlIlIlIIIlIllIllI())();end)(string.byte,table.insert,setmetatable);
end)

OtherSection:NewButton("Ink Monster", "Ink Monster", function()
    loadstring(game:HttpGet(('https://pastefy.ga/mv6EOsOX/raw'),true))()
end)

OtherSection:NewButton("Spider", "Spider", function()
    setsimulationradius(math.huge, math.huge)

local mouse = game.Players.LocalPlayer:GetMouse()

game.Players.LocalPlayer.Character.Archivable = true
game.Players.LocalPlayer.Character.Animate.Disabled = true
local clonec =  game.Players.LocalPlayer.Character:Clone()
clonec.Parent = workspace
clonec.Name = "POOCLONE"
clonec.Humanoid.HipHeight = -1.2 -- change this to look taller.
game.Players.LocalPlayer.Character = clonec
clonec.Animate.Disabled = false

workspace.Camera.CameraSubject = clonec.Humanoid
game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
game.Players.LocalPlayer.Character.Animate.Disabled = true
---game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy()

spawn(function()


while true do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
clonec.Humanoid.Jump = game.Players.LocalPlayer.Character.Humanoid.Jump

local veco = workspace.Camera.CFrame:VectorToObjectSpace(game.Players.LocalPlayer.Character.Humanoid.MoveDirection)
clonec.Humanoid:Move(veco, true)

end
wait()
end

end)

for i,v in pairs(clonec:GetDescendants())do 
    
    if v:IsA("Part") then 
    v.Transparency = 1
    end 
end 





local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["HumanoidRootPart"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 0, 0)
game:GetService("RunService").Stepped:connect(function()
    
    game.Players.LocalPlayer.Character.Torso.CanCollide = false 
    game.Players.LocalPlayer.Character.Head.CanCollide = false 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false 
       game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true  
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (clonec.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90),0,0)) * CFrame.new(0,-0,-1)
           game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
 game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
 
end)




local segments = Instance.new("Folder")
local part = Instance.new("Part")
local part_2 = Instance.new("Part")

segments.Name = "segments"
segments.Parent = workspace
part.Anchored = true
part.CanCollide = false
part.Transparency = 1
part.Size = Vector3.new(1, 1, 2)
part.BottomSurface = Enum.SurfaceType.Smooth
part.BrickColor = BrickColor.new("Alder")
part.TopSurface = Enum.SurfaceType.Smooth
part.Color = Color3.new(0.666667, 0.333333, 1)
part.Parent = segments
part.Name = "seg1"
part.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Anchored = true
part_2.CanCollide = false
part_2.Size = Vector3.new(1, 1, 2)
part_2.BottomSurface = Enum.SurfaceType.Smooth
part_2.BrickColor = BrickColor.new("Cool yellow")
part_2.TopSurface = Enum.SurfaceType.Smooth
part_2.Color = Color3.new(0.992157, 0.917647, 0.552941)
part_2.Parent = segments
part_2.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Name = "seg2"
part_2.Transparency = 1

local segments2 = Instance.new("Folder")
local part = Instance.new("Part")
local part_2 = Instance.new("Part")

segments2.Name = "segments2"
segments2.Parent = workspace
part.Anchored = true
part.CanCollide = false
part.Size = Vector3.new(1, 1, 2)
part.BottomSurface = Enum.SurfaceType.Smooth
part.BrickColor = BrickColor.new("Alder")
part.TopSurface = Enum.SurfaceType.Smooth
part.Name = "seg1"
part.Color = Color3.new(0.666667, 0.333333, 1)
part.Parent = segments2
part.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Anchored = true
part_2.CanCollide = false
part_2.Size = Vector3.new(1, 1, 2)
part_2.BottomSurface = Enum.SurfaceType.Smooth
part_2.BrickColor = BrickColor.new("Alder")
part_2.TopSurface = Enum.SurfaceType.Smooth
part_2.Color = Color3.new(0.666667, 0.333333, 1)
part_2.Parent = segments2
part_2.CFrame = CFrame.new(-4.1, 2.1, -37.5)
part_2.Name = "seg2"
part_2.Transparency = 1
part.Transparency = 1



local leg1 = Instance.new("Part")
leg1.Anchored = true
leg1.Size = Vector3.new(0.5, 0.2, 0.5)
leg1.BottomSurface = Enum.SurfaceType.Smooth
leg1.Color = Color3.new(0, 1, 0)
leg1.BrickColor = BrickColor.new("New Yeller")
leg1.TopSurface = Enum.SurfaceType.Smooth
leg1.Name = "leg1"
leg1.Parent = workspace
leg1.CFrame = CFrame.new(-31.15, 0.1, 8.65)
leg1.CanCollide = false
leg1.Transparency = 1





local leg1 =workspace.leg1:Clone()
leg1.Parent = workspace

local leg2= workspace.leg1:Clone()
leg2.Parent = workspace

local lp = game.Players.LocalPlayer
local head = game.Players.LocalPlayer.Character.Head

function coffset(x,y,z)
	return (head.CFrame * CFrame.new(x,y,z)).Position
end




mouse.KeyDown:connect(function(k)
	
	if k == "z" then
		
		leg1.Position = mouse.Hit.Position
	elseif k == "x" then
		
		
		leg2.Position = mouse.Hit.Position
	end
	
end)

	

		
spawn(function()
--
while true do
	
	
if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude >0.1 then
		wait(1.6/lp.Character.Humanoid.WalkSpeed)
		
	local ray1 =Ray.new(coffset(3,-0,0),Vector3.new(0,-10,0) )
	local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray1,{leg1,leg2,lp.Character})
	if pos then
		leg1.Position = pos
		end
		

	
		wait(1.6/lp.Character.Humanoid.WalkSpeed)
	local ray2 =Ray.new(coffset(-3,-0,0),Vector3.new(0,-10,0) )
	local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray2,{leg1,leg2,lp.Character})
	if pos then
	leg2.Position = pos	
		end
	
	end
	game:GetService("RunService").RenderStepped:wait()
end

end)


  

spawn(function()

local mouse = game.Players.LocalPlayer:GetMouse()



local len  = 2

local offset = Vector3.new(1,-3,0)
	
	local offset = Vector3.new(1,-1,0)
	
local segs = {}

local posn =  game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,-2.5,0)






for i,v in pairs(workspace.segments:GetChildren()) do
	
	
	
	table.insert(segs,v)
	
	
end






function vectorabsy(vec)
	local v = Vector3.new(vec.X,math.abs(vec.Y),vec.Z)
	return v
end


local count = #segs


while true do
	
	for i = 1,5 do
		
	for i = 1,count do
		
		if i == 1 then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =leg1.Position
			local vec = (pos2 - pos1).Unit 
			
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )
			local pos2 = 	segs[i-1].Position - (segs[i-1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
		end

	end	
	
	--Back

	
		for i = 1,count do
		
		local i = ( count - i ) + 1
		if i == count then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =(game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(offset)).Position  
			local vec =(pos2 - pos1).Unit 
			if vec.Y > 0 then
				
			vec = Vector3.new(vec.X, vec.Y-0.01 ,vec.Z)	
				
			end
			
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) * CFrame.Angles(0,math.rad(-180),0) 
			
			seg.CFrame =cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )
			
			local pos2 = 	segs[i+1].Position + (segs[i+1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit 
			
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2)  * CFrame.Angles(0,math.rad(-180),0)
			
			seg.CFrame = cframe
		end

		end	
		
	end
	game:GetService("RunService").Heartbeat:wait()
end
	
end)




spawn(function()

local mouse = game.Players.LocalPlayer:GetMouse()



local len  = 2

local offset = Vector3.new(-1,-1,0)

local segs = {}

local posn =  game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,-2.5,0)






for i,v in pairs(workspace.segments2:GetChildren()) do
	
	

	table.insert(segs,v)
	
	
end





function vectorabsy(vec)
	local v = Vector3.new(vec.X,math.abs(vec.Y),vec.Z)
	return v
end


local count = #segs


while true do

	for i = 1,5 do
		
	for i = 1,count do
		
		if i == 1 then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =leg2.Position
			local vec = (pos2 - pos1).Unit 
		
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position - (segs[i].CFrame.LookVector* (len/2) )
			local pos2 = 	segs[i-1].Position - (segs[i-1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) 
			
			seg.CFrame = cframe
		end

	end	
	
	--Back

	
		for i = 1,count do
		
		local i = ( count - i ) + 1
		if i == count then
			
			local seg = segs[i]
			
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )  -- Calculating position that is on back of the part
			local pos2 =(game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(offset)).Position  
			local vec =(pos2 - pos1).Unit 
			if vec.Y > 0 then
				
			vec = Vector3.new(vec.X, vec.Y-0.01 ,vec.Z)	
				
			end
			
			local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2) * CFrame.Angles(0,math.rad(-180),0) 
			
			seg.CFrame =cframe
			
		else
				local seg = segs[i]
			local pos1 = 	segs[i].Position + (segs[i].CFrame.LookVector* (len/2) )
			
			local pos2 = 	segs[i+1].Position + (segs[i+1].CFrame.LookVector* (len/2) )
			local vec = (pos2 - pos1).Unit 
			
				local cframe = CFrame.new(pos2 - (vec*(len/2) ),pos2)  * CFrame.Angles(0,math.rad(-180),0)
			
			seg.CFrame = cframe
		end

		end	
		
	end
	game:GetService("RunService").Heartbeat:wait()
end
	
end)


game.Players.LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
game.Players.LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
game.Players.LocalPlayer.Character.Torso["Right Hip"]:Destroy()
game.Players.LocalPlayer.Character.Torso["Left Hip"]:Destroy()


	
local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Right Arm"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)

local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Left Arm"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)

local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Left Leg"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)

local bodyvelocity = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character["Right Leg"])
bodyvelocity.MaxForce = Vector3.new(9.9999999805064e+18, 9.999999869911e+14, 9.999999869911e+14)
bodyvelocity.Velocity = Vector3.new(0, 200, 0)

spawn(function()
	

	game.Players.LocalPlayer.Character.Humanoid.Died:connect(function()
		
		segments:Destroy()
		segments2:Destroy()
		
	end)
	
	game:GetService("RunService").Stepped:connect(function()
	  	game.Players.LocalPlayer.Character["Right Arm"].CanCollide = false
	game.Players.LocalPlayer.Character["Left Arm"].CanCollide = false
		
	 game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
	game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false

	   end)
	
	repeat game:GetService("RunService").Heartbeat:wait()
		
	game.Players.LocalPlayer.Character["Right Arm"].CFrame = 	segments.seg1 .CFrame * CFrame.Angles(math.rad(90),0,0 )
	game.Players.LocalPlayer.Character["Left Arm"].CFrame = 	segments.seg2.CFrame * CFrame.Angles(math.rad(90),0,0 )
		
	 game.Players.LocalPlayer.Character["Right Leg"].CFrame = 	segments2.seg1.CFrame * CFrame.Angles(math.rad(90),0,0 )
	game.Players.LocalPlayer.Character["Left Leg"].CFrame = 	segments2.seg2.CFrame * CFrame.Angles(math.rad(90),0,0 )
	
	until game.Players.LocalPlayer.Character.Humanoid.Health  < 1

		
		
		
	
	
end)

end)

OtherSection:NewButton("Snake 1", "Snake", function()
    loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()
end)

OtherSection:NewButton("Snake 2", "Snake", function()
    --Hats are not required for this script wear items below to add to the script
--Snake head: https://www.roblox.com/catalog/5411710016/Toy-Snek-Head
--Snake Top: https://www.roblox.com/catalog/5813877364/Snake-Scales-Arms
--Snake Bottom: https://www.roblox.com/catalog/5813878665/Snake-Scales-Legs
--MADE BY DELECTIV/GUAVAJUICEFANCLUBFAN
--SUBSCRIBE TO DARK ECCENTRIC
function rmesh(a)
    if not (workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('Mesh') or workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('SpecialMesh')) then return end
    old=game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character=workspace[game.Players.LocalPlayer.Name]
    for i,v in next, workspace[game.Players.LocalPlayer.Name]:FindFirstChild(a).Handle:GetDescendants() do
    if v:IsA('Mesh') or v:IsA('SpecialMesh') then
    v:Remove()
    end
    end
    for i = 1 , 2 do
    game.Players.LocalPlayer.Character=old
    end
    end
    
    HumanDied = false for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do if v:IsA("BasePart") then  _G.netless=game:GetService("RunService").Heartbeat:connect(function() v.AssemblyLinearVelocity = Vector3.new(-30,0,0) sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge) sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999) end) end end  local plr = game.Players.LocalPlayer local char = plr.Character local srv = game:GetService('RunService') local ct = {}  char.Archivable = true local reanim = char:Clone() reanim.Name = 'Nexo '..plr.Name..'' fl=Instance.new('Folder',char) fl.Name ='Nexo' reanim.Animate.Disabled=true char.HumanoidRootPart:Destroy() char.Humanoid:ChangeState(16)  for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do v:Stop() end char.Animate:Remove()  function create(part, parent, p, r) Instance.new("Attachment",part) Instance.new("AlignPosition",part) Instance.new("AlignOrientation",part) Instance.new("Attachment",parent) part.Attachment.Name = part.Name parent.Attachment.Name = part.Name part.AlignPosition.Attachment0 = part[part.Name] part.AlignOrientation.Attachment0 = part[part.Name] part.AlignPosition.Attachment1 = parent[part.Name] part.AlignOrientation.Attachment1 = parent[part.Name] parent[part.Name].Position = p or Vector3.new() part[part.Name].Orientation = r or Vector3.new() part.AlignPosition.MaxForce = 999999999 part.AlignPosition.MaxVelocity = math.huge part.AlignPosition.ReactionForceEnabled = false part.AlignPosition.Responsiveness = math.huge part.AlignOrientation.Responsiveness = math.huge part.AlignPosition.RigidityEnabled = false part.AlignOrientation.MaxTorque = 999999999 end  for i,v in next, char:GetDescendants() do if v:IsA('Accessory') then v.Handle:BreakJoints() create(v.Handle,reanim[v.Name].Handle) end end  char.Torso['Left Shoulder']:Destroy() char.Torso['Right Shoulder']:Destroy() char.Torso['Left Hip']:Destroy() char.Torso['Right Hip']:Destroy()  create(char['Torso'],reanim['Torso']) create(char['Left Arm'],reanim['Left Arm']) create(char['Right Arm'],reanim['Right Arm']) create(char['Left Leg'],reanim['Left Leg']) create(char['Right Leg'],reanim['Right Leg'])  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') or v:IsA('Decal') then v.Transparency = 1 end end  reanim.Parent = fl  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  table.insert(ct,reanim.Humanoid.Died:Connect(function() plr.Character = char char:BreakJoints() reanim:Destroy() game.Players:Chat('-gr') _G.netless:Disconnect() HumanDied = true for _,v in pairs(ct) do v:Disconnect() end end))  plr.Character = reanim workspace.CurrentCamera.CameraSubject = reanim.Humanoid
    
    IT = Instance.new
    CF = CFrame.new
    VT = Vector3.new
    RAD = math.rad
    C3 = Color3.new
    UD2 = UDim2.new
    BRICKC = BrickColor.new
    ANGLES = CFrame.Angles
    EULER = CFrame.fromEulerAnglesXYZ
    COS = math.cos
    ACOS = math.acos
    SIN = math.sin
    ASIN = math.asin
    ABS = math.abs
    MRANDOM = math.random
    FLOOR = math.floor
    
    speed = 1
    sine = 1
    srv = game:GetService('RunService')
    
    reanim = game.Players.LocalPlayer.Character
    
    function hat(h,p,c1,c0,m)
    reanim[h].Handle.AccessoryWeld.Part1=reanim[p]
    reanim[h].Handle.AccessoryWeld.C1=c1 or CFrame.new()
    reanim[h].Handle.AccessoryWeld.C0=reanim[h].Handle.AccessoryWeld.C0:Lerp(c0 or CFrame.new(),1)
    if m == true then
    rmesh(h)
    end
    end
    
    m=game.Players.LocalPlayer:GetMouse()
    RJ = reanim.HumanoidRootPart.RootJoint
    RS = reanim.Torso['Right Shoulder']
    LS = reanim.Torso['Left Shoulder']
    RH = reanim.Torso['Right Hip']
    LH = reanim.Torso['Left Hip']
    Root = reanim.HumanoidRootPart
    NECK = reanim.Torso.Neck
    NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
    
    -- for modes u can go in this link : https://Nexo.notxeneon15.repl.co/nexo/modes.lua
    
    coroutine.wrap(function()
    while true do -- anim changer
    if HumanDied then break end
    sine = sine + speed
    local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
    local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
    local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
    local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
    local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
    local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
    if lookvector > reanim.Humanoid.WalkSpeed then
    lookvector = reanim.Humanoid.WalkSpeed
    end
    if lookvector < -reanim.Humanoid.WalkSpeed then
    lookvector = -reanim.Humanoid.WalkSpeed
    end
    if rightvector > reanim.Humanoid.WalkSpeed then
    rightvector = reanim.Humanoid.WalkSpeed
    end
    if rightvector < -reanim.Humanoid.WalkSpeed then
    rightvector = -reanim.Humanoid.WalkSpeed
    end
    local lookvel = lookvector / reanim.Humanoid.WalkSpeed
    local rightvel = rightvector / reanim.Humanoid.WalkSpeed
    if reanim.Humanoid.Jump then -- jump
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),2.54+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.76+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.83+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-4.44+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
    elseif Root.Velocity.y < -1 and reanim.Humanoid.Jump then -- fall
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),2.54+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.76+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.83+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-4.44+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
    elseif Root.Velocity.Magnitude < 2 then -- idle
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(242.48+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+5.58*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.68+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(219.55+13.23*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+59.08*math.cos(sine/10))),.2)
    elseif Root.Velocity.Magnitude < 20 then -- walk
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+2*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+-2.06*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+28.51*math.cos(sine/10))),.2)
    elseif Root.Velocity.Magnitude > 20 then -- run
    NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
    RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+2*math.cos(sine/10))),.2) 
    LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+-2.06*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+28.51*math.cos(sine/10))),.2)
    end
    srv.RenderStepped:Wait()
    end
    end)()
    --Created using Nexo Animator V4
end)

OtherSection:NewButton("Suicide", "Suicide", function()
    --SUICIDE GUN REBORN BY DMS
o1 = Instance.new("Tool")
o2 = Instance.new("Part")
o3 = Instance.new("SpecialMesh")
o4 = Instance.new("Part")
o5 = Instance.new("BlockMesh")
o6 = Instance.new("Part")
o7 = Instance.new("BlockMesh")
o8 = Instance.new("Part")
o9 = Instance.new("BlockMesh")
o10 = Instance.new("Part")
o11 = Instance.new("BlockMesh")
o12 = Instance.new("Part")
o13 = Instance.new("BlockMesh")
o14 = Instance.new("Part")
o15 = Instance.new("BlockMesh")
o16 = Instance.new("Part")
o17 = Instance.new("BlockMesh")
o18 = Instance.new("Part")
o19 = Instance.new("BlockMesh")
o20 = Instance.new("Part")
o21 = Instance.new("CylinderMesh")
o22 = Instance.new("Part")
o23 = Instance.new("CylinderMesh")
o24 = Instance.new("Part")
o25 = Instance.new("CylinderMesh")
o26 = Instance.new("Part")
o27 = Instance.new("BlockMesh")
o28 = Instance.new("Part")
o29 = Instance.new("CylinderMesh")
o30 = Instance.new("Part")
o31 = Instance.new("PointLight")
o32 = Instance.new("BillboardGui")
o33 = Instance.new("ImageLabel")
o34 = Instance.new("BlockMesh")
o35 = Instance.new("Part")
o36 = Instance.new("BlockMesh")
o37 = Instance.new("Part")
o38 = Instance.new("BlockMesh")
o39 = Instance.new("Part")
o40 = Instance.new("BlockMesh")
o41 = Instance.new("Part")
o42 = Instance.new("Decal")
o43 = Instance.new("CylinderMesh")
o44 = Instance.new("Part")
o45 = Instance.new("CylinderMesh")
o46 = Instance.new("Part")
o47 = Instance.new("BlockMesh")
o48 = Instance.new("Part")
o49 = Instance.new("SpecialMesh")
o50 = Instance.new("Part")
o51 = Instance.new("SpecialMesh")
o52 = Instance.new("Part")
o53 = Instance.new("BlockMesh")
o54 = Instance.new("Part")
o55 = Instance.new("BlockMesh")
o56 = Instance.new("Part")
o57 = Instance.new("BlockMesh")
o58 = Instance.new("Part")
o59 = Instance.new("CylinderMesh")
o60 = Instance.new("Part")
o61 = Instance.new("SpecialMesh")
o62 = Instance.new("Part")
o63 = Instance.new("BlockMesh")
o64 = Instance.new("Part")
o65 = Instance.new("SpecialMesh")
o66 = Instance.new("Part")
o67 = Instance.new("BlockMesh")
o68 = Instance.new("Part")
o69 = Instance.new("BlockMesh")
o70 = Instance.new("Part")
o71 = Instance.new("SpecialMesh")
o72 = Instance.new("Part")
o73 = Instance.new("BlockMesh")
o74 = Instance.new("Part")
o75 = Instance.new("BlockMesh")
o76 = Instance.new("Part")
o77 = Instance.new("BlockMesh")
o78 = Instance.new("Part")
o79 = Instance.new("SpecialMesh")
o80 = Instance.new("Part")
o81 = Instance.new("CylinderMesh")
o82 = Instance.new("Part")
o83 = Instance.new("SpecialMesh")
o84 = Instance.new("Part")
o85 = Instance.new("BlockMesh")
o86 = Instance.new("Part")
o87 = Instance.new("SpecialMesh")
o88 = Instance.new("Part")
o89 = Instance.new("SpecialMesh")
o90 = Instance.new("Part")
o91 = Instance.new("BlockMesh")
o92 = Instance.new("Part")
o93 = Instance.new("BlockMesh")
o94 = Instance.new("Part")
o95 = Instance.new("SpecialMesh")
o96 = Instance.new("Part")
o97 = Instance.new("BlockMesh")
o98 = Instance.new("Part")
o99 = Instance.new("SpecialMesh")
o100 = Instance.new("Part")
o101 = Instance.new("BlockMesh")
o102 = Instance.new("Part")
o103 = Instance.new("BlockMesh")
o104 = Instance.new("Part")
o105 = Instance.new("SpecialMesh")
o106 = Instance.new("Part")
o107 = Instance.new("BlockMesh")
o108 = Instance.new("Part")
o109 = Instance.new("CylinderMesh")
o110 = Instance.new("Part")
o111 = Instance.new("BlockMesh")
o112 = Instance.new("Part")
o113 = Instance.new("SpecialMesh")
o114 = Instance.new("Part")
o115 = Instance.new("CylinderMesh")
o116 = Instance.new("Part")
o117 = Instance.new("BlockMesh")
o118 = Instance.new("Part")
o119 = Instance.new("SpecialMesh")
o120 = Instance.new("Part")
o121 = Instance.new("BlockMesh")
o122 = Instance.new("Part")
o123 = Instance.new("SpecialMesh")
o124 = Instance.new("Part")
o125 = Instance.new("SpecialMesh")
o126 = Instance.new("Part")
o127 = Instance.new("BlockMesh")
o128 = Instance.new("Part")
o129 = Instance.new("BlockMesh")
o130 = Instance.new("Part")
o131 = Instance.new("SpecialMesh")
o132 = Instance.new("Part")
o133 = Instance.new("BlockMesh")
o134 = Instance.new("Part")
o135 = Instance.new("BlockMesh")
o136 = Instance.new("Part")
o137 = Instance.new("SpecialMesh")
o138 = Instance.new("Part")
o139 = Instance.new("BlockMesh")
o140 = Instance.new("Part")
o141 = Instance.new("CylinderMesh")
o142 = Instance.new("Part")
o143 = Instance.new("BlockMesh")
o144 = Instance.new("Part")
o145 = Instance.new("SpecialMesh")
o146 = Instance.new("Part")
o147 = Instance.new("SpecialMesh")
o148 = Instance.new("Part")
o149 = Instance.new("Sound")
o150 = Instance.new("BlockMesh")
o1.Name = "Suicide"
o1.Parent = game.Players.LocalPlayer.Backpack
o2.Parent = o1
o2.Material = Enum.Material.SmoothPlastic
o2.BrickColor = BrickColor.new("Really black")
o2.Position = Vector3.new(18.950964, 0.850407004, 14.2854338)
o2.Rotation = Vector3.new(-2.19040904e-013, 2.50129006e-006, -180)
o2.Anchored = true
o2.FormFactor = Enum.FormFactor.Custom
o2.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o2.CFrame = CFrame.new(18.950964, 0.850407004, 14.2854338, -1, 8.74227766e-008, 4.36557457e-008, -8.74227766e-008, -1, 3.82298495e-015, 4.36557457e-008, 3.92853881e-018, 1)
o2.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o2.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o2.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o2.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o2.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o2.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o2.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o3.Parent = o2
o3.Scale = Vector3.new(0.666666687, 0.388888866, 0.416666687)
o3.MeshType = Enum.MeshType.Wedge
o4.Parent = o1
o4.Material = Enum.Material.SmoothPlastic
o4.BrickColor = BrickColor.new("Really black")
o4.Position = Vector3.new(18.950964, 0.953182995, 14.5104237)
o4.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o4.Anchored = true
o4.FormFactor = Enum.FormFactor.Custom
o4.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o4.CFrame = CFrame.new(18.950964, 0.953182995, 14.5104237, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o4.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o4.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o4.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o4.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o4.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o4.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o4.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o5.Parent = o4
o5.Scale = Vector3.new(0.333333343, 0.194444433, 0.694444478)
o6.Parent = o1
o6.Material = Enum.Material.SmoothPlastic
o6.BrickColor = BrickColor.new("Black")
o6.Position = Vector3.new(18.950964, 1.13095105, 14.5993176)
o6.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o6.Anchored = true
o6.FormFactor = Enum.FormFactor.Custom
o6.Size = Vector3.new(0.566666663, 0.200000003, 0.200000003)
o6.CFrame = CFrame.new(18.950964, 1.13095105, 14.5993176, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o6.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o6.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o6.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o6.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o6.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o6.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o6.Color = Color3.new(0.105882, 0.164706, 0.207843)
o7.Parent = o6
o7.Scale = Vector3.new(1, 0.583333313, 0.722222269)
o8.Name = "SightBack"
o8.Parent = o1
o8.Material = Enum.Material.SmoothPlastic
o8.Position = Vector3.new(18.950964, 1.23151195, 14.4882116)
o8.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o8.Anchored = true
o8.FormFactor = Enum.FormFactor.Custom
o8.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o8.CFrame = CFrame.new(18.950964, 1.23151195, 14.4882116, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o8.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o8.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o8.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o8.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o8.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o8.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o9.Parent = o8
o9.Scale = Vector3.new(0.166666672, 0.111111112, 0.411111116)
o10.Parent = o1
o10.Material = Enum.Material.SmoothPlastic
o10.BrickColor = BrickColor.new("Really black")
o10.Position = Vector3.new(18.950964, 0.961513996, 14.5937595)
o10.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o10.Anchored = true
o10.FormFactor = Enum.FormFactor.Custom
o10.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o10.CFrame = CFrame.new(18.950964, 0.961513996, 14.5937595, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o10.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o10.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o10.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o10.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o10.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o10.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o10.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o11.Parent = o10
o11.Scale = Vector3.new(0.49999997, 0.277777761, 0.694444478)
o12.Parent = o1
o12.Material = Enum.Material.SmoothPlastic
o12.BrickColor = BrickColor.new("Really black")
o12.Position = Vector3.new(18.950964, 1.19539297, 14.5993176)
o12.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o12.Anchored = true
o12.FormFactor = Enum.FormFactor.Custom
o12.Size = Vector3.new(0.566666663, 0.200000003, 0.200000003)
o12.CFrame = CFrame.new(18.950964, 1.19539297, 14.5993176, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o12.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o12.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o12.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o12.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o12.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o12.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o12.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o13.Parent = o12
o13.Scale = Vector3.new(1, 0.249999985, 0.411111116)
o14.Parent = o1
o14.Material = Enum.Material.SmoothPlastic
o14.BrickColor = BrickColor.new("Really black")
o14.Position = Vector3.new(18.908186, 1.19095695, 14.5993176)
o14.Rotation = Vector3.new(-90, 44.9999962, 90)
o14.Anchored = true
o14.FormFactor = Enum.FormFactor.Custom
o14.Size = Vector3.new(0.566666663, 0.200000003, 0.200000003)
o14.CFrame = CFrame.new(18.908186, 1.19095695, 14.5993176, 0, -0.707106709, 0.707106709, 5.38120031e-018, 0.707106769, 0.707106769, -1, 2.04281037e-011, 9.59801127e-011)
o14.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o14.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o14.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o14.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o14.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o14.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o14.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o15.Parent = o14
o15.Scale = Vector3.new(1, 0.194444433, 0.222222224)
o16.Name = "SightBack"
o16.Parent = o1
o16.Material = Enum.Material.SmoothPlastic
o16.Position = Vector3.new(18.9787407, 1.25372696, 14.4882116)
o16.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o16.Anchored = true
o16.FormFactor = Enum.FormFactor.Custom
o16.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o16.CFrame = CFrame.new(18.9787407, 1.25372696, 14.4882116, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o16.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o16.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o16.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o16.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o16.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o16.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o17.Parent = o16
o17.Scale = Vector3.new(0.166666672, 0.111111112, 0.13333334)
o18.Name = "SightBack"
o18.Parent = o1
o18.Material = Enum.Material.SmoothPlastic
o18.Position = Vector3.new(18.9231701, 1.25372696, 14.4882002)
o18.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o18.Anchored = true
o18.FormFactor = Enum.FormFactor.Custom
o18.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o18.CFrame = CFrame.new(18.9231701, 1.25372696, 14.4882002, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o18.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o18.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o18.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o18.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o18.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o18.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o19.Parent = o18
o19.Scale = Vector3.new(0.166666672, 0.111111112, 0.13333334)
o20.Parent = o1
o20.Material = Enum.Material.SmoothPlastic
o20.BrickColor = BrickColor.new("Black")
o20.Position = Vector3.new(18.950964, 0.886528015, 14.5798664)
o20.Rotation = Vector3.new(-90, -2.50447761e-006, -90)
o20.Anchored = true
o20.FormFactor = Enum.FormFactor.Custom
o20.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o20.CFrame = CFrame.new(18.950964, 0.886528015, 14.5798664, -8.74279067e-008, 1, -4.37113812e-008, -3.83195418e-015, 4.37113812e-008, 1, 1, 8.74279067e-008, -4.65359901e-018)
o20.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o20.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o20.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o20.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o20.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o20.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o20.Color = Color3.new(0.105882, 0.164706, 0.207843)
o21.Parent = o20
o21.Scale = Vector3.new(0.416666687, 0.722222269, 0.416666687)
o22.Name = "SightLine"
o22.Parent = o1
o22.Material = Enum.Material.SmoothPlastic
o22.BrickColor = BrickColor.new("Smoky grey")
o22.Position = Vector3.new(18.950964, 1.21539295, 15.7804356)
o22.Rotation = Vector3.new(90, -2.50447761e-006, -90)
o22.Anchored = true
o22.FormFactor = Enum.FormFactor.Custom
o22.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o22.CFrame = CFrame.new(18.950964, 1.21539295, 15.7804356, 0, 1, -4.37113812e-008, 5.38120031e-018, -4.37113812e-008, -1, -1, 0, 6.1083781e-018)
o22.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o22.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o22.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o22.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o22.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o22.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o22.Color = Color3.new(0.356863, 0.364706, 0.411765)
o23.Parent = o22
o23.Scale = Vector3.new(0.505999982, 0.150000006, 0.505999982)
o24.Parent = o1
o24.Material = Enum.Material.SmoothPlastic
o24.BrickColor = BrickColor.new("Black")
o24.Position = Vector3.new(18.950964, 0.96707201, 15.7326679)
o24.Rotation = Vector3.new(-90, -2.50447761e-006, -180)
o24.Anchored = true
o24.FormFactor = Enum.FormFactor.Custom
o24.Size = Vector3.new(0.200000003, 0.344444454, 0.200000003)
o24.CFrame = CFrame.new(18.950964, 0.96707201, 15.7326679, -1, 4.36557457e-008, -4.37113812e-008, -4.37113812e-008, 1.9122997e-015, 1, 4.36557457e-008, 1, -4.65359901e-018)
o24.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o24.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o24.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o24.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o24.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o24.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o24.Color = Color3.new(0.105882, 0.164706, 0.207843)
o25.Parent = o24
o25.Scale = Vector3.new(0.405599982, 1, 0.405599982)
o26.Parent = o1
o26.Material = Enum.Material.SmoothPlastic
o26.BrickColor = BrickColor.new("Black")
o26.Position = Vector3.new(18.950964, 1.01984501, 15.7298756)
o26.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o26.Anchored = true
o26.FormFactor = Enum.FormFactor.Custom
o26.Size = Vector3.new(0.338888884, 0.200000003, 0.200000003)
o26.CFrame = CFrame.new(18.950964, 1.01984501, 15.7298756, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o26.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o26.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o26.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o26.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o26.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o26.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o26.Color = Color3.new(0.105882, 0.164706, 0.207843)
o27.Parent = o26
o27.Scale = Vector3.new(1, 0.527777731, 0.611111104)
o28.Parent = o1
o28.Material = Enum.Material.SmoothPlastic
o28.BrickColor = BrickColor.new("Black")
o28.Position = Vector3.new(18.950964, 0.96707201, 15.7298756)
o28.Rotation = Vector3.new(-90, -2.50447761e-006, -180)
o28.Anchored = true
o28.FormFactor = Enum.FormFactor.Custom
o28.Size = Vector3.new(0.200000003, 0.338888884, 0.200000003)
o28.CFrame = CFrame.new(18.950964, 0.96707201, 15.7298756, -1, 4.36557457e-008, -4.37113812e-008, -4.37113812e-008, 1.9122997e-015, 1, 4.36557457e-008, 1, -4.65359901e-018)
o28.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o28.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o28.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o28.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o28.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o28.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o28.Color = Color3.new(0.105882, 0.164706, 0.207843)
o29.Parent = o28
o29.Scale = Vector3.new(0.611111104, 1, 0.611111104)
o30.Name = "Main"
o30.Parent = o1
o30.Material = Enum.Material.SmoothPlastic
o30.BrickColor = BrickColor.new("Really black")
o30.Transparency = 1
o30.Position = Vector3.new(18.950964, 1.12816894, 15.9493256)
o30.Rotation = Vector3.new(90, -2.50447761e-006, 2.50796006e-006)
o30.Anchored = true
o30.FormFactor = Enum.FormFactor.Custom
o30.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o30.CFrame = CFrame.new(18.950964, 1.12816894, 15.9493256, 1, -4.3772161e-008, -4.37113812e-008, -4.37113812e-008, -1.49011594e-008, -1, 4.3772161e-008, 1, -1.49011603e-008)
o30.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o30.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o30.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o30.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o30.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o30.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o30.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o31.Name = "FlashFX"
o31.Parent = o30
o31.Color = Color3.new(1, 1, 0)
o31.Enabled = false
o31.Brightness = 10
o31.Range = 6
o31.Shadows = true
o32.Name = "FlashGui"
o32.Parent = o30
o32.Size = UDim2.new(1.1000000238419,0,1.1000000238419,0)
o32.Enabled = false
o33.Name = "Label"
o33.Parent = o32
o33.Size = UDim2.new(1,0,1,0)
o33.BackgroundTransparency = 1
o33.Image = "http://www.roblox.com/asset/?id=117472237"
o34.Parent = o30
o34.Scale = Vector3.new(0.99999994, 0.99999994, 0.99999994)
o35.Parent = o1
o35.Material = Enum.Material.SmoothPlastic
o35.BrickColor = BrickColor.new("Black")
o35.Position = Vector3.new(18.908186, 1.19095695, 15.5132236)
o35.Rotation = Vector3.new(-90, 44.9999962, 90)
o35.Anchored = true
o35.FormFactor = Enum.FormFactor.Custom
o35.Size = Vector3.new(0.772222221, 0.200000003, 0.200000003)
o35.CFrame = CFrame.new(18.908186, 1.19095695, 15.5132236, 0, -0.707106709, 0.707106709, 5.38120031e-018, 0.707106769, 0.707106769, -1, 2.04281037e-011, 9.59801127e-011)
o35.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o35.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o35.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o35.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o35.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o35.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o35.Color = Color3.new(0.105882, 0.164706, 0.207843)
o36.Parent = o35
o36.Scale = Vector3.new(1, 0.194444433, 0.222222224)
o37.Parent = o1
o37.Material = Enum.Material.SmoothPlastic
o37.BrickColor = BrickColor.new("Black")
o37.Position = Vector3.new(18.950964, 1.19539297, 15.5132236)
o37.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o37.Anchored = true
o37.FormFactor = Enum.FormFactor.Custom
o37.Size = Vector3.new(0.772222221, 0.200000003, 0.200000003)
o37.CFrame = CFrame.new(18.950964, 1.19539297, 15.5132236, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o37.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o37.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o37.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o37.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o37.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o37.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o37.Color = Color3.new(0.105882, 0.164706, 0.207843)
o38.Parent = o37
o38.Scale = Vector3.new(1, 0.249999985, 0.411111116)
o39.Parent = o1
o39.Material = Enum.Material.SmoothPlastic
o39.BrickColor = BrickColor.new("Black")
o39.Position = Vector3.new(18.950964, 1.13095105, 15.5132236)
o39.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o39.Anchored = true
o39.FormFactor = Enum.FormFactor.Custom
o39.Size = Vector3.new(0.772222221, 0.200000003, 0.200000003)
o39.CFrame = CFrame.new(18.950964, 1.13095105, 15.5132236, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o39.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o39.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o39.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o39.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o39.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o39.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o39.Color = Color3.new(0.105882, 0.164706, 0.207843)
o40.Parent = o39
o40.Scale = Vector3.new(1, 0.583333313, 0.722222269)
o41.Parent = o1
o41.Material = Enum.Material.SmoothPlastic
o41.BrickColor = BrickColor.new("Black")
o41.Position = Vector3.new(18.950964, 1.12816894, 15.3854284)
o41.Rotation = Vector3.new(-90, -2.50447761e-006, -180)
o41.Anchored = true
o41.FormFactor = Enum.FormFactor.Custom
o41.Size = Vector3.new(0.200000003, 1.06111109, 0.200000003)
o41.CFrame = CFrame.new(18.950964, 1.12816894, 15.3854284, -1, 4.36557457e-008, -4.37113812e-008, -4.37113812e-008, 1.9122997e-015, 1, 4.36557457e-008, 1, -4.65359901e-018)
o41.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o41.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o41.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o41.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o41.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o41.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o41.Color = Color3.new(0.105882, 0.164706, 0.207843)
o42.Parent = o41
o42.Texture = "http://www.roblox.com/asset/?id=47760372"
o42.Face = Enum.NormalId.Top
o43.Parent = o41
o43.Scale = Vector3.new(0.49999997, 1, 0.49999997)
o44.Parent = o1
o44.Material = Enum.Material.SmoothPlastic
o44.BrickColor = BrickColor.new("Black")
o44.Position = Vector3.new(18.950964, 0.961513996, 15.352108)
o44.Rotation = Vector3.new(-90, -2.50447761e-006, -180)
o44.Anchored = true
o44.FormFactor = Enum.FormFactor.Custom
o44.Size = Vector3.new(0.200000003, 0.416666627, 0.200000003)
o44.CFrame = CFrame.new(18.950964, 0.961513996, 15.352108, -1, 4.36557457e-008, -4.37113812e-008, -4.37113812e-008, 1.9122997e-015, 1, 4.36557457e-008, 1, -4.65359901e-018)
o44.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o44.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o44.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o44.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o44.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o44.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o44.Color = Color3.new(0.105882, 0.164706, 0.207843)
o45.Parent = o44
o45.Scale = Vector3.new(0.666666687, 1, 0.666666687)
o46.Name = "Mag"
o46.Parent = o1
o46.Material = Enum.Material.SmoothPlastic
o46.BrickColor = BrickColor.new("Black")
o46.Position = Vector3.new(18.950964, 0.129971996, 14.3866644)
o46.Rotation = Vector3.new(101, 90, 0)
o46.Anchored = true
o46.FormFactor = Enum.FormFactor.Custom
o46.Size = Vector3.new(0.200000003, 0.333333343, 0.200000003)
o46.CFrame = CFrame.new(18.950964, 0.129971996, 14.3866644, -2.79885857e-008, -5.49657244e-008, 1, 0.981627166, -0.190809026, 1.69563066e-008, 0.190809026, 0.981627107, 5.93718141e-008)
o46.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o46.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o46.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o46.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o46.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o46.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o46.Color = Color3.new(0.105882, 0.164706, 0.207843)
o47.Parent = o46
o47.Scale = Vector3.new(0.027777778, 1, 0.666666687)
o48.Parent = o1
o48.Material = Enum.Material.SmoothPlastic
o48.BrickColor = BrickColor.new("Black")
o48.Position = Vector3.new(18.950964, 0.161533996, 14.3493176)
o48.Rotation = Vector3.new(0.019784553, -6.66929267e-009, 180)
o48.Anchored = true
o48.FormFactor = Enum.FormFactor.Custom
o48.Size = Vector3.new(0.200000003, 0.200000003, 0.266666681)
o48.CFrame = CFrame.new(18.950964, 0.161533996, 14.3493176, -1, -8.74227979e-008, -1.16401111e-010, 8.74227766e-008, -0.99999994, -0.000345305598, 0, -0.000345305569, 0.99999994)
o48.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o48.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o48.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o48.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o48.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o48.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o48.Color = Color3.new(0.105882, 0.164706, 0.207843)
o49.Parent = o48
o49.Scale = Vector3.new(0.694444478, 0.222222224, 1)
o49.MeshType = Enum.MeshType.Wedge
o50.Parent = o1
o50.Material = Enum.Material.SmoothPlastic
o50.BrickColor = BrickColor.new("Really black")
o50.Position = Vector3.new(18.950964, 0.155975997, 14.3354216)
o50.Rotation = Vector3.new(3.08320072e-016, 0, -180)
o50.Anchored = true
o50.FormFactor = Enum.FormFactor.Custom
o50.Size = Vector3.new(0.200000003, 0.200000003, 0.438888878)
o50.CFrame = CFrame.new(18.950964, 0.155975997, 14.3354216, -1, 1.0960446e-021, 0, 1.0960446e-021, -1, -5.38120031e-018, 0, 5.38120031e-018, 1)
o50.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o50.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o50.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o50.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o50.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o50.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o50.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o51.Parent = o50
o51.Scale = Vector3.new(0.666666687, 0.333333343, 1)
o51.MeshType = Enum.MeshType.Wedge
o52.Parent = o1
o52.Material = Enum.Material.SmoothPlastic
o52.BrickColor = BrickColor.new("Black")
o52.Position = Vector3.new(18.950964, 0.239300996, 14.1882057)
o52.Rotation = Vector3.new(105, 90, 0)
o52.Anchored = true
o52.FormFactor = Enum.FormFactor.Custom
o52.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o52.CFrame = CFrame.new(18.950964, 0.239300996, 14.1882057, -1.07331601e-008, -6.40018527e-008, 1, 0.965925813, -0.258819044, -6.21114538e-009, 0.258819073, 0.965925813, 6.46105036e-008)
o52.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o52.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o52.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o52.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o52.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o52.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o52.Color = Color3.new(0.105882, 0.164706, 0.207843)
o53.Parent = o52
o53.Scale = Vector3.new(0.944444478, 0.111111112, 0.611111104)
o54.Parent = o1
o54.Material = Enum.Material.SmoothPlastic
o54.BrickColor = BrickColor.new("Really black")
o54.Position = Vector3.new(18.950964, 0.225419, 14.3520937)
o54.Rotation = Vector3.new(-3.25256337e-007, 90, 0)
o54.Anchored = true
o54.FormFactor = Enum.FormFactor.Custom
o54.Size = Vector3.new(0.26111111, 0.200000003, 0.200000003)
o54.CFrame = CFrame.new(18.950964, 0.225419, 14.3520937, 8.94069672e-008, -6.24762481e-015, 1, -5.6767937e-009, 1, 1.42108539e-014, -1, -5.6767937e-009, 8.94069672e-008)
o54.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o54.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o54.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o54.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o54.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o54.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o54.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o55.Parent = o54
o55.Scale = Vector3.new(1, 0.416666687, 0.694444478)
o56.Parent = o1
o56.Material = Enum.Material.SmoothPlastic
o56.BrickColor = BrickColor.new("Really black")
o56.Position = Vector3.new(18.950964, 0.197641, 14.2215319)
o56.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o56.Anchored = true
o56.FormFactor = Enum.FormFactor.Custom
o56.Size = Vector3.new(0.211111099, 0.200000003, 0.200000003)
o56.CFrame = CFrame.new(18.950964, 0.197641, 14.2215319, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o56.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o56.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o56.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o56.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o56.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o56.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o56.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o57.Parent = o56
o57.Scale = Vector3.new(1, 0.0833333358, 0.666666687)
o58.Parent = o1
o58.Material = Enum.Material.SmoothPlastic
o58.BrickColor = BrickColor.new("Really black")
o58.Position = Vector3.new(18.950964, 0.258204013, 14.3493176)
o58.Rotation = Vector3.new(-90, -2.50447761e-006, -90)
o58.Anchored = true
o58.FormFactor = Enum.FormFactor.Custom
o58.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o58.CFrame = CFrame.new(18.950964, 0.258204013, 14.3493176, -8.74279067e-008, 1, -4.37113812e-008, -3.83195418e-015, 4.37113812e-008, 1, 1, 8.74279067e-008, -4.65359901e-018)
o58.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o58.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o58.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o58.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o58.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o58.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o58.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o59.Parent = o58
o59.Scale = Vector3.new(0.49999997, 0.722222269, 0.472222239)
o60.Parent = o1
o60.Material = Enum.Material.SmoothPlastic
o60.BrickColor = BrickColor.new("Really black")
o60.Position = Vector3.new(18.950964, 0.244874001, 14.1993141)
o60.Rotation = Vector3.new(0.019784553, -6.66929267e-009, 180)
o60.Anchored = true
o60.FormFactor = Enum.FormFactor.Custom
o60.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o60.CFrame = CFrame.new(18.950964, 0.244874001, 14.1993141, -1, -8.74227979e-008, -1.16401111e-010, 8.74227766e-008, -0.99999994, -0.000345305598, 0, -0.000345305569, 0.99999994)
o60.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o60.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o60.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o60.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o60.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o60.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o60.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o61.Parent = o60
o61.Scale = Vector3.new(0.694444478, 0.222222224, 0.222222224)
o61.MeshType = Enum.MeshType.Wedge
o62.Parent = o1
o62.Material = Enum.Material.SmoothPlastic
o62.BrickColor = BrickColor.new("Black")
o62.Position = Vector3.new(18.993742, 1.19095695, 15.1076584)
o62.Rotation = Vector3.new(90, 44.9999962, -90)
o62.Anchored = true
o62.FormFactor = Enum.FormFactor.Custom
o62.Size = Vector3.new(1.58333337, 0.200000003, 0.200000003)
o62.CFrame = CFrame.new(18.993742, 1.19095695, 15.1076584, 0, 0.707106709, 0.707106709, 5.38120031e-018, 0.707106769, -0.707106769, -1, 9.59801127e-011, -2.04281037e-011)
o62.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o62.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o62.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o62.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o62.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o62.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o62.Color = Color3.new(0.105882, 0.164706, 0.207843)
o63.Parent = o62
o63.Scale = Vector3.new(1, 0.194444433, 0.222222224)
o64.Parent = o1
o64.Material = Enum.Material.SmoothPlastic
o64.Position = Vector3.new(18.950964, 0.867092013, 15.1298876)
o64.Rotation = Vector3.new(180, 2.50796006e-006, 8.65142192e-006)
o64.Anchored = true
o64.FormFactor = Enum.FormFactor.Custom
o64.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o64.CFrame = CFrame.new(18.950964, 0.867092013, 15.1298876, 1, -1.50995803e-007, 4.3772161e-008, -1.50995803e-007, -1, -6.59664855e-015, 4.3772161e-008, 3.92853881e-018, -1)
o64.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o64.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o64.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o64.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o64.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o64.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o65.Parent = o64
o65.Scale = Vector3.new(0.611111104, 0.333333343, 0.138888881)
o65.MeshType = Enum.MeshType.Wedge
o66.Parent = o1
o66.Material = Enum.Material.SmoothPlastic
o66.Position = Vector3.new(18.950964, 0.83930999, 15.1048679)
o66.Rotation = Vector3.new(89.9999771, 90, 0)
o66.Anchored = true
o66.FormFactor = Enum.FormFactor.Custom
o66.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o66.CFrame = CFrame.new(18.950964, 0.83930999, 15.1048679, -8.74231674e-008, 2.50292942e-008, 1, 1, 4.33125763e-007, 8.74231461e-008, -4.33125791e-007, 1, -2.50292942e-008)
o66.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o66.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o66.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o66.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o66.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o66.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o67.Parent = o66
o67.Scale = Vector3.new(0.944444478, 0.111111112, 0.611111104)
o68.Parent = o1
o68.Material = Enum.Material.SmoothPlastic
o68.BrickColor = BrickColor.new("Fossil")
o68.Position = Vector3.new(18.950964, 0.716949999, 15.0719404)
o68.Rotation = Vector3.new(-45, 90, 0)
o68.Anchored = true
o68.FormFactor = Enum.FormFactor.Custom
o68.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o68.CFrame = CFrame.new(18.950964, 0.716949999, 15.0719404, -1.36843425e-010, -2.04281037e-011, 1, -0.707106769, 0.707106769, -1.0960446e-021, -0.707106709, -0.707106709, 0)
o68.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o68.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o68.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o68.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o68.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o68.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o68.Color = Color3.new(0.623529, 0.631373, 0.67451)
o69.Parent = o68
o69.Scale = Vector3.new(0.527777731, 0.111111112, 0.611111104)
o70.Parent = o1
o70.Material = Enum.Material.SmoothPlastic
o70.BrickColor = BrickColor.new("Black")
o70.Position = Vector3.new(18.950964, 0.875427008, 15.0743237)
o70.Rotation = Vector3.new(3.08320072e-016, 0, -180)
o70.Anchored = true
o70.FormFactor = Enum.FormFactor.Custom
o70.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o70.CFrame = CFrame.new(18.950964, 0.875427008, 15.0743237, -1, 1.0960446e-021, 0, 1.0960446e-021, -1, -5.38120031e-018, 0, 5.38120031e-018, 1)
o70.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o70.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o70.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o70.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o70.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o70.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o70.Color = Color3.new(0.105882, 0.164706, 0.207843)
o71.Parent = o70
o71.Scale = Vector3.new(0.611111104, 0.249999985, 0.194444433)
o71.MeshType = Enum.MeshType.Wedge
o72.Parent = o1
o72.Material = Enum.Material.SmoothPlastic
o72.BrickColor = BrickColor.new("Black")
o72.Position = Vector3.new(18.9315281, 1.09817195, 15.0048761)
o72.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o72.Anchored = true
o72.FormFactor = Enum.FormFactor.Custom
o72.Size = Vector3.new(0.244444445, 0.200000003, 0.200000003)
o72.CFrame = CFrame.new(18.9315281, 1.09817195, 15.0048761, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o72.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o72.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o72.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o72.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o72.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o72.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o72.Color = Color3.new(0.105882, 0.164706, 0.207843)
o73.Parent = o72
o73.Scale = Vector3.new(1, 0.277777761, 0.527777731)
o74.Parent = o1
o74.Material = Enum.Material.SmoothPlastic
o74.BrickColor = BrickColor.new("Black")
o74.Position = Vector3.new(18.9870701, 1.13095105, 15.0048761)
o74.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o74.Anchored = true
o74.FormFactor = Enum.FormFactor.Custom
o74.Size = Vector3.new(0.244444445, 0.200000003, 0.200000003)
o74.CFrame = CFrame.new(18.9870701, 1.13095105, 15.0048761, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o74.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o74.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o74.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o74.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o74.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o74.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o74.Color = Color3.new(0.105882, 0.164706, 0.207843)
o75.Parent = o74
o75.Scale = Vector3.new(1, 0.583333313, 0.361111134)
o76.Parent = o1
o76.Material = Enum.Material.SmoothPlastic
o76.BrickColor = BrickColor.new("Black")
o76.Position = Vector3.new(18.970396, 1.17595196, 15.0048761)
o76.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o76.Anchored = true
o76.FormFactor = Enum.FormFactor.Custom
o76.Size = Vector3.new(0.244444445, 0.200000003, 0.200000003)
o76.CFrame = CFrame.new(18.970396, 1.17595196, 15.0048761, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o76.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o76.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o76.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o76.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o76.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o76.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o76.Color = Color3.new(0.105882, 0.164706, 0.207843)
o77.Parent = o76
o77.Scale = Vector3.new(1, 0.444444448, 0.216666669)
o78.Parent = o1
o78.Material = Enum.Material.SmoothPlastic
o78.BrickColor = BrickColor.new("Black")
o78.Position = Vector3.new(18.950964, 0.39764601, 14.6493216)
o78.Rotation = Vector3.new(180, 2.50796006e-006, 5.00895612e-006)
o78.Anchored = true
o78.FormFactor = Enum.FormFactor.Custom
o78.Size = Vector3.new(0.200000003, 0.550000012, 0.200000003)
o78.CFrame = CFrame.new(18.950964, 0.39764601, 14.6493216, 1, -8.74227766e-008, 4.3772161e-008, -8.74227766e-008, -1, -3.8177829e-015, 4.3772161e-008, 6.83386182e-018, -1)
o78.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o78.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o78.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o78.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o78.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o78.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o78.Color = Color3.new(0.105882, 0.164706, 0.207843)
o79.Parent = o78
o79.Scale = Vector3.new(0.666666687, 1, 0.944444478)
o79.MeshType = Enum.MeshType.Wedge
o80.Parent = o1
o80.Material = Enum.Material.SmoothPlastic
o80.BrickColor = BrickColor.new("Black")
o80.Position = Vector3.new(18.8859501, 0.96707201, 15.0021019)
o80.Rotation = Vector3.new(-90, -2.50447761e-006, -90.0000076)
o80.Anchored = true
o80.FormFactor = Enum.FormFactor.Custom
o80.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o80.CFrame = CFrame.new(18.8859501, 0.96707201, 15.0021019, -1.51107088e-007, 1, -4.37113812e-008, -6.60488848e-015, 4.37113812e-008, 1, 1, 1.51107088e-007, -4.65359901e-018)
o80.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o80.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o80.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o80.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o80.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o80.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o80.Color = Color3.new(0.105882, 0.164706, 0.207843)
o81.Parent = o80
o81.Scale = Vector3.new(0.249999985, 0.027777778, 0.249999985)
o82.Parent = o1
o82.Material = Enum.Material.SmoothPlastic
o82.BrickColor = BrickColor.new("Dark stone grey")
o82.Position = Vector3.new(18.950964, 0.858749986, 14.8770924)
o82.Rotation = Vector3.new(-180, -2.50796256e-006, 5.00895703e-006)
o82.Anchored = true
o82.FormFactor = Enum.FormFactor.Custom
o82.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o82.CFrame = CFrame.new(18.950964, 0.858749986, 14.8770924, 0.99999994, -8.74227837e-008, -4.37722036e-008, -8.74227837e-008, -0.99999994, 7.17606313e-018, -4.36557599e-008, 1.89421216e-015, -0.999999762)
o82.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o82.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o82.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o82.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o82.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o82.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o82.Color = Color3.new(0.388235, 0.372549, 0.384314)
o83.Parent = o82
o83.Scale = Vector3.new(0.472222239, 0.416666687, 0.222222224)
o83.MeshType = Enum.MeshType.Wedge
o84.Parent = o1
o84.Material = Enum.Material.SmoothPlastic
o84.BrickColor = BrickColor.new("Black")
o84.Position = Vector3.new(18.950964, 1.05040395, 14.9382162)
o84.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o84.Anchored = true
o84.FormFactor = Enum.FormFactor.Custom
o84.Size = Vector3.new(1.24444449, 0.200000003, 0.200000003)
o84.CFrame = CFrame.new(18.950964, 1.05040395, 14.9382162, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o84.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o84.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o84.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o84.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o84.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o84.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o84.Color = Color3.new(0.105882, 0.164706, 0.207843)
o85.Parent = o84
o85.Scale = Vector3.new(1, 0.222222224, 0.722222269)
o86.Parent = o1
o86.Material = Enum.Material.SmoothPlastic
o86.BrickColor = BrickColor.new("Black")
o86.Position = Vector3.new(18.950964, 0.469879985, 14.2215319)
o86.Rotation = Vector3.new(2.05579065e-016, -2.50796006e-006, 6.27987314e-020)
o86.Anchored = true
o86.FormFactor = Enum.FormFactor.Custom
o86.Size = Vector3.new(0.200000003, 0.527777791, 0.211111099)
o86.CFrame = CFrame.new(18.950964, 0.469879985, 14.2215319, 1, -1.0960446e-021, -4.3772161e-008, -7.78546341e-022, 1, -3.58803156e-018, 4.3772161e-008, -5.38120031e-018, 1)
o86.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o86.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o86.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o86.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o86.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o86.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o86.Color = Color3.new(0.105882, 0.164706, 0.207843)
o87.Parent = o86
o87.Scale = Vector3.new(0.666666687, 1, 1)
o87.MeshType = Enum.MeshType.Wedge
o88.Parent = o1
o88.Material = Enum.Material.SmoothPlastic
o88.BrickColor = BrickColor.new("Dark stone grey")
o88.Position = Vector3.new(18.950964, 0.736557007, 14.8798761)
o88.Rotation = Vector3.new(180, -2.50129006e-006, 180)
o88.Anchored = true
o88.FormFactor = Enum.FormFactor.Custom
o88.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o88.CFrame = CFrame.new(18.950964, 0.736557007, 14.8798761, -1, -1.0960446e-021, -4.36557457e-008, 1.41269847e-021, 1, -1.6144448e-018, 4.36557457e-008, -5.38120031e-018, -1)
o88.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o88.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o88.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o88.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o88.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o88.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o88.Color = Color3.new(0.388235, 0.372549, 0.384314)
o89.Parent = o88
o89.Scale = Vector3.new(0.472222239, 0.416666687, 0.249999985)
o89.MeshType = Enum.MeshType.Wedge
o90.Parent = o1
o90.Material = Enum.Material.SmoothPlastic
o90.BrickColor = BrickColor.new("Smoky grey")
o90.Position = Vector3.new(18.950964, 0.683766007, 14.9020796)
o90.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o90.Anchored = true
o90.FormFactor = Enum.FormFactor.Custom
o90.Size = Vector3.new(0.283333331, 0.200000003, 0.200000003)
o90.CFrame = CFrame.new(18.950964, 0.683766007, 14.9020796, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o90.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o90.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o90.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o90.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o90.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o90.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o90.Color = Color3.new(0.356863, 0.364706, 0.411765)
o91.Parent = o90
o91.Scale = Vector3.new(1, 0.111111112, 0.611111104)
o92.Parent = o1
o92.Material = Enum.Material.SmoothPlastic
o92.BrickColor = BrickColor.new("Black")
o92.Position = Vector3.new(18.950964, 0.992074013, 14.9382162)
o92.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o92.Anchored = true
o92.FormFactor = Enum.FormFactor.Custom
o92.Size = Vector3.new(1.24444449, 0.200000003, 0.200000003)
o92.CFrame = CFrame.new(18.950964, 0.992074013, 14.9382162, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o92.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o92.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o92.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o92.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o92.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o92.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o92.Color = Color3.new(0.105882, 0.164706, 0.207843)
o93.Parent = o92
o93.Scale = Vector3.new(1, 0.361111134, 0.666666687)
o94.Parent = o1
o94.Material = Enum.Material.SmoothPlastic
o94.BrickColor = BrickColor.new("Black")
o94.Position = Vector3.new(18.950964, 0.708733976, 14.827096)
o94.Rotation = Vector3.new(-180, 0.0927856117, 180)
o94.Anchored = true
o94.FormFactor = Enum.FormFactor.Custom
o94.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o94.CFrame = CFrame.new(18.950964, 0.708733976, 14.827096, -0.999998689, -1.0960446e-021, 0.00161941373, -1.1745207e-017, 1, 4.66291637e-018, -0.00161941373, -5.38120031e-018, -0.999998689)
o94.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o94.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o94.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o94.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o94.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o94.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o94.Color = Color3.new(0.105882, 0.164706, 0.207843)
o95.Parent = o94
o95.Scale = Vector3.new(0.611111104, 0.138888881, 0.249999985)
o95.MeshType = Enum.MeshType.Wedge
o96.Parent = o1
o96.Material = Enum.Material.SmoothPlastic
o96.BrickColor = BrickColor.new("Black")
o96.Position = Vector3.new(18.950964, 0.797657013, 14.8104324)
o96.Rotation = Vector3.new(180, -2.50129006e-006, 180)
o96.Anchored = true
o96.FormFactor = Enum.FormFactor.Custom
o96.Size = Vector3.new(0.200000003, 0.205555543, 0.200000003)
o96.CFrame = CFrame.new(18.950964, 0.797657013, 14.8104324, -1, -1.0960446e-021, -4.36557457e-008, 1.41269847e-021, 1, -1.6144448e-018, 4.36557457e-008, -5.38120031e-018, -1)
o96.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o96.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o96.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o96.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o96.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o96.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o96.Color = Color3.new(0.105882, 0.164706, 0.207843)
o97.Parent = o96
o97.Scale = Vector3.new(0.472222239, 1, 0.444444448)
o98.Parent = o1
o98.Material = Enum.Material.SmoothPlastic
o98.BrickColor = BrickColor.new("Black")
o98.Position = Vector3.new(18.950964, 0.875427008, 14.8298864)
o98.Rotation = Vector3.new(-180, 0, -6.27987314e-020)
o98.Anchored = true
o98.FormFactor = Enum.FormFactor.Custom
o98.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o98.CFrame = CFrame.new(18.950964, 0.875427008, 14.8298864, 1, 1.0960446e-021, 0, -1.0960446e-021, -1, 5.38120031e-018, 0, 5.38120031e-018, -1)
o98.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o98.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o98.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o98.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o98.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o98.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o98.Color = Color3.new(0.105882, 0.164706, 0.207843)
o99.Parent = o98
o99.Scale = Vector3.new(0.666666687, 0.249999985, 0.194444433)
o99.MeshType = Enum.MeshType.Wedge
o100.Parent = o1
o100.Material = Enum.Material.SmoothPlastic
o100.BrickColor = BrickColor.new("Black")
o100.Position = Vector3.new(18.988184, 0.986526012, 14.8076496)
o100.Rotation = Vector3.new(3.00000024, 90, 0)
o100.Anchored = true
o100.FormFactor = Enum.FormFactor.Custom
o100.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o100.CFrame = CFrame.new(18.988184, 0.986526012, 14.8076496, 2.57358579e-011, -6.64535094e-012, 1, 0.0523359589, 0.99862951, -1.0960446e-021, -0.99862951, 0.0523359627, 0)
o100.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o100.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o100.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o100.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o100.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o100.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o100.Color = Color3.new(0.105882, 0.164706, 0.207843)
o101.Parent = o100
o101.Scale = Vector3.new(0.694444478, 0.249999985, 0.361111134)
o102.Parent = o1
o102.Material = Enum.Material.SmoothPlastic
o102.BrickColor = BrickColor.new("Black")
o102.Position = Vector3.new(18.950964, 0.875427008, 14.8020916)
o102.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o102.Anchored = true
o102.FormFactor = Enum.FormFactor.Custom
o102.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o102.CFrame = CFrame.new(18.950964, 0.875427008, 14.8020916, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o102.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o102.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o102.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o102.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o102.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o102.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o102.Color = Color3.new(0.105882, 0.164706, 0.207843)
o103.Parent = o102
o103.Scale = Vector3.new(0.0833333358, 0.249999985, 0.666666687)
o104.Parent = o1
o104.Material = Enum.Material.SmoothPlastic
o104.BrickColor = BrickColor.new("Really black")
o104.Position = Vector3.new(18.950964, 0.536549985, 14.6048756)
o104.Rotation = Vector3.new(180, 2.50796006e-006, 5.00895612e-006)
o104.Anchored = true
o104.FormFactor = Enum.FormFactor.Custom
o104.Size = Vector3.new(0.200000003, 0.794444382, 0.244444445)
o104.CFrame = CFrame.new(18.950964, 0.536549985, 14.6048756, 1, -8.74227766e-008, 4.3772161e-008, -8.74227766e-008, -1, -3.8177829e-015, 4.3772161e-008, 6.83386182e-018, -1)
o104.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o104.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o104.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o104.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o104.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o104.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o104.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o105.Parent = o104
o105.Scale = Vector3.new(0.694444478, 1, 1)
o105.MeshType = Enum.MeshType.Wedge
o106.Name = "Mag"
o106.Parent = o1
o106.Material = Enum.Material.SmoothPlastic
o106.BrickColor = BrickColor.new("Really black")
o106.Position = Vector3.new(18.950964, 0.56080699, 14.4704056)
o106.Rotation = Vector3.new(101, 90, 0)
o106.Anchored = true
o106.FormFactor = Enum.FormFactor.Custom
o106.Size = Vector3.new(0.872222185, 0.322222203, 0.200000003)
o106.CFrame = CFrame.new(18.950964, 0.56080699, 14.4704056, -2.79885857e-008, -5.65955389e-008, 1, 0.981627166, -0.190809026, 1.66447549e-008, 0.190809026, 0.981627107, 6.10016286e-008)
o106.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o106.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o106.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o106.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o106.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o106.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o106.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o107.Parent = o106
o107.Scale = Vector3.new(1, 1, 0.611111104)
o108.Parent = o1
o108.Material = Enum.Material.SmoothPlastic
o108.BrickColor = BrickColor.new("Smoky grey")
o108.Position = Vector3.new(18.950964, 0.731004, 14.7326536)
o108.Rotation = Vector3.new(-90, 4.32571142e-006, -90.0000076)
o108.Anchored = true
o108.FormFactor = Enum.FormFactor.Custom
o108.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o108.CFrame = CFrame.new(18.950964, 0.731004, 14.7326536, -1.51107088e-007, 1, 7.54979084e-008, 7.25342942e-015, -7.54979084e-008, 1, 1, 1.51107088e-007, 4.14945855e-015)
o108.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o108.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o108.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o108.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o108.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o108.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o108.Color = Color3.new(0.356863, 0.364706, 0.411765)
o109.Parent = o108
o109.Scale = Vector3.new(0.416666687, 0.694444478, 0.416666687)
o110.Parent = o1
o110.Material = Enum.Material.SmoothPlastic
o110.BrickColor = BrickColor.new("Black")
o110.Position = Vector3.new(18.950964, 0.544876993, 14.4409838)
o110.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o110.Anchored = true
o110.FormFactor = Enum.FormFactor.Custom
o110.Size = Vector3.new(0.227777779, 0.711111128, 0.200000003)
o110.CFrame = CFrame.new(18.950964, 0.544876993, 14.4409838, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o110.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o110.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o110.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o110.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o110.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o110.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o110.Color = Color3.new(0.105882, 0.164706, 0.207843)
o111.Parent = o110
o111.Scale = Vector3.new(1, 1, 0.666666687)
o112.Parent = o1
o112.Material = Enum.Material.SmoothPlastic
o112.BrickColor = BrickColor.new("Black")
o112.Position = Vector3.new(18.950964, 0.775434017, 14.7993164)
o112.Rotation = Vector3.new(180, -2.50129006e-006, 180)
o112.Anchored = true
o112.FormFactor = Enum.FormFactor.Custom
o112.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o112.CFrame = CFrame.new(18.950964, 0.775434017, 14.7993164, -1, -1.0960446e-021, -4.36557457e-008, 1.41269847e-021, 1, -1.6144448e-018, 4.36557457e-008, -5.38120031e-018, -1)
o112.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o112.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o112.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o112.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o112.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o112.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o112.Color = Color3.new(0.105882, 0.164706, 0.207843)
o113.Parent = o112
o113.Scale = Vector3.new(0.666666687, 0.249999985, 0.111111112)
o113.MeshType = Enum.MeshType.Wedge
o114.Parent = o1
o114.Material = Enum.Material.SmoothPlastic
o114.BrickColor = BrickColor.new("Black")
o114.Position = Vector3.new(18.950964, 0.730996013, 14.7298584)
o114.Rotation = Vector3.new(180, 0, -90.0000076)
o114.Anchored = true
o114.FormFactor = Enum.FormFactor.Custom
o114.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o114.CFrame = CFrame.new(18.950964, 0.730996013, 14.7298584, -1.94707198e-007, 1, 0, 1, 1.94707169e-007, -4.37113883e-008, -4.37113883e-008, 0, -1)
o114.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o114.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o114.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o114.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o114.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o114.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o114.Color = Color3.new(0.105882, 0.164706, 0.207843)
o115.Parent = o114
o115.Scale = Vector3.new(0.833333373, 0.666666687, 0.805555522)
o116.Parent = o1
o116.Material = Enum.Material.SmoothPlastic
o116.BrickColor = BrickColor.new("Black")
o116.Position = Vector3.new(18.950964, 0.928192973, 14.7298584)
o116.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o116.Anchored = true
o116.FormFactor = Enum.FormFactor.Custom
o116.Size = Vector3.new(0.827777743, 0.200000003, 0.200000003)
o116.CFrame = CFrame.new(18.950964, 0.928192973, 14.7298584, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o116.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o116.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o116.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o116.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o116.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o116.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o116.Color = Color3.new(0.105882, 0.164706, 0.207843)
o117.Parent = o116
o117.Scale = Vector3.new(1, 0.277777761, 0.666666687)
o118.Parent = o1
o118.Material = Enum.Material.SmoothPlastic
o118.BrickColor = BrickColor.new("Black")
o118.Position = Vector3.new(18.950964, 0.825424016, 14.7993164)
o118.Rotation = Vector3.new(-180, 0, -6.27987314e-020)
o118.Anchored = true
o118.FormFactor = Enum.FormFactor.Custom
o118.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o118.CFrame = CFrame.new(18.950964, 0.825424016, 14.7993164, 1, 1.0960446e-021, 0, -1.0960446e-021, -1, 5.38120031e-018, 0, 5.38120031e-018, -1)
o118.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o118.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o118.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o118.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o118.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o118.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o118.Color = Color3.new(0.105882, 0.164706, 0.207843)
o119.Parent = o118
o119.Scale = Vector3.new(0.666666687, 0.249999985, 0.111111112)
o119.MeshType = Enum.MeshType.Wedge
o120.Parent = o1
o120.Material = Enum.Material.SmoothPlastic
o120.BrickColor = BrickColor.new("Black")
o120.Position = Vector3.new(18.950964, 0.600430012, 14.4798584)
o120.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o120.Anchored = true
o120.FormFactor = Enum.FormFactor.Custom
o120.Size = Vector3.new(0.200000003, 0.666666687, 0.200000003)
o120.CFrame = CFrame.new(18.950964, 0.600430012, 14.4798584, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o120.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o120.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o120.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o120.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o120.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o120.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o120.Color = Color3.new(0.105882, 0.164706, 0.207843)
o121.Parent = o120
o121.Scale = Vector3.new(0.027777778, 1, 0.694444478)
o122.Parent = o1
o122.Material = Enum.Material.SmoothPlastic
o122.BrickColor = BrickColor.new("Black")
o122.Position = Vector3.new(18.950964, 0.980957985, 14.5104237)
o122.Rotation = Vector3.new(2.05579065e-016, -2.50796006e-006, 6.27987314e-020)
o122.Anchored = true
o122.FormFactor = Enum.FormFactor.Custom
o122.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o122.CFrame = CFrame.new(18.950964, 0.980957985, 14.5104237, 1, -1.0960446e-021, -4.3772161e-008, -7.78546341e-022, 1, -3.58803156e-018, 4.3772161e-008, -5.38120031e-018, 1)
o122.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o122.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o122.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o122.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o122.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o122.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o122.Color = Color3.new(0.105882, 0.164706, 0.207843)
o123.Parent = o122
o123.Scale = Vector3.new(0.694444478, 0.0833333358, 0.333333343)
o123.MeshType = Enum.MeshType.Wedge
o124.Parent = o1
o124.Material = Enum.Material.SmoothPlastic
o124.BrickColor = BrickColor.new("Black")
o124.Position = Vector3.new(18.950964, 0.961513996, 14.6854324)
o124.Rotation = Vector3.new(180, -2.50129006e-006, 180)
o124.Anchored = true
o124.FormFactor = Enum.FormFactor.Custom
o124.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o124.CFrame = CFrame.new(18.950964, 0.961513996, 14.6854324, -1, -1.0960446e-021, -4.36557457e-008, 1.41269847e-021, 1, -1.6144448e-018, 4.36557457e-008, -5.38120031e-018, -1)
o124.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o124.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o124.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o124.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o124.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o124.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o124.Color = Color3.new(0.105882, 0.164706, 0.207843)
o125.Parent = o124
o125.Scale = Vector3.new(0.694444478, 0.277777761, 0.416666687)
o125.MeshType = Enum.MeshType.Wedge
o126.Parent = o1
o126.Material = Enum.Material.SmoothPlastic
o126.BrickColor = BrickColor.new("Really black")
o126.Position = Vector3.new(18.950964, 0.803216994, 14.6715384)
o126.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o126.Anchored = true
o126.FormFactor = Enum.FormFactor.Custom
o126.Size = Vector3.new(0.244444445, 0.200000003, 0.200000003)
o126.CFrame = CFrame.new(18.950964, 0.803216994, 14.6715384, 0, -1.0960446e-021, 1, 5.38120031e-018, 1, -1.0960446e-021, -1, -5.38120031e-018, 0)
o126.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o126.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o126.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o126.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o126.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o126.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o126.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o127.Parent = o126
o127.Scale = Vector3.new(1, 0.972222209, 0.666666687)
o128.Parent = o1
o128.Material = Enum.Material.SmoothPlastic
o128.BrickColor = BrickColor.new("Really black")
o128.Position = Vector3.new(18.950964, 0.672379017, 14.6450357)
o128.Rotation = Vector3.new(-30.0000038, 90, 0)
o128.Anchored = true
o128.FormFactor = Enum.FormFactor.Custom
o128.Size = Vector3.new(0.205555543, 0.200000003, 0.200000003)
o128.CFrame = CFrame.new(18.950964, 0.672379017, 14.6450357, 4.20376836e-008, -2.60188173e-008, 1, -0.50000006, 0.866025388, 4.35066809e-008, -0.866025388, -0.50000006, 2.33994797e-008)
o128.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o128.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o128.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o128.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o128.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o128.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o128.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o129.Parent = o128
o129.Scale = Vector3.new(1, 0.722222269, 0.666666687)
o130.Parent = o1
o130.Material = Enum.Material.SmoothPlastic
o130.BrickColor = BrickColor.new("Really black")
o130.Position = Vector3.new(18.950964, 0.619874001, 14.3270836)
o130.Rotation = Vector3.new(2.05579065e-016, -2.50796006e-006, 6.27987314e-020)
o130.Anchored = true
o130.FormFactor = Enum.FormFactor.Custom
o130.Size = Vector3.new(0.200000003, 0.705555558, 0.300000012)
o130.CFrame = CFrame.new(18.950964, 0.619874001, 14.3270836, 1, -1.0960446e-021, -4.3772161e-008, -7.78546341e-022, 1, -3.58803156e-018, 4.3772161e-008, -5.38120031e-018, 1)
o130.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o130.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o130.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o130.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o130.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o130.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o130.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o131.Parent = o130
o131.Scale = Vector3.new(0.694444478, 1, 1)
o131.MeshType = Enum.MeshType.Wedge
o132.Parent = o1
o132.Material = Enum.Material.SmoothPlastic
o132.BrickColor = BrickColor.new("Black")
o132.Position = Vector3.new(18.950964, 1.15317094, 14.2876415)
o132.Rotation = Vector3.new(30.0000019, 90, 0)
o132.Anchored = true
o132.FormFactor = Enum.FormFactor.Custom
o132.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o132.CFrame = CFrame.new(18.950964, 1.15317094, 14.2876415, 1.28167699e-010, -5.82076609e-011, 1, 0.5, 0.866025388, -1.0960446e-021, -0.866025388, 0.5, 0)
o132.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o132.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o132.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o132.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o132.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o132.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o132.Color = Color3.new(0.105882, 0.164706, 0.207843)
o133.Parent = o132
o133.Scale = Vector3.new(0.388888866, 0.194444433, 0.416666687)
o134.Parent = o1
o134.Material = Enum.Material.SmoothPlastic
o134.BrickColor = BrickColor.new("Black")
o134.Position = Vector3.new(18.950964, 1.10315704, 14.3126564)
o134.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o134.Anchored = true
o134.FormFactor = Enum.FormFactor.Custom
o134.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o134.CFrame = CFrame.new(18.950964, 1.10315704, 14.3126564, 0, -5.9604659e-008, 1, 5.38120031e-018, 1, 5.9604659e-008, -1, -5.38374141e-018, 0)
o134.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o134.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o134.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o134.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o134.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o134.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o134.Color = Color3.new(0.105882, 0.164706, 0.207843)
o135.Parent = o134
o135.Scale = Vector3.new(0.027777778, 0.861111045, 0.416666687)
o136.Parent = o1
o136.Material = Enum.Material.SmoothPlastic
o136.BrickColor = BrickColor.new("Black")
o136.Position = Vector3.new(18.950964, 0.969842017, 14.2187424)
o136.Rotation = Vector3.new(2.05579065e-016, -2.50796006e-006, 6.27987314e-020)
o136.Anchored = true
o136.FormFactor = Enum.FormFactor.Custom
o136.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o136.CFrame = CFrame.new(18.950964, 0.969842017, 14.2187424, 1, -1.0960446e-021, -4.3772161e-008, -7.78546341e-022, 1, -3.58803156e-018, 4.3772161e-008, -5.38120031e-018, 1)
o136.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o136.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o136.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o136.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o136.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o136.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o136.Color = Color3.new(0.105882, 0.164706, 0.207843)
o137.Parent = o136
o137.Scale = Vector3.new(0.666666687, 0.249999985, 0.74999994)
o137.MeshType = Enum.MeshType.Wedge
o138.Parent = o1
o138.Material = Enum.Material.SmoothPlastic
o138.BrickColor = BrickColor.new("Black")
o138.Position = Vector3.new(18.950964, 0.919857979, 14.2271004)
o138.Rotation = Vector3.new(-0.600734293, 89.980217, -5.99351438e-007)
o138.Anchored = true
o138.FormFactor = Enum.FormFactor.Custom
o138.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o138.CFrame = CFrame.new(18.950964, 0.919857979, 14.2271004, 4.06289615e-008, 4.25005558e-016, 0.99999994, -6.70552254e-008, 0.999999881, 4.68723726e-010, -1.00000012, -9.68575407e-008, 4.47034694e-008)
o138.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o138.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o138.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o138.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o138.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o138.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o138.Color = Color3.new(0.105882, 0.164706, 0.207843)
o139.Parent = o138
o139.Scale = Vector3.new(0.888888896, 0.249999985, 0.666666687)
o140.Parent = o1
o140.Material = Enum.Material.SmoothPlastic
o140.BrickColor = BrickColor.new("Black")
o140.Position = Vector3.new(18.950964, 1.17262495, 14.2539701)
o140.Rotation = Vector3.new(30.0000038, 1.24663654e-006, -90)
o140.Anchored = true
o140.FormFactor = Enum.FormFactor.Custom
o140.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o140.CFrame = CFrame.new(18.950964, 1.17262495, 14.2539701, -4.959292e-008, 1, 2.17579128e-008, -0.866025388, -3.19989653e-008, -0.50000006, -0.50000006, -4.36557457e-008, 0.866025388)
o140.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o140.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o140.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o140.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o140.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o140.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o140.Color = Color3.new(0.105882, 0.164706, 0.207843)
o141.Parent = o140
o141.Scale = Vector3.new(0.194444433, 0.416666687, 0.194444433)
o142.Parent = o1
o142.Material = Enum.Material.SmoothPlastic
o142.BrickColor = BrickColor.new("Really black")
o142.Position = Vector3.new(18.950964, 1.10038495, 14.3182096)
o142.Rotation = Vector3.new(3.08320072e-016, 90, 0)
o142.Anchored = true
o142.FormFactor = Enum.FormFactor.Custom
o142.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o142.CFrame = CFrame.new(18.950964, 1.10038495, 14.3182096, 0, -2.98023295e-008, 1, 5.38120031e-018, 1, 2.98023295e-008, -1, -1.91260039e-018, 0)
o142.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o142.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o142.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o142.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o142.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o142.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o142.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o143.Parent = o142
o143.Scale = Vector3.new(0.027777778, 0.722222269, 0.388888866)
o144.Parent = o1
o144.Material = Enum.Material.SmoothPlastic
o144.BrickColor = BrickColor.new("Black")
o144.Position = Vector3.new(18.950964, 0.986526012, 14.2826424)
o144.Rotation = Vector3.new(3.08320072e-016, 0, 6.27987314e-020)
o144.Anchored = true
o144.FormFactor = Enum.FormFactor.Custom
o144.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
o144.CFrame = CFrame.new(18.950964, 0.986526012, 14.2826424, 1, -1.0960446e-021, 0, -1.0960446e-021, 1, -5.38120031e-018, 0, -5.38120031e-018, 1)
o144.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o144.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o144.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o144.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o144.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o144.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o144.Color = Color3.new(0.105882, 0.164706, 0.207843)
o145.Parent = o144
o145.Scale = Vector3.new(0.666666687, 0.416666687, 0.333333343)
o145.MeshType = Enum.MeshType.Wedge
o146.Parent = o1
o146.Material = Enum.Material.SmoothPlastic
o146.BrickColor = BrickColor.new("Really black")
o146.Position = Vector3.new(18.950964, 0.872651994, 14.2770796)
o146.Rotation = Vector3.new(2.18855899e-013, 2.50129006e-006, 180)
o146.Anchored = true
o146.FormFactor = Enum.FormFactor.Custom
o146.Size = Vector3.new(0.200000003, 0.200000003, 0.211111099)
o146.CFrame = CFrame.new(18.950964, 0.872651994, 14.2770796, -1, -8.74227766e-008, 4.36557457e-008, 8.74227766e-008, -1, -3.81975606e-015, 4.36557457e-008, 6.83386182e-018, 1)
o146.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o146.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o146.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o146.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o146.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o146.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o146.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o147.Parent = o146
o147.Scale = Vector3.new(0.666666687, 0.277777761, 1)
o147.MeshType = Enum.MeshType.Wedge
o148.Name = "Handle"
o148.Parent = o1
o148.Material = Enum.Material.SmoothPlastic
o148.BrickColor = BrickColor.new("Really black")
o148.Transparency = 1
o148.Position = Vector3.new(18.9506321, 0.598004997, 14.4106464)
o148.Rotation = Vector3.new(180, -2.50129006e-006, 180)
o148.Anchored = true
o148.FormFactor = Enum.FormFactor.Custom
o148.Size = Vector3.new(0.200000003, 0.205555543, 0.200000003)
o148.CFrame = CFrame.new(18.9506321, 0.598004997, 14.4106464, -1, -1.0960446e-021, -4.36557457e-008, 1.41269847e-021, 1, -1.6144448e-018, 4.36557457e-008, -5.38120031e-018, -1)
o148.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o148.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o148.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o148.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o148.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o148.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o148.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o149.Name = "FireSound"
o149.Parent = o148
o149.SoundId = "rbxassetid://330704232"
o149.Volume = 10
o150.Parent = o148
o150.Scale = Vector3.new(0.99999994, 1, 0.99999994)
Victim = game.Players.LocalPlayer.Character
function Suicide ()
	    Victim.Torso.Neck.C0 = CFrame.new(0,1.5,0) * CFrame.Angles(math.rad(25), -math.rad(0),-math.rad(0))
        Victim.Torso.Neck.C1 = CFrame.new(0,0,0)
		wait(.02)
	    Victim.Torso["Right Shoulder"].C0 = CFrame.new(2.3,.5,0) * CFrame.Angles(math.rad(-90), -math.rad(160),-math.rad(-70))
        Victim.Torso["Right Shoulder"].C1 = CFrame.new(0,0,0)
		ANGLE = -70
		ANGLE2 = -20
		for i=1,7 do
		ANGLE = ANGLE + 10
		ANGLE2 = ANGLE2 + 10
		Victim.Torso["Right Shoulder"].C0 = CFrame.new(2.3,.5,0) * CFrame.Angles(math.rad(-90), -math.rad(160),-math.rad(ANGLE))
        Victim.Torso["Right Shoulder"].C1 = CFrame.new(0,0,0)
		wait(1/30)
		end
		wait(.3)
		o1.Handle.FireSound.Parent = workspace
		workspace.FireSound:Play()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		game.Players.LocalPlayer.Character.Head.BrickColor = BrickColor.new("Maroon")
		player = game.Players[Victim.Name]
char = player.Character
			char.Archivable = true
			local rg = char:Clone()
			rg.HumanoidRootPart:Destroy()
			rg.Name = ""
			rg.Humanoid.MaxHealth = 0

			for i, v in pairs(rg.Torso:GetChildren()) do
				if v:IsA("Glue") or v:IsA("Motor6D") then
					v:Destroy()
				end
			end
									
			local n = Instance.new("Glue", rg.Torso)
			n.Name = "Neck"
			n.Part0 = rg.Torso
			n.Part1 = rg.Head
			n.C0 = CFrame.new(0, 1, 0)
			n.C1 = CFrame.new(0, -0.5, 0)

			
			local rs = Instance.new("Glue", rg.Torso)
			rs.Name = "Right Shoulder"
			rs.Part0 = rg.Torso
			rs.Part1 = rg["Right Arm"]
			rs.C0 = CFrame.new(1.5, 0.5, 0)
			rs.C1 = CFrame.new(0, 0.5, 0)
			local ls = Instance.new("Glue", rg.Torso)
			ls.Name = "Left Shoulder"
			ls.Part0 = rg.Torso
			ls.Part1 = rg["Left Arm"]
			ls.C0 = CFrame.new(-1.5, 0.5, 0)
			ls.C1 = CFrame.new(0, 0.5, 0)
			
			local rh = Instance.new("Glue", rg.Torso)
			rh.Name = "Right Hip"
			rh.Part0 = rg.Torso
			rh.Part1 = rg["Right Leg"]
			rh.C0 = CFrame.new(0.5, -1, 0)
			rh.C1 = CFrame.new(0, 1, 0)
			local lh = Instance.new("Glue", rg.Torso)
			lh.Name = "Left Hip"
			lh.Part0 = rg.Torso
			lh.Part1 = rg["Left Leg"]
			lh.C0 = CFrame.new(-0.5, -1, 0)
			lh.C1 = CFrame.new(0, 1, 0)
			char.Torso:Destroy()
			char.Head:Destroy()
			char["Left Leg"]:Destroy()
			char["Left Arm"]:Destroy()
			char["Right Leg"]:Destroy()
			char["Right Arm"]:Destroy()
			rg.Parent = game.Workspace
			rg.Head.BrickColor = BrickColor.new("Maroon")
			rg.Torso.Neck:Destroy()
						for i, v in pairs(rg.Torso:GetChildren()) do
				if v:IsA("Motor6D") then
					v:Destroy()
				end
			end
function DEATH ()
OHHNELLY = Instance.new("Part")
OHHNELLY.Parent = rg
OHHNELLY.Anchored = false
OHHNELLY.Material = Enum.Material.SmoothPlastic
OHHNELLY.BrickColor = BrickColor.new("Maroon")
OHHNELLY.Size = Vector3.new(0.200000003, 0.200000003, 0.200000003)
OHHNELLY.Position = rg.Head.Position
OHHNELLY.Color = Color3.new(0.458824, 0, 0)
OHHNELLY.BackSurface = Enum.SurfaceType.SmoothNoOutlines
OHHNELLY.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
OHHNELLY.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
OHHNELLY.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
OHHNELLY.RightSurface = Enum.SurfaceType.SmoothNoOutlines
OHHNELLY.TopSurface = Enum.SurfaceType.SmoothNoOutlines
end
for i=1, 10 do
	DEATH()
	print"BLOODY"
	wait()
end
end
function Weld(x,y)
	local W = Instance.new("Weld")
	W.Part0 = x
	W.Part1 = y
	local CJ = CFrame.new(x.Position)
	local C0 = x.CFrame:inverse()*CJ
	local C1 = y.CFrame:inverse()*CJ
	W.C0 = C0
	W.C1 = C1
	W.Parent = x
end

function Get(A)
	if A.className == "Part" then
		Weld(o1.Handle, A)
		A.Anchored = false
	else
		local C = A:GetChildren()
		for i=1, #C do
		Get(C[i])
		end
	end
end

function Finale()
	Get(o1)
end

o1.Equipped:connect(Finale)
o1.Unequipped:connect(Finale)
o1.Activated:connect(Suicide)
Finale()
end)

--Hubs
local Hubs = Window:NewTab("Hubs")
local HubsSection = Hubs:NewSection("Hubs")

HubsSection:NewButton("Infinite Yield", "Infinite Yield", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

HubsSection:NewButton("Replication UI", "Replication UI", function()
    local screenGui = game:GetObjects("rbxassetid://3546404827")[1]
  local mainFrame = screenGui.Frame
    local pages = mainFrame.Pages
      local pageLayout = pages.UIPageLayout
      local pageScripts = pages.Scripts
        local interactiveButton = pageScripts.Character.Elements.TextButton
        local utility = pageScripts.Utility
          local utilityElements = utility.Elements
      local pageOptions = pages.Options
    local titleFrame = mainFrame.Title
    local toolbar = mainFrame.Toolbar

screenGui.LocalScript:Destroy()
screenGui.Parent = game:GetService("CoreGui")
interactiveButton.Parent = nil
mainFrame.Visible = true

gripCenter = CFrame.new(0, 0, 1) * CFrame.Angles(math.rad(90), 0, 0)
offset = CFrame.Angles(0, 0, 0)

_player = {
	p = game:GetService("Players").LocalPlayer;
	b = function()
		return _player.p:FindFirstChild("Backpack")
	end;
	c = function()
		return _player.p.Character
	end;
}
_functions = {
	respawn = function()
		local c = _player.c()
		if workspace:FindFirstChild(_player.p.Name) then 
			spawn(function()
				wait(.5)
				if _player.c() ~= workspace:FindFirstChild(_player.p.Name) then
					workspace:FindFirstChild(_player.p.Name):BreakJoints()
				end
			end)
		end
		if c then
			c:BreakJoints()
			c:ClearAllChildren()
		end
		local newChar = Instance.new("Model", workspace)
		local hum = Instance.new("Humanoid", newChar)
		local torso = Instance.new("Part", newChar)
		newChar.Name = "respawn_"
		torso.Name = "Torso"
		torso.Transparency = 1
		_player.p.Character = newChar
		torso.Name = ""
		torso.CanCollide = false
		newChar:MoveTo(Vector3.new(999999, 999999, 999999))
	end;
	tools = function(int)
		local toolamount = int or 200
		
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local runservice = game:GetService("RunService")
		LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
		local currentamount = #LocalPlayer.Backpack:GetChildren()
		LocalPlayer.Character.Archivable = true
		local tempchar = LocalPlayer.Character:Clone()
		local lastchar = nil
		tempchar.Parent = workspace
		local savepos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
		local renderstepped = runservice.RenderStepped:Connect(function()
		    workspace.CurrentCamera.CameraSubject = tempchar:FindFirstChild("Humanoid")
		    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
			   	if tool:IsA("Tool") then
		            tool.Parent = LocalPlayer
		        end
		    end
			for _, char in pairs(workspace:GetChildren()) do
				if char.Name == LocalPlayer.Name and char:FindFirstChildWhichIsA("Humanoid") then
					char.Humanoid.Health = 0
				end
			end
		    LocalPlayer.Character:ClearAllChildren()
		    local char = Instance.new("Model", workspace)
		    Instance.new("Humanoid", char)
		    LocalPlayer.Character = char
		    if lastchar ~= nil then
		        lastchar:Destroy()
		    end
		    repeat runservice.RenderStepped:Wait() until LocalPlayer.Character ~= nil
		    lastchar = char
		end)
		repeat runservice.RenderStepped:Wait() until #LocalPlayer:GetChildren() - 3 - currentamount >= toolamount
		renderstepped:Disconnect()
		repeat runservice.RenderStepped:Wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil
		lastchar:Destroy()
		
		utilityElements.Tools.Text = "Done respawning?"
		repeat runservice.RenderStepped:Wait() until utilityElements.Tools.Text == "Load Tools"
		
		for _, tool in pairs(LocalPlayer:GetChildren()) do
		    if tool:IsA("Tool") then
		        tool.Parent = LocalPlayer.Backpack
		    end
		end
		LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = savepos
		tempchar:Destroy()
	end;
	load = function()
		local b = _player.b()
		local c = _player.c()
		local grip = function(tool, cf)
			local origin = CFrame.new(cf.p)
			local x, y, z = cf:toEulerAnglesXYZ()
			local new = CFrame.Angles(x, y, z)
			local grip = (origin * new):inverse()
			tool.Grip = grip
		end
		local model = c:WaitForChild("gay") -- stupid name choice from what a few months ago?? i have nothing against it i swear
		local parts = {}
		wait(1)
		
		for i, Model in pairs(c:GetChildren()) do
			if Model:IsA("Model") and Model.Name == "gay" then
				for i, v in pairs(Model:GetDescendants()) do
					if v:IsA("BasePart") then
						v.LocalTransparencyModifier = 1
						if v.Name ~= "Ignore" then
							table.insert(parts, v)
						end
					end
					if not v:IsA("BasePart") and not v:IsA("JointInstance") and not v:IsA("BodyMover") and not v:isA("Humanoid") and not v:IsA("Model") then
						v:Remove()
					end
				end
				Model.ChildAdded:Connect(function(c)
					c.Parent = nil
				end)
			end
		end
		
		for _, part in pairs(parts) do
			local m = Instance.new("BlockMesh", part)
			m.Scale = Vector3.new(0, 0, 0)
		end
		
		local tools = b:GetChildren()
		for i, tool in pairs(tools) do
			if tool.Parent then
				wrap(function()
					tool.Parent = c
					for i, v in pairs(tool:GetDescendants()) do
						if v:IsA("Sound") or v:IsA("TouchTransmitter") then
							v:Destroy()
						elseif v:IsA("BasePart") then
							v.Massless = true
							v.CanCollide = false
						elseif v:IsA("LocalScript") or v:IsA("Script") then
							v:Destroy()
						end
					end
					
					if tool:FindFirstChild("Handle") then
						local handle = tool.Handle
						local fakeHandle = handle:Clone()
						fakeHandle.Name = "FakeHandle"
						fakeHandle.Parent = tool
						local w = Instance.new("Weld", handle)
						w.Part0 = fakeHandle
						w.Part1 = handle
						handle.Size = Vector3.new(0, 0, 0)
					end
					
					tool.Parent = b
				end)
			end
			if (not parts[i]) then
				tools[i] = nil
				tool:Destroy()
			end
		end
		
		wait(.2)
		local amt = #tools
		
		wrap(function()
			local connection1
			
			connection1 = game:GetService("RunService").RenderStepped:Connect(function(step)
				for i = 1, amt do
					local tool = tools[i]
					if parts[i] then
						tool.Parent = b
						tool.Parent = c
					end
				end
				
				if _player.c() ~= c or c:FindFirstChildWhichIsA("Humanoid").Health == 0 then
					connection1:Disconnect()
				end
				
				utilityElements.Replicate.Text = ("Replicate (%dfps)"):format(1/step)
			end)
		end)
		
		local connection2
		connection2 = game:GetService("RunService").Heartbeat:Connect(function()
			for i = 1, amt do
				local tool = tools[i]
				if parts[i] then
					if parts[i].Transparency ~= 1 then
						local p = _cframe.toWorldPoint(parts[i].CFrame) * offset
						grip(tool, p)
					else
						local p = _cframe.toWorldPoint(CFrame.new(0, -250, 0))
						grip(tool, p)
					end
				end
			end
			if _player.c() ~= c or c:FindFirstChildWhichIsA("Humanoid").Health == 0 then
				connection2:Disconnect()
			end
		end)
	end;
}
_cframe = {
	diff = function(a, b)
		return (a:Inverse() * b)
	end;
	toWorldPoint = function(a)
		local arm = _player.c():FindFirstChild('Right Arm') or _player.c():FindFirstChild('RightHand')
		local off = arm.CFrame * gripCenter:Inverse()
		if arm.Name == "RightHand" then
			off = arm.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
		end
		return _cframe.diff(off, a)
	end;
	tween = function(object,style,direction,t,goal)
	    local tweenservice = game:GetService("TweenService")
	    local tweenInfo = TweenInfo.new(t,Enum.EasingStyle[style],Enum.EasingDirection[direction])
	    local tween = tweenservice:Create(object,tweenInfo,goal)
	    tween:Play()
	    return tween
	end;
}
scriptList = {
	Character = {
		['Titan']			= {"rbxassetid://3600286284", "rbxassetid://3070358214"};
		['Winged Titan']	= {"rbxassetid://3593786550", "rbxassetid://3070358214"};
		['Part Surround']	= {"rbxassetid://3546680077", "rbxassetid://3546673786"};
	},
	Mechanical = {
		['Spiderbot']		= {"rbxassetid://3040869607", "rbxassetid://3070355648"};
		['Drone']			= {"rbxassetid://3074236927", "rbxassetid://3074245958"};
		['Noise']			= {"rbxassetid://3193712297", "rbxassetid://3070358314"};
	},
	Aesthetic = {
		['Wings']			= {"rbxassetid://3040946714", "rbxassetid://3070358381"};
		['Tail']			= {"rbxassetid://3041387168", "rbxassetid://3070358314"};
		['Star Glitcher']	= {"rbxassetid://3074734519", "rbxassetid://3074751071"};
		['Tentacles']		= {"rbxassetid://3074817074", "rbxassetid://3074820325"};
	},
	Weapon = {
		['Master Hand']		= {"rbxassetid://3040943596", "rbxassetid://3070358267"};
		['Ravenger']		= {"rbxassetid://3040945482", "rbxassetid://3070358154"};
	},
}
wrap = function(f)
	return coroutine.wrap(f)()
end

if game:GetService("RunService"):IsStudio() then
	guiLib = require(screenGui.GuiLib)
else
	guiLib = loadstring(screenGui.GuiLib.Source)()
end

for title, tbl in pairs(scriptList) do
	local frame = pageScripts[title]
	for name, info in pairs(tbl) do
		local btn = interactiveButton:Clone()
		btn.Name = name
		btn.Text = name
		btn.Parent = frame.Elements
		btn.Icon.Image = info[2]
		
		guiLib.circleInteractive(btn)
		guiLib.colorInteractive(btn)
		
		btn.MouseButton1Click:Connect(function()
			local scr = game:GetObjects(info[1])[1]
			local source = scr.Source
			
			if game:GetService("RunService"):IsStudio() == false then
				for i, v in pairs(scr:GetChildren()) do
					v.Parent = script
				end
				wrap(function()
					local func = loadstring(source)
					spawn(func)
				end)
			else
				scr.Disabled = true
				scr.Parent = _player.c()
				wait(.1)
				scr.Disabled = false
			end
		end)
	end
end

repeat wait() until pageLayout.CurrentPage

guiLib.draggable(mainFrame, titleFrame)
for i, v in pairs(toolbar:GetChildren()) do
	if v:IsA("TextButton") then
		guiLib.circleInteractive(v, 2, 1)
		v.MouseButton1Click:Connect(function()
			pageLayout:JumpTo(pages[v.Name])
		end)
		pageLayout.Changed:Connect(function(p)
			if pageLayout.CurrentPage.Name == v.Name then
				guiLib.tween(v, "Sine", "Out", .5, {BackgroundColor3 = Color3.fromRGB(255, 118, 26)})
			else
				guiLib.tween(v, "Sine", "Out", .5, {BackgroundColor3 = Color3.fromRGB(236, 109, 17)})
			end
		end)
	end
end

for i, v in pairs(utilityElements:GetChildren()) do
	if v:IsA("TextButton") then
		guiLib.circleInteractive(v)
		guiLib.colorInteractive(v)
	end
end

utilityElements.Reset.MouseButton1Click:Connect(function()
	local c = _player.c()
	c.Humanoid.Health = 0
	wait(.55)
	for i, v in pairs(c:GetChildren()) do
		if v:IsA("BackpackItem") then
			v.Parent = _player.b()
			v.Parent = _player.p
		end
	end
	repeat wait() until _player.c() ~= c
	_player.c():WaitForChild("Right Arm")
	wait(.25)
	for i, v in pairs(_player.p:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = _player.b()
		end
	end
end)

utilityElements.Block.MouseButton1Click:Connect(function()
	local c = _player.c()
	for _, v in pairs(c:GetChildren()) do
		if v:IsA("BackpackItem") then
			for _, m in pairs(v:GetDescendants()) do
				if m:IsA("DataModelMesh") then
					m:Destroy()
				end
			end
		end
	end
end)

local noclip = false
utilityElements.Noclip.MouseButton1Click:Connect(function()
	noclip = not noclip
end)

utilityElements.Tools.MouseButton1Click:Connect(function()
	if utilityElements.Tools.Text == "Load Tools" then
		_functions.tools(120)
	else
		utilityElements.Tools.Text = "Load Tools"
	end
end)

utilityElements.Replicate.MouseButton1Click:Connect(function()
	_functions.load()
end)

local flipped = 0
utilityElements.Flip.MouseButton1Click:Connect(function()
	flipped = (flipped + 1) % 4
	if flipped == 0 then
		offset = CFrame.Angles(0, 0, 0)
	elseif flipped == 1 then
		offset = CFrame.Angles(math.rad(90), 0, 0)
	elseif flipped == 2 then
		offset = CFrame.Angles(0, math.rad(90), 0)
	elseif flipped == 3 then
		offset = CFrame.Angles(0, 0, math.rad(90))
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	local c = _player.c()
	if noclip then
		local descendants = c:GetDescendants()
		for i = 1, #descendants do
			local v = descendants[i]
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
				v.CanCollide = false
			end
		end
	end
end)

workspace:WaitForChild("S")
end)

HubsSection:NewButton("OP Finality", "OP Finality", function()
    wait(0.3)
-- Objects
-- CREDIT TO xFunnieuss / Timeless for partial (short) names.

OPFinality = Instance.new("ScreenGui")
MainFrame = Instance.new("Frame")
TopFrame = Instance.new("Frame")
CloseGUI = Instance.new("TextButton")
MenuEnterFrame = Instance.new("Frame")
Title = Instance.new("TextLabel")
OpenMenu = Instance.new("ImageButton")
Pages = Instance.new("Frame")
Information = Instance.new("Frame")
Image_FE_ENABLED = Instance.new("ImageLabel")
Text_FE_ENABLED = Instance.new("TextLabel")
WhatIsOPFinality = Instance.new("TextLabel")
Text_FE_DISABLED = Instance.new("TextLabel")
OPFin_Description = Instance.new("TextLabel")
OPFin_Warning = Instance.new("TextLabel")
Info_Bar = Instance.new("Frame")
Info_Background = Instance.new("Frame")
Warning_Bar = Instance.new("Frame")
Warning_Background = Instance.new("Frame")
Info_Image = Instance.new("ImageLabel")
Image_FE_DISABLED = Instance.new("ImageLabel")
Warn_Image = Instance.new("ImageLabel")
Others_1 = Instance.new("Frame")
OthersTitle = Instance.new("TextLabel")
Char_Image = Instance.new("ImageLabel")
OthersText = Instance.new("TextLabel")
TXTBOX_PlrName = Instance.new("TextBox")
othersBaseBackground = Instance.new("Frame")
TeleportTo = Instance.new("TextButton")
Annoy = Instance.new("TextButton")
Follow = Instance.new("TextButton")
View = Instance.new("TextButton")
Orbit = Instance.new("TextButton")
HeadWalk = Instance.new("TextButton")
Stick = Instance.new("TextButton")
Spam = Instance.new("TextButton")
Carpet = Instance.new("TextButton")
Others_toPAGE2 = Instance.new("TextButton")
Character_toPAGE2_IMAGE = Instance.new("ImageLabel")
Character_2 = Instance.new("Frame")
CharacterTitle = Instance.new("TextLabel")
CharacterText = Instance.new("TextLabel")
Animations_SPOOKY = Instance.new("Frame")
spookytitle = Instance.new("TextLabel")
headthrow = Instance.new("TextButton")
armsoff = Instance.new("TextButton")
loophead = Instance.new("TextButton")
levitate = Instance.new("TextButton")
headfloat = Instance.new("TextButton")
Character_backPAGE1 = Instance.new("TextButton")
Character_toPAGE1_IMAGE = Instance.new("ImageLabel")
Animations_DANCE = Instance.new("Frame")
dancetitle = Instance.new("TextLabel")
normal = Instance.new("TextButton")
movingdance = Instance.new("TextButton")
insane = Instance.new("TextButton")
happy = Instance.new("TextButton")
spindance = Instance.new("TextButton")
Animations_HEROIC = Instance.new("Frame")
heroictitle = Instance.new("TextLabel")
swordstrike = Instance.new("TextButton")
jumpland = Instance.new("TextButton")
punches = Instance.new("TextButton")
swing = Instance.new("TextButton")
crawl = Instance.new("TextButton")
Char2_Image = Instance.new("ImageLabel")
Character_1 = Instance.new("Frame")
CharacterTitle_2 = Instance.new("TextLabel")
Char_Image_2 = Instance.new("ImageLabel")
CharacterText_2 = Instance.new("TextLabel")
TXTBOX_Stats = Instance.new("TextBox")
BackGroundChar = Instance.new("Frame")
HipHeight = Instance.new("TextButton")
JumpHeight = Instance.new("TextButton")
Speed = Instance.new("TextButton")
TXTBOX_Chat = Instance.new("TextBox")
BackGroundChar2 = Instance.new("Frame")
Chat = Instance.new("TextButton")
Spam_2 = Instance.new("TextButton")
BackGroundChar3 = Instance.new("Frame")
Noclip = Instance.new("TextButton")
Fly = Instance.new("TextButton")
Character_toPAGE2 = Instance.new("TextButton")
Character_toPAGE2_IMAGE_2 = Instance.new("ImageLabel")
Others_2 = Instance.new("Frame")
OthersTitle_2 = Instance.new("TextLabel")
Other_Image2 = Instance.new("ImageLabel")
OthersText_2 = Instance.new("TextLabel")
TXTBOX_PlrName2 = Instance.new("TextBox")
othersBaseBackground2 = Instance.new("Frame")
Flatten = Instance.new("TextButton")
AimHead = Instance.new("TextButton")
Float = Instance.new("TextButton")
Multiple = Instance.new("TextButton")
Animated = Instance.new("TextButton")
SlowAttract = Instance.new("TextButton")
WeirdOrbit = Instance.new("TextButton")
Violent = Instance.new("TextButton")
Max = Instance.new("TextButton")
Others_toPAGE3 = Instance.new("TextButton")
Character_toPAGE3_IMAGE = Instance.new("ImageLabel")
Others_backPAGE1 = Instance.new("TextButton")
Character_toPAGE1_IMAGE_2 = Instance.new("ImageLabel")
Extra_1 = Instance.new("Frame")
Extra_Image = Instance.new("ImageLabel")
ExtraText = Instance.new("TextLabel")
ExtraBaseBackGround1 = Instance.new("Frame")
CrouchRocket = Instance.new("TextButton")
ExtraBaseBackGround1Side = Instance.new("Frame")
CloneIllusion = Instance.new("TextButton")
CoolSpin = Instance.new("TextButton")
JumpRocket = Instance.new("TextButton")
Extra_toPAGE2 = Instance.new("TextButton")
Character_toPAGE2_IMAGE_3 = Instance.new("ImageLabel")
Extra_Title = Instance.new("TextLabel")
ExtraBaseBackGround2 = Instance.new("Frame")
NoLimbs = Instance.new("TextButton")
FEGodmode = Instance.new("TextButton")
BrickHats = Instance.new("TextButton")
RapidPunch = Instance.new("TextButton")
ExtraBaseBackGround2Side = Instance.new("Frame")
ExtraBaseBackGround3 = Instance.new("Frame")
PunchFollow = Instance.new("TextButton")
ArmFollow = Instance.new("TextButton")
Spin = Instance.new("TextButton")
Faint = Instance.new("TextButton")
ExtraBaseBackGround3Side = Instance.new("Frame")
Extra_2 = Instance.new("Frame")
Extra_Image_2 = Instance.new("ImageLabel")
ExtraText_2 = Instance.new("TextLabel")
Extra_Title_2 = Instance.new("TextLabel")
ExtraBaseBackGround2_2 = Instance.new("Frame")
CrouchAttack = Instance.new("TextButton")
WalkThrough = Instance.new("TextButton")
CreepyWatch = Instance.new("TextButton")
SpinAttack = Instance.new("TextButton")
ExtraBaseBackGround2Side_2 = Instance.new("Frame")
TXTBOX_PlrNameEXTRA = Instance.new("TextBox")
_18 = Instance.new("TextButton")
SlamPropulsion = Instance.new("TextButton")
Extra_backPAGE1 = Instance.new("TextButton")
Character_toPAGE1_IMAGE_3 = Instance.new("ImageLabel")
Others_3 = Instance.new("Frame")
OthersTitle_3 = Instance.new("TextLabel")
Other_Image3 = Instance.new("ImageLabel")
OthersText_3 = Instance.new("TextLabel")
TXTBOX_PlrNameOTHER3 = Instance.new("TextBox")
othersBaseBackground3 = Instance.new("Frame")
FreeFall = Instance.new("TextButton")
Attach = Instance.new("TextButton")
Bring = Instance.new("TextButton")
SafeKill = Instance.new("TextButton")
SuperSpin = Instance.new("TextButton")
Kill = Instance.new("TextButton")
Others_backPAGE2 = Instance.new("TextButton")
Character_toPAGE1_IMAGE_4 = Instance.new("ImageLabel")
Games = Instance.new("Frame")
Games_IMAGE = Instance.new("ImageLabel")
GamesText = Instance.new("TextLabel")
Games_TITLE = Instance.new("TextLabel")
Games_IMAGE2 = Instance.new("ImageLabel")
SwordFightingTournament = Instance.new("TextButton")
PlatesOfFateMayhem = Instance.new("TextButton")
GamesText2 = Instance.new("TextLabel")
Frappe = Instance.new("TextButton")
Frappe_2 = Instance.new("TextButton")
MenuFrame = Instance.new("Frame")
Welcome = Instance.new("TextLabel")
NameOfPlayer = Instance.new("TextLabel")
T_Information = Instance.new("TextButton")
T_InfoImage = Instance.new("ImageLabel")
T_Character = Instance.new("TextButton")
T_CharImage = Instance.new("ImageLabel")
T_Games = Instance.new("TextButton")
T_GameImage = Instance.new("ImageLabel")
T_Others = Instance.new("TextButton")
T_OtherImage = Instance.new("ImageLabel")
T_Extra = Instance.new("TextButton")
T_ExtraImage = Instance.new("ImageLabel")
DeleteGUI = Instance.new("TextButton")
DELETEIMAGE = Instance.new("ImageLabel")
Darkness = Instance.new("TextButton")

-- Properties

OPFinality.Name = "OPFinality"
OPFinality.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = OPFinality
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BackgroundTransparency = 1
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0, 402, 0, 162)
MainFrame.Size = UDim2.new(0, 442, 0, 293)

TopFrame.Name = "TopFrame"
TopFrame.Parent = MainFrame
TopFrame.BackgroundColor3 = Color3.new(0.752941, 0.223529, 0.168627)
TopFrame.BorderColor3 = Color3.new(0.145098, 0.184314, 0.223529)
TopFrame.BorderSizePixel = 0
TopFrame.Size = UDim2.new(1, 0, 0.0741975307, 0)
TopFrame.ZIndex = 7

CloseGUI.Parent = TopFrame
CloseGUI.BackgroundColor3 = Color3.new(1, 1, 1)
CloseGUI.BackgroundTransparency = 1
CloseGUI.Position = UDim2.new(0.951219499, 0, 0, 0)
CloseGUI.Size = UDim2.new(0.048780486, 0, 1.00166667, 0)
CloseGUI.Font = Enum.Font.Cartoon
CloseGUI.FontSize = Enum.FontSize.Size28
CloseGUI.Text = "X"
CloseGUI.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
CloseGUI.TextSize = 25
CloseGUI.ZIndex = 8

MenuEnterFrame.Name = "MenuEnterFrame"
MenuEnterFrame.Parent = MainFrame
MenuEnterFrame.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
MenuEnterFrame.BorderColor3 = Color3.new(0.145098, 0.184314, 0.223529)
MenuEnterFrame.BorderSizePixel = 0
MenuEnterFrame.Position = UDim2.new(0, 0, 0.0741975307, 0)
MenuEnterFrame.Size = UDim2.new(1, 0, 0.148395061, 0)
MenuEnterFrame.ZIndex = 5

Title.Name = "Title"
Title.Parent = MenuEnterFrame
Title.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.341463417, 0, 0, 0)
Title.Size = UDim2.new(0.292682916, 0, 1.00166667, 0)
Title.Font = Enum.Font.SourceSansLight
Title.FontSize = Enum.FontSize.Size32
Title.Text = "OPFinality"
Title.TextColor3 = Color3.new(0.933333, 0.933333, 0.933333)
Title.TextSize = 30
Title.ZIndex = 6

OpenMenu.Name = "OpenMenu"
OpenMenu.Parent = MenuEnterFrame
OpenMenu.BackgroundColor3 = Color3.new(1, 1, 1)
OpenMenu.BackgroundTransparency = 1
OpenMenu.Size = UDim2.new(0.0909999982, 0, 1.01999998, 0)
OpenMenu.Image = "http://www.roblox.com/asset/?id=1280184088"
OpenMenu.ZIndex = 6

Pages.Name = "Pages"
Pages.Parent = MainFrame
Pages.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Pages.BorderSizePixel = 0
Pages.Position = UDim2.new(0, 0, 0.222592592, 0)
Pages.Size = UDim2.new(1, 0, 0.779074073, 0)

Information.Name = "Information"
Information.Parent = Pages
Information.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Information.BorderSizePixel = 0
Information.Size = UDim2.new(1, 0, 1, 0)

Image_FE_ENABLED.Name = "Image_FE_ENABLED"
Image_FE_ENABLED.Parent = Information
Image_FE_ENABLED.BackgroundColor3 = Color3.new(1, 1, 1)
Image_FE_ENABLED.BackgroundTransparency = 1
Image_FE_ENABLED.Position = UDim2.new(0.0227242485, 0, 0.0454809628, 0)
Image_FE_ENABLED.Size = UDim2.new(0.136345491, 0, 0.263394117, 0)
Image_FE_ENABLED.Visible = false
Image_FE_ENABLED.Image = "http://www.roblox.com/asset/?id=1281289312"

Text_FE_ENABLED.Name = "Text_FE_ENABLED"
Text_FE_ENABLED.Parent = Information
Text_FE_ENABLED.BackgroundColor3 = Color3.new(1, 1, 1)
Text_FE_ENABLED.BackgroundTransparency = 1
Text_FE_ENABLED.Position = UDim2.new(0.158999994, 0, 0.0670000017, 0)
Text_FE_ENABLED.Size = UDim2.new(0.795348704, 0, 0.227404833, 0)
Text_FE_ENABLED.Visible = false
Text_FE_ENABLED.Font = Enum.Font.SourceSansItalic
Text_FE_ENABLED.FontSize = Enum.FontSize.Size24
Text_FE_ENABLED.Text = "This game is Filtering Enabled! Enjoy using OPFinality."
Text_FE_ENABLED.TextSize = 19

WhatIsOPFinality.Name = "WhatIsOPFinality"
WhatIsOPFinality.Parent = Information
WhatIsOPFinality.BackgroundColor3 = Color3.new(1, 1, 1)
WhatIsOPFinality.BackgroundTransparency = 1
WhatIsOPFinality.Position = UDim2.new(0.249966726, 0, 0.227404833, 0)
WhatIsOPFinality.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
WhatIsOPFinality.Font = Enum.Font.SourceSansBold
WhatIsOPFinality.FontSize = Enum.FontSize.Size28
WhatIsOPFinality.Text = "What is OPFinality?"
WhatIsOPFinality.TextSize = 25

Text_FE_DISABLED.Name = "Text_FE_DISABLED"
Text_FE_DISABLED.Parent = Information
Text_FE_DISABLED.BackgroundColor3 = Color3.new(1, 1, 1)
Text_FE_DISABLED.BackgroundTransparency = 1
Text_FE_DISABLED.Position = UDim2.new(0.158999994, 0, 0.0670000017, 0)
Text_FE_DISABLED.Size = UDim2.new(0.545381963, 0, 0.227404833, 0)
Text_FE_DISABLED.Font = Enum.Font.SourceSansItalic
Text_FE_DISABLED.FontSize = Enum.FontSize.Size24
Text_FE_DISABLED.Text = "Oh! This game is Filtering Disabled..."
Text_FE_DISABLED.TextSize = 19

OPFin_Description.Name = "OPFin_Description"
OPFin_Description.Parent = Information
OPFin_Description.BackgroundColor3 = Color3.new(1, 1, 1)
OPFin_Description.BackgroundTransparency = 1
OPFin_Description.Position = UDim2.new(0.204999998, 0, 0.388000011, 0)
OPFin_Description.Size = UDim2.new(0.772624433, 0, 0.181923851, 0)
OPFin_Description.ZIndex = 3
OPFin_Description.Font = Enum.Font.SourceSans
OPFin_Description.FontSize = Enum.FontSize.Size18
OPFin_Description.Text = "OPFinality is an FE GUI developed by illremember made for giving you power in Filtering Enabled games."
OPFin_Description.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
OPFin_Description.TextSize = 18
OPFin_Description.TextWrapped = true

OPFin_Warning.Name = "OPFin_Warning"
OPFin_Warning.Parent = Information
OPFin_Warning.BackgroundColor3 = Color3.new(1, 1, 1)
OPFin_Warning.BackgroundTransparency = 1
OPFin_Warning.Position = UDim2.new(0.0227242485, 0, 0.636733532, 0)
OPFin_Warning.Size = UDim2.new(0.659003198, 0, 0.272885799, 0)
OPFin_Warning.ZIndex = 2
OPFin_Warning.Font = Enum.Font.SourceSans
OPFin_Warning.FontSize = Enum.FontSize.Size18
OPFin_Warning.Text = "If this game is detected as Filtering Disabled, this GUI wont work as well as other scripts would. Consider using a different script."
OPFin_Warning.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
OPFin_Warning.TextSize = 18
OPFin_Warning.TextWrapped = true

Info_Bar.Name = "Info_Bar"
Info_Bar.Parent = Information
Info_Bar.BackgroundColor3 = Color3.new(0.160784, 0.501961, 0.72549)
Info_Bar.BorderSizePixel = 0
Info_Bar.Position = UDim2.new(0.159069732, 0, 0.363847703, 0)
Info_Bar.Size = UDim2.new(0.0227242485, 0, 0.227404833, 0)

Info_Background.Name = "Info_Background"
Info_Background.Parent = Information
Info_Background.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Info_Background.BorderSizePixel = 0
Info_Background.Position = UDim2.new(0.181793988, 0, 0.363847703, 0)
Info_Background.Size = UDim2.new(0.819999993, 0, 0.226999998, 0)
Info_Background.ZIndex = 2

Warning_Bar.Name = "Warning_Bar"
Warning_Bar.Parent = Information
Warning_Bar.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
Warning_Bar.BorderSizePixel = 0
Warning_Bar.Position = UDim2.new(0.70445168, 0, 0.636733532, 0)
Warning_Bar.Size = UDim2.new(0.0227242485, 0, 0.272885799, 0)

Warning_Background.Name = "Warning_Background"
Warning_Background.Parent = Information
Warning_Background.BackgroundColor3 = Color3.new(0.945098, 0.768628, 0.0588235)
Warning_Background.BorderSizePixel = 0
Warning_Background.Position = UDim2.new(0, 0, 0.636733532, 0)
Warning_Background.Size = UDim2.new(0.70445168, 0, 0.272885799, 0)

Info_Image.Name = "Info_Image"
Info_Image.Parent = Information
Info_Image.BackgroundColor3 = Color3.new(1, 1, 1)
Info_Image.BackgroundTransparency = 1
Info_Image.Position = UDim2.new(0.0454484969, 0, 0.395091146, 0)
Info_Image.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Info_Image.Image = "http://www.roblox.com/asset/?id=1281284684"

Image_FE_DISABLED.Name = "Image_FE_DISABLED"
Image_FE_DISABLED.Parent = Information
Image_FE_DISABLED.BackgroundColor3 = Color3.new(1, 1, 1)
Image_FE_DISABLED.BackgroundTransparency = 1
Image_FE_DISABLED.Position = UDim2.new(0.0227242485, 0, 0.0454809628, 0)
Image_FE_DISABLED.Size = UDim2.new(0.136345491, 0, 0.263394117, 0)
Image_FE_DISABLED.Image = "http://www.roblox.com/asset/?id=1281290326"

Warn_Image.Name = "Warn_Image"
Warn_Image.Parent = Information
Warn_Image.BackgroundColor3 = Color3.new(1, 1, 1)
Warn_Image.BackgroundTransparency = 1
Warn_Image.Position = UDim2.new(0.763000011, 0, 0.677999973, 0)
Warn_Image.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Warn_Image.Image = "http://www.roblox.com/asset/?id=1281286925"

Others_1.Name = "Others_1"
Others_1.Parent = Pages
Others_1.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_1.BorderSizePixel = 0
Others_1.Position = UDim2.new(1.00752497, 0, 0, 0)
Others_1.Size = UDim2.new(1, 0, 1, 0)

OthersTitle.Name = "OthersTitle"
OthersTitle.Parent = Others_1
OthersTitle.BackgroundColor3 = Color3.new(1, 1, 1)
OthersTitle.BackgroundTransparency = 1
OthersTitle.Position = UDim2.new(0.226410091, 0, 0.0439298227, 0)
OthersTitle.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
OthersTitle.Font = Enum.Font.SourceSansBold
OthersTitle.FontSize = Enum.FontSize.Size28
OthersTitle.Text = "Others"
OthersTitle.TextSize = 25

Char_Image.Name = "Char_Image"
Char_Image.Parent = Others_1
Char_Image.BackgroundColor3 = Color3.new(1, 1, 1)
Char_Image.BackgroundTransparency = 1
Char_Image.Position = UDim2.new(0.0113205044, 0, 0.153754383, 0)
Char_Image.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Char_Image.Image = "http://www.roblox.com/asset/?id=1281476978"

OthersText.Name = "OthersText"
OthersText.Parent = Others_1
OthersText.BackgroundColor3 = Color3.new(1, 1, 1)
OthersText.BackgroundTransparency = 1
OthersText.Position = UDim2.new(0.101884536, 0, 0.153754383, 0)
OthersText.Size = UDim2.new(0.781114817, 0, 0.175719291, 0)
OthersText.Font = Enum.Font.SourceSansItalic
OthersText.FontSize = Enum.FontSize.Size24
OthersText.Text = "Use a set of basic commands on other players! Enter a name into the textbox, supports partial names."
OthersText.TextSize = 19
OthersText.TextWrapped = true

TXTBOX_PlrName.Name = "TXTBOX_PlrName"
TXTBOX_PlrName.Parent = Others_1
TXTBOX_PlrName.BackgroundColor3 = Color3.new(0.956863, 0.968628, 0.972549)
TXTBOX_PlrName.BorderColor3 = Color3.new(0.152941, 0.682353, 0.376471)
TXTBOX_PlrName.BorderSizePixel = 0
TXTBOX_PlrName.Position = UDim2.new(0.249051109, 0, 0.395368397, 0)
TXTBOX_PlrName.Size = UDim2.new(0.520743191, 0, 0.0878596455, 0)
TXTBOX_PlrName.ZIndex = 2
TXTBOX_PlrName.Font = Enum.Font.SourceSans
TXTBOX_PlrName.FontSize = Enum.FontSize.Size14
TXTBOX_PlrName.Text = "Player"
TXTBOX_PlrName.TextScaled = true
TXTBOX_PlrName.TextSize = 14
TXTBOX_PlrName.TextWrapped = true

othersBaseBackground.Name = "othersBaseBackground"
othersBaseBackground.Parent = Others_1
othersBaseBackground.BackgroundColor3 = Color3.new(0.160784, 0.501961, 0.72549)
othersBaseBackground.BorderSizePixel = 0
othersBaseBackground.Position = UDim2.new(0.124525554, 0, 0.351438582, 0)
othersBaseBackground.Size = UDim2.new(0.769999981, 0, 0.649999976, 0)

TeleportTo.Name = "TeleportTo"
TeleportTo.Parent = othersBaseBackground
TeleportTo.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
TeleportTo.BorderSizePixel = 0
TeleportTo.Position = UDim2.new(0.0294333119, 0, 0.27070269, 0)
TeleportTo.Size = UDim2.new(0, 92, 0, 25)
TeleportTo.Font = Enum.Font.SourceSans
TeleportTo.FontSize = Enum.FontSize.Size24
TeleportTo.Text = "Teleport To"
TeleportTo.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
TeleportTo.TextSize = 22

Annoy.Name = "Annoy"
Annoy.Parent = othersBaseBackground
Annoy.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Annoy.BorderSizePixel = 0
Annoy.Position = UDim2.new(0.0294333119, 0, 0.507567585, 0)
Annoy.Size = UDim2.new(0, 92, 0, 25)
Annoy.Font = Enum.Font.SourceSans
Annoy.FontSize = Enum.FontSize.Size24
Annoy.Text = "Annoy"
Annoy.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Annoy.TextSize = 22

Follow.Name = "Follow"
Follow.Parent = othersBaseBackground
Follow.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Follow.BorderSizePixel = 0
Follow.Position = UDim2.new(0.0294333119, 0, 0.744432449, 0)
Follow.Size = UDim2.new(0, 92, 0, 25)
Follow.Font = Enum.Font.SourceSans
Follow.FontSize = Enum.FontSize.Size24
Follow.Text = "Follow"
Follow.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Follow.TextSize = 22

View.Name = "View"
View.Parent = othersBaseBackground
View.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
View.BorderSizePixel = 0
View.Position = UDim2.new(0.367916405, 0, 0.27070269, 0)
View.Size = UDim2.new(0, 92, 0, 25)
View.Font = Enum.Font.SourceSans
View.FontSize = Enum.FontSize.Size24
View.Text = "View"
View.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
View.TextSize = 22

Orbit.Name = "Orbit"
Orbit.Parent = othersBaseBackground
Orbit.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Orbit.BorderSizePixel = 0
Orbit.Position = UDim2.new(0.367916405, 0, 0.507567585, 0)
Orbit.Size = UDim2.new(0, 92, 0, 25)
Orbit.Font = Enum.Font.SourceSans
Orbit.FontSize = Enum.FontSize.Size24
Orbit.Text = "Orbit"
Orbit.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Orbit.TextSize = 22

HeadWalk.Name = "HeadWalk"
HeadWalk.Parent = othersBaseBackground
HeadWalk.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
HeadWalk.BorderSizePixel = 0
HeadWalk.Position = UDim2.new(0.367916405, 0, 0.744432449, 0)
HeadWalk.Size = UDim2.new(0, 92, 0, 25)
HeadWalk.Font = Enum.Font.SourceSans
HeadWalk.FontSize = Enum.FontSize.Size24
HeadWalk.Text = "Head Walk"
HeadWalk.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
HeadWalk.TextSize = 22

Stick.Name = "Stick"
Stick.Parent = othersBaseBackground
Stick.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Stick.BorderSizePixel = 0
Stick.Position = UDim2.new(0.7063995, 0, 0.27070269, 0)
Stick.Size = UDim2.new(0, 92, 0, 25)
Stick.Font = Enum.Font.SourceSans
Stick.FontSize = Enum.FontSize.Size24
Stick.Text = "Stick"
Stick.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Stick.TextSize = 22

Spam.Name = "Spam"
Spam.Parent = othersBaseBackground
Spam.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Spam.BorderSizePixel = 0
Spam.Position = UDim2.new(0.7063995, 0, 0.507567585, 0)
Spam.Size = UDim2.new(0, 92, 0, 25)
Spam.Font = Enum.Font.SourceSans
Spam.FontSize = Enum.FontSize.Size24
Spam.Text = "Spam"
Spam.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Spam.TextSize = 22

Carpet.Name = "Carpet"
Carpet.Parent = othersBaseBackground
Carpet.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
Carpet.BorderSizePixel = 0
Carpet.Position = UDim2.new(0.7063995, 0, 0.744432449, 0)
Carpet.Size = UDim2.new(0, 92, 0, 25)
Carpet.Font = Enum.Font.SourceSans
Carpet.FontSize = Enum.FontSize.Size24
Carpet.Text = "Carpet"
Carpet.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Carpet.TextSize = 22

Others_toPAGE2.Name = "Others_toPAGE2"
Others_toPAGE2.Parent = Others_1
Others_toPAGE2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Others_toPAGE2.BorderSizePixel = 0
Others_toPAGE2.Position = UDim2.new(0.819999993, 0, 0.0439999998, 0)
Others_toPAGE2.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Others_toPAGE2.Font = Enum.Font.SourceSansLight
Others_toPAGE2.FontSize = Enum.FontSize.Size24
Others_toPAGE2.Text = "Next"
Others_toPAGE2.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_toPAGE2.TextSize = 22

Character_toPAGE2_IMAGE.Name = "Character_toPAGE2_IMAGE"
Character_toPAGE2_IMAGE.Parent = Others_toPAGE2
Character_toPAGE2_IMAGE.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE2_IMAGE.BorderSizePixel = 0
Character_toPAGE2_IMAGE.Position = UDim2.new(0.900659323, 0, 0, 0)
Character_toPAGE2_IMAGE.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE2_IMAGE.Image = "http://www.roblox.com/asset/?id=1282737326"

Character_2.Name = "Character_2"
Character_2.Parent = Pages
Character_2.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Character_2.BorderSizePixel = 0
Character_2.Position = UDim2.new(1, 0, 0, 0)
Character_2.Size = UDim2.new(1, 0, 1, 0)

CharacterTitle.Name = "CharacterTitle"
CharacterTitle.Parent = Character_2
CharacterTitle.BackgroundColor3 = Color3.new(1, 1, 1)
CharacterTitle.BackgroundTransparency = 1
CharacterTitle.Position = UDim2.new(0.226410091, 0, 0, 0)
CharacterTitle.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
CharacterTitle.Font = Enum.Font.SourceSansBold
CharacterTitle.FontSize = Enum.FontSize.Size28
CharacterTitle.Text = "Character"
CharacterTitle.TextSize = 25

CharacterText.Name = "CharacterText"
CharacterText.Parent = Character_2
CharacterText.BackgroundColor3 = Color3.new(1, 1, 1)
CharacterText.BackgroundTransparency = 1
CharacterText.Position = UDim2.new(0.158487067, 0, 0.109824568, 0)
CharacterText.Size = UDim2.new(0.679230273, 0, 0.0878596455, 0)
CharacterText.Font = Enum.Font.SourceSansItalic
CharacterText.FontSize = Enum.FontSize.Size24
CharacterText.Text = "Apply cool animations to your player!"
CharacterText.TextSize = 19
CharacterText.TextWrapped = true

Animations_SPOOKY.Name = "Animations_SPOOKY"
Animations_SPOOKY.Parent = Character_2
Animations_SPOOKY.BackgroundColor3 = Color3.new(0.827451, 0.329412, 0)
Animations_SPOOKY.BorderSizePixel = 0
Animations_SPOOKY.Position = UDim2.new(0.101884536, 0, 0.263578951, 0)
Animations_SPOOKY.Size = UDim2.new(0.200000003, 0, 0.735000014, 0)

spookytitle.Name = "spookytitle"
spookytitle.Parent = Animations_SPOOKY
spookytitle.BackgroundColor3 = Color3.new(1, 1, 1)
spookytitle.BackgroundTransparency = 1
spookytitle.Position = UDim2.new(0, 0, 0.0298095234, 0)
spookytitle.Size = UDim2.new(0.96661669, 0, 0.149047628, 0)
spookytitle.Font = Enum.Font.SourceSansLight
spookytitle.FontSize = Enum.FontSize.Size28
spookytitle.Text = "Spooky"
spookytitle.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
spookytitle.TextSize = 25

headthrow.Name = "headthrow"
headthrow.Parent = Animations_SPOOKY
headthrow.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
headthrow.BorderSizePixel = 0
headthrow.Position = UDim2.new(0, 0, 0.238476187, 0)
headthrow.Size = UDim2.new(1, 0, 0.119000003, 0)
headthrow.Font = Enum.Font.SourceSans
headthrow.FontSize = Enum.FontSize.Size14
headthrow.Text = "Head Throw"
headthrow.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
headthrow.TextScaled = true
headthrow.TextSize = 14
headthrow.TextWrapped = true

armsoff.Name = "armsoff"
armsoff.Parent = Animations_SPOOKY
armsoff.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
armsoff.BorderSizePixel = 0
armsoff.Position = UDim2.new(0, 0, 0.3875238, 0)
armsoff.Size = UDim2.new(1, 0, 0.119000003, 0)
armsoff.Font = Enum.Font.SourceSans
armsoff.FontSize = Enum.FontSize.Size14
armsoff.Text = "Arms Off"
armsoff.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
armsoff.TextScaled = true
armsoff.TextSize = 14
armsoff.TextWrapped = true

loophead.Name = "loophead"
loophead.Parent = Animations_SPOOKY
loophead.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
loophead.BorderSizePixel = 0
loophead.Position = UDim2.new(0, 0, 0.536571383, 0)
loophead.Size = UDim2.new(1, 0, 0.119000003, 0)
loophead.Font = Enum.Font.SourceSans
loophead.FontSize = Enum.FontSize.Size14
loophead.Text = "Loop Head"
loophead.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
loophead.TextScaled = true
loophead.TextSize = 14
loophead.TextWrapped = true

levitate.Name = "levitate"
levitate.Parent = Animations_SPOOKY
levitate.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
levitate.BorderSizePixel = 0
levitate.Position = UDim2.new(0, 0, 0.685619056, 0)
levitate.Size = UDim2.new(1, 0, 0.119000003, 0)
levitate.Font = Enum.Font.SourceSans
levitate.FontSize = Enum.FontSize.Size14
levitate.Text = "Levitate"
levitate.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
levitate.TextScaled = true
levitate.TextSize = 14
levitate.TextWrapped = true

headfloat.Name = "headfloat"
headfloat.Parent = Animations_SPOOKY
headfloat.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
headfloat.BorderSizePixel = 0
headfloat.Position = UDim2.new(0, 0, 0.834666669, 0)
headfloat.Size = UDim2.new(1, 0, 0.119000003, 0)
headfloat.Font = Enum.Font.SourceSans
headfloat.FontSize = Enum.FontSize.Size14
headfloat.Text = "Head Float"
headfloat.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
headfloat.TextScaled = true
headfloat.TextSize = 14
headfloat.TextWrapped = true

Character_backPAGE1.Name = "Character_backPAGE1"
Character_backPAGE1.Parent = Character_2
Character_backPAGE1.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_backPAGE1.BorderSizePixel = 0
Character_backPAGE1.Position = UDim2.new(0.0679230243, 0, 0.0439298227, 0)
Character_backPAGE1.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Character_backPAGE1.Font = Enum.Font.SourceSansLight
Character_backPAGE1.FontSize = Enum.FontSize.Size24
Character_backPAGE1.Text = "Prev"
Character_backPAGE1.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Character_backPAGE1.TextSize = 22

Character_toPAGE1_IMAGE.Name = "Character_toPAGE1_IMAGE"
Character_toPAGE1_IMAGE.Parent = Character_backPAGE1
Character_toPAGE1_IMAGE.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE1_IMAGE.BorderSizePixel = 0
Character_toPAGE1_IMAGE.Position = UDim2.new(-0.400293052, 0, 0, 0)
Character_toPAGE1_IMAGE.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE1_IMAGE.Image = "http://www.roblox.com/asset/?id=1282894968"

Animations_DANCE.Name = "Animations_DANCE"
Animations_DANCE.Parent = Character_2
Animations_DANCE.BackgroundColor3 = Color3.new(0.827451, 0.329412, 0)
Animations_DANCE.BorderSizePixel = 0
Animations_DANCE.Position = UDim2.new(0.407538146, 0, 0.263578951, 0)
Animations_DANCE.Size = UDim2.new(0.200000003, 0, 0.735000014, 0)

dancetitle.Name = "dancetitle"
dancetitle.Parent = Animations_DANCE
dancetitle.BackgroundColor3 = Color3.new(1, 1, 1)
dancetitle.BackgroundTransparency = 1
dancetitle.Position = UDim2.new(0, 0, 0.0298095234, 0)
dancetitle.Size = UDim2.new(0.96661669, 0, 0.149047628, 0)
dancetitle.Font = Enum.Font.SourceSansLight
dancetitle.FontSize = Enum.FontSize.Size28
dancetitle.Text = "Dance"
dancetitle.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
dancetitle.TextSize = 25

normal.Name = "normal"
normal.Parent = Animations_DANCE
normal.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
normal.BorderSizePixel = 0
normal.Position = UDim2.new(0, 0, 0.238476187, 0)
normal.Size = UDim2.new(1, 0, 0.119000003, 0)
normal.Font = Enum.Font.SourceSans
normal.FontSize = Enum.FontSize.Size14
normal.Text = "Normal"
normal.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
normal.TextScaled = true
normal.TextSize = 14
normal.TextWrapped = true

movingdance.Name = "movingdance"
movingdance.Parent = Animations_DANCE
movingdance.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
movingdance.BorderSizePixel = 0
movingdance.Position = UDim2.new(0, 0, 0.3875238, 0)
movingdance.Size = UDim2.new(1, 0, 0.119000003, 0)
movingdance.Font = Enum.Font.SourceSans
movingdance.FontSize = Enum.FontSize.Size14
movingdance.Text = "Moving Dance"
movingdance.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
movingdance.TextScaled = true
movingdance.TextSize = 14
movingdance.TextWrapped = true

insane.Name = "insane"
insane.Parent = Animations_DANCE
insane.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
insane.BorderSizePixel = 0
insane.Position = UDim2.new(0, 0, 0.834666669, 0)
insane.Size = UDim2.new(1, 0, 0.119000003, 0)
insane.Font = Enum.Font.SourceSans
insane.FontSize = Enum.FontSize.Size14
insane.Text = "Insane"
insane.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
insane.TextScaled = true
insane.TextSize = 14
insane.TextWrapped = true

happy.Name = "happy"
happy.Parent = Animations_DANCE
happy.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
happy.BorderSizePixel = 0
happy.Position = UDim2.new(0, 0, 0.536571383, 0)
happy.Size = UDim2.new(1, 0, 0.119000003, 0)
happy.Font = Enum.Font.SourceSans
happy.FontSize = Enum.FontSize.Size14
happy.Text = "Happy"
happy.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
happy.TextScaled = true
happy.TextSize = 14
happy.TextWrapped = true

spindance.Name = "spindance"
spindance.Parent = Animations_DANCE
spindance.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
spindance.BorderSizePixel = 0
spindance.Position = UDim2.new(0, 0, 0.685619056, 0)
spindance.Size = UDim2.new(1, 0, 0.119000003, 0)
spindance.Font = Enum.Font.SourceSans
spindance.FontSize = Enum.FontSize.Size14
spindance.Text = "Spin Dance"
spindance.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
spindance.TextScaled = true
spindance.TextSize = 14
spindance.TextWrapped = true

Animations_HEROIC.Name = "Animations_HEROIC"
Animations_HEROIC.Parent = Character_2
Animations_HEROIC.BackgroundColor3 = Color3.new(0.827451, 0.329412, 0)
Animations_HEROIC.BorderSizePixel = 0
Animations_HEROIC.Position = UDim2.new(0.713191807, 0, 0.263578951, 0)
Animations_HEROIC.Size = UDim2.new(0.200000003, 0, 0.735000014, 0)

heroictitle.Name = "heroictitle"
heroictitle.Parent = Animations_HEROIC
heroictitle.BackgroundColor3 = Color3.new(1, 1, 1)
heroictitle.BackgroundTransparency = 1
heroictitle.Position = UDim2.new(0, 0, 0.0298095234, 0)
heroictitle.Size = UDim2.new(0.96661669, 0, 0.149047628, 0)
heroictitle.Font = Enum.Font.SourceSansLight
heroictitle.FontSize = Enum.FontSize.Size28
heroictitle.Text = "Heroic"
heroictitle.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
heroictitle.TextSize = 25

swordstrike.Name = "swordstrike"
swordstrike.Parent = Animations_HEROIC
swordstrike.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
swordstrike.BorderSizePixel = 0
swordstrike.Position = UDim2.new(0, 0, 0.238476187, 0)
swordstrike.Size = UDim2.new(1, 0, 0.119000003, 0)
swordstrike.Font = Enum.Font.SourceSans
swordstrike.FontSize = Enum.FontSize.Size14
swordstrike.Text = "Sword Strike"
swordstrike.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
swordstrike.TextScaled = true
swordstrike.TextSize = 14
swordstrike.TextWrapped = true

jumpland.Name = "jumpland"
jumpland.Parent = Animations_HEROIC
jumpland.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
jumpland.BorderSizePixel = 0
jumpland.Position = UDim2.new(0, 0, 0.3875238, 0)
jumpland.Size = UDim2.new(1, 0, 0.119000003, 0)
jumpland.Font = Enum.Font.SourceSans
jumpland.FontSize = Enum.FontSize.Size14
jumpland.Text = "Jump Land"
jumpland.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
jumpland.TextScaled = true
jumpland.TextSize = 14
jumpland.TextWrapped = true

punches.Name = "punches"
punches.Parent = Animations_HEROIC
punches.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
punches.BorderSizePixel = 0
punches.Position = UDim2.new(0, 0, 0.834666669, 0)
punches.Size = UDim2.new(1, 0, 0.119000003, 0)
punches.Font = Enum.Font.SourceSans
punches.FontSize = Enum.FontSize.Size14
punches.Text = "Punches"
punches.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
punches.TextScaled = true
punches.TextSize = 14
punches.TextWrapped = true

swing.Name = "swing"
swing.Parent = Animations_HEROIC
swing.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
swing.BorderSizePixel = 0
swing.Position = UDim2.new(0, 0, 0.536571383, 0)
swing.Size = UDim2.new(1, 0, 0.119000003, 0)
swing.Font = Enum.Font.SourceSans
swing.FontSize = Enum.FontSize.Size14
swing.Text = "Swing"
swing.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
swing.TextScaled = true
swing.TextSize = 14
swing.TextWrapped = true

crawl.Name = "crawl"
crawl.Parent = Animations_HEROIC
crawl.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
crawl.BorderSizePixel = 0
crawl.Position = UDim2.new(0, 0, 0.685619056, 0)
crawl.Size = UDim2.new(1, 0, 0.119000003, 0)
crawl.Font = Enum.Font.SourceSans
crawl.FontSize = Enum.FontSize.Size14
crawl.Text = "Crawl"
crawl.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
crawl.TextScaled = true
crawl.TextSize = 14
crawl.TextWrapped = true

Char2_Image.Name = "Char2_Image"
Char2_Image.Parent = Character_2
Char2_Image.BackgroundColor3 = Color3.new(1, 1, 1)
Char2_Image.BackgroundTransparency = 1
Char2_Image.Position = UDim2.new(0.792435288, 0, 0.0219649114, 0)
Char2_Image.Size = UDim2.new(0.101884536, 0, 0.197684199, 0)
Char2_Image.Image = "http://www.roblox.com/asset/?id=1282931168"

Character_1.Name = "Character_1"
Character_1.Parent = Pages
Character_1.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Character_1.BorderSizePixel = 0
Character_1.Position = UDim2.new(11, 0, 0, 0)
Character_1.Size = UDim2.new(1, 0, 1, 0)

CharacterTitle_2.Name = "CharacterTitle"
CharacterTitle_2.Parent = Character_1
CharacterTitle_2.BackgroundColor3 = Color3.new(1, 1, 1)
CharacterTitle_2.BackgroundTransparency = 1
CharacterTitle_2.Position = UDim2.new(0.226410091, 0, 0, 0)
CharacterTitle_2.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
CharacterTitle_2.Font = Enum.Font.SourceSansBold
CharacterTitle_2.FontSize = Enum.FontSize.Size28
CharacterTitle_2.Text = "Character"
CharacterTitle_2.TextSize = 25

Char_Image_2.Name = "Char_Image"
Char_Image_2.Parent = Character_1
Char_Image_2.BackgroundColor3 = Color3.new(1, 1, 1)
Char_Image_2.BackgroundTransparency = 1
Char_Image_2.Position = UDim2.new(0.0792435333, 0, 0.109824568, 0)
Char_Image_2.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Char_Image_2.Image = "http://www.roblox.com/asset/?id=1281299598"

CharacterText_2.Name = "CharacterText"
CharacterText_2.Parent = Character_1
CharacterText_2.BackgroundColor3 = Color3.new(1, 1, 1)
CharacterText_2.BackgroundTransparency = 1
CharacterText_2.Position = UDim2.new(0.147166565, 0, 0.109824568, 0)
CharacterText_2.Size = UDim2.new(0.679230273, 0, 0.175719291, 0)
CharacterText_2.Font = Enum.Font.SourceSansItalic
CharacterText_2.FontSize = Enum.FontSize.Size24
CharacterText_2.Text = "Change your character's speed and other stats, give yourself fly, noclip and more!"
CharacterText_2.TextSize = 19
CharacterText_2.TextWrapped = true

TXTBOX_Stats.Name = "TXTBOX_Stats"
TXTBOX_Stats.Parent = Character_1
TXTBOX_Stats.BackgroundColor3 = Color3.new(0.956863, 0.968628, 0.972549)
TXTBOX_Stats.BorderColor3 = Color3.new(0.152941, 0.682353, 0.376471)
TXTBOX_Stats.BorderSizePixel = 6
TXTBOX_Stats.Position = UDim2.new(0.0905640349, 0, 0.373403519, 0)
TXTBOX_Stats.Size = UDim2.new(0.18112807, 0, 0.0878596455, 0)
TXTBOX_Stats.Font = Enum.Font.SourceSans
TXTBOX_Stats.FontSize = Enum.FontSize.Size14
TXTBOX_Stats.Text = "Number"
TXTBOX_Stats.TextScaled = true
TXTBOX_Stats.TextSize = 14
TXTBOX_Stats.TextWrapped = true

BackGroundChar.Name = "BackGroundChar"
BackGroundChar.Parent = Character_1
BackGroundChar.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
BackGroundChar.BorderSizePixel = 0
BackGroundChar.Position = UDim2.new(0.0769999996, 0, 0.48300001, 0)
BackGroundChar.Size = UDim2.new(0, 92, 0, 118)

HipHeight.Name = "HipHeight"
HipHeight.Parent = BackGroundChar
HipHeight.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
HipHeight.BorderSizePixel = 0
HipHeight.Position = UDim2.new(0, 0, 0.679050863, 0)
HipHeight.Size = UDim2.new(0, 92, 0, 25)
HipHeight.Font = Enum.Font.SourceSans
HipHeight.FontSize = Enum.FontSize.Size24
HipHeight.Text = "HipHeight"
HipHeight.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
HipHeight.TextSize = 22

JumpHeight.Name = "JumpHeight"
JumpHeight.Parent = BackGroundChar
JumpHeight.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
JumpHeight.BorderSizePixel = 0
JumpHeight.Position = UDim2.new(0, 0, 0.381966084, 0)
JumpHeight.Size = UDim2.new(0, 92, 0, 25)
JumpHeight.Font = Enum.Font.SourceSans
JumpHeight.FontSize = Enum.FontSize.Size24
JumpHeight.Text = "JumpHeight"
JumpHeight.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
JumpHeight.TextSize = 20

Speed.Name = "Speed"
Speed.Parent = BackGroundChar
Speed.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0, 0, 0.0848813578, 0)
Speed.Size = UDim2.new(0, 92, 0, 25)
Speed.Font = Enum.Font.SourceSans
Speed.FontSize = Enum.FontSize.Size24
Speed.Text = "Speed"
Speed.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Speed.TextSize = 22

TXTBOX_Chat.Name = "TXTBOX_Chat"
TXTBOX_Chat.Parent = Character_1
TXTBOX_Chat.BackgroundColor3 = Color3.new(0.956863, 0.968628, 0.972549)
TXTBOX_Chat.BorderColor3 = Color3.new(0.152941, 0.682353, 0.376471)
TXTBOX_Chat.BorderSizePixel = 6
TXTBOX_Chat.Position = UDim2.new(0.384897143, 0, 0.373403519, 0)
TXTBOX_Chat.Size = UDim2.new(0.520743191, 0, 0.0878596455, 0)
TXTBOX_Chat.Font = Enum.Font.SourceSans
TXTBOX_Chat.FontSize = Enum.FontSize.Size14
TXTBOX_Chat.Text = "Text for chatting"
TXTBOX_Chat.TextScaled = true
TXTBOX_Chat.TextSize = 14
TXTBOX_Chat.TextWrapped = true

BackGroundChar2.Name = "BackGroundChar2"
BackGroundChar2.Parent = Character_1
BackGroundChar2.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
BackGroundChar2.BorderSizePixel = 0
BackGroundChar2.Position = UDim2.new(0.370000005, 0, 0.48300001, 0)
BackGroundChar2.Size = UDim2.new(0, 242, 0, 40)

Chat.Name = "Chat"
Chat.Parent = BackGroundChar2
Chat.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
Chat.BorderSizePixel = 0
Chat.Position = UDim2.new(0.0620288812, 0, 0.125200003, 0)
Chat.Size = UDim2.new(0, 92, 0, 25)
Chat.Font = Enum.Font.SourceSans
Chat.FontSize = Enum.FontSize.Size24
Chat.Text = "Chat"
Chat.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Chat.TextSize = 22

Spam_2.Name = "Spam"
Spam_2.Parent = BackGroundChar2
Spam_2.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
Spam_2.BorderSizePixel = 0
Spam_2.Position = UDim2.new(0.558259964, 0, 0.125200003, 0)
Spam_2.Size = UDim2.new(0, 92, 0, 25)
Spam_2.Font = Enum.Font.SourceSans
Spam_2.FontSize = Enum.FontSize.Size24
Spam_2.Text = "Spam"
Spam_2.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Spam_2.TextSize = 22

BackGroundChar3.Name = "BackGroundChar3"
BackGroundChar3.Parent = Character_1
BackGroundChar3.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
BackGroundChar3.BorderSizePixel = 0
BackGroundChar3.Position = UDim2.new(0.372000009, 0, 0.742999971, 0)
BackGroundChar3.Size = UDim2.new(0, 242, 0, 43)

Noclip.Name = "Noclip"
Noclip.Parent = BackGroundChar3
Noclip.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
Noclip.BorderSizePixel = 0
Noclip.Position = UDim2.new(0.558000028, 0, 0.208000004, 0)
Noclip.Size = UDim2.new(0, 92, 0, 25)
Noclip.Font = Enum.Font.SourceSans
Noclip.FontSize = Enum.FontSize.Size24
Noclip.Text = "Noclip"
Noclip.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Noclip.TextSize = 22

Fly.Name = "Fly"
Fly.Parent = BackGroundChar3
Fly.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.061999999, 0, 0.208000004, 0)
Fly.Size = UDim2.new(0, 92, 0, 25)
Fly.Font = Enum.Font.SourceSans
Fly.FontSize = Enum.FontSize.Size24
Fly.Text = "Fly"
Fly.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Fly.TextSize = 22

Character_toPAGE2.Name = "Character_toPAGE2"
Character_toPAGE2.Parent = Character_1
Character_toPAGE2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE2.BorderSizePixel = 0
Character_toPAGE2.Position = UDim2.new(0.819999993, 0, 0.0439999998, 0)
Character_toPAGE2.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Character_toPAGE2.Font = Enum.Font.SourceSansLight
Character_toPAGE2.FontSize = Enum.FontSize.Size24
Character_toPAGE2.Text = "Next"
Character_toPAGE2.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Character_toPAGE2.TextSize = 22

Character_toPAGE2_IMAGE_2.Name = "Character_toPAGE2_IMAGE"
Character_toPAGE2_IMAGE_2.Parent = Character_toPAGE2
Character_toPAGE2_IMAGE_2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE2_IMAGE_2.BorderSizePixel = 0
Character_toPAGE2_IMAGE_2.Position = UDim2.new(0.900659323, 0, 0, 0)
Character_toPAGE2_IMAGE_2.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE2_IMAGE_2.Image = "http://www.roblox.com/asset/?id=1282737326"

Others_2.Name = "Others_2"
Others_2.Parent = Pages
Others_2.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_2.BorderSizePixel = 0
Others_2.Position = UDim2.new(1, 0, 0, 0)
Others_2.Size = UDim2.new(1, 0, 1, 0)

OthersTitle_2.Name = "OthersTitle"
OthersTitle_2.Parent = Others_2
OthersTitle_2.BackgroundColor3 = Color3.new(1, 1, 1)
OthersTitle_2.BackgroundTransparency = 1
OthersTitle_2.Position = UDim2.new(0.226410091, 0, 0, 0)
OthersTitle_2.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
OthersTitle_2.Font = Enum.Font.SourceSansBold
OthersTitle_2.FontSize = Enum.FontSize.Size28
OthersTitle_2.Text = "Others"
OthersTitle_2.TextSize = 25

Other_Image2.Name = "Other_Image2"
Other_Image2.Parent = Others_2
Other_Image2.BackgroundColor3 = Color3.new(1, 1, 1)
Other_Image2.BackgroundTransparency = 1
Other_Image2.Position = UDim2.new(0.0113205044, 0, 0.197684199, 0)
Other_Image2.Size = UDim2.new(0.101884536, 0, 0.197684199, 0)
Other_Image2.Image = "http://www.roblox.com/asset/?id=1284941440"

OthersText_2.Name = "OthersText"
OthersText_2.Parent = Others_2
OthersText_2.BackgroundColor3 = Color3.new(1, 1, 1)
OthersText_2.BackgroundTransparency = 1
OthersText_2.Position = UDim2.new(0.203769073, 0, 0.109824568, 0)
OthersText_2.Size = UDim2.new(0.577345729, 0, 0.175719291, 0)
OthersText_2.Font = Enum.Font.SourceSansItalic
OthersText_2.FontSize = Enum.FontSize.Size24
OthersText_2.Text = "Use rocket propulsion to push, fling, and annoy players!"
OthersText_2.TextSize = 19
OthersText_2.TextWrapped = true

TXTBOX_PlrName2.Name = "TXTBOX_PlrName2"
TXTBOX_PlrName2.Parent = Others_2
TXTBOX_PlrName2.BackgroundColor3 = Color3.new(0.956863, 0.968628, 0.972549)
TXTBOX_PlrName2.BorderColor3 = Color3.new(0.152941, 0.682353, 0.376471)
TXTBOX_PlrName2.BorderSizePixel = 0
TXTBOX_PlrName2.Position = UDim2.new(0.249051109, 0, 0.395368397, 0)
TXTBOX_PlrName2.Size = UDim2.new(0.520743191, 0, 0.0878596455, 0)
TXTBOX_PlrName2.ZIndex = 2
TXTBOX_PlrName2.Font = Enum.Font.SourceSans
TXTBOX_PlrName2.FontSize = Enum.FontSize.Size14
TXTBOX_PlrName2.Text = "Player"
TXTBOX_PlrName2.TextScaled = true
TXTBOX_PlrName2.TextSize = 14
TXTBOX_PlrName2.TextWrapped = true

othersBaseBackground2.Name = "othersBaseBackground2"
othersBaseBackground2.Parent = Others_2
othersBaseBackground2.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
othersBaseBackground2.BorderSizePixel = 0
othersBaseBackground2.Position = UDim2.new(0.124525554, 0, 0.351438582, 0)
othersBaseBackground2.Size = UDim2.new(0.769999981, 0, 0.649999976, 0)

Flatten.Name = "Flatten"
Flatten.Parent = othersBaseBackground2
Flatten.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
Flatten.BorderSizePixel = 0
Flatten.Position = UDim2.new(0.0588666238, 0, 0.27070269, 0)
Flatten.Size = UDim2.new(0, 92, 0, 25)
Flatten.Font = Enum.Font.SourceSans
Flatten.FontSize = Enum.FontSize.Size24
Flatten.Text = "Flatten"
Flatten.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Flatten.TextSize = 22

AimHead.Name = "AimHead"
AimHead.Parent = othersBaseBackground2
AimHead.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
AimHead.BorderSizePixel = 0
AimHead.Position = UDim2.new(0.367916405, 0, 0.27070269, 0)
AimHead.Size = UDim2.new(0, 92, 0, 25)
AimHead.Font = Enum.Font.SourceSans
AimHead.FontSize = Enum.FontSize.Size24
AimHead.Text = "Aim Head"
AimHead.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
AimHead.TextSize = 22

Float.Name = "Float"
Float.Parent = othersBaseBackground2
Float.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
Float.BorderSizePixel = 0
Float.Position = UDim2.new(0.0588666238, 0, 0.507567585, 0)
Float.Size = UDim2.new(0, 92, 0, 25)
Float.Font = Enum.Font.SourceSans
Float.FontSize = Enum.FontSize.Size24
Float.Text = "Float"
Float.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Float.TextSize = 22

Multiple.Name = "Multiple"
Multiple.Parent = othersBaseBackground2
Multiple.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
Multiple.BorderSizePixel = 0
Multiple.Position = UDim2.new(0.367916405, 0, 0.507567585, 0)
Multiple.Size = UDim2.new(0, 92, 0, 25)
Multiple.Font = Enum.Font.SourceSans
Multiple.FontSize = Enum.FontSize.Size24
Multiple.Text = "Multiple"
Multiple.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Multiple.TextSize = 22

Animated.Name = "Animated"
Animated.Parent = othersBaseBackground2
Animated.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
Animated.BorderSizePixel = 0
Animated.Position = UDim2.new(0.67696619, 0, 0.27070269, 0)
Animated.Size = UDim2.new(0, 92, 0, 25)
Animated.Font = Enum.Font.SourceSans
Animated.FontSize = Enum.FontSize.Size24
Animated.Text = "Animated"
Animated.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Animated.TextSize = 22

SlowAttract.Name = "SlowAttract"
SlowAttract.Parent = othersBaseBackground2
SlowAttract.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
SlowAttract.BorderSizePixel = 0
SlowAttract.Position = UDim2.new(0.67696619, 0, 0.507567585, 0)
SlowAttract.Size = UDim2.new(0, 92, 0, 25)
SlowAttract.Font = Enum.Font.SourceSans
SlowAttract.FontSize = Enum.FontSize.Size24
SlowAttract.Text = "SlowAttract"
SlowAttract.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
SlowAttract.TextSize = 22

WeirdOrbit.Name = "WeirdOrbit"
WeirdOrbit.Parent = othersBaseBackground2
WeirdOrbit.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
WeirdOrbit.BorderSizePixel = 0
WeirdOrbit.Position = UDim2.new(0.67696619, 0, 0.744432449, 0)
WeirdOrbit.Size = UDim2.new(0, 92, 0, 25)
WeirdOrbit.Font = Enum.Font.SourceSans
WeirdOrbit.FontSize = Enum.FontSize.Size24
WeirdOrbit.Text = "Weird Orbit"
WeirdOrbit.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
WeirdOrbit.TextSize = 22

Violent.Name = "Violent"
Violent.Parent = othersBaseBackground2
Violent.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
Violent.BorderSizePixel = 0
Violent.Position = UDim2.new(0.367916405, 0, 0.744432449, 0)
Violent.Size = UDim2.new(0, 92, 0, 25)
Violent.Font = Enum.Font.SourceSans
Violent.FontSize = Enum.FontSize.Size24
Violent.Text = "Violent"
Violent.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Violent.TextSize = 22

Max.Name = "Max"
Max.Parent = othersBaseBackground2
Max.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
Max.BorderSizePixel = 0
Max.Position = UDim2.new(0.0588666238, 0, 0.744432449, 0)
Max.Size = UDim2.new(0, 92, 0, 25)
Max.Font = Enum.Font.SourceSans
Max.FontSize = Enum.FontSize.Size24
Max.Text = "Max"
Max.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Max.TextSize = 22

Others_toPAGE3.Name = "Others_toPAGE3"
Others_toPAGE3.Parent = Others_2
Others_toPAGE3.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Others_toPAGE3.BorderSizePixel = 0
Others_toPAGE3.Position = UDim2.new(0.819999993, 0, 0.0439999998, 0)
Others_toPAGE3.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Others_toPAGE3.Font = Enum.Font.SourceSansLight
Others_toPAGE3.FontSize = Enum.FontSize.Size24
Others_toPAGE3.Text = "Next"
Others_toPAGE3.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_toPAGE3.TextSize = 22

Character_toPAGE3_IMAGE.Name = "Character_toPAGE3_IMAGE"
Character_toPAGE3_IMAGE.Parent = Others_toPAGE3
Character_toPAGE3_IMAGE.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE3_IMAGE.BorderSizePixel = 0
Character_toPAGE3_IMAGE.Position = UDim2.new(0.900659323, 0, 0, 0)
Character_toPAGE3_IMAGE.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE3_IMAGE.Image = "http://www.roblox.com/asset/?id=1282737326"

Others_backPAGE1.Name = "Others_backPAGE1"
Others_backPAGE1.Parent = Others_2
Others_backPAGE1.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Others_backPAGE1.BorderSizePixel = 0
Others_backPAGE1.Position = UDim2.new(0.0679230243, 0, 0.0439298227, 0)
Others_backPAGE1.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Others_backPAGE1.Font = Enum.Font.SourceSansLight
Others_backPAGE1.FontSize = Enum.FontSize.Size24
Others_backPAGE1.Text = "Prev"
Others_backPAGE1.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_backPAGE1.TextSize = 22

Character_toPAGE1_IMAGE_2.Name = "Character_toPAGE1_IMAGE"
Character_toPAGE1_IMAGE_2.Parent = Others_backPAGE1
Character_toPAGE1_IMAGE_2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE1_IMAGE_2.BorderSizePixel = 0
Character_toPAGE1_IMAGE_2.Position = UDim2.new(-0.400293052, 0, 0, 0)
Character_toPAGE1_IMAGE_2.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE1_IMAGE_2.Image = "http://www.roblox.com/asset/?id=1282894968"

Extra_1.Name = "Extra_1"
Extra_1.Parent = Pages
Extra_1.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Extra_1.BorderSizePixel = 0
Extra_1.Position = UDim2.new(1, 0, 0, 0)
Extra_1.Size = UDim2.new(1, 0, 1, 0)

Extra_Image.Name = "Extra_Image"
Extra_Image.Parent = Extra_1
Extra_Image.BackgroundColor3 = Color3.new(1, 1, 1)
Extra_Image.BackgroundTransparency = 1
Extra_Image.Position = UDim2.new(0.0679230243, 0, 0.0439298227, 0)
Extra_Image.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Extra_Image.Image = "http://www.roblox.com/asset/?id=1281477720"

ExtraText.Name = "ExtraText"
ExtraText.Parent = Extra_1
ExtraText.BackgroundColor3 = Color3.new(1, 1, 1)
ExtraText.BackgroundTransparency = 1
ExtraText.Position = UDim2.new(0.158487067, 0, 0.109824568, 0)
ExtraText.Size = UDim2.new(0.65658927, 0, 0.0878596455, 0)
ExtraText.Font = Enum.Font.SourceSansItalic
ExtraText.FontSize = Enum.FontSize.Size24
ExtraText.Text = "Cool and unique commands for yourself!"
ExtraText.TextSize = 19
ExtraText.TextWrapped = true

ExtraBaseBackGround1.Name = "ExtraBaseBackGround1"
ExtraBaseBackGround1.Parent = Extra_1
ExtraBaseBackGround1.BackgroundColor3 = Color3.new(0.945098, 0.768628, 0.0588235)
ExtraBaseBackGround1.BorderSizePixel = 0
ExtraBaseBackGround1.Position = UDim2.new(0.0790000036, 0, 0.400000006, 0)
ExtraBaseBackGround1.Size = UDim2.new(0.25, 0, 0.600000024, 0)

CrouchRocket.Name = "CrouchRocket"
CrouchRocket.Parent = ExtraBaseBackGround1
CrouchRocket.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
CrouchRocket.BorderSizePixel = 0
CrouchRocket.Position = UDim2.new(0.0901560932, 0, 0.0731094852, 0)
CrouchRocket.Size = UDim2.new(0, 92, 0, 25)
CrouchRocket.Font = Enum.Font.SourceSans
CrouchRocket.FontSize = Enum.FontSize.Size18
CrouchRocket.Text = "Crouch Rocket"
CrouchRocket.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
CrouchRocket.TextSize = 17

ExtraBaseBackGround1Side.Name = "ExtraBaseBackGround1Side"
ExtraBaseBackGround1Side.Parent = ExtraBaseBackGround1
ExtraBaseBackGround1Side.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
ExtraBaseBackGround1Side.BorderSizePixel = 0
ExtraBaseBackGround1Side.Position = UDim2.new(0, 0, -0.109664232, 0)
ExtraBaseBackGround1Side.Size = UDim2.new(1, 0, 0.109999999, 0)

CloneIllusion.Name = "CloneIllusion"
CloneIllusion.Parent = ExtraBaseBackGround1
CloneIllusion.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
CloneIllusion.BorderSizePixel = 0
CloneIllusion.Position = UDim2.new(0.0901560932, 0, 0.292437941, 0)
CloneIllusion.Size = UDim2.new(0, 92, 0, 25)
CloneIllusion.Font = Enum.Font.SourceSans
CloneIllusion.FontSize = Enum.FontSize.Size18
CloneIllusion.Text = "Clone Illusion"
CloneIllusion.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
CloneIllusion.TextSize = 17

CoolSpin.Name = "CoolSpin"
CoolSpin.Parent = ExtraBaseBackGround1
CoolSpin.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
CoolSpin.BorderSizePixel = 0
CoolSpin.Position = UDim2.new(0.0901560932, 0, 0.511766434, 0)
CoolSpin.Size = UDim2.new(0, 92, 0, 25)
CoolSpin.Font = Enum.Font.SourceSans
CoolSpin.FontSize = Enum.FontSize.Size18
CoolSpin.Text = "Cool Spin"
CoolSpin.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
CoolSpin.TextSize = 17

JumpRocket.Name = "JumpRocket"
JumpRocket.Parent = ExtraBaseBackGround1
JumpRocket.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
JumpRocket.BorderSizePixel = 0
JumpRocket.Position = UDim2.new(0.0901560932, 0, 0.731094897, 0)
JumpRocket.Size = UDim2.new(0, 92, 0, 25)
JumpRocket.Font = Enum.Font.SourceSans
JumpRocket.FontSize = Enum.FontSize.Size18
JumpRocket.Text = "Jump Rocket"
JumpRocket.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
JumpRocket.TextSize = 17

Extra_toPAGE2.Name = "Extra_toPAGE2"
Extra_toPAGE2.Parent = Extra_1
Extra_toPAGE2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Extra_toPAGE2.BorderSizePixel = 0
Extra_toPAGE2.Position = UDim2.new(0.819999993, 0, 0.0439999998, 0)
Extra_toPAGE2.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Extra_toPAGE2.Font = Enum.Font.SourceSansLight
Extra_toPAGE2.FontSize = Enum.FontSize.Size24
Extra_toPAGE2.Text = "Next"
Extra_toPAGE2.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Extra_toPAGE2.TextSize = 22

Character_toPAGE2_IMAGE_3.Name = "Character_toPAGE2_IMAGE"
Character_toPAGE2_IMAGE_3.Parent = Extra_toPAGE2
Character_toPAGE2_IMAGE_3.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE2_IMAGE_3.BorderSizePixel = 0
Character_toPAGE2_IMAGE_3.Position = UDim2.new(0.900659323, 0, 0, 0)
Character_toPAGE2_IMAGE_3.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE2_IMAGE_3.Image = "http://www.roblox.com/asset/?id=1282737326"

Extra_Title.Name = "Extra_Title"
Extra_Title.Parent = Extra_1
Extra_Title.BackgroundColor3 = Color3.new(1, 1, 1)
Extra_Title.BackgroundTransparency = 1
Extra_Title.Position = UDim2.new(0.226410091, 0, 0, 0)
Extra_Title.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
Extra_Title.Font = Enum.Font.SourceSansBold
Extra_Title.FontSize = Enum.FontSize.Size28
Extra_Title.Text = "Extra"
Extra_Title.TextSize = 25

ExtraBaseBackGround2.Name = "ExtraBaseBackGround2"
ExtraBaseBackGround2.Parent = Extra_1
ExtraBaseBackGround2.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
ExtraBaseBackGround2.BorderSizePixel = 0
ExtraBaseBackGround2.Position = UDim2.new(0.374000013, 0, 0.400000006, 0)
ExtraBaseBackGround2.Size = UDim2.new(0.25, 0, 0.600000024, 0)

NoLimbs.Name = "NoLimbs"
NoLimbs.Parent = ExtraBaseBackGround2
NoLimbs.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
NoLimbs.BorderSizePixel = 0
NoLimbs.Position = UDim2.new(0.0901560932, 0, 0.0731094852, 0)
NoLimbs.Size = UDim2.new(0, 92, 0, 25)
NoLimbs.Font = Enum.Font.SourceSans
NoLimbs.FontSize = Enum.FontSize.Size18
NoLimbs.Text = "No Limbs"
NoLimbs.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
NoLimbs.TextSize = 17

FEGodmode.Name = "FE Godmode"
FEGodmode.Parent = ExtraBaseBackGround2
FEGodmode.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
FEGodmode.BorderSizePixel = 0
FEGodmode.Position = UDim2.new(0.0901560932, 0, 0.292437941, 0)
FEGodmode.Size = UDim2.new(0, 92, 0, 25)
FEGodmode.Font = Enum.Font.SourceSans
FEGodmode.FontSize = Enum.FontSize.Size18
FEGodmode.Text = "FE Godmode"
FEGodmode.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
FEGodmode.TextSize = 17

BrickHats.Name = "BrickHats"
BrickHats.Parent = ExtraBaseBackGround2
BrickHats.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
BrickHats.BorderSizePixel = 0
BrickHats.Position = UDim2.new(0.0901560932, 0, 0.511766434, 0)
BrickHats.Size = UDim2.new(0, 92, 0, 25)
BrickHats.Font = Enum.Font.SourceSans
BrickHats.FontSize = Enum.FontSize.Size18
BrickHats.Text = "Brick Hats"
BrickHats.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
BrickHats.TextSize = 17

RapidPunch.Name = "RapidPunch"
RapidPunch.Parent = ExtraBaseBackGround2
RapidPunch.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
RapidPunch.BorderSizePixel = 0
RapidPunch.Position = UDim2.new(0.0901560932, 0, 0.731094897, 0)
RapidPunch.Size = UDim2.new(0, 92, 0, 25)
RapidPunch.Font = Enum.Font.SourceSans
RapidPunch.FontSize = Enum.FontSize.Size18
RapidPunch.Text = "RapidPunch"
RapidPunch.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
RapidPunch.TextSize = 17

ExtraBaseBackGround2Side.Name = "ExtraBaseBackGround2Side"
ExtraBaseBackGround2Side.Parent = ExtraBaseBackGround2
ExtraBaseBackGround2Side.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
ExtraBaseBackGround2Side.BorderSizePixel = 0
ExtraBaseBackGround2Side.Position = UDim2.new(0, 0, -0.109664232, 0)
ExtraBaseBackGround2Side.Size = UDim2.new(1, 0, 0.109999999, 0)

ExtraBaseBackGround3.Name = "ExtraBaseBackGround3"
ExtraBaseBackGround3.Parent = Extra_1
ExtraBaseBackGround3.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
ExtraBaseBackGround3.BorderSizePixel = 0
ExtraBaseBackGround3.Position = UDim2.new(0.667999983, 0, 0.400000006, 0)
ExtraBaseBackGround3.Size = UDim2.new(0.25, 0, 0.600000024, 0)

PunchFollow.Name = "PunchFollow"
PunchFollow.Parent = ExtraBaseBackGround3
PunchFollow.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
PunchFollow.BorderSizePixel = 0
PunchFollow.Position = UDim2.new(0.0901560932, 0, 0.0731094852, 0)
PunchFollow.Size = UDim2.new(0, 92, 0, 25)
PunchFollow.Font = Enum.Font.SourceSans
PunchFollow.FontSize = Enum.FontSize.Size18
PunchFollow.Text = "Punch Follow"
PunchFollow.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
PunchFollow.TextSize = 17

ArmFollow.Name = "ArmFollow"
ArmFollow.Parent = ExtraBaseBackGround3
ArmFollow.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
ArmFollow.BorderSizePixel = 0
ArmFollow.Position = UDim2.new(0.0901560932, 0, 0.292437941, 0)
ArmFollow.Size = UDim2.new(0, 92, 0, 25)
ArmFollow.Font = Enum.Font.SourceSans
ArmFollow.FontSize = Enum.FontSize.Size18
ArmFollow.Text = "Arm Follow"
ArmFollow.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
ArmFollow.TextSize = 17

Spin.Name = "Spin"
Spin.Parent = ExtraBaseBackGround3
Spin.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
Spin.BorderSizePixel = 0
Spin.Position = UDim2.new(0.0901560932, 0, 0.511766434, 0)
Spin.Size = UDim2.new(0, 92, 0, 25)
Spin.Font = Enum.Font.SourceSans
Spin.FontSize = Enum.FontSize.Size18
Spin.Text = "Spin"
Spin.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Spin.TextSize = 17

Faint.Name = "Faint"
Faint.Parent = ExtraBaseBackGround3
Faint.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
Faint.BorderSizePixel = 0
Faint.Position = UDim2.new(0.0901560932, 0, 0.731094897, 0)
Faint.Size = UDim2.new(0, 92, 0, 25)
Faint.Font = Enum.Font.SourceSans
Faint.FontSize = Enum.FontSize.Size18
Faint.Text = "Faint"
Faint.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Faint.TextSize = 17

ExtraBaseBackGround3Side.Name = "ExtraBaseBackGround3Side"
ExtraBaseBackGround3Side.Parent = ExtraBaseBackGround3
ExtraBaseBackGround3Side.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
ExtraBaseBackGround3Side.BorderSizePixel = 0
ExtraBaseBackGround3Side.Position = UDim2.new(0, 0, -0.109664232, 0)
ExtraBaseBackGround3Side.Size = UDim2.new(1, 0, 0.109999999, 0)

Extra_2.Name = "Extra_2"
Extra_2.Parent = Pages
Extra_2.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Extra_2.BorderSizePixel = 0
Extra_2.Position = UDim2.new(1, 0, 0, 0)
Extra_2.Size = UDim2.new(1, 0, 1, 0)

Extra_Image_2.Name = "Extra_Image"
Extra_Image_2.Parent = Extra_2
Extra_Image_2.BackgroundColor3 = Color3.new(1, 1, 1)
Extra_Image_2.BackgroundTransparency = 1
Extra_Image_2.Position = UDim2.new(0.80375582, 0, 0.0439298227, 0)
Extra_Image_2.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Extra_Image_2.Image = "http://www.roblox.com/asset/?id=1282931168"

ExtraText_2.Name = "ExtraText"
ExtraText_2.Parent = Extra_2
ExtraText_2.BackgroundColor3 = Color3.new(1, 1, 1)
ExtraText_2.BackgroundTransparency = 1
ExtraText_2.Position = UDim2.new(0.158487067, 0, 0.109824568, 0)
ExtraText_2.Size = UDim2.new(0.65658927, 0, 0.175719291, 0)
ExtraText_2.Font = Enum.Font.SourceSansItalic
ExtraText_2.FontSize = Enum.FontSize.Size24
ExtraText_2.Text = "Cool and unique commands for other players!"
ExtraText_2.TextSize = 19
ExtraText_2.TextWrapped = true

Extra_Title_2.Name = "Extra_Title"
Extra_Title_2.Parent = Extra_2
Extra_Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
Extra_Title_2.BackgroundTransparency = 1
Extra_Title_2.Position = UDim2.new(0.226410091, 0, 0, 0)
Extra_Title_2.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
Extra_Title_2.Font = Enum.Font.SourceSansBold
Extra_Title_2.FontSize = Enum.FontSize.Size28
Extra_Title_2.Text = "Extra"
Extra_Title_2.TextSize = 25

ExtraBaseBackGround2_2.Name = "ExtraBaseBackGround2"
ExtraBaseBackGround2_2.Parent = Extra_2
ExtraBaseBackGround2_2.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
ExtraBaseBackGround2_2.BorderSizePixel = 0
ExtraBaseBackGround2_2.Position = UDim2.new(0.158000007, 0, 0.38499999, 0)
ExtraBaseBackGround2_2.Size = UDim2.new(0.667909801, 0, 0.615017533, 0)

CrouchAttack.Name = "CrouchAttack"
CrouchAttack.Parent = ExtraBaseBackGround2_2
CrouchAttack.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
CrouchAttack.BorderSizePixel = 0
CrouchAttack.Position = UDim2.new(0.576693356, 0, 0.321942836, 0)
CrouchAttack.Size = UDim2.new(0, 92, 0, 25)
CrouchAttack.Font = Enum.Font.SourceSans
CrouchAttack.FontSize = Enum.FontSize.Size18
CrouchAttack.Text = "Crouch Attack"
CrouchAttack.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
CrouchAttack.TextSize = 17

WalkThrough.Name = "WalkThrough"
WalkThrough.Parent = ExtraBaseBackGround2_2
WalkThrough.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
WalkThrough.BorderSizePixel = 0
WalkThrough.Position = UDim2.new(0.118730992, 0, 0.536571443, 0)
WalkThrough.Size = UDim2.new(0, 92, 0, 25)
WalkThrough.Font = Enum.Font.SourceSans
WalkThrough.FontSize = Enum.FontSize.Size18
WalkThrough.Text = "Walk Through"
WalkThrough.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
WalkThrough.TextSize = 17

CreepyWatch.Name = "CreepyWatch"
CreepyWatch.Parent = ExtraBaseBackGround2_2
CreepyWatch.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
CreepyWatch.BorderSizePixel = 0
CreepyWatch.Position = UDim2.new(0.118730992, 0, 0.321942836, 0)
CreepyWatch.Size = UDim2.new(0, 92, 0, 25)
CreepyWatch.Font = Enum.Font.SourceSans
CreepyWatch.FontSize = Enum.FontSize.Size18
CreepyWatch.Text = "Creepy Watch"
CreepyWatch.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
CreepyWatch.TextSize = 17

SpinAttack.Name = "SpinAttack"
SpinAttack.Parent = ExtraBaseBackGround2_2
SpinAttack.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
SpinAttack.BorderSizePixel = 0
SpinAttack.Position = UDim2.new(0.576693356, 0, 0.536571443, 0)
SpinAttack.Size = UDim2.new(0, 92, 0, 25)
SpinAttack.Font = Enum.Font.SourceSans
SpinAttack.FontSize = Enum.FontSize.Size18
SpinAttack.Text = "Spin Attack"
SpinAttack.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
SpinAttack.TextSize = 17

ExtraBaseBackGround2Side_2.Name = "ExtraBaseBackGround2Side"
ExtraBaseBackGround2Side_2.Parent = ExtraBaseBackGround2_2
ExtraBaseBackGround2Side_2.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
ExtraBaseBackGround2Side_2.BorderSizePixel = 0
ExtraBaseBackGround2Side_2.Position = UDim2.new(0, 0, -0.109664232, 0)
ExtraBaseBackGround2Side_2.Size = UDim2.new(1, 0, 0.109999999, 0)

TXTBOX_PlrNameEXTRA.Name = "TXTBOX_PlrNameEXTRA"
TXTBOX_PlrNameEXTRA.Parent = ExtraBaseBackGround2_2
TXTBOX_PlrNameEXTRA.BackgroundColor3 = Color3.new(0.956863, 0.968628, 0.972549)
TXTBOX_PlrNameEXTRA.BorderColor3 = Color3.new(0.152941, 0.682353, 0.376471)
TXTBOX_PlrNameEXTRA.BorderSizePixel = 0
TXTBOX_PlrNameEXTRA.Position = UDim2.new(0.22050041, 0, 0.0715428591, 0)
TXTBOX_PlrNameEXTRA.Size = UDim2.new(0.559731781, 0, 0.143085718, 0)
TXTBOX_PlrNameEXTRA.ZIndex = 2
TXTBOX_PlrNameEXTRA.Font = Enum.Font.SourceSans
TXTBOX_PlrNameEXTRA.FontSize = Enum.FontSize.Size14
TXTBOX_PlrNameEXTRA.Text = "Player"
TXTBOX_PlrNameEXTRA.TextScaled = true
TXTBOX_PlrNameEXTRA.TextSize = 14
TXTBOX_PlrNameEXTRA.TextWrapped = true

_18.Name = "18+"
_18.Parent = ExtraBaseBackGround2_2
_18.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
_18.BorderSizePixel = 0
_18.Position = UDim2.new(0.576693356, 0, 0.75120002, 0)
_18.Size = UDim2.new(0, 92, 0, 25)
_18.Font = Enum.Font.SourceSans
_18.FontSize = Enum.FontSize.Size18
_18.Text = "18+"
_18.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
_18.TextSize = 17

SlamPropulsion.Name = "SlamPropulsion"
SlamPropulsion.Parent = ExtraBaseBackGround2_2
SlamPropulsion.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
SlamPropulsion.BorderSizePixel = 0
SlamPropulsion.Position = UDim2.new(0.118730992, 0, 0.75120002, 0)
SlamPropulsion.Size = UDim2.new(0, 92, 0, 25)
SlamPropulsion.Font = Enum.Font.SourceSans
SlamPropulsion.FontSize = Enum.FontSize.Size18
SlamPropulsion.Text = "Slam Propulsion"
SlamPropulsion.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
SlamPropulsion.TextSize = 15
SlamPropulsion.TextWrapped = true

Extra_backPAGE1.Name = "Extra_backPAGE1"
Extra_backPAGE1.Parent = Extra_2
Extra_backPAGE1.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Extra_backPAGE1.BorderSizePixel = 0
Extra_backPAGE1.Position = UDim2.new(0.0679230243, 0, 0.0439298227, 0)
Extra_backPAGE1.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Extra_backPAGE1.Font = Enum.Font.SourceSansLight
Extra_backPAGE1.FontSize = Enum.FontSize.Size24
Extra_backPAGE1.Text = "Prev"
Extra_backPAGE1.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Extra_backPAGE1.TextSize = 22

Character_toPAGE1_IMAGE_3.Name = "Character_toPAGE1_IMAGE"
Character_toPAGE1_IMAGE_3.Parent = Extra_backPAGE1
Character_toPAGE1_IMAGE_3.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE1_IMAGE_3.BorderSizePixel = 0
Character_toPAGE1_IMAGE_3.Position = UDim2.new(-0.400293052, 0, 0, 0)
Character_toPAGE1_IMAGE_3.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE1_IMAGE_3.Image = "http://www.roblox.com/asset/?id=1282894968"

Others_3.Name = "Others_3"
Others_3.Parent = Pages
Others_3.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_3.BorderSizePixel = 0
Others_3.Position = UDim2.new(1, 0, 0, 0)
Others_3.Size = UDim2.new(1, 0, 1, 0)

OthersTitle_3.Name = "OthersTitle"
OthersTitle_3.Parent = Others_3
OthersTitle_3.BackgroundColor3 = Color3.new(1, 1, 1)
OthersTitle_3.BackgroundTransparency = 1
OthersTitle_3.Position = UDim2.new(0.226410091, 0, 0, 0)
OthersTitle_3.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
OthersTitle_3.Font = Enum.Font.SourceSansBold
OthersTitle_3.FontSize = Enum.FontSize.Size28
OthersTitle_3.Text = "Others"
OthersTitle_3.TextSize = 25

Other_Image3.Name = "Other_Image3"
Other_Image3.Parent = Others_3
Other_Image3.BackgroundColor3 = Color3.new(1, 1, 1)
Other_Image3.BackgroundTransparency = 1
Other_Image3.Position = UDim2.new(0.124525554, 0, 0.219649136, 0)
Other_Image3.Size = UDim2.new(0.101884536, 0, 0.197684199, 0)
Other_Image3.Image = "http://www.roblox.com/asset/?id=1281286925"

OthersText_3.Name = "OthersText"
OthersText_3.Parent = Others_3
OthersText_3.BackgroundColor3 = Color3.new(1, 1, 1)
OthersText_3.BackgroundTransparency = 1
OthersText_3.Position = UDim2.new(0.237730592, 0, 0.197684199, 0)
OthersText_3.Size = UDim2.new(0.65658927, 0, 0.219649136, 0)
OthersText_3.Font = Enum.Font.SourceSansItalic
OthersText_3.FontSize = Enum.FontSize.Size24
OthersText_3.Text = "Warning! You require tools in your inventory to use these. Some games/tools do not work."
OthersText_3.TextSize = 19
OthersText_3.TextWrapped = true

TXTBOX_PlrNameOTHER3.Name = "TXTBOX_PlrNameOTHER3"
TXTBOX_PlrNameOTHER3.Parent = Others_3
TXTBOX_PlrNameOTHER3.BackgroundColor3 = Color3.new(0.956863, 0.968628, 0.972549)
TXTBOX_PlrNameOTHER3.BorderColor3 = Color3.new(0.152941, 0.682353, 0.376471)
TXTBOX_PlrNameOTHER3.BorderSizePixel = 0
TXTBOX_PlrNameOTHER3.Position = UDim2.new(0.249051109, 0, 0.571087658, 0)
TXTBOX_PlrNameOTHER3.Size = UDim2.new(0.520743191, 0, 0.0878596455, 0)
TXTBOX_PlrNameOTHER3.ZIndex = 2
TXTBOX_PlrNameOTHER3.Font = Enum.Font.SourceSans
TXTBOX_PlrNameOTHER3.FontSize = Enum.FontSize.Size14
TXTBOX_PlrNameOTHER3.Text = "Player"
TXTBOX_PlrNameOTHER3.TextScaled = true
TXTBOX_PlrNameOTHER3.TextSize = 14
TXTBOX_PlrNameOTHER3.TextWrapped = true

othersBaseBackground3.Name = "othersBaseBackground3"
othersBaseBackground3.Parent = Others_3
othersBaseBackground3.BackgroundColor3 = Color3.new(0.752941, 0.223529, 0.168627)
othersBaseBackground3.BorderSizePixel = 0
othersBaseBackground3.Position = UDim2.new(0.125, 0, 0.518999994, 0)
othersBaseBackground3.Size = UDim2.new(0.769794285, 0, 0.483228087, 0)

FreeFall.Name = "FreeFall"
FreeFall.Parent = othersBaseBackground3
FreeFall.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
FreeFall.BorderSizePixel = 0
FreeFall.Position = UDim2.new(0.367916405, 0, 0.364218175, 0)
FreeFall.Size = UDim2.new(0, 92, 0, 25)
FreeFall.Font = Enum.Font.SourceSans
FreeFall.FontSize = Enum.FontSize.Size24
FreeFall.Text = "Free Fall"
FreeFall.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
FreeFall.TextSize = 22

Attach.Name = "Attach"
Attach.Parent = othersBaseBackground3
Attach.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
Attach.BorderSizePixel = 0
Attach.Position = UDim2.new(0.67696619, 0, 0.364218175, 0)
Attach.Size = UDim2.new(0, 92, 0, 25)
Attach.Font = Enum.Font.SourceSans
Attach.FontSize = Enum.FontSize.Size24
Attach.Text = "Attach"
Attach.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Attach.TextSize = 22

Bring.Name = "Bring"
Bring.Parent = othersBaseBackground3
Bring.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
Bring.BorderSizePixel = 0
Bring.Position = UDim2.new(0.67696619, 0, 0.682909131, 0)
Bring.Size = UDim2.new(0, 92, 0, 25)
Bring.Font = Enum.Font.SourceSans
Bring.FontSize = Enum.FontSize.Size24
Bring.Text = "Bring"
Bring.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Bring.TextSize = 22

SafeKill.Name = "SafeKill"
SafeKill.Parent = othersBaseBackground3
SafeKill.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
SafeKill.BorderSizePixel = 0
SafeKill.Position = UDim2.new(0.367916405, 0, 0.682909131, 0)
SafeKill.Size = UDim2.new(0, 92, 0, 25)
SafeKill.Font = Enum.Font.SourceSans
SafeKill.FontSize = Enum.FontSize.Size24
SafeKill.Text = "SafeKill"
SafeKill.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
SafeKill.TextSize = 22

SuperSpin.Name = "SuperSpin"
SuperSpin.Parent = othersBaseBackground3
SuperSpin.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
SuperSpin.BorderSizePixel = 0
SuperSpin.Position = UDim2.new(0.0588666238, 0, 0.682909131, 0)
SuperSpin.Size = UDim2.new(0, 92, 0, 25)
SuperSpin.Font = Enum.Font.SourceSans
SuperSpin.FontSize = Enum.FontSize.Size24
SuperSpin.Text = "SuperSpin"
SuperSpin.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
SuperSpin.TextSize = 22

Kill.Name = "Kill"
Kill.Parent = othersBaseBackground3
Kill.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
Kill.BorderSizePixel = 0
Kill.Position = UDim2.new(0.0588666238, 0, 0.364218175, 0)
Kill.Size = UDim2.new(0, 92, 0, 25)
Kill.Font = Enum.Font.SourceSans
Kill.FontSize = Enum.FontSize.Size24
Kill.Text = "Kill"
Kill.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Kill.TextSize = 22

Others_backPAGE2.Name = "Others_backPAGE2"
Others_backPAGE2.Parent = Others_3
Others_backPAGE2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Others_backPAGE2.BorderSizePixel = 0
Others_backPAGE2.Position = UDim2.new(0.0679230243, 0, 0.0439298227, 0)
Others_backPAGE2.Size = UDim2.new(0.113205045, 0, 0.109824568, 0)
Others_backPAGE2.Font = Enum.Font.SourceSansLight
Others_backPAGE2.FontSize = Enum.FontSize.Size24
Others_backPAGE2.Text = "Prev"
Others_backPAGE2.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Others_backPAGE2.TextSize = 22

Character_toPAGE1_IMAGE_4.Name = "Character_toPAGE1_IMAGE"
Character_toPAGE1_IMAGE_4.Parent = Others_backPAGE2
Character_toPAGE1_IMAGE_4.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Character_toPAGE1_IMAGE_4.BorderSizePixel = 0
Character_toPAGE1_IMAGE_4.Position = UDim2.new(-0.400293052, 0, 0, 0)
Character_toPAGE1_IMAGE_4.Size = UDim2.new(0, 25, 0, 25)
Character_toPAGE1_IMAGE_4.Image = "http://www.roblox.com/asset/?id=1282894968"

Games.Name = "Games"
Games.Parent = Pages
Games.BackgroundColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Games.BorderSizePixel = 0
Games.Position = UDim2.new(1, 0, 0, 0)
Games.Size = UDim2.new(1, 0, 1, 0)

Games_IMAGE.Name = "Games_IMAGE"
Games_IMAGE.Parent = Games
Games_IMAGE.BackgroundColor3 = Color3.new(1, 1, 1)
Games_IMAGE.BackgroundTransparency = 1
Games_IMAGE.Position = UDim2.new(0.0679230243, 0, 0.109824568, 0)
Games_IMAGE.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Games_IMAGE.Image = "http://www.roblox.com/asset/?id=1281454262"

GamesText.Name = "GamesText"
GamesText.Parent = Games
GamesText.BackgroundColor3 = Color3.new(1, 1, 1)
GamesText.BackgroundTransparency = 1
GamesText.Position = UDim2.new(0.158487067, 0, 0.109824568, 0)
GamesText.Size = UDim2.new(0.65658927, 0, 0.175719291, 0)
GamesText.Font = Enum.Font.SourceSansItalic
GamesText.FontSize = Enum.FontSize.Size24
GamesText.Text = "Not a completed part, I will be updating with more games."
GamesText.TextSize = 19
GamesText.TextWrapped = true

Games_TITLE.Name = "Games_TITLE"
Games_TITLE.Parent = Games
Games_TITLE.BackgroundColor3 = Color3.new(1, 1, 1)
Games_TITLE.BackgroundTransparency = 1
Games_TITLE.Position = UDim2.new(0.226410091, 0, 0, 0)
Games_TITLE.Size = UDim2.new(0.522657692, 0, 0.1364429, 0)
Games_TITLE.Font = Enum.Font.SourceSansBold
Games_TITLE.FontSize = Enum.FontSize.Size28
Games_TITLE.Text = "Games"
Games_TITLE.TextSize = 25

Games_IMAGE2.Name = "Games_IMAGE2"
Games_IMAGE2.Parent = Games
Games_IMAGE2.BackgroundColor3 = Color3.new(1, 1, 1)
Games_IMAGE2.BackgroundTransparency = 1
Games_IMAGE2.Position = UDim2.new(0.815076292, 0, 0.109824568, 0)
Games_IMAGE2.Size = UDim2.new(0.0908969939, 0, 0.175596073, 0)
Games_IMAGE2.Image = "http://www.roblox.com/asset/?id=1281454262"

SwordFightingTournament.Name = "SwordFightingTournament"
SwordFightingTournament.Parent = Games
SwordFightingTournament.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
SwordFightingTournament.BorderSizePixel = 0
SwordFightingTournament.Position = UDim2.new(0.350935638, 0, 0.329473704, 0)
SwordFightingTournament.Size = UDim2.new(0.283012629, 0, 0.109824568, 0)
SwordFightingTournament.Font = Enum.Font.SourceSans
SwordFightingTournament.FontSize = Enum.FontSize.Size14
SwordFightingTournament.Text = "Sword Fighting Tournament"
SwordFightingTournament.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
SwordFightingTournament.TextScaled = true
SwordFightingTournament.TextSize = 14
SwordFightingTournament.TextWrapped = true

PlatesOfFateMayhem.Name = "PlatesOfFateMayhem"
PlatesOfFateMayhem.Parent = Games
PlatesOfFateMayhem.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
PlatesOfFateMayhem.BorderSizePixel = 0
PlatesOfFateMayhem.Position = UDim2.new(0.350935638, 0, 0.483228087, 0)
PlatesOfFateMayhem.Size = UDim2.new(0.283012629, 0, 0.109824568, 0)
PlatesOfFateMayhem.Font = Enum.Font.SourceSans
PlatesOfFateMayhem.FontSize = Enum.FontSize.Size14
PlatesOfFateMayhem.Text = "Plates of Fate: Mayhem"
PlatesOfFateMayhem.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
PlatesOfFateMayhem.TextScaled = true
PlatesOfFateMayhem.TextSize = 14
PlatesOfFateMayhem.TextWrapped = true

GamesText2.Name = "GamesText2"
GamesText2.Parent = Games
GamesText2.BackgroundColor3 = Color3.new(1, 1, 1)
GamesText2.BackgroundTransparency = 1
GamesText2.Position = UDim2.new(0.0679230243, 0, 0.768771946, 0)
GamesText2.Size = UDim2.new(0.871678829, 0, 0.175719291, 0)
GamesText2.Font = Enum.Font.SourceSansItalic
GamesText2.FontSize = Enum.FontSize.Size24
GamesText2.Text = "Since games update, buttons can sometimes not work. If they do not work, please let me know so I can update."
GamesText2.TextSize = 19
GamesText2.TextWrapped = true

Frappe.Name = "Frappe"
Frappe.Parent = Games
Frappe.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Frappe.BorderSizePixel = 0
Frappe.Position = UDim2.new(0.350935638, 0, 0.636982441, 0)
Frappe.Size = UDim2.new(0.283012629, 0, 0.109824568, 0)
Frappe.Font = Enum.Font.SourceSans
Frappe.FontSize = Enum.FontSize.Size14
Frappe.Text = "Frappe"
Frappe.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Frappe.TextScaled = true
Frappe.TextSize = 14
Frappe.TextWrapped = true

Frappe_2.Name = "Frappe"
Frappe_2.Parent = Games
Frappe_2.BackgroundColor3 = Color3.new(0.203922, 0.286275, 0.368627)
Frappe_2.BorderSizePixel = 0
Frappe_2.Position = UDim2.new(0.667909801, 0, 0.329473704, 0)
Frappe_2.Size = UDim2.new(0.283012629, 0, 0.109824568, 0)
Frappe_2.Font = Enum.Font.SourceSans
Frappe_2.FontSize = Enum.FontSize.Size14
Frappe_2.Text = "Frappe"
Frappe_2.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Frappe_2.TextScaled = true
Frappe_2.TextSize = 14
Frappe_2.TextWrapped = true

MenuFrame.Name = "MenuFrame"
MenuFrame.Parent = MainFrame
MenuFrame.BackgroundColor3 = Color3.new(0.741176, 0.764706, 0.780392)
MenuFrame.BorderSizePixel = 0
MenuFrame.Position = UDim2.new(-0.38499999, 0, 0.075000003, 0)
MenuFrame.Size = UDim2.new(0, 170, 0, 271)

Welcome.Name = "Welcome"
Welcome.Parent = MenuFrame
Welcome.BackgroundColor3 = Color3.new(1, 1, 1)
Welcome.BackgroundTransparency = 1
Welcome.Position = UDim2.new(0.0294333119, 0, 0.0184797049, 0)
Welcome.Size = UDim2.new(0.941865981, 0, 0.0739188194, 0)
Welcome.Font = Enum.Font.SourceSansLight
Welcome.FontSize = Enum.FontSize.Size14
Welcome.Text = "Welcome,"
Welcome.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
Welcome.TextScaled = true
Welcome.TextSize = 14
Welcome.TextWrapped = true

NameOfPlayer.Name = "NameOfPlayer"
NameOfPlayer.Parent = MenuFrame
NameOfPlayer.BackgroundColor3 = Color3.new(1, 1, 1)
NameOfPlayer.BackgroundTransparency = 1
NameOfPlayer.Position = UDim2.new(0, 0, 0.0923985243, 0)
NameOfPlayer.Size = UDim2.new(0.971299291, 0, 0.0739188194, 0)
NameOfPlayer.Font = Enum.Font.SourceSansItalic
NameOfPlayer.FontSize = Enum.FontSize.Size14
NameOfPlayer.Text = "PlayerName"
NameOfPlayer.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
NameOfPlayer.TextScaled = true
NameOfPlayer.TextSize = 14
NameOfPlayer.TextWrapped = true

T_Information.Name = "T_Information"
T_Information.Parent = MenuFrame
T_Information.BackgroundColor3 = Color3.new(0.584314, 0.647059, 0.65098)
T_Information.BorderSizePixel = 0
T_Information.Position = UDim2.new(0, 0, 0.221756458, 0)
T_Information.Size = UDim2.new(1.00073266, 0, 0.0923985243, 0)
T_Information.Font = Enum.Font.SourceSans
T_Information.FontSize = Enum.FontSize.Size18
T_Information.Text = "Information"
T_Information.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
T_Information.TextSize = 16
T_Information.TextXAlignment = Enum.TextXAlignment.Left

T_InfoImage.Name = "T_InfoImage"
T_InfoImage.Parent = T_Information
T_InfoImage.BackgroundColor3 = Color3.new(1, 1, 1)
T_InfoImage.BackgroundTransparency = 1
T_InfoImage.Position = UDim2.new(0.79469943, 0, -0.400639981, 0)
T_InfoImage.Size = UDim2.new(0.176599875, 0, 1.20192003, 0)
T_InfoImage.Image = "http://www.roblox.com/asset/?id=1281284684"

T_Character.Name = "T_Character"
T_Character.Parent = MenuFrame
T_Character.BackgroundColor3 = Color3.new(0.584314, 0.647059, 0.65098)
T_Character.BorderSizePixel = 0
T_Character.Position = UDim2.new(0, 0, 0.388073802, 0)
T_Character.Size = UDim2.new(1.00073266, 0, 0.0923985243, 0)
T_Character.Font = Enum.Font.SourceSans
T_Character.FontSize = Enum.FontSize.Size18
T_Character.Text = "Character"
T_Character.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
T_Character.TextSize = 16
T_Character.TextXAlignment = Enum.TextXAlignment.Left

T_CharImage.Name = "T_CharImage"
T_CharImage.Parent = T_Character
T_CharImage.BackgroundColor3 = Color3.new(1, 1, 1)
T_CharImage.BackgroundTransparency = 1
T_CharImage.Position = UDim2.new(0.79469943, 0, -0.400639981, 0)
T_CharImage.Size = UDim2.new(0.176599875, 0, 1.20192003, 0)
T_CharImage.Image = "http://www.roblox.com/asset/?id=1281299598"

T_Games.Name = "T_Games"
T_Games.Parent = MenuFrame
T_Games.BackgroundColor3 = Color3.new(0.584314, 0.647059, 0.65098)
T_Games.BorderSizePixel = 0
T_Games.Position = UDim2.new(0, 0, 0.498952031, 0)
T_Games.Size = UDim2.new(1.00073266, 0, 0.0923985243, 0)
T_Games.Font = Enum.Font.SourceSans
T_Games.FontSize = Enum.FontSize.Size18
T_Games.Text = "Games"
T_Games.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
T_Games.TextSize = 16
T_Games.TextXAlignment = Enum.TextXAlignment.Left

T_GameImage.Name = "T_GameImage"
T_GameImage.Parent = T_Games
T_GameImage.BackgroundColor3 = Color3.new(1, 1, 1)
T_GameImage.BackgroundTransparency = 1
T_GameImage.Position = UDim2.new(0.79469943, 0, -0.400639981, 0)
T_GameImage.Size = UDim2.new(0.176599875, 0, 1.20192003, 0)
T_GameImage.Image = "http://www.roblox.com/asset/?id=1281454262"

T_Others.Name = "T_Others"
T_Others.Parent = MenuFrame
T_Others.BackgroundColor3 = Color3.new(0.584314, 0.647059, 0.65098)
T_Others.BorderSizePixel = 0
T_Others.Position = UDim2.new(0, 0, 0.60983026, 0)
T_Others.Size = UDim2.new(1.00073266, 0, 0.0923985243, 0)
T_Others.Font = Enum.Font.SourceSans
T_Others.FontSize = Enum.FontSize.Size18
T_Others.Text = "Others"
T_Others.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
T_Others.TextSize = 16
T_Others.TextXAlignment = Enum.TextXAlignment.Left

T_OtherImage.Name = "T_OtherImage"
T_OtherImage.Parent = T_Others
T_OtherImage.BackgroundColor3 = Color3.new(1, 1, 1)
T_OtherImage.BackgroundTransparency = 1
T_OtherImage.Position = UDim2.new(0.795000017, 0, -0.351000011, 0)
T_OtherImage.Size = UDim2.new(0, 30, 0, 30)
T_OtherImage.Image = "http://www.roblox.com/asset/?id=1281476978"

T_Extra.Name = "T_Extra"
T_Extra.Parent = MenuFrame
T_Extra.BackgroundColor3 = Color3.new(0.584314, 0.647059, 0.65098)
T_Extra.BorderSizePixel = 0
T_Extra.Position = UDim2.new(0, 0, 0.720708489, 0)
T_Extra.Size = UDim2.new(1.00073266, 0, 0.0923985243, 0)
T_Extra.Font = Enum.Font.SourceSans
T_Extra.FontSize = Enum.FontSize.Size18
T_Extra.Text = "Extra"
T_Extra.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
T_Extra.TextSize = 16
T_Extra.TextXAlignment = Enum.TextXAlignment.Left

T_ExtraImage.Name = "T_ExtraImage"
T_ExtraImage.Parent = T_Extra
T_ExtraImage.BackgroundColor3 = Color3.new(1, 1, 1)
T_ExtraImage.BackgroundTransparency = 1
T_ExtraImage.Position = UDim2.new(0.79469943, 0, -0.400639981, 0)
T_ExtraImage.Size = UDim2.new(0.176599875, 0, 1.20192003, 0)
T_ExtraImage.Image = "http://www.roblox.com/asset/?id=1281477720"

DeleteGUI.Name = "DeleteGUI"
DeleteGUI.Parent = MenuFrame
DeleteGUI.BackgroundColor3 = Color3.new(0.752941, 0.223529, 0.168627)
DeleteGUI.BorderSizePixel = 0
DeleteGUI.Position = UDim2.new(0, 0, 0.887025833, 0)
DeleteGUI.Size = UDim2.new(1.00073266, 0, 0.0923985243, 0)
DeleteGUI.Font = Enum.Font.SourceSans
DeleteGUI.FontSize = Enum.FontSize.Size18
DeleteGUI.Text = "Delete GUI"
DeleteGUI.TextColor3 = Color3.new(0.92549, 0.941177, 0.945098)
DeleteGUI.TextSize = 16
DeleteGUI.TextXAlignment = Enum.TextXAlignment.Left

DELETEIMAGE.Name = "DELETEIMAGE"
DELETEIMAGE.Parent = DeleteGUI
DELETEIMAGE.BackgroundColor3 = Color3.new(1, 1, 1)
DELETEIMAGE.BackgroundTransparency = 1
DELETEIMAGE.Position = UDim2.new(0.853566051, 0, 0, 0)
DELETEIMAGE.Size = UDim2.new(0.14716655, 0, 1.00160003, 0)
DELETEIMAGE.Image = "http://www.roblox.com/asset/?id=1281475635"

Darkness.Name = "Darkness"
Darkness.Parent = MainFrame
Darkness.BackgroundColor3 = Color3.new(0.180392, 0.192157, 0.176471)
Darkness.BackgroundTransparency = 0.8
Darkness.BorderSizePixel = 0
Darkness.Position = UDim2.new(0.38499999, 0, 0.075000003, 0)
Darkness.Size = UDim2.new(0, 272, 0, 271)
Darkness.Visible = false
Darkness.ZIndex = 7
Darkness.Font = Enum.Font.SourceSans
Darkness.FontSize = Enum.FontSize.Size14
Darkness.Text = ""
Darkness.TextSize = 14

-----------------------------------------------------------------
-----------------------------------------------------------------
NameOfPlayer.Text = game.Players.LocalPlayer.Name
if game.Workspace.FilteringEnabled == true then
	Image_FE_ENABLED.Visible = true
	Image_FE_DISABLED.Visible = false
	Text_FE_ENABLED.Visible = true
	Text_FE_DISABLED.Visible = false
else
	Image_FE_ENABLED.Visible = false
	Image_FE_DISABLED.Visible = true
	Text_FE_ENABLED.Visible = false
	Text_FE_DISABLED.Visible = true
end

function GetPlayer(String) -- Credit to Timeless/xFunnieuss
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game.Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                table.insert(Found,v)
            end
        end    
    else
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end    
    end
    return Found    
end

OpenMenu.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(0, 0, 0.075, 0), "Out", "Sine", 0.7)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 170, 0.075, 0), "Out", "Sine", 0.7)
	Pages:TweenPosition(UDim2.new(0, 170, 0.223, 0), "Out", "Sine", 0.7)
	wait(0.7)
	Darkness.Visible = true
	Darkness.BackgroundTransparency = 0.8
end)

Darkness.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(-0.385, 0, 0.075, 0), "Out", "Sine", 0.7)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 0, 0.074, 0), "Out", "Sine", 0.7)
	Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 0.7)
	Darkness.Visible = false
end)

closedgui = true
CloseGUI.MouseButton1Click:connect(function()
	wait(0.3)
	if closedgui then
		Pages.Position = UDim2.new(0, 0, 0.223, 0)
		OpenMenu.Position = UDim2.new(0, 0, 0, 0)
		MenuFrame.Position = UDim2.new(-0.38499999, 0, 0.075000003, 0)
		MenuEnterFrame.Position = UDim2.new(0, 0, 0.0741975307, 0)
		Darkness.Visible = false
		Pages:TweenPosition(UDim2.new(0, 0, -0.786, 0), "Out", "Sine", 1.5)
		OpenMenu:TweenPosition(UDim2.new(-0.102, 0, 0, 0), "Out", "Sine", 1.5)
		wait(1.6)
		MenuFrame.Position = UDim2.new(-0.38499999, 0, 0.075000003, 0)
		Darkness.Visible = false
		MenuEnterFrame.Position = UDim2.new(0, 0, 0.0741975307, 0)
		closedgui = false
	else
		Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 1.5)
		wait(1.5)
		OpenMenu:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
		wait(0.6)
		closedgui = true
	end
end)

DeleteGUI.MouseButton1Click:connect(function()
	game.CoreGui.OPFinality:Destroy()
end)

T_Character.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(-0.385, 0, 0.075, 0), "Out", "Sine", 0.5)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 0, 0.074, 0), "Out", "Sine", 0.5)
	Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 0.5)
	Darkness.Visible = false
	wait(0.5)
	Character_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Games:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Information:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_3:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Character_1:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)

T_Extra.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(-0.385, 0, 0.075, 0), "Out", "Sine", 0.5)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 0, 0.074, 0), "Out", "Sine", 0.5)
	Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 0.5)
	Darkness.Visible = false
	wait(0.5)
	Character_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Character_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Games:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Information:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_3:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Extra_1:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)

T_Games.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(-0.385, 0, 0.075, 0), "Out", "Sine", 0.5)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 0, 0.074, 0), "Out", "Sine", 0.5)
	Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 0.5)
	Darkness.Visible = false
	wait(0.5)
	Character_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Character_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Information:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_3:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Games:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)

T_Information.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(-0.385, 0, 0.075, 0), "Out", "Sine", 0.5)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 0, 0.074, 0), "Out", "Sine", 0.5)
	Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 0.5)
	Darkness.Visible = false
	wait(0.5)
	Character_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Character_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Games:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_3:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Information:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)

T_Others.MouseButton1Click:connect(function()
	MenuFrame:TweenPosition(UDim2.new(-0.385, 0, 0.075, 0), "Out", "Sine", 0.5)
	MenuEnterFrame:TweenPosition(UDim2.new(0, 0, 0.074, 0), "Out", "Sine", 0.5)
	Pages:TweenPosition(UDim2.new(0, 0, 0.223, 0), "Out", "Sine", 0.5)
	Darkness.Visible = false
	wait(0.5)
	Character_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Character_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Games:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Information:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Extra_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	Others_3:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Others_1:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)

Character_toPAGE2.MouseButton1Click:connect(function()
	Character_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Character_2:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Character_backPAGE1.MouseButton1Click:connect(function()
	Character_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Character_1:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Extra_toPAGE2.MouseButton1Click:connect(function()
	Extra_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Extra_2:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Extra_backPAGE1.MouseButton1Click:connect(function()
	Extra_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Extra_1:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Others_toPAGE2.MouseButton1Click:connect(function()
	Others_1:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Others_2:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Others_toPAGE3.MouseButton1Click:connect(function()
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Others_3:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Others_backPAGE1.MouseButton1Click:connect(function()
	Others_2:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Others_1:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)
Others_backPAGE2.MouseButton1Click:connect(function()
	Others_3:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Sine", 0.5)
	wait(0.5)
	Others_2:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5)
end)

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

HipHeight.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.Humanoid.HipHeight = TXTBOX_Stats.Text
end)
Speed.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = TXTBOX_Stats.Text
end)
JumpHeight.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = TXTBOX_Stats.Text
end)
Chat.MouseButton1Click:connect(function()
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(TXTBOX_Chat.Text, "All")
end)
SpammingChar = false
Spam_2.MouseButton1Click:connect(function()
	SpammingChar = not SpammingChar
end)

local flying = false
Fly.MouseButton1Click:connect(function()
flying = not flying
repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 80
local speed = 0
if flying then
	Fly.BackgroundColor3 = Color3.new(0.201961, 0.837255, 0.711765)
else
	Fly.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
end
 
function FlyFunction()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
FlyFunction()
end)

clip = true
Noclip.MouseButton1Click:connect(function()
	clip = not clip
	game:GetService('RunService').Stepped:connect(function()
		if not clip then
			Noclip.BackgroundColor3 = Color3.new(0.201961, 0.837255, 0.711765)
			game.Players.LocalPlayer.Character.Head.CanCollide = false
			game.Players.LocalPlayer.Character.Torso.CanCollide = false
			game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
			game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
		else
			Noclip.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
		end
	end)
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://33169583"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local armsareoff = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    armsareoff = false
	armsoff.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
armsoff.MouseButton1Click:connect(function()
	armsareoff = not armsareoff
	if armsareoff then
		armsoff.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if armsareoff then
				track:Play(.1, 1, 1e6)
			end
		 end
		end
	else
		track:Stop()
		armsoff.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://121572214"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
headfloatACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    headfloatACTIVE = false
	headfloat.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
headfloat.MouseButton1Click:connect(function()
	headfloatACTIVE = not headfloatACTIVE
	if headfloatACTIVE then
		headfloat.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if headfloatACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		headfloat.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://35154961"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local headthrowACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    headthrowACTIVE = false
	headthrow.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
headthrow.MouseButton1Click:connect(function()
	headthrowACTIVE = not headthrowACTIVE
	if headthrowACTIVE then
		headthrow.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if headthrowACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		headthrow.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://35154961"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local loopheadACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    loopheadACTIVE = false
	loophead.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
loophead.MouseButton1Click:connect(function()
	loopheadACTIVE = not loopheadACTIVE
	if loopheadACTIVE then
		loophead.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if loopheadACTIVE then
				track:Play(.1, 1, 1e6)
			end
		 end
		end
	else
		track:Stop()
		loophead.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://313762630"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local levitateACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    levitateACTIVE = false
	levitate.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
levitate.MouseButton1Click:connect(function()
	levitateACTIVE = not levitateACTIVE
	if levitateACTIVE then
		levitate.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if levitateACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		levitate.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://282574440"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local crawlACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    crawlACTIVE = false
	crawl.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
crawl.MouseButton1Click:connect(function()
	crawlACTIVE = not crawlACTIVE
	if crawlACTIVE then
		crawl.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if crawlACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		crawl.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://184574340"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local jumplandACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    jumplandACTIVE = false
	jumpland.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
jumpland.MouseButton1Click:connect(function()
	jumplandACTIVE = not jumplandACTIVE
	if jumplandACTIVE then
		jumpland.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if jumplandACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		jumpland.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://126753849"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local punchesACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    punchesACTIVE = false
	punches.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
punches.MouseButton1Click:connect(function()
	punchesACTIVE = not punchesACTIVE
	if punchesACTIVE then
		punches.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if punchesACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		punches.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204062532"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local swingACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    swingACTIVE = false
	swing.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
swing.MouseButton1Click:connect(function()
	swingACTIVE = not swingACTIVE
	if swingACTIVE then
		swing.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if swingACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		swing.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204295235"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local swordstrikeACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    swordstrikeACTIVE = false
	swordstrike.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
swordstrike.MouseButton1Click:connect(function()
	swordstrikeACTIVE = not swordstrikeACTIVE
	if swordstrikeACTIVE then
		swordstrike.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if swordstrikeACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		swordstrike.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://45834924"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local happyACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    happyACTIVE = false
	happy.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
happy.MouseButton1Click:connect(function()
	happyACTIVE = not happyACTIVE
	if happyACTIVE then
		happy.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if happyACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		happy.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://33796059"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local insaneACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    insaneACTIVE = false
	insane.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
insane.MouseButton1Click:connect(function()
	insaneACTIVE = not insaneACTIVE
	if insaneACTIVE then
		insane.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if insaneACTIVE then
				track:Play(.1, 1, 1e6)
			end
		 end
		end
	else
		track:Stop()
		insane.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://429703734"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local movingdanceACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    movingdanceACTIVE = false
	movingdance.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
movingdance.MouseButton1Click:connect(function()
	movingdanceACTIVE = not movingdanceACTIVE
	if movingdanceACTIVE then
		movingdance.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if movingdanceACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		movingdance.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://35654637"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local normalACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    normalACTIVE = false
	normal.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
normal.MouseButton1Click:connect(function()
	normalACTIVE = not normalACTIVE
	if normalACTIVE then
		normal.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if normalACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		normal.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://186934910"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local spindanceACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    spindanceACTIVE = false
	spindance.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
end)
spindance.MouseButton1Click:connect(function()
	spindanceACTIVE = not spindanceACTIVE
	if spindanceACTIVE then
		spindance.BackgroundColor3 = Color3.new(0.851961, 0.694118, 0.333333)
		while wait() do
		 if track.IsPlaying == false then
			if spindanceACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		spindance.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local CloneIllusionACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    CloneIllusionACTIVE = false
	CloneIllusion.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
end)
CloneIllusion.MouseButton1Click:connect(function()
	CloneIllusionACTIVE = not CloneIllusionACTIVE
	if CloneIllusionACTIVE then
		CloneIllusion.BackgroundColor3 = Color3.new(0.992941, 0.811765, 0.2705882)
		while wait() do
		 if track.IsPlaying == false then
			if CloneIllusionACTIVE then
				track:Play(.1, 1, 1e6)
			end
		 end
		end
	else
		track:Stop()
		CloneIllusion.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
	end
end)

spinning = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    spinning = false
	CoolSpin.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
end)
CoolSpin.MouseButton1Click:connect(function()
	spinning = not spinning
	if spinning then
		local p = Instance.new("RocketPropulsion")
		p.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		p.Name = "CrazySpin"
		p.Target = game.Players.LocalPlayer.Character["Left Arm"]
		p:Fire()
		CoolSpin.BackgroundColor3 = Color3.new(0.992941, 0.811765, 0.2705882)
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CrazySpin:Destroy()
		CoolSpin.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://180612465"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local ScaredACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    ScaredACTIVE = false
	CrouchRocket.BackgroundColor3 = Color3.new(0.952941, 0.711765, 0.1705882)
end)
CrouchRocket.MouseButton1Click:connect(function()
	ScaredACTIVE = not ScaredACTIVE
	if ScaredACTIVE then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "CrouchRocket"
		u.Target = game.Players.LocalPlayer.Character.Head
		u:Fire()
		CrouchRocket.BackgroundColor3 = Color3.new(0.992941, 0.811765, 0.2705882)
		while wait() do
		 if track.IsPlaying == false then
			if ScaredACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		CrouchRocket.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CrouchRocket:Destroy()
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://184574340"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local jumprocketnow = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    jumprocketnow = false
	JumpRocket.BackgroundColor3 = Color3.new(0.952941, 0.711765, 0.1705882)
end)
JumpRocket.MouseButton1Click:connect(function()
	jumprocketnow = not jumprocketnow
	if jumprocketnow then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "JumpRocket"
		u.Target = game.Players.LocalPlayer.Character.Head
		u:Fire()
		JumpRocket.BackgroundColor3 = Color3.new(0.992941, 0.811765, 0.2705882)
		while wait() do
		 if track.IsPlaying == false then
			if jumprocketnow then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		JumpRocket.BackgroundColor3 = Color3.new(0.952941, 0.611765, 0.0705882)
		game.Players.LocalPlayer.Character.HumanoidRootPart.JumpRocket:Destroy()
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://126753849"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local RapidPunchACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    RapidPunchACTIVE = false
	RapidPunch.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
end)
RapidPunch.MouseButton1Click:connect(function()
	RapidPunchACTIVE = not RapidPunchACTIVE
	if RapidPunchACTIVE then
		RapidPunch.BackgroundColor3 = Color3.new(0.1962745, 0.827451, 0.721569)
		while wait() do
		 if track.IsPlaying == false then
			if RapidPunchACTIVE then
				track:Play(.1, 1, 10)
			end
		 end
		end
	else
		track:Stop()
		RapidPunch.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
	end
end)

FEGodmode.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	l.Parent = game.Players.LocalPlayer.Character
	l.Name = "Humanoid"
	wait(0.1)
	game.Players.LocalPlayer.Character["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
	game.Players.LocalPlayer.Character.Animate.Disabled = true
	wait(0.1)
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
end)

NoLimbs.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character["Left Leg"]:Destroy()
	game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
	game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
	game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
end)

BrickHats.MouseButton1Click:connect(function() 
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (v:IsA("Accessory")) then
			v.Handle.Mesh:Destroy()
		end
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://181525546"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FaintACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    FaintACTIVE = false
	Faint.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
end)
Faint.MouseButton1Click:connect(function()
	FaintACTIVE = not FaintACTIVE
	if FaintACTIVE then
		Faint.BackgroundColor3 = Color3.new(0.756863, 0.466667, 0.878431)
		while wait() do
		 if track.IsPlaying == false then
			if FaintACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		Faint.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://188632011"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SpinACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    SpinACTIVE = false
	Spin.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
end)
Spin.MouseButton1Click:connect(function()
	SpinACTIVE = not SpinACTIVE
	if SpinACTIVE then
		Spin.BackgroundColor3 = Color3.new(0.756863, 0.466667, 0.878431)
		while wait() do
		 if track.IsPlaying == false then
			if SpinACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		Spin.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://33169583"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local ArmFollowACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    ArmFollowACTIVE = false
	ArmFollow.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
end)
ArmFollow.MouseButton1Click:connect(function()
	ArmFollowACTIVE = not ArmFollowACTIVE
	if ArmFollowACTIVE then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "ArmFollow"
		u.Target = game.Players.LocalPlayer.Character["Right Arm"]
		u:Fire()
		ArmFollow.BackgroundColor3 = Color3.new(0.756863, 0.466667, 0.878431)
		while wait() do
		 if track.IsPlaying == false then
			if ArmFollowACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		ArmFollow.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
		game.Players.LocalPlayer.Character.HumanoidRootPart.ArmFollow:Destroy()
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://126753849"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local PunchFollowACTIVE = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    PunchFollowACTIVE = false
	PunchFollow.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
end)
PunchFollow.MouseButton1Click:connect(function()
	PunchFollowACTIVE = not PunchFollowACTIVE
	if PunchFollowACTIVE then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "PunchFollow"
		u.Target = game.Players.LocalPlayer.Character["Right Arm"]
		u:Fire()
		PunchFollow.BackgroundColor3 = Color3.new(0.756863, 0.466667, 0.878431)
		while wait() do
		 if track.IsPlaying == false then
			if PunchFollowACTIVE then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		PunchFollow.BackgroundColor3 = Color3.new(0.556863, 0.266667, 0.678431)
		game.Players.LocalPlayer.Character.HumanoidRootPart.PunchFollow:Destroy()
	end
end)

AnimationId = "148840371"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
_18active = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    _18active = false
	_18.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
end)
_18.MouseButton1Click:connect(function()
	_18active = not _18active
	if _18active then
		_18.BackgroundColor3 = Color3.new(0.352941, 0.882353, 0.576471)
		for i,v in pairs(GetPlayer(TXTBOX_PlrNameEXTRA.Text))do
			track:Play()
			while wait() do
				if _18active then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				end
			end
		end
	else
		track:Stop()
		_18.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://180612465"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local crouchattacking = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    crouchattacking = false
	CrouchAttack.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
end)
CrouchAttack.MouseButton1Click:connect(function()
	crouchattacking = not crouchattacking
	if crouchattacking then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "CrouchAttack"
		for i,v in pairs(GetPlayer(TXTBOX_PlrNameEXTRA.Text))do
			u.Target = game.Players[v.Name].Character.HumanoidRootPart
		end
		u:Fire()
		CrouchAttack.BackgroundColor3 = Color3.new(0.352941, 0.882353, 0.576471)
		while wait() do
		 if track.IsPlaying == false then
			if crouchattacking then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		CrouchAttack.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CrouchAttack:Destroy()
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://184574340"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SlamPropulsioning = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    SlamPropulsioning = false
	SlamPropulsion.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
end)
SlamPropulsion.MouseButton1Click:connect(function()
	SlamPropulsioning = not SlamPropulsioning
	if SlamPropulsioning then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "SlamPropulsion"
		for i,v in pairs(GetPlayer(TXTBOX_PlrNameEXTRA.Text))do
			u.Target = game.Players[v.Name].Character.HumanoidRootPart
		end
		u:Fire()
		SlamPropulsion.BackgroundColor3 = Color3.new(0.352941, 0.882353, 0.576471)
		while wait() do
		 if track.IsPlaying == false then
			if SlamPropulsioning then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		SlamPropulsion.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
		game.Players.LocalPlayer.Character.HumanoidRootPart.SlamPropulsion:Destroy()
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://429730430"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SpinAttacking = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    SpinAttacking = false
	SpinAttack.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
end)
SpinAttack.MouseButton1Click:connect(function()
	SpinAttacking = not SpinAttacking
	if SpinAttacking then
		local u = Instance.new("RocketPropulsion")
		u.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		u.Name = "SpinAttack"
		for i,v in pairs(GetPlayer(TXTBOX_PlrNameEXTRA.Text))do
			u.Target = game.Players[v.Name].Character.HumanoidRootPart
		end
		u:Fire()
		SpinAttack.BackgroundColor3 = Color3.new(0.352941, 0.882353, 0.576471)
		while wait() do
		 if track.IsPlaying == false then
			if SpinAttacking then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		SpinAttack.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
		game.Players.LocalPlayer.Character.HumanoidRootPart.SpinAttack:Destroy()
	end
end)

watching = false
CreepyWatch.MouseButton1Click:connect(function()
	watching = not watching
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
walkingthrough = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    walkingthrough = false
	WalkThrough.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
	track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
end)
WalkThrough.MouseButton1Click:connect(function()
	walkingthrough = not walkingthrough
	if walkingthrough then
		WalkThrough.BackgroundColor3 = Color3.new(0.352941, 0.882353, 0.576471)
		while wait() do
			if walkingthrough then
			for i,v in pairs(GetPlayer(TXTBOX_PlrNameEXTRA.Text))do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				if track.IsPlaying == false then
					if walkingthrough then
						track:Play(.1, 1, 1e6)
					end
				end
			end
			end
		end
	else
		WalkThrough.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
		track:Stop()
	end
end)

annoying = false
Annoy.MouseButton1Click:connect(function()
	annoying = not annoying
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://282574440"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local crawlACTIVE = false
Carpett = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    Carpett = false
	Carpet.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
end)
Carpet.MouseButton1Click:connect(function()
	Carpett = not Carpett
	if Carpett then
		Carpet.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		while wait() do
		 if track.IsPlaying == false then
			if Carpett then
				track:Play(.1, 1, 1)
			end
		 end
		end
	else
		track:Stop()
		Carpet.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
end)
following = false
Follow.MouseButton1Click:connect(function()
	following = not following
end)
headwalking = false
HeadWalk.MouseButton1Click:connect(function()
	headwalking = not headwalking
end)
Spammer = false
Spam.MouseButton1Click:connect(function()
	Spammer = not Spammer
end)
stuck = false
Stick.MouseButton1Click:connect(function()
	stuck = not stuck
end)
TeleportTo.MouseButton1Click:connect(function()
	for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
	end
end)

orbital = false
Orbit.MouseButton1Click:connect(function()
	orbital = not orbital
	if orbital then
		Orbit.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		local o = Instance.new("RocketPropulsion")
		o.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		o.Name = "Orbit"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			o.Target = game.Players[v.Name].Character.HumanoidRootPart
			o:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if orbital then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.Orbit:Destroy()
		Orbit.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
end)

currentview = false
View.MouseButton1Click:connect(function()
	currentview = not currentview
	for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
		if currentview then
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			View.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		else
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
			View.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
		end
	end
end)

floating = false
Float.MouseButton1Click:connect(function()
	floating = not floating
	if floating then
		Float.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 50000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Float"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			y.Target = game.Players[v.Name].Character.Head
			y:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if floating then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
			while wait(0.3) do
				if floating then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Leg"].CFrame
				end
			end
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.Float:Destroy()
		Float.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://282574440"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
flattening = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    flattening = false
	Flatten.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
end)
Flatten.MouseButton1Click:connect(function()
	flattening = not flattening
	if flattening then
		Flatten.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 50000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Flatten"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			y.Target = game.Players[v.Name].Character["Left Leg"]
			y:Fire()
			track:Play(.1, 1, 1)
			game:GetService('RunService').Stepped:connect(function()
				if flattening then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
			while wait(0.3) do
				if flattening then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
				end
			end
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.Flatten:Destroy()
		track:Stop()
		Flatten.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

SlowAttracting = false
SlowAttract.MouseButton1Click:connect(function()
	SlowAttracting = not SlowAttracting
	if SlowAttracting then
		SlowAttract.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local b = Instance.new("RocketPropulsion")
		b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		b.TurnD = 5000
		b.MaxThrust = 5000
		b.MaxSpeed = 200
		b.ThrustP = 5000
		b.CartoonFactor = 1
		b.Name = "SlowAttract"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			b.Target = game.Players[v.Name].Character.HumanoidRootPart
			b:Fire()
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			game:GetService('RunService').Stepped:connect(function()
				if SlowAttracting then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.SlowAttract:Destroy()
		SlowAttract.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

AimHeading = false
AimHead.MouseButton1Click:connect(function()
	AimHeading = not AimHeading
	if AimHeading then
		AimHead.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local b = Instance.new("RocketPropulsion")
		b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		b.TurnP = 2500
		b.MaxThrust = 50000
		b.MaxSpeed = 1000
		b.ThrustP = 50000
		b.CartoonFactor = 1
		b.Name = "AimHead"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			b.Target = game.Players[v.Name].Character.Head
			b:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if AimHeading then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.AimHead:Destroy()
		AimHead.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

Multipleing = false
Multiple.MouseButton1Click:connect(function()
	Multipleing = not Multipleing
	if Multipleing then
		Multiple.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local t1 = Instance.new("RocketPropulsion")
		t1.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t1.TurnP = 30000
		t1.MaxThrust = 30000
		t1.MaxSpeed = 1000
		t1.ThrustP = 30000
		t1.CartoonFactor = 1
		t1.Name = "one"
		local t2 = Instance.new("RocketPropulsion")
		t2.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t2.TurnP = 30000
		t2.MaxThrust = 30000
		t2.MaxSpeed = 1000
		t2.ThrustP = 30000
		t2.CartoonFactor = 1
		t2.Name = "two"
		local t3 = Instance.new("RocketPropulsion")
		t3.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t3.TurnP = 30000
		t3.MaxThrust = 30000
		t3.MaxSpeed = 1000
		t3.ThrustP = 30000
		t3.CartoonFactor = 1
		t3.Name = "three"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			t1.Target = game.Players[v.Name].Character.Torso
			t1:Fire()
			t2.Target = game.Players[v.Name].Character["Right Leg"]
			t2:Fire()
			t3.Target = game.Players[v.Name].Character["Left Arm"]
			t3:Fire()
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			game:GetService('RunService').Stepped:connect(function()
				if Multipleing then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.one:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.two:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.three:Destroy()
		Multiple.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
Violenting = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    Violenting = false
	Violent.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
end)
Violent.MouseButton1Click:connect(function()
	Violenting = not Violenting
	if Violenting then
		Violent.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 50000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Violent"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			y.Target = game.Players[v.Name].Character.HumanoidRootPart
			y:Fire()
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			track:Play(.1, 1, 10)
			game:GetService('RunService').Stepped:connect(function()
				if Violenting then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.Violent:Destroy()
		track:Stop()
		Violent.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
Violenting = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    Violenting = false
	Violent.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
end)
Violent.MouseButton1Click:connect(function()
	Violenting = not Violenting
	if Violenting then
		Violent.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 500000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Violent"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			y.Target = game.Players[v.Name].Character.HumanoidRootPart
			y:Fire()
			track:Play(.1, 1, 10)
			game:GetService('RunService').Stepped:connect(function()
				if Violenting then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.Violent:Destroy()
		track:Stop()
		Violent.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

WeirdOrbital = false
WeirdOrbit.MouseButton1Click:connect(function()
	WeirdOrbital = not WeirdOrbital
	if WeirdOrbital then
		WeirdOrbit.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local o = Instance.new("RocketPropulsion")
		o.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		o.TurnD = 50000
		o.Name = "WeirdOrbit"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			o.Target = game.Players[v.Name].Character.HumanoidRootPart
			o:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if WeirdOrbital then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.WeirdOrbit:Destroy()
		WeirdOrbit.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

Maxing = false
Max.MouseButton1Click:connect(function()
	Maxing = not Maxing
	if Maxing then
		Max.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local t1 = Instance.new("RocketPropulsion")
		t1.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t1.TurnP = 100000
		t1.MaxThrust = 100000
		t1.MaxSpeed = 5000
		t1.ThrustP = 100000
		t1.CartoonFactor = 1
		t1.Name = "onee"
		local t2 = Instance.new("RocketPropulsion")
		t2.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t2.TurnP = 100000
		t2.MaxThrust = 100000
		t2.MaxSpeed = 5000
		t2.ThrustP = 100000
		t2.CartoonFactor = 1
		t2.Name = "twoo"
		local t3 = Instance.new("RocketPropulsion")
		t3.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t3.TurnP = 100000
		t3.MaxThrust = 100000
		t3.MaxSpeed = 5000
		t3.ThrustP = 100000
		t3.CartoonFactor = 1
		t3.Name = "threee"
		local t4 = Instance.new("RocketPropulsion")
		t4.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t4.TurnP = 100000
		t4.MaxThrust = 100000
		t4.MaxSpeed = 5000
		t4.ThrustP = 100000
		t4.CartoonFactor = 1
		t4.Name = "fourr"
		local t5 = Instance.new("RocketPropulsion")
		t5.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t5.TurnP = 100000
		t5.MaxThrust = 100000
		t5.MaxSpeed = 5000
		t5.ThrustP = 100000
		t5.CartoonFactor = 1
		t5.Name = "fivee"
		local t6 = Instance.new("RocketPropulsion")
		t6.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		t6.TurnP = 100000
		t6.MaxThrust = 100000
		t6.MaxSpeed = 5000
		t6.ThrustP = 100000
		t6.CartoonFactor = 1
		t6.Name = "sixx"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			t1.Target = game.Players[v.Name].Character.Torso
			t1:Fire()
			t2.Target = game.Players[v.Name].Character["Right Leg"]
			t2:Fire()
			t3.Target = game.Players[v.Name].Character["Left Arm"]
			t3:Fire()
			t4.Target = game.Players[v.Name].Character["Left Leg"]
			t4:Fire()
			t5.Target = game.Players[v.Name].Character["Right Arm"]
			t5:Fire()
			t6.Target = game.Players[v.Name].Character.Head
			t6:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if Maxing then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.onee:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.twoo:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.threee:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.fourr:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.fivee:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.sixx:Destroy()
		Max.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://184574340"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
Animateding = false
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    track = character:WaitForChild("Humanoid"):LoadAnimation(Anim)
    Animateding = false
	Animated.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
end)
Animated.MouseButton1Click:connect(function()
	Animateding = not Animateding
	if Animateding then
		Animated.BackgroundColor3 = Color3.new(0.707843, 0.54902, 0.813726)
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 200000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Animated"
		for i,v in pairs(GetPlayer(TXTBOX_PlrName2.Text))do
			game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			y.Target = game.Players[v.Name].Character.HumanoidRootPart
			y:Fire()
			track:Play(.1, 1, 10)
			game:GetService('RunService').Stepped:connect(function()
				if Animateding then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.Animated:Destroy()
		track:Stop()
		Animated.BackgroundColor3 = Color3.new(0.607843, 0.34902, 0.713726)
	end
end)

Attach.MouseButton1Click:connect(function()
	for i,v in pairs(GetPlayer(TXTBOX_PlrNameOTHER3.Text))do
		game.Players.LocalPlayer.Character.Humanoid.Name = 1
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		wait(0.1)
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
	end
end)

superspinning = false
SuperSpin.MouseButton1Click:connect(function()
	superspinning = not superspinning
	if superspinning then
		SuperSpin.BackgroundColor3 = Color3.new(0.905882, 0.498039, 0.435294)
		for i,v in pairs(GetPlayer(TXTBOX_PlrNameOTHER3.Text))do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Arm"].CFrame
			wait(1)
			while wait() do
				if superspinning then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				end
			end
		end
	else
		SuperSpin.BackgroundColor3 = Color3.new(0.905882, 0.298039, 0.235294)
	end
end)

Kill.MouseButton1Click:connect(function()
	for i,v in pairs(GetPlayer(TXTBOX_PlrNameOTHER3.Text))do
		game.Players.LocalPlayer.Character.Humanoid.Name = 1
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		wait(0.1)
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
		wait(0.2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
		wait(0.4)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(100000, 0, 100000))
	end
end)

SafeKill.MouseButton1Click:connect(function()
	local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	l.Parent = game.Players.LocalPlayer.Character
	l.Name = "Humanoid"
	wait(0.1)
	game.Players.LocalPlayer.Character["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
	game.Players.LocalPlayer.Character.Animate.Disabled = true
	wait(0.1)
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
	for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
	end
	local function tp(player,player2)
	local char1,char2=player.Character,player2.Character
	if char1 and char2 then
	char1:MoveTo(char2.Head.Position)
	end
	end
	for i,v in pairs(GetPlayer(TXTBOX_PlrNameOTHER3.Text))do
	wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
	wait(0.2)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
	wait(0.2)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,0,-100000))
	wait(0.7)
	tp(game.Players.LocalPlayer,game.Players[v.Name])
	wait(0.7)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
	end
end)

Bring.MouseButton1Click:connect(function()
	local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	l.Parent = game.Players.LocalPlayer.Character
	l.Name = "Humanoid"
	wait(0.1)
	game.Players.LocalPlayer.Character["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
	game.Players.LocalPlayer.Character.Animate.Disabled = true
	wait(0.1)
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
	for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
	end
	
	local function tp(player,player2)
	local char1,char2=player.Character,player2.Character
	if char1 and char2 then
	char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
	end
	end
	
	local function getout(player,player2)
	local char1,char2=player.Character,player2.Character
	if char1 and char2 then
	char1:MoveTo(char2.Head.Position)
	end
	end
	
	for i,v in pairs(GetPlayer(TXTBOX_PlrNameOTHER3.Text))do
	tp(game.Players[v.Name], game.Players.LocalPlayer)
	wait(0.2)
	tp(game.Players[v.Name], game.Players.LocalPlayer)
	wait(0.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
	wait(0.5)
	getout(game.Players.LocalPlayer, game.Players[v.Name])
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
	end
end)

FreeFall.MouseButton1Click:connect(function()
		local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.Humanoid.Name = 1
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		wait(0.1)
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
		for i,v in pairs(GetPlayer(TXTBOX_PlrNameOTHER3.Text))do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
		wait(0.2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
		wait(0.6)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
		wait(0.6)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
	end
end)

while wait() do
	if SpammingChar then
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(TXTBOX_Chat.Text, "All")
		Spam_2.BackgroundColor3 = Color3.new(0.280392, 0.9, 0.543137)
		wait(0.5)
	else
		Spam_2.BackgroundColor3 = Color3.new(0.180392, 0.8, 0.443137)
	end
	if annoying then
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			Annoy.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		end
	else
		Annoy.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
	if Carpett then
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			Carpet.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		end
	else
		Carpet.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
	if following then
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame + Vector3.new(5,0,0)
			Follow.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		end
	else
		Follow.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
	if headwalking then
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.Head.CFrame
			HeadWalk.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
		end
	else
		HeadWalk.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
	if Spammer then
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..v.Name.." @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", "All")
			Spam.BackgroundColor3 = Color3.new(0.403922, 0.796078, 0.858824)
			wait(0.5)
		end
	else
		Spam.BackgroundColor3 = Color3.new(0.203922, 0.596078, 0.858824)
	end
	if watching then
		for i,v in pairs(GetPlayer(TXTBOX_PlrName.Text))do
			CreepyWatch.BackgroundColor3 = Color3.new(0.352941, 0.882353, 0.576471)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.Torso.Position, game.Players[v.Name].Character.Torso.Position)
		end
	else
		CreepyWatch.BackgroundColor3 = Color3.new(0.152941, 0.682353, 0.376471)
	end
end
end)

HubsSection:NewButton("Equinox Hub", "Equinox Hub", function()
    do local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=getfenv or function()return _ENV;end;local v9=setmetatable;local v10=pcall;local v11=select;local v12=unpack or table.unpack;local v13=tonumber;local function v14(v15,v16)local v17=1;local v18;v15=v4(v3(v15,5),"..",function(v29)if (v1(v29,2)==79) then local v60=0;while true do if (v60==0) then v18=v0(v3(v29,1,1));return "";end end else local v61=v2(v0(v29,16));if v18 then local v70=v5(v61,v18);v18=nil;return v70;else return v61;end end end);local function v19(v30,v31,v32)if v32 then local v62=0 -0;local v63;while true do if (v62==0) then v63=(v30/(2^(v31-(1 + 0))))%(((1 + 1) -0)^(((v32-(1959 -(120 + 1838))) -(v31-(667 -(554 + 112)))) + (1595 -(1198 + (1692 -(1079 + 217))))));return v63-(v63%(2 -1));end end else local v64=((420 -(181 + 51)) -(119 + 67))^(v31-(4 -3));return (((v30%(v64 + v64))>=v64) and (1432 -(1125 + 306))) or (0 + (615 -(28 + 587)));end end local function v20()local v37=v1(v15,v17,v17);v17=v17 + 1;return v37;end local function v21()local v38,v39=v1(v15,v17,v17 + (514 -(214 + 298)));v17=v17 + 2;return (v39 * (765 -(360 + 149))) + v38;end local function v22()local v40,v41,v42,v43=v1(v15,v17,v17 + 3);v17=v17 + ((788 + 162) -(349 + 597));return (v43 * (16778427 -(15 + 1196))) + (v42 * (111652 -46116)) + (v41 * (534 -278)) + v40;end local function v23()local v44=v22();local v45=v22();return (( -(2 + 0) * v19(v45,32)) + (1398 -(502 + 155 + 740))) * (((1 -0) + 1)^(v19(v45,9 + 12,112 -81) -((1930 -(268 + 738)) + 99))) * ((((v19(v45,1062 -(102 + 959),12 + 8) * (((1226 -(44 + 699)) -((594 -333) + 220))^(583 -((200 -139) + 490)))) + v44)/((5 -3)^(19 + 33))) + ((2 + 0) -1));end local function v24(v33)local v46=(3635 -(300 + 1406)) -(164 + 1765);local v47;local v48;while true do if (v46==3) then return v6(v48);end if (v46==(2 -1)) then v47=v3(v15,v17,(v17 + v33) -(1 + 0));v17=v17 + v33;v46=1383 -((1165 -661) + 877);end if (v46==(0 + 0)) then v47=nil;if  not v33 then v33=v22();if (v33==(0 -0)) then return "";end end v46=1 + (0 -0);end if (v46==(1713 -(171 + 1540))) then v48={};for v71=1 + 0 + 0, #v47 do v48[v71]=v2(v1(v3(v47,v71,v71)));end v46=3;end end end local v25=v22;local function v26(...)return {...},v11("#",...);end local function v27()local v49=0;local v50;local v51;local v52;local v53;local v54;local v55;while true do local v59=0;while true do if (v59~=1) then else if (v49==2) then local v88=0;while true do if (v88~=0) then else for v98=399 -(185 + 213),v54 do local v99=0;local v100;local v101;local v102;local v103;while true do if (v99==(415 -(134 + 281))) then v100=0;v101=nil;v99=1 + 0;end if (v99~=(1 -0)) then else v102=nil;v103=nil;v99=2;end if (v99==(3 -1)) then while true do if (v100==(1480 -(801 + 678))) then v103=nil;while true do if (v101==1) then if (v102==(1 -0)) then v103=v20()~=0;elseif (v102==2) then v103=v23();elseif (v102~=3) then else v103=v24();end v55[v98]=v103;break;end if (v101==0) then local v140=1113 -(882 + 231);local v141;while true do if (v140~=(949 -(674 + 275))) then else v141=0;while true do if ((0 + 0)==v141) then local v156=0 -0;local v157;while true do if ((0 -0)~=v156) then else v157=0;while true do if (v157~=0) then else local v164=0;while true do if (v164~=0) then else v102=v20();v103=nil;v164=1;end if (v164==(1 -0)) then v157=1 + 0;break;end end end if (v157==(1716 -(769 + 946))) then v141=359 -(196 + 162);break;end end break;end end end if (v141==(1 + 0)) then v101=1 + 0;break;end end break;end end end end break;end if (v100==(0 + 0)) then local v129=0;local v130;while true do if (v129~=(0 -0)) then else v130=1765 -(1621 + 144);while true do if ((516 -(377 + 138))~=v130) then else v100=3 -2;break;end if ((0 + 0)~=v130) then else local v145=0 -0;while true do if (v145~=(117 -(112 + 4))) then else v130=3 -2;break;end if (v145==0) then v101=0;v102=nil;v145=1;end end end end break;end end end end break;end end end v53[11 -8]=v20();v88=1 + 0;end if (v88==1) then for v104=1346 -(1220 + 125),v22() do local v105=0 -0;local v106;local v107;while true do if (v105==1) then while true do if (v106~=0) then else v107=v20();if (v19(v107,1 -0,4 -3)==(122 -(74 + 48))) then local v134=0 + 0;local v135;local v136;local v137;local v138;while true do if (v134~=(1 + 1)) then else while true do if (v135==(692 -(460 + 229))) then if (v19(v137,5 -2,3)==(1860 -(1367 + 492))) then v138[4]=v55[v138[4]];end v50[v104]=v138;break;end if ((0 + 0)~=v135) then else local v150=0;while true do if (v150~=1) then else v135=1045 -(704 + 340);break;end if ((0 -0)==v150) then v136=v19(v107,2,3);v137=v19(v107,4,1164 -(327 + 831));v150=1;end end end if (v135==2) then local v151=0 + 0;while true do if (v151==(528 -(201 + 327))) then if (v19(v137,1,1)~=1) then else v138[2]=v55[v138[2]];end if (v19(v137,1 + 1,2)==(1 + 0)) then v138[3]=v55[v138[3]];end v151=1;end if (v151==(1 + 0)) then v135=3 + 0;break;end end end if (v135==(1129 -(70 + 1058))) then local v152=0 + 0;while true do if (v152~=(0 -0)) then else local v160=0;while true do if (v160~=(1417 -(875 + 541))) then else v152=4 -3;break;end if (v160~=0) then else v138={v21(),v21(),nil,nil};if (v136==(0 + 0)) then local v165=0;local v166;while true do if (v165==0) then v166=903 -(297 + 606);while true do if (v166~=(1709 -(848 + 861))) then else v138[3]=v21();v138[2 + 2]=v21();break;end end break;end end elseif (v136==(1 -0)) then v138[2 + 1]=v22();elseif (v136==2) then v138[7 -4]=v22() -(2^(44 -(18 + 10)));elseif (v136==3) then local v171=0;local v172;local v173;local v174;while true do if ((2 -1)==v171) then v174=nil;while true do if (v172==(1398 -(748 + 650))) then v173=0 + 0;v174=nil;v172=1 + 0;end if (v172==(1 + 0)) then while true do if (v173==(0 + 0)) then v174=0 -0;while true do if (v174~=(1167 -(230 + 937))) then else v138[1247 -(556 + 688)]=v22() -((7 -5)^16);v138[15 -11]=v21();break;end end break;end end break;end end break;end if (v171==0) then v172=1748 -(1265 + 483);v173=nil;v171=1;end end end v160=1 + 0;end end end if (v152~=1) then else v135=2;break;end end end end break;end if (v134==0) then local v144=0 + 0;while true do if (v144==0) then v135=0;v136=nil;v144=1279 -(978 + 300);end if (v144~=(1678 -(985 + 692))) then else v134=1 + 0;break;end end end if (v134~=(1 + 0)) then else v137=nil;v138=nil;v134=2;end end end break;end end break;end if (v105~=0) then else local v112=0;while true do if (v112~=0) then else v106=0 -0;v107=nil;v112=833 -(590 + 242);end if (v112==(1 + 0)) then v105=1 + 0;break;end end end end end v49=1 + 2;break;end end end if (v49~=0) then else local v89=907 -(555 + 352);local v90;while true do if (v89~=(0 -0)) then else v90=13 -(12 + 1);while true do if (v90~=0) then else v50={};v51={};v90=1356 -(553 + 802);end if (v90==(1 -0)) then v52={};v49=1;break;end end break;end end end break;end if (v59~=0) then else if (v49~=3) then else local v91=0 + 0;while true do if (0~=v91) then else for v108=1 + 0,v22() do v51[v108-1]=v27();end for v110=1,v22() do v52[v110]=v22();end v91=1;end if (v91==1) then return v53;end end end if (v49~=(3 -2)) then else local v92=0;while true do if (v92==1) then v55={};v49=2;break;end if (v92~=(0 -0)) then else local v97=0 -0;while true do if (v97~=0) then else v53={v50,v51,nil,v52};v54=v22();v97=1;end if (v97==(1419 -(1295 + 123))) then v92=1391 -(210 + 1180);break;end end end end end v59=1;end end end end local function v28(v34,v35,v36)local v56=v34[1];local v57=v34[2];local v58=v34[3];return function(...)local v65=1;local v66= -1;local v67={...};local v68=v11("#",...) -1;local function v69()local v73=v56;local v74=Const;local v75=v57;local v76=v58;local v77=v26;local v78={};local v79={};local v80={};for v86=0 + 0,v68 do if (((45 + 177)<(2433 + (2868 -(616 + 136)))) and (v86>=v76)) then v78[v86-v76]=v67[v86 + (1 -0)];else v80[v86]=v67[v86 + (1797 -(440 + 1356))];end end local v81=(v68-v76) + (1413 -(319 + 1093));local v82;local v83;while true do local v87=0 + 0;while true do if ((v87==(1 + 0)) or ((17446 -13037)<=(4910 -(1036 + 268)))) then if (((2766 -(43 + 1527))<(5589 -1313)) and (v83<=(1875 -(243 + 1629)))) then if (((88 + 361)==449) and (v83<=((2334 -(54 + 1854)) -(165 + (1997 -(257 + 1480)))))) then if ((v83>(0 + 0)) or ((4607 -2959)>(665 + 2384))) then v80[v82[560 -(237 + 321)]]=v82[1 + 2]~=(0 + 0);else v80[v82[2 + 0]]();end elseif ((v83>(6 -4)) or ((3335 -(793 + 193))>(8611 -6174))) then v80[v82[3 -1]]=v82[3 -0];else local v115=0 -0;local v116;local v117;while true do if (((0 -0)==v115) or (4982<(6483 -4753))) then v116=878 -((109 -39) + 808);v117=nil;v115=918 -(81 + 836);end if ((v115==(1 + 0)) or (((20302 -(125 + 200)) -15647)==(5285 -(460 + 1113)))) then while true do if (((2655 -(568 + 892))<=(6684 -(80 + 1905))) and (v116==(300 -(287 + 13)))) then v117=v82[3 -1];v80[v117]=v80[v117](v12(v80,v117 + (34 -(25 + 8)),v66));break;end end break;end end end elseif ((((506 + 2619) -2274)<1849) and (v83<=(4 + 1))) then if ((v83>(8 -4)) or ((645 + 378)>(2589 + (2141 -(400 + 135))))) then local v118=0 -0;local v119;local v120;local v121;local v122;local v123;local v124;while true do if ((v118==(0 + 0)) or ((3361 -(107 + 15 + 4))<=(3629 -(411 + 571 + 33)))) then v119=672 -(598 + 74);v120=nil;v118=824 -(757 + 66);end if ((v118==(1090 -(770 + 319))) or ((2291 -(1053 + 76))<(124 + 409))) then v121=nil;v122=nil;v118=2 -0;end if (((2632 -(762 + 83))<(5890 -(1610 + 251))) and (v118==(1 + 1 + 0))) then v123=nil;v124=nil;v118=1 + 2;end if (((1820 -(995 + 654))<=((12757 -5222) -4762)) and (v118==(1051 -(569 + 479)))) then while true do if ((v119==(1 + 0 + 1)) or ((830 + 230)>(6386 -3196))) then v124=nil;while true do if (((1754 + 22 + 29)<=(4524 -(374 + 990))) and (v120==(0 -0))) then local v146=0;local v147;while true do if ((((2896 -(121 + 57)) + 1734)>3913) and (v146==(0 + 0))) then v147=0 -0;while true do if ((v147==(1 + (1619 -(660 + 959)))) or ((399 + 3084)<=894)) then v120=1 + 0;break;end if ((v147==(0 + 0)) or (4321>=((3717 + 12291) -11485))) then v121=v82[1307 -(560 + 745)];v122,v123=v77(v80[v121](v12(v80,v121 + 1 + 0,v82[2 + 1 + 0])));v147=1 + 0;end end break;end end end if (((1287 + 3314)==(6481 -(214 + 1666))) and (v120==(649 -(112 + 535)))) then for v153=v121,v66 do local v154=0 -0;local v155;while true do if (((2845 -((3121 -(1121 + 629)) + 305))<=(2595 -(239 + 119))) and ((1175 -(554 + 621))==v154)) then v155=0 + 0;while true do if (((333 + 69)<=((2320 -(28 + 1504)) -(228 + 35))) and (v155==(1529 -(1301 + 228)))) then v124=v124 + (2 -1);v80[v153]=v122[v124];break;end end break;end end end break;end if ((((4691 + 1780) -(1514 + 288))>=(11473 -6853)) and (v120==(1 + (1880 -(1480 + 400))))) then local v148=0 -0;while true do if ((((3850 + 498) -1164)<=(392 + 3922)) and (v148==(491 -(317 + 173)))) then v120=(825 -(321 + 502)) + 0;break;end if ((v148==(0 + 0)) or ((271 + 535)<(439 + (1633 -(297 + 1154))))) then local v159=(1144 -(10 + 1134)) -0;while true do if ((v159==(0 + 0)) or ((116 + 3766)>(1807 + 2937))) then v66=(v123 + v121) -(1 -0);v124=0 + 0;v159=145 -(86 + 58);end if (((1576 -(1454 + 121))==v159) or ((972 + 526)<=(532 + 219))) then v148=1 + 0;break;end end end end end end break;end if (((1495 + 2806)>2856) and (v119==(0 -0))) then local v143=1614 -(781 + 271 + 562);while true do if ((v143==(0 + 0)) or ((6242 -(2477 + 343))<(3988 -(120 + 1046)))) then v120=1431 -(729 + 702);v121=nil;v143=1 -0;end if (((1938 -(349 + 117))>(1563 -1184)) and (v143==(1 + 0))) then v119=1 + 0;break;end end end if ((v119==(1404 -(1097 + 306))) or ((60 -37)==3997)) then v122=nil;v123=nil;v119=458 -(413 + (785 -(551 + 191)));end end break;end end else local v125=0 -0;local v126;local v127;while true do if (((2409 + 1560)>=(2245 + 998)) and (v125==(1010 -(574 + 435)))) then v80[v126 + 1 + 0]=v127;v80[v126]=v127[v82[2 + 2]];break;end if (((11889 -9136)<(380 + 1256 + 1660)) and ((0 + 0)==v125)) then local v133=0 -0;while true do if ((v133==(1097 -(395 + 701))) or (3922<(893 + 2136))) then v125=2 -1;break;end if (((4182 -2799)==(3054 -(669 + 1002))) and (v133==(0 -0))) then v126=v82[1 + 1];v127=v80[v82[3 + 0]];v133=1 + 0;end end end end end elseif (((4150 -2231)>=(2798 -(1601 + 314))) and (v83>(3 + 3))) then do return;end else v80[v82[1 + 1]]=v36[v82[(1796 -(1370 + 424)) + 1]];end v65=v65 + 1 + 0;break;end if ((v87==((1161 -(514 + 647)) -(0 + 0))) or (((773 -420) + 586)>=(2284 + 2426))) then local v95=0 -(0 -0);while true do if ((v95==(1 + 0)) or ((177 + 2292)<(2193 -1508))) then v87=(2 -1) + 0;break;end if (((12871 -8608)==4263) and (v95==((0 -0) -0))) then v82=v73[v65];v83=v82[1 + 0];v95=1746 -(1558 + 187);end end end end end end A,B=v26(v10(v69));if  not A[1] then local v84=0;local v85;while true do if (0==v84) then v85=v34[4][v65] or "?";error("Script error at ["   .. v85   .. "]:"   .. A[2]);break;end end else return v12(A,2,B);end end;end return v28(v27(),{},v16)();end v14("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403493O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4B524E4C322F756E6976657273616C687562756C74696D6174652F6D61696E2F7570646174653100093O0012063O00013O001206000100023O002004000100010003001203000300044O0001000400014O0005000100044O00025O00026O000100012O00073O00017O00093O00023O00023O00023O00023O00023O00023O00023O00023O00033O00",v8());end
end)

HubsSection:NewButton("Simplity", "Simplity", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HeyGyt/simplityv2/main/main"))()
end)

HubsSection:NewButton("CMD-X", "CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()
end)