local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local plrFuncs = getgenv().Players

local LocalPlayer = Players.LocalPlayer

local movement = {}

local humanoid: Humanoid? = nil
local rootPart: BasePart? = nil
local character: Model? = nil
local Camera = workspace.CurrentCamera

-- Speed
local speedEnabled: boolean = false
local speedValue: number = 16
local defaultSpeed: number = 16

-- Jump
local jumpEnabled: boolean = false
local jumpPowerValue: number = 50
local defaultJumpPower: number = 50

-- Fly
local flyEnabled: boolean = false
local flySpeedValue: number = 0.5

local function flyLoop()
	if not character or not rootPart or not humanoid then return end

	local hum = humanoid
	local root = rootPart

	hum.PlatformStand = true
	local currentCF = root.CFrame

	while flyEnabled
		and character
		and character.Parent
		and root.Parent
		and hum.Parent
	do
		task.wait()

		local add = Vector3.new(0, 0, 0)

		if UIS:IsKeyDown(Enum.KeyCode.W) then add += Camera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then add -= Camera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then add += Camera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then add -= Camera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.E) then add += Camera.CFrame.UpVector end
		if UIS:IsKeyDown(Enum.KeyCode.Q) then add -= Camera.CFrame.UpVector end

		if add.Magnitude > 0 then
			add = add.Unit * flySpeedValue
		end

		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero

		currentCF += add
		root.CFrame = CFrame.lookAt(
			currentCF.Position,
			currentCF.Position + (Camera.CFrame.LookVector * 2)
		)
	end

	if hum and hum.Parent then
		hum.PlatformStand = false
	end
end

local function startFly()
	if not character then return end

	rootPart = character:FindFirstChild("HumanoidRootPart")
		or character:WaitForChild("HumanoidRootPart")

	humanoid = character:FindFirstChildOfClass("Humanoid")
		or character:WaitForChild("Humanoid")

	if not rootPart or not humanoid then return end

	task.spawn(flyLoop)
end

local function stopFly()
	flyEnabled = false

	if humanoid and humanoid.Parent then
		humanoid.PlatformStand = false
	end
end

plrFuncs.localOnCharacterAdded(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
	rootPart = char:WaitForChild("HumanoidRootPart")

	humanoid.WalkSpeed = speedEnabled and speedValue or defaultSpeed

	humanoid.UseJumpPower = true
	humanoid.JumpPower = jumpEnabled and jumpPowerValue or defaultJumpPower

	if flyEnabled then
		startFly()
	else
		stopFly()
	end
end)

function movement.setSpeedState(state: boolean)
	assert(typeof(state) == "boolean", "setState expects a boolean")

	speedEnabled = state

	if humanoid then
		humanoid.WalkSpeed = speedEnabled and speedValue or defaultSpeed
	end
end

function movement.setSpeed(speed: number)
	assert(typeof(speed) == "number", "setSpeed expects a number")

	speedValue = speed

	if speedEnabled and humanoid then
		humanoid.WalkSpeed = speedValue
	end
end

function movement.setJumpState(state: boolean)
	assert(typeof(state) == "boolean", "setState expects a boolean")

	jumpEnabled = state

	if humanoid then
		humanoid.UseJumpPower = true
		humanoid.JumpPower = jumpEnabled and jumpPowerValue or defaultJumpPower
	end
end

function movement.setJumpPower(power: number)
	assert(typeof(power) == "number", "setPower expects a number")

	jumpPowerValue = power

	if jumpEnabled and humanoid then
		humanoid.JumpPower = jumpPowerValue
	end
end

function movement.setFlyState(state: boolean)
	assert(typeof(state) == "boolean", "setState expects a boolean")

	flyEnabled = state

	if flyEnabled then
		startFly()
	else
		stopFly()
	end
end

function movement.setFlySpeed(speed: number)
	assert(typeof(speed) == "number", "setSpeed expects a number")

	flySpeedValue = speed
end

return movement