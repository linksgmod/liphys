

local plyAccess = {}

hook.Add( "PlayerInitialSpawn", "linksPHYS.RainbowPhysgunCheck", function(ply)
    if linksPHYS.Access[ply:GetUserGroup()] then
        table.insert(plyAccess, ply)
    end
end)

local function DoRainbowPhysgun()
    for k, v in ipairs(plyAccess) do
        if v:IsValid() and linksPHYS.Access[v:GetUserGroup()] then
            local col = HSVToColor(CurTime() % 6 * linksPHYS.ColourSpeed, 1, 1)
            v:SetWeaponColor(Vector(col.r/255, col.g/255, col.b/255))
        else
            table.remove(plyAccess, k)
        end
    end
end

timer.Create("links.PHYSTIME", AzureRBPG.UpdateFrequency, 0, DoRainbowPhysgun)
print("[linksPHYS] Loaded sv_rainbow_physgun.lua")