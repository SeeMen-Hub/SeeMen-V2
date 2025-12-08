local plrFuncs = getgenv().Players
local Players = game:GetService("Players")
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

plrFuncs.localOnCharacterAdded(function(character)
	humanoid = character:WaitForChild("Humanoid")
	humanoid.WalkSpeed = speedEnabled and speedValue or defaultSpeed
    humanoid.UseJumpPower = true
	humanoid.JumpPower = jumpEnabled and jumpPowerValue or defaultJumpPower
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

return movement