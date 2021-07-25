local UIS = game:GetService('UserInputService');
local Players = game:GetService('Players');

local Event = game.ReplicatedStorage.Events.WandEvent;

local Player = Players.LocalPlayer;
local Character = Player.Character;

_G.Auto = false;

function toggleAuto()
    _G.Auto = not _G.Auto;
    Autoblock();
end

function Autoblock()
    local coro = spawn(function()
        while _G.Auto do
            Event:FireServer(3);
            wait(2);
        end
    end)
end

function onInput(Input, GPE)
    if GPE then return nil end

    if Input.UserInputType == Enum.UserInputType.Keyboard then
        if Input.KeyCode == Enum.KeyCode.Z then
            toggleAuto();
        end
    end
end

UIS.InputBegan:Connect(onInput);
