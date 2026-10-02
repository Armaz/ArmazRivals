-- Services
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

-- Local Player
local LocalPlayer = Players.LocalPlayer

-- Universal Team Check Function
local function isEnemy(targetPlayer)
    -- Ensure the target is a valid player and not the local player
    if not targetPlayer or targetPlayer == LocalPlayer then 
        return false 
    end
    
    -- Check if Teams service is active and has teams configured
    if #Teams:GetTeams() > 0 then
        -- Return true if their teams are different
        return LocalPlayer.Team ~= targetPlayer.Team
    else
        -- Fallback for games without official Teams (e.g., using TeamColor directly)
        return LocalPlayer.TeamColor ~= targetPlayer.TeamColor
    end
end

-- Example Usage in a Target Selection Loop:
--[[
local function getClosestEnemy()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        -- Apply the Team Check here
        if isEnemy(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- (Your distance/FOV calculation logic goes here)
            
            -- Example distance check:
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    return closestPlayer
end
]]
