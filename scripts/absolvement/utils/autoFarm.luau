-- potential model: workspace.Potentials (everything but the pre place highlight and must be a base part)
--[[
local args = {
	"Room5_1", --basepart.Name
	2 -- 1-3
}
game:GetService("Players").LocalPlayer:WaitForChild("Remotes"):WaitForChild("Potential"):InvokeServer(unpack(args))
]]

local TweenService = game:GetService("TweenService")

getgenv().autoFarm = {}

local rootPart: BasePart? = nil
local character: Model? = nil

local target = nil

local state : boolean = false
local offset: number = 5

getgenv().Players.localOnCharacterAdded(function(char)
	character = char
    rootPart = char:WaitForChild("HumanoidRootPart")
end)

local args = {
        "",
        Enum.UserInputState.Begin,
    {
        MouseLock = false,
        MoveDirection = Vector3.zero,
        TorsoRotation = CFrame.zero,
        MousePosition = vector.zero
    }
}

local function requestAction(action: string, state: boolean)
    args[1] = action
    if not state then args[2] = Enum.UserInputState.End end
    game:GetService("Players").LocalPlayer:WaitForChild("Remotes"):WaitForChild("RequestAction"):InvokeServer(unpack(args))
end

local function getEnemies()
    local enemies = {}
    for _, enemy in workspace.NPCs:GetChildren() do
        table.insert(enemies, enemy)
    end
    return enemies
end

local function teleport(tpPos: CFrame)
    local lookPos = tpPos.Position
    local abovePos = lookPos + Vector3.new(0, offset, 0)

    character:SetAttribute("LatestTeleport", CFrame.lookAt(abovePos, lookPos, Vector3.yAxis))
end

local function kill(enemy : Model)
    local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
    if enemyHRP then
        repeat
            teleport(enemyHRP.CFrame)
            requestAction("Weapon", true)
            task.wait()
            while character.Humanoid.Health <= character.Humanoid.MaxHealth / 4 do
                teleport(enemyHRP.CFrame + Vector3.new(0,100,0))
                task.wait()
            end
        until enemy.Humanoid.Health <= 0.01 or state == false
        requestAction("Weapon", true)
    else
        return
    end
end

for _, enemy in getEnemies() do
    if state == false then return end
    if enemy:IsA("Model") then
        kill(enemy)
    end
end

function autoFarm.setOffset(offsetVal: number)
    offset = offsetVal
end

function autoFarm.autoFarmState(value)
    state = value
end

--return autoFarm