local plrGui = game.Players.LocalPlayer.PlayerGui.MainScreenGui
-- create a TextBox
local textBox = Instance.new("TextBox")
textBox.Text = ""
textBox.PlaceholderText = "Enter Username (can be shortened)"
textBox.PlaceholderColor3 = Color3.new(0, 0, 0)
textBox.Name = "userMoney"
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0, 660, 0, 880)
textBox.Parent = plrGui

-- create a TextButton
local textButton = Instance.new("TextButton")
textButton.TextSize = "25"
textButton.Text = "See Money"
textButton.Name = "buttonMoney"
textButton.Size = UDim2.new(0, 190, 0, 50)
textButton.Position = UDim2.new(0, 875, 0, 880)
textButton.Parent = plrGui

-- connect the button to a function that retrieves the player's money
textButton.MouseButton1Click:Connect(function()
    local plrName = textBox.Text
    local Players = game:GetService("Players")
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower():find(plrName:lower()) then
            local plr = player.Name
            local moneyCount = player.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text
            if moneyCount == "???" then
                local m = Instance.new("Message", workspace)
                m.Text = player.Name .. " did not show the Wallet, or they have resetted.\nSo they need to pull out their Wallet to see their money."
                wait(5)
                m:Remove()
            else
                local m = Instance.new("Message", workspace)
                m.Text = player.Name .. " Money:\n" .. moneyCount
                wait(5)
                m:Remove()
            end
            break
        end
    end
end)
