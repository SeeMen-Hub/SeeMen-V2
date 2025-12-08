local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local plrFuncs = getgenv().Players

local LocalPlayer = Players.LocalPlayer

local movement = {}

local humanoid : Humanoid? = nil

-- Speed
local speedEnabled : boolean = false
local speedValue : number = 16
local defaultSpeed : number = 16

-- Jump
local jumpEnabled : boolean = false
local jumpPowerValue : number = 50
local defaultJumpPower : number = 50

-- Fly
local flyEnabled : boolean = false
local flySpeedValue : number = 50
local rootPart : BasePart? = nil

local bodyVelocity : BodyVelocity? = nil
local bodyGyro : BodyGyro? = nil
local flyConnection : RBXScriptConnection? = nil

local function startFly()
	if not rootPart then return end

	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
	bodyVelocity.Velocity = Vector3.zero
	bodyVelocity.Parent = rootPart

	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
	bodyGyro.CFrame = rootPart.CFrame
	bodyGyro.Parent = rootPart

	flyConnection = RunService.RenderStepped:Connect(function()
		if not rootPart then return end

		local camera = workspace.CurrentCamera
		local moveDir = humanoid and humanoid.MoveDirection or Vector3.zero

		bodyVelocity.Velocity =
			(camera.CFrame.RightVector * moveDir.X +
			camera.CFrame.LookVector * moveDir.Z) * flySpeedValue

		bodyGyro.CFrame = camera.CFrame
	end)
end

local function stopFly()
	if flyConnection then
		flyConnection:Disconnect()
		flyConnection = nil
	end

	if bodyVelocity then
		bodyVelocity:Destroy()
		bodyVelocity = nil
	end

	if bodyGyro then
		bodyGyro:Destroy()
		bodyGyro = nil
	end
end

plrFuncs.localOnCharacterAdded(function(character)
	humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
	humanoid.WalkSpeed = speedEnabled and speedValue or defaultSpeed
    humanoid.UseJumpPower = true
	humanoid.JumpPower = jumpEnabled and jumpPowerValue or defaultJumpPower
    if flyEnabled then
        startFly()
    else
        stopFly()
    end
end)

function movement.setSpeedState(state : boolean)
	assert(typeof(state) == "boolean", "setState expects a boolean")

	speedEnabled = state

	if humanoid then
		humanoid.WalkSpeed = speedEnabled and speedValue or defaultSpeed
	end
end

function movement.setSpeed(speed : number)
	assert(typeof(speed) == "number", "setSpeed expects a number")

	speedValue = speed

	if speedEnabled and humanoid then
		humanoid.WalkSpeed = speedValue
	end
end

function movement.setJumpState(state : boolean)
	assert(typeof(state) == "boolean", "setState expects a boolean")

	jumpEnabled = state

	if humanoid then
		humanoid.UseJumpPower = true
		humanoid.JumpPower = jumpEnabled and jumpPowerValue or defaultJumpPower
	end
end

function movement.setJumpPower(power : number)
	assert(typeof(power) == "number", "setPower expects a number")

	jumpPowerValue = power

	if jumpEnabled and humanoid then
		humanoid.JumpPower = jumpPowerValue
	end
end

function movement.setFlyState(state : boolean)
	assert(typeof(state) == "boolean", "setState expects a boolean")

	flyEnabled = state

	if flyEnabled then
		startFly()
	else
		stopFly()
	end
end

-- Sets the fly movement speed
function movement.setFlySpeed(speed : number)
	assert(typeof(speed) == "number", "setSpeed expects a number")

	flySpeedValue = speed
end


return movement