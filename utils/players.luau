local Players = game:GetService("Players")

local plrfuncs = {}

function plrfuncs.onPlayerJoin(callback)
    assert(typeof(callback) == "function", "onPlayerJoin expects a function")

    return Players.PlayerAdded:Connect(callback)
end

function plrfuncs.onPlayerLeave(callback)
    assert(typeof(callback) == "function", "onPlayerLeave expects a function")

    return Players.PlayerRemoving:Connect(callback)
end

function plrfuncs.onCharacterAdded(callback)
    return plrfuncs.onPlayerJoin(function(player)
        if player.Character then
            callback(player, player.Character)
        end

        player.CharacterAdded:Connect(function(character)
            callback(player, character)
        end)
    end)
end


return plrfuncs