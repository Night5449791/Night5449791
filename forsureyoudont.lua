for i, v in game:GetDescendants() do
    if v:IsA("RemoteEvent") then
        v:FireServer({}, 23909043, "amogus", "9032949084390289048230948290348924390432902432409439290342934239240098342904323904289052890583240923489023409234", {})
    elseif v:IsA("RemoteFunction") then
        v:InvokeServer({}, 23909043, "amogus", "9032949084390289048230948290348924390432902432409439290342934239240098342904323904289052890583240923489023409234", {})
    end
end

if raknet then
    raknet.OnPacketReceive:Connect(function(packet)
        packet:Block()
    end)
end