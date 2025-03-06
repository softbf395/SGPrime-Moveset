local folder="AeSGR/"
local songP="PRIME.mp3"
local rbxlP="PRIME.rbxl"
local songURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.mp3"
local rbxlURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.rbxm"
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
PRIME:SetPivot(game.Players.LocalPlayer.Character.Head.CFrame)
PRIME.Head.title.TextLabel.GUI.Enabled=false
local chr = game.Players.LocalPlayer.Character
PRIME.Head.Particles.Parent=chr.Head
PRIME.Head.title.Parent=chr.Head
PRIME.Torso.BottomPiece.Parent=chr.Torso
PRIME.WingsPRIME.Parent=chr
chr.Torso.BottomPiece.WeldConstraint.Part0=chr.Torso
chr.Torso.BottomPiece.WeldConstraint.Part1=chr.Torso.BottomPiece
PRIME.Parent:Destroy()
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
            tweenC0(rootJoint, CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.5)

            -- **Arm Positions (Raised & Tilted)**
            tweenC0(rightShoulder, CFrame.new(1.2, 0.5, 0) * CFrame.Angles(math.rad(-90), math.rad(15), math.rad(30)), 0.5)
            tweenC0(leftShoulder, CFrame.new(-1.2, 0.5, 0) * CFrame.Angles(math.rad(-90), math.rad(-15), math.rad(-30)), 0.5)

            -- **Leg Positions (Bent Slightly Forward)**
            tweenC0(rightHip, CFrame.new(0.5, -1, 0.2) * CFrame.Angles(math.rad(20), 0, math.rad(10)), 0.5)
            tweenC0(leftHip, CFrame.new(-0.5, -1, 0.2) * CFrame.Angles(math.rad(20), 0, math.rad(-10)), 0.5)
        end
    else
        if isIdle then
            isIdle = false
            -- Reset Position
            tweenC0(rootJoint, CFrame.new(0, 0, 0), 0.5)
            tweenC0(rightShoulder, CFrame.new(1, 0.5, 0), 0.5)
            tweenC0(leftShoulder, CFrame.new(-1, 0.5, 0), 0.5)
            tweenC0(rightHip, CFrame.new(0.5, -1, 0), 0.5)
            tweenC0(leftHip, CFrame.new(-0.5, -1, 0), 0.5)
        end
    end
end)


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
