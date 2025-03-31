Config = {
    text = {
            format = 'TVŮJ POSTAL: %s',
            -- ScriptHook PLD Position
            --posX = 0.225,
            --posY = 0.963,
            -- vMenu PLD Position
            posX = 0.680,
            posY = 0.976,
        },
        blip = {
            textFormat = 'GPS POSTALU %s',
            color = 3, -- default 3 (light blue)
            distToDelete = 100.0, -- in meters
        }
    }

-- General
Config.AutoHide = false --Show basic player hud components (health, hunger and thrist) only if they are under 50%
Config.CinemaBarsCommand = 'cinema'
Config.command = 'gdfgdgsfjsdfbhjssghfiusfghsduighsjfuiasdfjhsduázaifghsduifhsduighsdiugshdfiugsfgsdhuiguigsdh'
Config.EnableCruise = false -- Determines if cruise mode is active
Config.DefaultCruiseControlKey = "k" -- Default control key for cruise. Players can change the key according to their desire
Config.CarHud = false --Enable/Disable car hud
Config.StreetOnlyOnCar = false --Show the street name component only whes player is driving
Config.UseLogo = false --Enable/Disble logo on screen
Config.LogoURL = ("https://cdn.discordapp.com/attachments/1228677298367238175/1228773794446049310/PRV_ICON_GAMING_ZMENSENA.png?ex=662d43c6&is=661acec6&hm=5b5cf5580753fca77e72d522dd4d842dce26c7dadb3891d9522e037d63a87ce0&") --Logo url (only if you have the Config.UseLogo in true)
Config.SpeedUnit = 'KMH'--KMH or MPH

-- Stress
Config.StressChance = 0.1 -- Default: 10% -- Percentage Stress Chance When Shooting (0-1)
Config.MinimumStress = 50 -- Minimum Stress Level For Screen Shaking
Config.MinimumSpeedUnbuckled = 50 -- Going Over This Speed Unbuckled Will Cause Stress
Config.MinimumSpeed = 100 -- Going Over This Speed While Buckled Will Cause Stress
Config.DisableStress = true -- If true will disable stress completely for all players
Config.StressNotifications = true --Enable/Disable notifications when getting stressed or relaxed

Config.VehClassStress = { -- Enable/Disable gaining stress from vehicle classes in this table
    ['0'] = true, -- Compacts
    ['1'] = true, -- Sedans
    ['2'] = true, -- SUVs
    ['3'] = true, -- Coupes
    ['4'] = true, -- Muscle
    ['5'] = true,  -- Sports Classics
    ['6'] = true, -- Sports
    ['7'] = true, -- Super
    ['8'] = true, -- Motorcycles
    ['9'] = true, -- Off Road
    ['10'] = true, -- Industrial
    ['11'] = true,  -- Utility
    ['12'] = true,  -- Vans
    ['13'] = false, -- Cycles
    ['14'] = false, -- Boats
    ['15'] = false, -- Helicopters
    ['16'] = false, -- Planes
    ['18'] = false, -- Emergency
    ['19'] = false, -- Military
    ['20'] = false, -- Commercial
    ['21'] = false  -- Trains
}

Config.WhitelistedVehicles = { -- Disable gaining stress from speeding in any vehicle in this table
    --[`adder`] = true
}

Config.WhitelistedJobs = { -- Disable stress completely for players with matching job or job type

}

Config.Intensity = {
    ["blur"] = {
        [1] = {
            min = 50,
            max = 60,
            intensity = 1500,
        },
        [2] = {
            min = 60,
            max = 70,
            intensity = 2000,
        },
        [3] = {
            min = 70,
            max = 80,
            intensity = 2500,
        },
        [4] = {
            min = 80,
            max = 90,
            intensity = 2700,
        },
        [5] = {
            min = 90,
            max = 100,
            intensity = 3000,
        },
    }
}

Config.EffectInterval = {
    [1] = {
        min = 50,
        max = 60,
        timeout = math.random(50000, 60000)
    },
    [2] = {
        min = 60,
        max = 70,
        timeout = math.random(40000, 50000)
    },
    [3] = {
        min = 70,
        max = 80,
        timeout = math.random(30000, 40000)
    },
    [4] = {
        min = 80,
        max = 90,
        timeout = math.random(20000, 30000)
    },
    [5] = {
        min = 90,
        max = 100,
        timeout = math.random(15000, 20000)
    }
}

Config.EnableSpamNotification = true -- Spam preventation for seatbelt, cruise etc.

-------------------------------------------- Notifications --------------------------------------------

Config.Notifications = { -- Notifications
    ["stress_gained"] = {
        message = 'Getting Stressed',
        type = "error",
    },
    ["stress_relive"] = {
        message =  'You Are Relaxing',
        type = "success",
    },
    ["took_off_seatbelt"] = {
        type = "error",
        message = "Odpoutal jsi se.",
    },
    ["took_seatbelt"] = {
        type = "success",
        message = "Jsi připoután.",
    },
    ["cruise_actived"] = {
        type = "success",
        message = "Omezovač rychlosti aktivní.",
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Omezovač rychlosti deaktivován.",
    },
    ["spam"] = {
        type = "error",
        message = "Prosím, vyčkej několik sekund.",
    },
    ["engine_on"] = {
        type = "success",
        message = "Motor naskočil :)",
    }, 
    ["engine_off"] = {
        type = "success",
        message = "Zhasl jsi motor.",
    }, 
    ["cant_install_nitro"] = {
        type = "error",
        message = "Nemůžeš montovat nitro uvnitř auta.",
    }, 
    ["no_veh_nearby"] = {
        type = "error",
        message = "Žádné vozidlo poblíž.",
    }, 
    ["cash_display"] = {
        type = "success",
        message = "Máš $%s v kapse.",
    }, 
    ["bank_display"] = {
        type = "success",
        message = "Máš $%s v bance.",
    }, 
}

Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end 