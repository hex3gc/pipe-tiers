-- TIER VALUES
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier1PipeExtent",
        setting_type = "startup",
        default_value = 128
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier1PumpSpeed",
        setting_type = "startup",
        default_value = 600
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier2PipeExtent",
        setting_type = "startup",
        default_value = 256
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier2PumpSpeed",
        setting_type = "startup",
        default_value = 1200
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier3PipeExtent",
        setting_type = "startup",
        default_value = 512
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier3PumpSpeed",
        setting_type = "startup",
        default_value = 2400
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier4PipeExtent",
        setting_type = "startup",
        default_value = 8192
    }
})
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_tier4PumpSpeed",
        setting_type = "startup",
        default_value = 24000
    }
})

-- TIER ASSIGNMENTS --

-- Default
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_defaultTier",
        setting_type = "startup",
        default_value = 2,
        allowed_values = {1,2,3,4}
    }
})

-- Factorio: Pipes
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_pipeTier_factorioPipe",
        setting_type = "startup",
        default_value = 1,
        allowed_values = {1,2,3,4}
    }
})
-- Factorio: Pump
data:extend
({
    {
        type = "int-setting",
        name = "h3pt_pipeTier_factorioPump",
        setting_type = "startup",
        default_value = 2,
        allowed_values = {1,2,3,4}
    }
})
data:extend -- Factorio: Offshore pump
({
    {
        type = "int-setting",
        name = "h3pt_pipeTier_factorioOffshorePump",
        setting_type = "startup",
        default_value = 2,
        allowed_values = {1,2,3,4}
    }
})

-- Fluid Must Flow
if mods["FluidMustFlow"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_fluidMustFlow",
            setting_type = "startup",
            default_value = 4,
            allowed_values = {1,2,3,4}
        }
    })
end

-- Krastorio 2: Steel Pipes
if mods["Krastorio2"] or mods["k2-steel-pipes"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_k2SteelPipes",
            setting_type = "startup",
            default_value = 2,
            allowed_values = {1,2,3,4}
        }
    })
end
-- Krastorio 2: Big/huge Storage Tanks
if mods["Krastorio2"] or mods["k2-fluid-storage"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_k2FluidStorage",
            setting_type = "startup",
            default_value = 2,
            allowed_values = {1,2,3,4}
        }
    })
end

-- Elevated pipes
if mods["elevated-pipes"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_elevatedPipes",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
end

-- Paracelsin
if mods["Paracelsin"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_zincPipes",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
end

-- Pyanodons Industry (Niobium pipes)
if mods["pyindustry"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_pyNiobiumPipes",
            setting_type = "startup",
            default_value = 2,
            allowed_values = {1,2,3,4}
        }
    })
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_pyValves",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
end
-- Pyanodons High Tech (Multipurpose pipes)
if mods["pyhightech"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_pyMultiPipes",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
end
-- Pyanodons storage tanks
if mods["pyindustry"] or mods["pypetroleumhandling"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_pyStorageTanks",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
end

-- Schall pipe scaling
if mods["SchallPipeScaling"] then
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_schallPS1",
            setting_type = "startup",
            default_value = 2,
            allowed_values = {1,2,3,4}
        }
    })
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_schallPS2",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_schallPS3",
            setting_type = "startup",
            default_value = 4,
            allowed_values = {1,2,3,4}
        }
    })
end

-- Advanced fluid handling
if mods["underground-pipe-pack"] then
        data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_advTier1",
            setting_type = "startup",
            default_value = 1,
            allowed_values = {1,2,3,4}
        }
    })
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_advTier2",
            setting_type = "startup",
            default_value = 2,
            allowed_values = {1,2,3,4}
        }
    })
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_advTier3",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
    data:extend
    ({
        {
            type = "int-setting",
            name = "h3pt_pipeTier_advValves",
            setting_type = "startup",
            default_value = 3,
            allowed_values = {1,2,3,4}
        }
    })
end

-- CUSTOM OVERRIDES --
data:extend
({
    {
        type = "string-setting",
        name = "h3pt_overrides_tier1",
        setting_type = "startup",
        default_value = "",
        allow_blank = true,
        auto_trim = true
    }
})
data:extend
({
    {
        type = "string-setting",
        name = "h3pt_overrides_tier2",
        setting_type = "startup",
        default_value = "",
        allow_blank = true,
        auto_trim = true
    }
})
data:extend
({
    {
        type = "string-setting",
        name = "h3pt_overrides_tier3",
        setting_type = "startup",
        default_value = "",
        allow_blank = true,
        auto_trim = true
    }
})
data:extend
({
    {
        type = "string-setting",
        name = "h3pt_overrides_tier4",
        setting_type = "startup",
        default_value = "",
        allow_blank = true,
        auto_trim = true
    }
})