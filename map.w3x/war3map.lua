gg_trg_Periodic = nil
gg_trg_Melee_Initialization = nil
gg_trg_TimeOfDay = nil
function InitGlobals()
end

function CreateUnitsForPlayer0()
    local p = Player(0)
    local u
    local unitID
    local t
    local life
    u = BlzCreateUnitWithSkin(p, FourCC("Hjai"), 571.2, -254.5, 61.877, FourCC("Hjai"))
end

function CreatePlayerBuildings()
end

function CreatePlayerUnits()
    CreateUnitsForPlayer0()
end

function CreateAllUnits()
    CreatePlayerBuildings()
    CreatePlayerUnits()
end

--CUSTOM_CODE

Group = CreateGroup()
NPC = {}
NPC.BaseUnit = FourCC('hfoo')
State = { Trigger = { Create = CreateTrigger() } }
Group = {
    Ally = CreateGroup(),
    Enemy = CreateGroup()
}
do
    ---@param id integer
    function CharacterSet(id)
        NPC[id] = {
            State = {
                Previous = "previous",
                Current = "current",
                Next = "next",
                PathFind = false,
                Walk = false,
                Dialogue = false,
                Escape = false,
                Busy = false,
                Work = false,
                Idle = false,
                Attack = false,
                Sleep = false,
                Death = false,
            },
            Attitude = { Aggressive = false, Negative = false, Neutral = false, Positive = false, Friendly = false, },
            Faction = { Bandit = false, Inquisition = false, Army = false, Player = false, Villagers = false, },
            Sex = { Male = false, Female = false },
            Age = { Child = false, Adult = false, Old = false },
            Class = {
                Assassin = {
                    Default = {
                       Faction =  "Bandit",
                       Attitude = "Aggressive"
                    },
                    Status = false,
                    Skin = {
                        Male = { Child = FourCC('nban'), Adult = FourCC('nbrg'), Old = FourCC('nrog') },
                        Female = { Child = FourCC('nass'), Adult = FourCC('nenf'), Old = FourCC('nbld')}
                    },
                    Name = {
                        Male = { Child = "Маленький убийца", Adult = "Взрослый убийца", Old = "Пожилой убийца" },
                        Female = { Child = "Маленькая убийца", Adult = "Взрослая убийца", Old = "Пожилая убийца" }
                    },
                    Damage = {
                        Male = {Child = 12, Adult = 35, Old = 21},
                        Female = {Child = 9, Adult = 28, Old = 17}
                    },
                    AttackRate = {
                        Male = {Child = 1.2, Adult = 1, Old = 1.5},
                        Female = {Child = 1.3, Adult = 1.1, Old = 1.6}
                    },
                    Defence = {
                        Male = {Child = 2, Adult = 7, Old = 5},
                        Female = {Child = 1, Adult = 5, Old = 3}
                    },
                    Range = {
                        Male = {Child = 0, Adult = 0, Old = 0},
                        Female = {Child = 0, Adult = 0, Old = 0}
                    },
                    MoveSpeed = {
                        Male = {Child = 265, Adult = 320, Old = 290},
                        Female = {Child = 250, Adult = 300, Old = 275}
                    },
                    HP = {
                        Male = {Child = 250, Adult = 450, Old = 430},
                        Female = {Child = 230, Adult = 425, Old = 400}
                    },
                    HPRegen = {
                        Male = {Child = 1.2, Adult = 1, Old = 0.8},
                        Female = {Child = 1.2, Adult = 1, Old = 0.8}
                    },
                    MP = {
                        Male = {Child = 120, Adult = 240, Old = 280},
                        Female = {Child = 150, Adult = 270, Old = 300}
                    },
                    MPRegen = {
                        Male = {Child = 0.2, Adult = 0.2, Old = 0.2},
                        Female = {Child = 0.2, Adult = 0.2, Old = 0.2}
                    },
                    DefenceType = {
                        Male = { Child = 0, Adult = 0, Old = 0 },
                        Female = { Child = 0, Adult = 0, Old = 0 }
                    },
                    AbilityCount = {
                        Child = 1, Adult = 2, Old = 3
                    }
                }
            },
            Current = {
                Attitude = "Neutral",
                State = "Idle",
                Faction = "",
                Sex = "",
                Age = "",
                Class = ""
            }
        }
    end

    ---@param player player
    ---@param x real
    ---@param y real
    ---@param sex string
    ---@param age string
    ---@param class string
    ---@param name string
    function CreateNPC(player, x, y, sex, age, class, name)
        local unit = CreateUnit(player, NPC.BaseUnit, x, y, 0)
        local id = GetHandleId(unit)
        CharacterSet(id)
        local data = NPC[id]
        local faction = NPC[id].Class[class].Default.Faction
        local attitude = NPC[id].Class[class].Default.Attitude
        data.Sex[sex] = true
        data.Age[age] = true
        data.Faction[faction] = true
        data.Attitude[attitude] = true
        data.Class[class].Status = true
        BlzSetUnitSkin(unit, data.Class[class].Skin[sex][age])
        BlzSetUnitName(unit, data.Class[class].Name[sex][age])
        BlzSetUnitMaxHP(unit, data.Class[class].HP[sex][age])
        SetUnitState(unit, UNIT_STATE_LIFE, GetUnitState(unit, UNIT_STATE_MAX_LIFE))
        BlzSetUnitMaxMana(unit, data.Class[class].MP[sex][age])
        SetUnitState(unit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MAX_MANA))
        BlzSetUnitAttackCooldown(unit, data.Class[class].AttackRate[sex][age], 0)
        BlzSetUnitArmor(unit, data.Class[class].Defence[sex][age])
        BlzSetUnitBaseDamage(unit, data.Class[class].Damage[sex][age],0)
    end

    function RandomNPC()
        local sex = {
            [1] = "Male",
            [2] = "Female"
        }
        local age = {
            [1] = "Child",
            [2] = "Adult",
            [3] = "Old"
        }
        local class = {
            [1] = "Assasin",
            [2] = "Bard",
            [3] = "Barmen",
            [4] = "Blacksmith",
            [5] = "Butcher",
            [6] = "Cook",
            [7] = "Captain",
            [8] = "Courtesan",
            [9] = "Doctor",
            [10] = "Farmer",
            [11] = "Fisherman",
            [12] = "Gravedigger",
            [13] = "Governor",
            [14] = "Innkeeper",
            [15] = "Jailer",
            [16] = "Knight",
            [17] = "Logger",
            [18] = "Mercenary",
            [19] = "Merchant",
            [20] = "Monk",
            [21] = "Rifleman",
            [22] = "Traveller",
            [23] = "Villager",
        }
        CreateNPC(Player(0), 0, 0, sex[GetRandomInt(1,2)], age[GetRandomInt(1,3)], class[GetRandomInt(1,23)], "Jack")
    end

    ---@param faction string
    ---@return boolexpr
    function NPCStateAttackEnumAllyFilter(faction)
        return NPC[GetHandleId(GetEnumUnit())].Faction[faction]  and not NPC[GetHandleId(GetEnumUnit())].Attitude.Aggressive
    end

    ---@param faction string
    ---@return boolexpr
    function NPCStateAttackEnumEnemyFilter(faction)
        return NPC[GetHandleId(GetEnumUnit())].Faction[faction] and NPC[GetHandleId(GetEnumUnit())].Attitude.Aggressive
    end

    ---@param unit unit
    function NPCStateActions(unit)
        local group = {enemy = CreateGroup(), ally = CreateGroup()}
        local faction = NPC[unit].Current.Faction
        local stateunit = GetTriggerUnit()
        local firstofgroup
        local unit = { life = {enemy = 0, ally = 0}, damage = {enemy = 0, ally = 0}, attackrate = {enemy = 0, ally = 0}, armor = {enemy = 0, ally = 0} }
        local power = {enemy = 0, ally = 0 , result = 0}
        local x = GetUnitX(stateunit)
        local y = GetUnitX(stateunit)
        local x1 = GetUnitX(unit)
        local y1 = GetUnitX(unit)
        if NPC[stateunit].Current.Attitude.Aggressive then
            GroupEnumUnitsInRange(group.enemy, x, y, GetUnitRealField(stateunit,UNIT_RF_SIGHT_RADIUS), NPCStateAttackEnumEnemyFilter(faction))
            for i = 1, CountUnitsInGroup(group.enemy) do
                firstofgroup = FirstOfGroup(group.enemy)
                unit.life.enemy = unit.life.enemy + GetUnitState(firstofgroup, UNIT_STATE_MAX_LIFE)
                unit.damage.enemy  = unit.damage.enemy  + BlzGetUnitBaseDamage(firstofgroup)
                unit.attackrate.enemy  = unit.attackrate.enemy  + BlzGetUnitAttackCooldown(firstofgroup,0)
                unit.armor.enemy  = unit.armor.enemy  + BlzGetUnitArmor(firstofgroup)
                GroupRemoveUnit(group.enemy, firstofgroup)
                GroupAddUnit(Group.Enemy, firstofgroup)
            end
            GroupEnumUnitsInRange(group.ally, x1, y1, GetUnitRealField(unit, UNIT_RF_SIGHT_RADIUS), NPCStateAttackEnumAllyFilter(faction))
            for i = 1, CountUnitsInGroup(group.ally) do
                firstofgroup = FirstOfGroup(group.ally)
                unit.life.ally = unit.life.ally + GetUnitState(firstofgroup, UNIT_STATE_MAX_LIFE)
                unit.damage.ally  = unit.damage.ally  + BlzGetUnitBaseDamage(firstofgroup)
                unit.attackrate.ally  = unit.attackrate.ally  + BlzGetUnitAttackCooldown(firstofgroup,0)
                unit.armor.ally  = unit.armor.ally  + BlzGetUnitArmor(firstofgroup)
                GroupRemoveUnit(group.ally, firstofgroup)
            end
            power.enemy = unit.life.ally / (unit.damage.enemy / unit.attackrate.enemy) * ( 1 - unit.armor.ally/100)
            power.ally = unit.life.enemy / (unit.damage.ally / unit.attackrate.ally) * ( 1 - unit.armor.enemy/100)
            power.result = (power.enemy * CountUnitsInGroup(Group.Ally)) / (power.ally * CountUnitsInGroup(Group.Enemy))
            if power.result >= 0.5 then
                for i = 1, CountUnitsInGroup(Group.Enemy) do
                    firstofgroup = FirstOfGroup(Group.Enemy)
                    GroupRemoveUnit(Group.Enemy, firstofgroup)
                    SetUnitOwner(firstofgroup, Player(23), false)
                    SetUnitAcquireRange(firstofgroup, GetUnitRealField(unit, UNIT_RF_SIGHT_RADIUS))
                    NPC[GetHandleId(firstofgroup)].Current.State = "Attack"
                end
            end
        end
    end

    ---@return boolexpr
    function NPCStateFilter()
        return GetOwningPlayer(GetTriggerUnit()) ~= Player(0)
    end

    ---@param unit unit
    function NPCStateRegister(unit)
        TriggerRegisterUnitInRange(State.Trigger.Create, unit, BlzGetUnitRealField(unit,UNIT_RF_SIGHT_RADIUS), NPCStateFilter())
        TriggerAddAction(State.Trigger.Create, NPCStateActions(unit))
    end
end
Weather = {
    Type = {
        [1] = "Sunny",
        [2] = "Rainy",
        [3] = "Snowy",
        [4] = "Windy",
        [5] = "Cloudy",
        [6] = "Foggy",
        Sunny = {
            Morning = {
                Fog = { Color = {Red = 1, Green = 1, Blue = 1,}, Start = 1000, End = 4500 }
            },
            Day = {
                EffectId = FourCC('LRaa'),
                Fog = { Color = {Red = 1, Green = 1, Blue = 0,}, Start = 1500, End = 5000 }
            },
            Evening = {
                EffectId = FourCC('LRaa'),
                Fog = { Color = {Red = 0.85, Green = 0.35, Blue = 0.2,}, Start = 1000, End = 4000 }
            },
            Night = {
                EffectId = FourCC('LRma'),
                Fog = { Color = {Red = 0.3, Green = 0, Blue = 0.4,}, Start = 500, End = 3000 }
            }
        },
        Rainy = {
            Morning = {
                EffectId = FourCC('RLlr'),
                Fog = { Color = {Red = 0.5, Green = 0.5, Blue = 0.5,}, Start = 500, End = 3500 }
            },
            Day = {
                EffectId = FourCC('RLhr'),
                Fog = { Color = {Red = 0.7, Green = 0.7, Blue = 0.7,}, Start = 1000, End = 4000 }
            },
            Evening = {
                EffectId = FourCC('RLlr'),
                Fog = { Color = {Red = 0.6, Green = 0.35, Blue = 0.2,}, Start = 500, End = 3000 }
            },
            Night = {
                EffectId = FourCC('RLhr'),
                Fog = { Color = {Red = 0.3, Green = 0, Blue = 0.4,}, Start = 0, End = 2000 }
            }
        },
        Snowy = {
            Morning = {
                EffectId = FourCC('SNls'),
                Fog = { Color = {Red = 1, Green = 1, Blue = 1,}, Start = 1000, End = 4000 }
            },
            Day = {
                EffectId = FourCC('SNhs'),
                Fog = { Color = {Red = 0.8, Green = 0.8, Blue = 0.8,}, Start = 500, End = 3500 }
            },
            Evening = {
                EffectId = FourCC('SNhs'),
                Fog = { Color = {Red = 0.8, Green = 0.5, Blue = 0.4,}, Start = 500, End = 3000 }
            },
            Night = {
                EffectId = FourCC('SNls'),
                Fog = { Color = {Red = 0.4, Green = 0.2, Blue = 0.4,}, Start = 0, End = 2000 }
            }
        },
        Windy = {
            Morning = {
                EffectId = FourCC('WOlw'),
                Fog = { Color = {Red = 0.5, Green = 0.5, Blue = 0.5,}, Start = 500, End = 3500 }
            },
            Day = {
                EffectId = FourCC('WOhw'),
                Fog = { Color = {Red = 0.7, Green = 0.7, Blue = 0.7,}, Start = 1000, End = 4000 }
            },
            Evening = {
                EffectId = FourCC('WOhw'),
                Fog = { Color = {Red = 0.6, Green = 0.35, Blue = 0.2,}, Start = 500, End = 3000 }
            },
            Night = {
                EffectId = FourCC('WOlw'),
                Fog = { Color = {Red = 0.3, Green = 0, Blue = 0.4,}, Start = 0, End = 2000 }
            }
        },
        Cloudy = {
            Morning = {
                Fog = { Color = {Red = 1, Green = 1, Blue = 1,}, Start = 1000, End = 3000 }
            },
            Day = {
                Fog = { Color = {Red = 1, Green = 1, Blue = 0.5,}, Start = 1500, End = 4500 }
            },
            Evening = {
                Fog = { Color = {Red = 0.5, Green = 0.5, Blue = 0.5,}, Start = 1000, End = 3500 }
            },
            Night = {
                Fog = { Color = {Red = 0.3, Green = 0, Blue = 0.4,}, Start = 500, End = 4000 }
            }
        },
        Foggy = {
            Morning = {
                EffectId = FourCC('FDwh'),
                Fog = { Color = {Red = 1, Green = 1, Blue = 1,}, Start = 0, End = 2000 }
            },
            Day = {
                EffectId = FourCC('FDwl'),
                Fog = { Color = {Red = 1, Green = 1, Blue = 1,}, Start = 0, End = 2500 }
            },
            Evening = {
                EffectId = FourCC('FDwl'),
                Fog = { Color = {Red = 0.5, Green = 0.5, Blue = 0.5,}, Start = 1000, End = 3500 }
            },
            Night = {
                EffectId = FourCC('FDbl'),
                Fog = { Color = {Red = 0.3, Green = 0, Blue = 0.4,}, Start = 500, End = 4000 }
            }
        }
    },
    DayCycle = {
        [6] = "Morning",
        [30] = "Morning",
        [12] = "Day",
        [18] = "Evening",
        [-6] = "Evening",
        [24] = "Night",
        [0] = "Night"
    },
    Current = {
        Type = "Sunny",
        Time = 6
    }
}

do
    function WeatherSystem()
        local currenttype = Weather.Current.Type
        local currenttime = Weather.Current.Time
        local nexttime = Weather.Current.Time + 6
        local currentdaycycle = Weather.DayCycle[currenttime]
        local nextdaycycle  = Weather.DayCycle[nexttime]
        local progress = (GetTimeOfDay() - currenttime) / (nexttime - currenttime)
        local red =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Red + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Red - Weather.Type[currenttype][currentdaycycle].Fog.Color.Red) * progress
        local green =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Green + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Green - Weather.Type[currenttype][currentdaycycle].Fog.Color.Green) * progress
        local blue =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Blue + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Blue - Weather.Type[currenttype][currentdaycycle].Fog.Color.Blue) * progress
        local fogstart =  Weather.Type[currenttype][currentdaycycle].Fog.Start + (Weather.Type[currenttype][nextdaycycle].Fog.Start - Weather.Type[currenttype][currentdaycycle].Fog.Start) * progress
        local fogend =  Weather.Type[currenttype][currentdaycycle].Fog.End + (Weather.Type[currenttype][nextdaycycle].Fog.End - Weather.Type[currenttype][currentdaycycle].Fog.End) * progress
        SetTerrainFogEx(0, fogstart, fogend,0.5, red, green, blue)
    end

    function WeatherSwitch()
        local currenttype = Weather.Current.Type
        local currenttime = Weather.Current.Time
        local nexttime = Weather.Current.Time - 6
        local currentdaycycle = Weather.DayCycle[currenttime]
        local nextdaycycle  = Weather.DayCycle[nexttime]
        local currenteffectid = Weather.Type[currenttype][currentdaycycle].EffectId
        local nexteffectid = Weather.Type[currenttype][nextdaycycle].EffectId
        if currenteffectid ~= nexteffectid then
            RemoveWeatherEffect(bj_lastCreatedWeatherEffect)
            if currenteffectid ~= nil then
                bj_lastCreatedWeatherEffect = AddWeatherEffect(GetPlayableMapRect(), currenteffectid)
                EnableWeatherEffect(bj_lastCreatedWeatherEffect, true)
            end
        end
    end
end
--CUSTOM_CODE
function Trig_Periodic_Actions()
        WeatherSystem()
end

function InitTrig_Periodic()
    gg_trg_Periodic = CreateTrigger()
    TriggerRegisterTimerEventPeriodic(gg_trg_Periodic, 0.05)
    TriggerAddAction(gg_trg_Periodic, Trig_Periodic_Actions)
end

function Trig_Melee_Initialization_Actions()
    AddWeatherEffectSaveLast(GetPlayableMapRect(), FourCC("LRaa"))
    EnableWeatherEffect(GetLastCreatedWeatherEffect(), true)
    SetTimeOfDay(6.00)
    TriggerSleepAction(1.00)
    EnableTrigger(gg_trg_TimeOfDay)
end

function InitTrig_Melee_Initialization()
    gg_trg_Melee_Initialization = CreateTrigger()
    TriggerAddAction(gg_trg_Melee_Initialization, Trig_Melee_Initialization_Actions)
end

function Trig_TimeOfDay_Actions()
        Weather.Current.Time = GetTimeOfDay()
        WeatherSwitch()
end

function InitTrig_TimeOfDay()
    gg_trg_TimeOfDay = CreateTrigger()
    DisableTrigger(gg_trg_TimeOfDay)
    TriggerRegisterGameStateEventTimeOfDay(gg_trg_TimeOfDay, EQUAL, 0.00)
    TriggerRegisterGameStateEventTimeOfDay(gg_trg_TimeOfDay, EQUAL, 6.00)
    TriggerRegisterGameStateEventTimeOfDay(gg_trg_TimeOfDay, EQUAL, 12.00)
    TriggerRegisterGameStateEventTimeOfDay(gg_trg_TimeOfDay, EQUAL, 18.00)
    TriggerRegisterGameStateEventTimeOfDay(gg_trg_TimeOfDay, EQUAL, 24.00)
    TriggerAddAction(gg_trg_TimeOfDay, Trig_TimeOfDay_Actions)
end

function InitCustomTriggers()
    InitTrig_Periodic()
    InitTrig_Melee_Initialization()
    InitTrig_TimeOfDay()
end

function RunInitializationTriggers()
    ConditionalTriggerExecute(gg_trg_Melee_Initialization)
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(0), true)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
end

function main()
    SetCameraBounds(-1280.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -1536.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -1280.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -1536.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("VillageDay")
    SetAmbientNightSound("VillageNight")
    SetMapMusic("Music", true, 0)
    CreateAllUnits()
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_003")
    SetMapDescription("TRIGSTR_005")
    SetPlayers(1)
    SetTeams(1)
    SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    DefineStartLocation(0, 1024.0, 64.0)
    InitCustomPlayerSlots()
    SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    InitGenericPlayerSlots()
end

