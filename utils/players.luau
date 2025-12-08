local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local plrfuncs = {}

-- Passes player to callback on join
function plrfuncs.onPlayerJoin(callback)
    assert(typeof(callback) == "function", "onPlayerJoin expects a function")

    return Players.PlayerAdded:Connect(callback)
end

-- Passes player to callback on leave
function plrfuncs.onPlayerLeave(callback)
    assert(typeof(callback) == "function", "onPlayerLeave expects a function")

    return Players.PlayerRemoving:Connect(callback)
end

-- Passes the player and character to callback (other players)
function plrfuncs.onCharacterAdded(callback)
    assert(typeof(callback) == "function", "onCharacterAdded expects a function")

    return plrfuncs.onPlayerJoin(function(player)
        if player == LocalPlayer then return end
        if player.Character then
            callback(player, player.Character)
        end

        player.CharacterAdded:Connect(function(character)
            callback(player, character)
        end)
    end)
end

function plrfuncs.otherPlayers(callback)
    assert(typeof(callback) == "function", "allPlayers expects a function")

    for _, plr in Players:GetPlayers() do
        if plr == LocalPlayer then continue end
        callback(plr)
    end
end

-- Passes the localplayer's character to callback
function plrfuncs.localOnCharacterAdded(callback)
    assert(typeof(callback) == "function", "onCharacterAdded expects a function")

    if LocalPlayer.Character then
        callback(LocalPlayer.Character)
    end

    return LocalPlayer.CharacterAdded:Connect(callback)
end


return plrfuncs