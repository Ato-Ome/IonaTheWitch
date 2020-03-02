gg_cam_Camera_001 = nil
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
    u = BlzCreateUnitWithSkin(p, FourCC("Hjai"), 25.3, -36.3, 247.450, FourCC("Hjai"))
    SetHeroLevel(u, 10, false)
    SetUnitState(u, UNIT_STATE_MANA, 705)
    SelectHeroSkill(u, FourCC("AHbz"))
    SelectHeroSkill(u, FourCC("AHbz"))
    SelectHeroSkill(u, FourCC("AHbz"))
    SelectHeroSkill(u, FourCC("AHwe"))
    SelectHeroSkill(u, FourCC("AHwe"))
    SelectHeroSkill(u, FourCC("AHwe"))
    SelectHeroSkill(u, FourCC("AHab"))
    SelectHeroSkill(u, FourCC("AHab"))
    SelectHeroSkill(u, FourCC("AHab"))
    SelectHeroSkill(u, FourCC("AHmt"))
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

function CreateCameras()
    gg_cam_Camera_001 = CreateCameraSetup()
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_TARGET_DISTANCE, 2415.8, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROLL, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_NEARZ, 16.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0)
    CameraSetupSetDestPosition(gg_cam_Camera_001, -436.0, -130.5, 0.0)
end

--CUSTOM_CODE

NPC = {}
NPC.BaseUnit = FourCC('hfoo')
do
    ---@param id integer
    function CharacterSet(id)
        NPC[id] = {
            State = { PathFind = false; Walk = false; Busy = false; Idle = false; Attack = false; Sleep = false; Death = false; },
            Faction = { Aggressive = false; Negative = false; Neutral = false; Positive = false; Friendly = false },
            Sex = { Male = false; Female = false },
            Age = { Child = false; Adult = false; Old = false },
            Class = {
                Assassin = {
                    Status = false;
                    Skin = {
                        Male = { Child = FourCC('nban'); Adult = FourCC('nbrg'); Old = FourCC('nrog') },
                        Female = { Child = FourCC('nass'); Adult = FourCC('nenf'); Old = FourCC('nbld')}
                    },
                    Name = {
                        Male = { Child = "Маленький убийца"; Adult = "Взрослый убийца"; Old = "Пожилой убийца" },
                        Female = { Child = "Маленькая убийца"; Adult = "Взрослая убийца"; Old = "Пожилая убийца" }
                    },
                    Damage = {
                        Male = {Child = 12; Adult = 35; Old = 21};
                        Female = {Child = 9; Adult = 28; Old = 17}
                    },
                    AttackRate = {
                        Male = {Child = 1.2; Adult = 1; Old = 1.5};
                        Female = {Child = 1.3; Adult = 1.1; Old = 1.6}
                    },
                    Defence = {
                        Male = {Child = 2; Adult = 7; Old = 5};
                        Female = {Child = 1; Adult = 5; Old = 3}
                    },
                    Range = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    MoveSpeed = {
                        Male = {Child = 265; Adult = 320; Old = 290};
                        Female = {Child = 250; Adult = 300; Old = 275}
                    },
                    HP = {
                        Male = {Child = 250; Adult = 450; Old = 430};
                        Female = {Child = 230; Adult = 425; Old = 400}
                    },
                    HPRegen = {
                        Male = {Child = 1.2; Adult = 1; Old = 0.8};
                        Female = {Child = 1.2; Adult = 1; Old = 0.8}
                    },
                    MP = {
                        Male = {Child = 120; Adult = 240; Old = 280};
                        Female = {Child = 150; Adult = 270; Old = 300}
                    },
                    MPRegen = {
                        Male = {Child = 0.2; Adult = 0.2; Old = 0.2};
                        Female = {Child = 0.2; Adult = 0.2; Old = 0.2}
                    },
                    DefenceType = {
                        Male = { Child = 0; Adult = 0; Old = 0 };
                        Female = { Child = 0; Adult = 0; Old = 0 }
                    },
                    AbilityCount = {
                        Child = 1; Adult = 2; Old = 3
                    }
                }
            }
        }

        -- ["Bard"] = false;
        --  ["Barmen"] = false;
        --  ["Blacksmith"] = false;
        --  ["Butcher"] = false;
        --   ["Cook"] = false;
        --  ["Captain"] = false;
        --   ["Courtesan"] = false;
        --  ["Doctor"] = false;
        --   ["Farmer"] = false;
        --  ["Fisherman"] = false;
        --  ["Gravedigger"] = false;
        --  ["Governor"] = false;
        --  ["Innkeeper"] = false;
        --  ["Jailer"] = false;
        --  ["Knight"] = false;
        -- ["Logger"] = false;
        --  ["Mercenary"] = false;
        --  ["Merchant"] = false;
        --  ["Monk"] = false;
        --  ["Rifleman"] = false;
        --  ["Traveller"] = false;
        -- ["Villager"] = false
    end

    ---@param player player
    ---@param x real
    ---@param y real
    ---@param sex string
    ---@param age string
    ---@param class string
    ---@param faction string
    ---@param name string
    function CreateNPC(player, x, y, sex, age, class, faction, name)
        local unit = CreateUnit(player, NPC.BaseUnit, x, y, 0)
        local id = GetHandleId(unit)
        CharacterSet(id)
        local data = NPC[id]
        data.Sex[sex] = true
        data.Age[age] = true
        data.Faction[faction] = true
        data.Name = name
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
        CreateNPC(Player(0), 0, 0, sex[GetRandomInt(1,2)], age[GetRandomInt(1,3)], "Assassin", "Neutral", "Jack")
    end
end
do
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
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 4500 }
                },
                Day = {
                    EffectId = FourCC('LRaa'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 0;}, Start = 1500; End = 5000 }
                },
                Evening = {
                    EffectId = FourCC('LRaa'),
                    Fog = { Color = {Red = 0.85; Green = 0.35; Blue = 0.2;}, Start = 1000; End = 4000 }
                },
                Night = {
                    EffectId = FourCC('LRma'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 500; End = 3000 }
                }
            },
            Rainy = {
                Morning = {
                    EffectId = FourCC('RLlr'),
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 500; End = 3500 }
                },
                Day = {
                    EffectId = FourCC('RLhr'),
                    Fog = { Color = {Red = 0.7; Green = 0.7; Blue = 0.7;}, Start = 1000; End = 4000 }
                },
                Evening = {
                    EffectId = FourCC('RLlr'),
                    Fog = { Color = {Red = 0.6; Green = 0.35; Blue = 0.2;}, Start = 500; End = 3000 }
                },
                Night = {
                    EffectId = FourCC('RLhr'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 0; End = 2000 }
                }
            },
            Snowy = {
                Morning = {
                    EffectId = FourCC('SNls'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 4000 }
                },
                Day = {
                    EffectId = FourCC('SNhs'),
                    Fog = { Color = {Red = 0.8; Green = 0.8; Blue = 0.8;}, Start = 500; End = 3500 }
                },
                Evening = {
                    EffectId = FourCC('SNhs'),
                    Fog = { Color = {Red = 0.8; Green = 0.5; Blue = 0.4;}, Start = 500; End = 3000 }
                },
                Night = {
                    EffectId = FourCC('SNls'),
                    Fog = { Color = {Red = 0.4; Green = 0.2; Blue = 0.4;}, Start = 0; End = 2000 }
                }
            },
            Windy = {
                Morning = {
                    EffectId = FourCC('WOlw'),
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 500; End = 3500 }
                },
                Day = {
                    EffectId = FourCC('WOhw'),
                    Fog = { Color = {Red = 0.7; Green = 0.7; Blue = 0.7;}, Start = 1000; End = 4000 }
                },
                Evening = {
                    EffectId = FourCC('WOhw'),
                    Fog = { Color = {Red = 0.6; Green = 0.35; Blue = 0.2;}, Start = 500; End = 3000 }
                },
                Night = {
                    EffectId = FourCC('WOlw'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 0; End = 2000 }
                }
            },
            Cloudy = {
                Morning = {
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 3000 }
                },
                Day = {
                    Fog = { Color = {Red = 1; Green = 1; Blue = 0.5;}, Start = 1500; End = 4500 }
                },
                Evening = {
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 1000; End = 3500 }
                },
                Night = {
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 500; End = 4000 }
                }
            },
            Foggy = {
                Morning = {
                    EffectId = FourCC('FDwh'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 0; End = 2000 }
                },
                Day = {
                    EffectId = FourCC('FDwl'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 0; End = 2500 }
                },
                Evening = {
                    EffectId = FourCC('FDwl'),
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 1000; End = 3500 }
                },
                Night = {
                    EffectId = FourCC('FDbl'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 500; End = 4000 }
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
        SetTimeOfDay(6)
        Weather.Current.Effect = AddWeatherEffect(GetPlayableMapRect(), 'LRaa')
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
    SetCameraBounds(-3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("LordaeronSummerDay")
    SetAmbientNightSound("LordaeronSummerNight")
    SetMapMusic("Music", true, 0)
    CreateCameras()
    CreateAllUnits()
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_001")
    SetMapDescription("TRIGSTR_003")
    SetPlayers(1)
    SetTeams(1)
    SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    DefineStartLocation(0, -1024.0, -128.0)
    InitCustomPlayerSlots()
    SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    InitGenericPlayerSlots()
end

