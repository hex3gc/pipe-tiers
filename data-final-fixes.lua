-- Code adapted from "Extents begone" by notnotmelon https://github.com/notnotmelon/extents-begone
-- except i used it to actually ADD extents ha ha
-- i'll make more extents......... i'll make even smaller ones
local function locateInTable(table, value)
    for i = 1, #table do
        if table[i] == value then
            return true;
        end
    end
    return false
end

local function getPosInTable(table, value)
    for i = 1, #table do
        if table[i] == value then
            return i;
        end
    end
    return 0;
end

local function commaDelimitedListIntoTable(inputString)
    local retTable = {};

    for hit in string.gmatch(inputString, '([^,]+)') do
        local hitTrimmed = hit:match("^%s*(.-)%s*$");
        table.insert(retTable, hitTrimmed);
    end
    
    return retTable;
end

local function applyTierValuesToAllEntities(tier)
    local extent = settings.startup["h3pt_tier"..tier.."PipeExtent"].value;
    local pumpSpeed = settings.startup["h3pt_tier"..tier.."PumpSpeed"].value / 60;

    for entity_prototype in pairs(defines.prototypes.entity) do
        for _, entity in pairs(data.raw[entity_prototype] or {}) do

            for _, fluid_box in pairs(entity.fluid_boxes or {}) do
                fluid_box.max_pipeline_extent = extent;
            end
            if entity.fluid_box then
                entity.fluid_box.max_pipeline_extent = extent;
            end
            if entity.input_fluid_box then
                entity.input_fluid_box.max_pipeline_extent = extent;
            end
            if entity.output_fluid_box then
                entity.output_fluid_box.max_pipeline_extent = extent;
            end
            if entity.fuel_fluid_box then
                entity.fuel_fluid_box.max_pipeline_extent = extent;
            end
            if entity.oxidizer_fluid_box then
                entity.oxidizer_fluid_box.max_pipeline_extent = extent;
            end
            if entity.energy_source and entity.energy_source.type == "fluid" then
                entity.energy_source.fluid_box.max_pipeline_extent = extent;
            end
            if entity.pumping_speed then
                entity.pumping_speed = pumpSpeed;
            end
            if entity.flow_rate then
                entity.flow_rate = pumpSpeed;
            end
        end
    end
end

local function applyTierValuesToNamedEntities(tier, listOfEntityNames)
    local extent = settings.startup["h3pt_tier"..tier.."PipeExtent"].value;
    local pumpSpeed = settings.startup["h3pt_tier"..tier.."PumpSpeed"].value / 60;

    for entity_prototype in pairs(defines.prototypes.entity) do

        if #listOfEntityNames <= 0 then
            break;
        end

        for _, entity in pairs(data.raw[entity_prototype] or {}) do

            if #listOfEntityNames <= 0 then
                break;
            end

            if locateInTable(listOfEntityNames, entity.name) then

                for _, fluid_box in pairs(entity.fluid_boxes or {}) do
                    fluid_box.max_pipeline_extent = extent;
                end
                if entity.fluid_box then
                    entity.fluid_box.max_pipeline_extent = extent;
                end
                if entity.input_fluid_box then
                    entity.input_fluid_box.max_pipeline_extent = extent;
                end
                if entity.output_fluid_box then
                    entity.output_fluid_box.max_pipeline_extent = extent;
                end
                if entity.fuel_fluid_box then
                    entity.fuel_fluid_box.max_pipeline_extent = extent;
                end
                if entity.oxidizer_fluid_box then
                    entity.oxidizer_fluid_box.max_pipeline_extent = extent;
                end
                if entity.energy_source and entity.energy_source.type == "fluid" then
                    entity.energy_source.fluid_box.max_pipeline_extent = extent;
                end
                if entity.pumping_speed then
                    entity.pumping_speed = pumpSpeed;
                end
                if entity.flow_rate then
                    entity.flow_rate = pumpSpeed;
                end
                
                if getPosInTable(listOfEntityNames, entity.name) > 0 then
                    table.remove(listOfEntityNames, getPosInTable(listOfEntityNames, entity.name));
                end
            end
        end
    end
end

-- Defaults
applyTierValuesToAllEntities(settings.startup["h3pt_defaultTier"].value);

-- Factorio
applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_factorioPipe"].value, {"pipe", "pipe-to-ground"});
applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_factorioPump"].value, {"pump"});
applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_factorioOffshorePump"].value, {"offshore-pump"});
if mods["the-one-mod-with-underground-bits"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_factorioPipe"].value, {"tomwub-pipe"});
end

-- Fluid Must Flow
if mods["FluidMustFlow"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_fluidMustFlow"].value, {"duct-cross", "duct-curve", "duct-exhaust", "duct-intake", "duct-long", "duct-small", "duct-t-junction", "duct-underground", "duct", "non-return-duct"});
    if mods["the-one-mod-with-underground-bits"] then
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_fluidMustFlow"].value, {"tomwub-duct-cross", "tomwub-duct-curve", "tomwub-duct-long", "tomwub-duct-small", "tomwub-duct-t-junction", "tomwub-duct"});
    end
end

-- Krastorio 2
if mods["Krastorio2"] or mods["k2-steel-pipes"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_k2SteelPipes"].value, {"kr-steel-pipe", "kr-steel-pipe-to-ground", "kr-steel-pump"});
    if mods["the-one-mod-with-underground-bits"] then
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_k2SteelPipes"].value, {"tomwub-kr-steel-pipe"});
    end
end
if mods["Krastorio2"] or mods["k2-fluid-storage"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_k2FluidStorage"].value, {"kr-fluid-storage-1", "kr-fluid-storage-2"});
end

-- Elevated pipis
if mods["elevated-pipes"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_elevatedPipes"].value, {"elevated-pipe"});
end

-- Paracelsin
if mods["Paracelsin"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_zincPipes"].value, {"zinc-pipe", "zinc-pipe-to-ground", "zinc-storage-tank", "zinc-pump"});
    if mods["the-one-mod-with-underground-bits"] then
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_zincPipes"].value, {"tomwub-zinc-pipe"});
    end
end

-- PyMods
if mods["pyindustry"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyNiobiumPipes"].value, {"niobium-pipe", "niobium-pipe-to-ground"});
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyValves"].value, {"py-underflow-valve", "py-overflow-valve", "py-check-valve"});
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyStorageTanks"].value, {"py-tank-1000", "py-tank-1500", "py-tank-3000", "py-tank-4000", "py-tank-5000", "py-tank-6500", "py-tank-7000", "py-tank-8000"});
    if mods["the-one-mod-with-underground-bits"] then
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyNiobiumPipes"].value, {"tomwub-niobium-pipe"});
    end
end
if mods["pyhightech"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyMultiPipes"].value, {"ht-pipes", "ht-pipes-to-ground"});
    if mods["the-one-mod-with-underground-bits"] then
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyMultiPipes"].value, {"tomwub-ht-pipes"});
    end
end
if mods["pypetroleumhandling"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_pyStorageTanks"].value, {"py-tank-9000", "py-tank-10000"});
end

-- Schall pipe scaling
if mods["SchallPipeScaling"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_schallPS1"].value, {"pipe-PS-1", "pipe-to-ground-PS-1", "pump-PS-1"});
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_schallPS2"].value, {"pipe-PS-2", "pipe-to-ground-PS-2", "pump-PS-2"});
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_schallPS3"].value, {"pipe-PS-3", "pipe-to-ground-PS-3", "pump-PS-3"});
    if mods["the-one-mod-with-underground-bits"] then
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_schallPS1"].value, {"tomwub-pipe-PS-1"});
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_schallPS2"].value, {"tomwub-pipe-PS-2"});
        applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_schallPS3"].value, {"tomwub-pipe-PS-3"});
    end
end

-- Advanced fluid handling
if mods["underground-pipe-pack"] then
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_advTier1"].value, {"underground-mini-pump", "one-to-one-forward-pipe", "one-to-two-perpendicular-pipe", "one-to-three-forward-pipe", "one-to-four-pipe", "underground-i-pipe", "underground-L-pipe", "underground-t-pipe", "underground-cross-pipe", "4-to-4-pipe"}); -- You have too many pipes
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_advTier2"].value, {"underground-mini-pump-t2", "one-to-one-forward-t2-pipe", "one-to-two-perpendicular-t2-pipe", "one-to-three-forward-t2-pipe", "one-to-four-t2-pipe", "underground-i-t2-pipe", "underground-L-t2-pipe", "underground-t-t2-pipe", "underground-cross-t2-pipe"});
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_advTier3"].value, {"underground-mini-pump-t3", "one-to-one-forward-t3-pipe", "one-to-two-perpendicular-t3-pipe", "one-to-three-forward-t3-pipe", "one-to-four-t3-pipe", "underground-i-t3-pipe", "underground-L-t3-pipe", "underground-t-t3-pipe", "underground-cross-t3-pipe"});
    applyTierValuesToNamedEntities(settings.startup["h3pt_pipeTier_advValves"].value, {"80-top-up-valve", "80-overflow-valve", "check-valve"});
end

-- Overrides
if settings.startup["h3pt_overrides_tier1"].value ~= "" then
    applyTierValuesToNamedEntities(1, commaDelimitedListIntoTable(settings.startup["h3pt_overrides_tier1"].value));
end
if settings.startup["h3pt_overrides_tier2"].value ~= "" then
    applyTierValuesToNamedEntities(2, commaDelimitedListIntoTable(settings.startup["h3pt_overrides_tier2"].value));
end
if settings.startup["h3pt_overrides_tier3"].value ~= "" then
    applyTierValuesToNamedEntities(3, commaDelimitedListIntoTable(settings.startup["h3pt_overrides_tier3"].value));
end
if settings.startup["h3pt_overrides_tier4"].value ~= "" then
    applyTierValuesToNamedEntities(4, commaDelimitedListIntoTable(settings.startup["h3pt_overrides_tier4"].value));
end