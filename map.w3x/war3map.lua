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
    u = BlzCreateUnitWithSkin(p, FourCC("Hjai"), 571.2, -254.5, 61.877, FourCC("Hjai"))
    u = BlzCreateUnitWithSkin(p, FourCC("ndog"), 3601.4, 2262.5, -70.872, FourCC("ndog"))
    u = BlzCreateUnitWithSkin(p, FourCC("ndog"), 4847.1, 1850.5, 217.065, FourCC("ndog"))
    u = BlzCreateUnitWithSkin(p, FourCC("ndog"), 4386.4, 3503.9, -86.426, FourCC("ndog"))
end

function CreateNeutralPassive()
    local p = Player(PLAYER_NEUTRAL_PASSIVE)
    local u
    local unitID
    local t
    local life
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 5047.2, 1324.0, -59.982, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 5159.5, 1232.8, 8.332, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 5159.6, 3103.5, 9.965, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 5283.9, 1348.7, 21.041, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("npig"), 5267.4, 1218.8, 244.398, FourCC("npig"))
    u = BlzCreateUnitWithSkin(p, FourCC("necr"), 5102.1, 3296.7, 257.253, FourCC("necr"))
    u = BlzCreateUnitWithSkin(p, FourCC("necr"), 5087.1, 2950.7, 6.604, FourCC("necr"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 4958.1, 3381.4, 269.687, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 5115.6, 3038.3, 100.445, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 5032.8, 3310.5, 26.643, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 4437.4, 3878.8, 114.020, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("necr"), 4718.0, 3719.0, 248.387, FourCC("necr"))
    u = BlzCreateUnitWithSkin(p, FourCC("necr"), 4635.2, 3935.1, 164.361, FourCC("necr"))
    u = BlzCreateUnitWithSkin(p, FourCC("npig"), 3864.7, 3625.8, 230.526, FourCC("npig"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 4098.3, 3759.8, 336.653, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 3936.7, 3489.6, 176.399, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("npig"), 4129.4, 3664.3, 257.534, FourCC("npig"))
    u = BlzCreateUnitWithSkin(p, FourCC("npig"), 3981.1, 3632.4, -53.915, FourCC("npig"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 4663.8, 3758.5, 39.658, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 4658.8, 3633.8, 115.833, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("npig"), -750.4, 3068.2, 354.957, FourCC("npig"))
    u = BlzCreateUnitWithSkin(p, FourCC("npig"), 352.0, 3867.0, -65.430, FourCC("npig"))
    u = BlzCreateUnitWithSkin(p, FourCC("necr"), -392.3, 3444.2, 127.995, FourCC("necr"))
    u = BlzCreateUnitWithSkin(p, FourCC("necr"), 743.2, 3630.9, 188.781, FourCC("necr"))
    u = BlzCreateUnitWithSkin(p, FourCC("nder"), 1355.3, 1562.3, -83.981, FourCC("nder"))
    u = BlzCreateUnitWithSkin(p, FourCC("nder"), 1930.3, 410.7, 57.328, FourCC("nder"))
    u = BlzCreateUnitWithSkin(p, FourCC("ndog"), -599.5, 3203.7, -55.739, FourCC("ndog"))
    u = BlzCreateUnitWithSkin(p, FourCC("nrac"), 2322.0, -160.4, 148.353, FourCC("nrac"))
    u = BlzCreateUnitWithSkin(p, FourCC("nder"), 3563.2, -141.5, 86.428, FourCC("nder"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 678.7, 444.3, 325.996, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 1269.5, 264.4, 305.693, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), 980.1, 12.8, 170.788, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 611.9, -5.0, -20.955, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("nech"), -78.8, -762.2, 30.047, FourCC("nech"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 746.9, 421.3, 23.025, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("nshe"), 1266.7, 97.7, 144.910, FourCC("nshe"))
    u = BlzCreateUnitWithSkin(p, FourCC("ndog"), 4185.0, 679.1, -79.568, FourCC("ndog"))
end

function CreatePlayerBuildings()
end

function CreatePlayerUnits()
    CreateUnitsForPlayer0()
end

function CreateAllUnits()
    CreatePlayerBuildings()
    CreateNeutralPassive()
    CreatePlayerUnits()
end

function CreateCameras()
    gg_cam_Camera_001 = CreateCameraSetup()
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROTATION, 62.9, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ANGLE_OF_ATTACK, 328.1, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_TARGET_DISTANCE, 1815.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROLL, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_NEARZ, 16.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0)
    CameraSetupSetDestPosition(gg_cam_Camera_001, 41.8, 3344.3, 0.0)
end

--CUSTOM_CODE
Group = CreateGroup()
NPC = {}
NPC.BaseUnit = FourCC('hfoo')
Group = CreateGroup()
RegisterInRange = {
    Trigger = CreateTrigger()
}

do
    ---@param id integer
    function CharacterSet(id)
        NPC[id] = {
            State = {
                Previous = "previous",
                Current = "current",
                Next = "next"
            },
            Attitude = "",--{ Aggressive = false, Negative = false, Neutral = false, Positive = false, Friendly = false, },
            Faction = "",
            Sex = "",
            Age = "",
            Class = "",
            Default = {
                Attitude = "Neutral",
                State = "Idle",
                Sex = "Male",
                Age = "Adult"
            },
            Classes = {
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
        local faction = NPC[id].Classes[class].Default.Faction
        local attitude = NPC[id].Classes[class].Default.Attitude
        data.Sex = sex
        data.Age = age
        data.Faction = faction
        data.Attitude = attitude
        data.Class = class
        data.State.Current = "Idle"
        BlzSetUnitSkin(unit, data.Classes[class].Skin[sex][age])
        BlzSetUnitName(unit, data.Classes[class].Name[sex][age])
        BlzSetUnitMaxHP(unit, data.Classes[class].HP[sex][age])
        SetUnitState(unit, UNIT_STATE_LIFE, GetUnitState(unit, UNIT_STATE_MAX_LIFE))
        BlzSetUnitMaxMana(unit, data.Classes[class].MP[sex][age])
        SetUnitState(unit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MAX_MANA))
        BlzSetUnitAttackCooldown(unit, data.Classes[class].AttackRate[sex][age], 0)
        BlzSetUnitArmor(unit, data.Classes[class].Defence[sex][age])
        BlzSetUnitBaseDamage(unit, data.Classes[class].Damage[sex][age],0)
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
            [23] = "Villager"
        }
        CreateNPC(Player(0), 0, 0, sex[GetRandomInt(1,2)], age[GetRandomInt(1,3)], class[GetRandomInt(1,23)], "Jack")
    end


    ---@return boolexpr
    function AllyFilter()
        return NPC[GetFilterUnit()].Faction == "Guard" or GetOwningPlayer(GetFilterUnit()) == Player(0) or NPC[GetFilterUnit()].Attitude == "Friendly"
    end

    ---@return boolexpr
    function EnemyFilter()
        return NPC[GetTriggerUnit()].Faction == NPC[GetFilterUnit()].Faction and NPC[GetFilterUnit()].Attitude == "Aggression"
    end

    function RegisterUnitInRangeActions()
        local unit = GetTriggerUnit()
        local x = GetUnitX(unit)
        local y = GetUnitY(unit)
        local group = {
            enemy = CreateGroup(),
            ally = CreateGroup()
        }
        local firstofgroup
        local unitstats = {
            life = {enemy = 0, ally = 0},
            damage = {enemy = 0, ally = 0},
            attackrate = {enemy = 0, ally = 0},
            armor = {enemy = 0, ally = 0}
        }
        local power = {enemy = 0, ally = 0 , result = 0}

        if NPC[unit].Attitude == "Aggressive" then
            GroupEnumUnitsInRange(group.enemy, x, y, BlzGetUnitRealField(unit,UNIT_RF_SIGHT_RADIUS), EnemyFilter())
            for i = 1, CountUnitsInGroup(group.enemy) do
                firstofgroup = FirstOfGroup(group.enemy)
                unitstats.life.enemy = unitstats.life.enemy + GetUnitState(firstofgroup, UNIT_STATE_LIFE)
                unitstats.damage.enemy  = unitstats.damage.enemy  + BlzGetUnitBaseDamage(firstofgroup)
                unitstats.attackrate.enemy  = unitstats.attackrate.enemy  + BlzGetUnitAttackCooldown(firstofgroup,0)
                unitstats.armor.enemy  = unitstats.armor.enemy  + BlzGetUnitArmor(firstofgroup)
                GroupRemoveUnit(group.enemy,firstofgroup)
                GroupAddUnit(Group.Enemy,firstofgroup)
            end
            GroupEnumUnitsInRangeCounted(group.ally, x, y, BlzGetUnitRealField(unit,UNIT_RF_SIGHT_RADIUS), AllyFilter(), 1)
            firstofgroup = FirstOfGroup(group.ally)
            GroupClear(group.ally)
            x = GetUnitX(firstofgroup)
            y = GetUnitY(firstofgroup)
            GroupEnumUnitsInRange(group.ally, x, y, BlzGetUnitRealField(unit,UNIT_RF_SIGHT_RADIUS), AllyFilter())
            for i = 1, CountUnitsInGroup(group.ally) do
                firstofgroup = FirstOfGroup(group.ally)
                unitstats.life.ally = unitstats.life.ally + GetUnitState(firstofgroup, UNIT_STATE_LIFE)
                unitstats.damage.ally  = unitstats.damage.ally  + BlzGetUnitBaseDamage(firstofgroup)
                unitstats.attackrate.ally  = unitstats.attackrate.ally  + BlzGetUnitAttackCooldown(firstofgroup,0)
                unitstats.armor.ally  = unitstats.armor.ally  + BlzGetUnitArmor(firstofgroup)
                GroupRemoveUnit(group.ally,firstofgroup)
                GroupAddUnit(Group.Ally,firstofgroup)
            end
            power.enemy = unitstats.life.ally / (unitstats.damage.enemy / unitstats.attackrate.enemy) * ( 1 - unitstats.armor.ally/100)
            power.ally = unitstats.life.enemy / (unitstats.damage.ally / unitstats.attackrate.ally) * ( 1 - unitstats.armor.enemy/100)
            power.result = (power.enemy) / (power.ally)
            if power.result >= 0.5 then
                for i = 1, CountUnitsInGroup(Group) do
                    firstofgroup = FirstOfGroup(Group)
                    GroupRemoveUnit(Group, firstofgroup)
                    if NPC[GetFilterUnit()].Attitude == "Aggression" then
                        SetUnitAcquireRange(firstofgroup, GetUnitRealField(unit, UNIT_RF_SIGHT_RADIUS))
                        NPC[GetHandleId(firstofgroup)].State = "Attack"
                        SetUnitOwner(firstofgroup,Player(23))
                    elseif GetOwningPlayer(firstofgroup) ~= Player(0) then
                        SetUnitAcquireRange(firstofgroup, GetUnitRealField(unit, UNIT_RF_SIGHT_RADIUS))
                        NPC[GetHandleId(firstofgroup)].State = "Guard"
                    end
                end
            end
            GroupClear(Group)
        end
    end

    ---@return boolexpr
    function RegisterUnitInRangeFilter()
        local boolean = {
            [1] = GetOwningPlayer(GetTriggerUnit()) ~= Player(0),
            [2] = NPC[GetTriggerUnit()].State == "Walk",
            [3] = NPC[GetTriggerUnit()].State == "Idle"
        }
        return boolean[1] and boolean[2] and boolean[3]
    end

    ---@param unit unit
    function RegisterUnitInRange(unit)
        TriggerRegisterUnitInRange(RegisterInRange.Trigger, unit, BlzGetUnitRealField(unit,UNIT_RF_ACQUISITION_RANGE), RegisterUnitInRangeFilter())
        if RegisterInRange.Action == nil then
            RegisterInRange.Action = TriggerAddAction(RegisterInRange.Trigger, RegisterUnitInRangeActions())
        end
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
    ForcePlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(0), true)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(1), 1)
    ForcePlayerStartLocation(Player(1), 1)
    SetPlayerColor(Player(1), ConvertPlayerColor(1))
    SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(1), true)
    SetPlayerController(Player(1), MAP_CONTROL_COMPUTER)
    SetPlayerStartLocation(Player(2), 2)
    ForcePlayerStartLocation(Player(2), 2)
    SetPlayerColor(Player(2), ConvertPlayerColor(2))
    SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(2), true)
    SetPlayerController(Player(2), MAP_CONTROL_COMPUTER)
    SetPlayerStartLocation(Player(3), 3)
    ForcePlayerStartLocation(Player(3), 3)
    SetPlayerColor(Player(3), ConvertPlayerColor(3))
    SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(3), true)
    SetPlayerController(Player(3), MAP_CONTROL_COMPUTER)
    SetPlayerStartLocation(Player(4), 4)
    ForcePlayerStartLocation(Player(4), 4)
    SetPlayerColor(Player(4), ConvertPlayerColor(4))
    SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(4), true)
    SetPlayerController(Player(4), MAP_CONTROL_COMPUTER)
    SetPlayerStartLocation(Player(5), 5)
    ForcePlayerStartLocation(Player(5), 5)
    SetPlayerColor(Player(5), ConvertPlayerColor(5))
    SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(5), true)
    SetPlayerController(Player(5), MAP_CONTROL_COMPUTER)
    SetPlayerStartLocation(Player(23), 6)
    ForcePlayerStartLocation(Player(23), 6)
    SetPlayerColor(Player(23), ConvertPlayerColor(23))
    SetPlayerRacePreference(Player(23), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(23), true)
    SetPlayerController(Player(23), MAP_CONTROL_COMPUTER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerTeam(Player(1), 0)
    SetPlayerTeam(Player(3), 0)
    SetPlayerTeam(Player(2), 1)
    SetPlayerTeam(Player(4), 1)
    SetPlayerTeam(Player(5), 1)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    SetPlayerTeam(Player(23), 2)
end

function InitAllyPriorities()
    SetEnemyStartLocPrioCount(1, 1)
    SetEnemyStartLocPrio(1, 0, 5, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(2, 5)
    SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(2, 2, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(2, 3, 5, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrioCount(2, 3)
    SetEnemyStartLocPrio(2, 0, 3, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrio(2, 1, 4, MAP_LOC_PRIO_HIGH)
    SetEnemyStartLocPrio(2, 2, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(3, 4)
    SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 1, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 2, 5, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrioCount(3, 3)
    SetEnemyStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    SetEnemyStartLocPrio(3, 1, 4, MAP_LOC_PRIO_HIGH)
    SetEnemyStartLocPrio(3, 2, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(4, 5)
    SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 3, 5, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrioCount(4, 3)
    SetEnemyStartLocPrio(4, 0, 2, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrio(4, 1, 3, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrioCount(5, 1)
    SetEnemyStartLocPrio(5, 0, 4, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrioCount(6, 2)
    SetEnemyStartLocPrio(6, 0, 1, MAP_LOC_PRIO_LOW)
    SetEnemyStartLocPrio(6, 1, 5, MAP_LOC_PRIO_LOW)
end

function main()
    SetCameraBounds(-1280.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -2560.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 9472.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 8192.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -1280.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 8192.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 9472.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -2560.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("VillageDay")
    SetAmbientNightSound("VillageNight")
    SetMapMusic("Music", true, 0)
    CreateCameras()
    CreateAllUnits()
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_003")
    SetMapDescription("TRIGSTR_005")
    SetPlayers(7)
    SetTeams(7)
    SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    DefineStartLocation(0, 128.0, -576.0)
    DefineStartLocation(1, 128.0, -576.0)
    DefineStartLocation(2, 128.0, -576.0)
    DefineStartLocation(3, 128.0, -576.0)
    DefineStartLocation(4, 128.0, -576.0)
    DefineStartLocation(5, 128.0, -576.0)
    DefineStartLocation(6, 128.0, -576.0)
    InitCustomPlayerSlots()
    InitCustomTeams()
    InitAllyPriorities()
end

