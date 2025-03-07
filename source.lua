print("VERSION: Test 02-01") --version!!
print("Creator: Aedaniss7 on scriptblox")
local folder="AeSGR/" --start :D
local songP="PRIME.mp3" 
local rbxlP="PRIME.rbxl"
local songURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.mp3"
local rbxlURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.rbxm"
function runScript(source, origin)
  local Run=source:gsub("script", origin:GetFullName())
    spawn(function()
      loadstring(Run)()
    end)
end
function saveFilee(path, content, useURLV)
  local useURL = useURLV or false
  if not isfile(path) then
    if useURL == true then
      writefile(folder..path, game:HttpGet(content))
    else
      writefile(folder..path, content)
    end
  end
end
function spawnRBXL(path)
  local ins=getcustomasset(folder..path)
  return game:GetObjects(ins)[1]
end
saveFilee(songP, songURL, true)
local PRIME=spawnRBXL(rbxlP)
PRIME.Torso.BottomPiece.WeldConstraint.Part1=PRIME.Torso.BottomPiece
PRIME.PrimaryPart=PRIME.HumanoidRootPart
PRIME.PrimaryPart.Anchored=true
PRIME.Parent=workspace
PRIME.Head.title.TextLabel.Visible=true
PRIME:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
PRIME.Head.title.TextLabel.GUI.Enabled=false
PRIME.Head.title.TextLabel.LocalScript.Enabled=false
local chr = game.Players.LocalPlayer.Character
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
