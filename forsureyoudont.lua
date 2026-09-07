local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local meleeEvent = ReplicatedStorage:WaitForChild("meleeEvent")

local states = {
    KILLAURA = true
}

coroutine.wrap(function()
    while task.wait(0.5) do
        if states.KILLAURA then
            local character = LocalPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")

            if rootPart then
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        pcall(function()
                            local targetCharacter = player.Character
                            local targetRoot = targetCharacter
                                and targetCharacter:FindFirstChild("HumanoidRootPart")

                            local humanoid = targetCharacter
                                and targetCharacter:FindFirstChildOfClass("Humanoid")

                            if targetRoot and humanoid and humanoid.Health > 0 then
                                local distance = (
                                    rootPart.Position - targetRoot.Position
                                ).Magnitude

                                if distance < 10 then
                                    local hits = math.ceil(humanoid.Health / 5)

                                    for i = 1, hits do
                                        meleeEvent:FireServer(player)
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        end
    end
end)()