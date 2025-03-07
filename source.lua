print("VERSION: 0.0.1 Test 02-02") --version!!
print("Creator: Aedaniss7 on scriptblox")
local folder="AeSGR/" --start :D
local songP="PRIME.mp3" 
local rbxlP="PRIME V2.rbxl"
local songURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.mp3"
local rbxlURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.rbxm"
function runScript(source, origin)
  local Run=source:gsub("script", origin:GetFullName())
    spawn(function()
      loadstring(Run)()
    end)
end
function TypewriterText2(Text, TL, ttf)
  spawn(function()
      TL.Text=Text
      TL.MaxVisibleGraphemes=0
      local tss=game:GetService("TweenService")
      tss:Create(TL, TweenInfo.new(ttf, Enum.EasingStyle.Linear), {MaxVisibleGraphemes=string.len(Text)}):Play()
    end)
end
function saveFilee(path, content, useURLV)
  local useURL = useURLV or false
  if not isfile(path) then
    local savingUI=Instance.new("ScreenGui")
    savingUI.Parent=game.Players.LocalPlayer.PlayerGui
    local savingText=Instance.new("TextLabel")
    savingText.Text=""
    savingText.BackgroundColor3=Color3.new(0,0,0)
    savingText.BorderColor3=Color3.new(1,1,1)
    savingText.BorderSizePixel=5
    savingText.Font=Enum.Font.Jura
    savingText.Size=UDim2.new(1,0,0.3,0)
    savingText.TextXAlignment=Enum.TextXAlignment.Left
    TypewriterText2("Downloading " ..folder..path.."...", savingText, 1)
    if useURL == true then
      writefile(folder..path, game:HttpGet(content))
    else
      writefile(folder..path, content)
    end
    savingUI:Destroy()
  end
end
function spawnRBXL(path)
  local ins=getcustomasset(folder..path)
  return game:GetObjects(ins)[1]
end
saveFilee(songP, songURL, true)
saveFilee(rbxlP, rbxlURL, true)
local PRIME=spawnRBXL(rbxlP)
PRIME.Torso.BottomPiece.WeldConstraint.Part1=PRIME.Torso.BottomPiece
PRIME.PrimaryPart=PRIME.HumanoidRootPart
PRIME.PrimaryPart.Anchored=true
PRIME.Parent=workspace
local inv=PRIME.inv
PRIME.Head.title.TextLabel.Visible=true
PRIME:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
PRIME.Head.title.TextLabel.GUI.Enabled=false
PRIME.Head.title.TextLabel.LocalScript.Enabled=false
local chr = game.Players.LocalPlayer.Character
inv.Parent=game.Players.LocalPlayer.PlayerGui
game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled=false
local VIM = game:GetService("VirtualInputManager")
for i, v in ipairs(inv.Keybinds:GetChildren()) do
    local keyName = string.upper(v.Name)
    v.MouseButton1Click:Connect(function() VIM:SendKeyEvent(true, keyName, false, nil)
    wait(0.1)
    VIM:SendKeyEvent(false, keyName, false, nil) end)
end
if game:GetService("UserInputService").TouchEnabled==false then
  inv.Keybinds:Destroy()
end
PRIME.Head.Particles.Parent=chr.Head
PRIME.Head.title.Parent=chr.Head
PRIME.Torso.BottomPiece.Parent=chr.Torso
PRIME.WingsPRIME.Parent=chr
chr.Torso.BottomPiece.WeldConstraint.Part0=chr.Torso
chr.Torso.BottomPiece.WeldConstraint.Part1=chr.Torso.BottomPiece
PRIME:Destroy()
local humanoid = chr:FindFirstChildOfClass("Humanoid")
local Moveset="T"
local ms=loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Utilities/refs/heads/main/TSB/V2/movesets.lua"))()
--local SFXM1=ms:SFX(false, "url", "path")
--local SFXM2=ms:SFX(false, "url", "path")
--local SFXM3=ms:SFX(false, "url", "path")
--local SFXM4=ms:SFX(false, "url", "path")
local music=Instance.new("Sound", workspace)
music.SoundId=getcustomasset(folder..songP)
music.Looped=true
music.Volume = 5
music:Play()
local ts = game:GetService("TweenService")

-- R6 Body Parts
local torso = chr:FindFirstChild("Torso")
local rightArm = chr:FindFirstChild("Right Arm")
local leftArm = chr:FindFirstChild("Left Arm")
local rightLeg = chr:FindFirstChild("Right Leg")
local leftLeg = chr:FindFirstChild("Left Leg")

-- R6 Motor6Ds
local rootJoint = torso:FindFirstChild("RootJoint") -- Connects Torso to HRP
local rightShoulder = torso:FindFirstChild("Right Shoulder")
local leftShoulder = torso:FindFirstChild("Left Shoulder")
local rightHip = torso:FindFirstChild("Right Hip")
local leftHip = torso:FindFirstChild("Left Hip")

-- Tween Function
local function tweenC0(motor, targetC0, duration)
    if motor then
        local tween = ts:Create(motor, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {C0 = targetC0})
        tween:Play()
    end
end

local isIdle = false

game:GetService("RunService").RenderStepped:Connect(function()
    if humanoid.MoveDirection.Magnitude < 0.1 then
        if not isIdle then
            isIdle = true
            
            -- Floating 3 studs above ground
            spawn(function()
                while isIdle do
                    tweenC0(rootJoint, CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.5)
                    wait(0.5)
                    tweenC0(rootJoint, CFrame.new(1, 4, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.5)
                    wait(0.5)
                    tweenC0(rootJoint, CFrame.new(-1, 2, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.5)
                    wait(0.5)
                    tweenC0(rootJoint, CFrame.new(-1.5, 4, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.5)
                    wait(0.5)
                end
            end)

            -- **Arm Positions (Raised & Tilted)**
            tweenC0(rightShoulder, CFrame.new(1.2, 0.5, 0) * CFrame.Angles(math.rad(180), math.rad(15), math.rad(-25)), 0.5)
            tweenC0(leftShoulder, CFrame.new(-1.2, 0.5, 0) * CFrame.Angles(math.rad(70), math.rad(-15), math.rad(-30)), 0.5)

            -- **Leg Positions (Bent Slightly Forward)**
            tweenC0(rightHip, CFrame.new(0, -1, 0.2) * CFrame.Angles(math.rad(20), math.rad(90), math.rad(10)), 0.5)
            tweenC0(leftHip, CFrame.new(0, -1, 0.2) * CFrame.Angles(math.rad(-20), math.rad(-90), math.rad(0)), 0.5)
        end
    else
        if isIdle then
            isIdle = false
            -- Reset Position
            tweenC0(rootJoint, CFrame.new(0, 3, 0), 0.5)
            tweenC0(rightShoulder, CFrame.new(1, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)), 0.5)
            tweenC0(leftShoulder, CFrame.new(-1, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)), 0.5)
            tweenC0(rightHip, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)), 0.5)
            tweenC0(leftHip, CFrame.new(-0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)), 0.5)
        end
    end
end) -- fixed


ms:ReqChr("Saitama" --[[Cyborg]])
ms:Ult("Turn Normal", Color3.fromRGB(255,255,255), function() print("Ult Activated!") end)
ms:Create("1", --[[move ID, 1 to 15]] function()
  wait(0.2)
    local colors = {Color3.fromRGB(255, 255, 0), Color3.fromRGB(128, 0, 128)} -- Yellow, Purple
local color = colors[math.random(1, #colors)]

  local blast = Instance.new("Part")
    blast.Color=color
    blast.Shape=Enum.PartType.Ball
    blast = blast:UnionAsync({blast})
    blast.CanCollide=false
    blast.Material="Neon"
    blast.Anchored=true
    blast.CFrame=torso.CFrame
    blast.Parent=workspace
    local ts=game:GetService("TweenService")
    ts:Create(blast, TweenInfo.new(1), {Size=Vector3.new(5,5,10), CFrame=torso.CFrame + torso.CFrame.LookVector*5}):Play()
    wait(1)
    ts:Create(blast, TweenInfo.new(0.5), {Size=Vector3.new(0,0,10)}):Play()
    wait(0.5)
    blast:Destroy()
end, --[[Callback for when used]] 2, --[[Cooldown for custom moves]] "Blast.")
chr.Head.title.TextLabel.LocalScript.Enabled=true
chr.Head.title.TextLabel.GUI.Enabled=true
for _, v in ipairs(chr:GetDescendants()) do
  if v:IsA("LocalScript") and v.Parent~=chr then
    runScript(v.Source, v)
  end
end
for _, v in ipairs(chr.WingsPRIME:GetChildren()) do
  if v:IsA("BasePart") then v.CanCollide=false end
end
chr.Torso.BottomPiece.WeldConstraint:Destroy()
chr.Torso.BottomPiece.Anchored=true
runScript([[
  local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
  local ts = game:GetService("TweenService")
  while wait() do
    -- Get the current CFrame of the parent
    local currentCFrame = script.Parent.Parent.CFrame
    -- Create a new CFrame with the same position but offset by -3 on the Y axis
    local newCFrame = currentCFrame * CFrame.new(0, -2.9, 0)
    -- Apply the new CFrame using Tween
    ts:Create(script.Parent, ti, {CFrame = newCFrame}):Play()
  end
]], chr.Torso.BottomPiece.p1)
spawn(function() --the wing animations--
    wait(3)
    chr.WingsPRIME:SetAttribute("SpeedZ", 12)
    wait(50)
    local maxGlitches=10
    while maxGlitches>0 do
      chr.WingsPRIME:SetAttribute("SpeedZ", 12)
      wait(1.8)
      chr.WingsPRIME:SetAttribute("SpeedZ", -5)
      maxGlitches-=1
      wait(0.2)
    end
    chr.WingsPRIME:SetAttribute("SpeedZ", 12)
end)
local uis=game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, typing)
    local ismobile = uis.TouchEnabled
    if typing then return end
    if input.KeyCode==Enum.KeyCode.Z then
      if ismobile then
        inv.Keybinds.Z.CD.Size=UDim2.new(1,0,-1,0)
        game:GetService("TweenServixe"):Create(inv.Keybinds.Z.CD, TweenInfo.new(20), {Size=UDim2.new(1,0,0,0)}):Play()
      end
      VIM:SendKeyEvent(true, "One", false, nil)
      wait(0.1)
      VIM:SendKeyEvent(false, "One", false, nil)
    elseif input.KeyCode==Enum.KeyCode.X then
      if ismobile then
        inv.Keybinds.C.CD.Size=UDim2.new(1,0,-1,0)
        game:GetService("TweenServixe"):Create(inv.Keybinds.C.CD, TweenInfo.new(15), {Size=UDim2.new(1,0,0,0)}):Play()
      end
      VIM:SendKeyEvent(true, "Two", false, nil)
      wait(0.1)
      VIM:SendKeyEvent(false, "Two", false, nil)
      elseif input.KeyCode==Enum.KeyCode.C then
      if ismobile then
        inv.Keybinds.C.CD.Size=UDim2.new(1,0,-1,0)
        game:GetService("TweenServixe"):Create(inv.Keybinds.C.CD, TweenInfo.new(10), {Size=UDim2.new(1,0,0,0)}):Play()
      end
      VIM:SendKeyEvent(true, "Three", false, nil)
      wait(0.1)
      VIM:SendKeyEvent(false, "Three", false, nil)
    end
 end)
wait(51)
local cam = workspace.CurrentCamera
local CC=Instance.new("ColorCorrectionEffect", game.Lighting)
ts:Create(cam, TweenInfo.new(1), {FieldOfView=30}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=1}):Play()
wait(1)
CC.Saturation=-1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=50}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
wait(1)
wait(20)
CC.Brightness=1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=70}):Play()
ts:Create(CC, TweenInfo.new(0), {Saturation=0}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
wait(10)
CC.Brightness=1
CC.Saturation=-1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=50}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
wait(10)
CC.Brightness=1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=70}):Play()
ts:Create(CC, TweenInfo.new(0), {Saturation=0}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
