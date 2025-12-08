local plrFuncs = getgenv().Players
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local movement = {}

local humanoid : Humanoid? = nil

-- Speed
local speedEnabled : boolean = false
local speedValue : number = 32
local defaultSpeed : number = 16

plrFuncs.localOnCharacterAdded(function(character)
	humanoid = character:WaitForChild("Humanoid")
	humanoid.WalkSpeed = speedEnabled and speedValue or defaultSpeed
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

return movement