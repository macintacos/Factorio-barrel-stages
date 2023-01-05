-- Hello there :)
local fluidTech = data.raw.technology['fluid-handling']

-- https://forums.factorio.com/viewtopic.php?f=23&t=100057
local targetTechs = {
    ['fill-sulfuric-acid-barrel'] = 'sulfur-processing',
    ['empty-sulfuric-acid-barrel'] = 'sulfur-processing',

    ['fill-crude-oil-barrel'] = 'oil-processing',
    ['empty-crude-oil-barrel'] = 'oil-processing',

    ['fill-petroleum-gas-barrel'] = 'oil-processing',
    ['empty-petroleum-gas-barrel'] = 'oil-processing',

    ['fill-heavy-oil-barrel'] = 'advanced-oil-processing',
    ['empty-heavy-oil-barrel'] = 'advanced-oil-processing',

    ['fill-light-oil-barrel'] = 'advanced-oil-processing',
    ['empty-light-oil-barrel'] = 'advanced-oil-processing',

    ['fill-lubricant-barrel'] = 'lubricant',
    ['empty-lubricant-barrel'] = 'lubricant',
}


if not fluidTech.effects then return end


local n = #fluidTech.effects;
for i = 1, n do
    local effect = fluidTech.effects[i]
    local targetTech = data.raw.technology[targetTechs[effect.recipe]]
    if effect.type == 'unlock-recipe' and targetTech then -- filter only specific effects
        fluidTech.effects[i] = nil
        table.insert(targetTech.effects, { type = "unlock-recipe", recipe = effect.recipe })
    end
end
