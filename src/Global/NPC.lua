Group = CreateGroup()
NPC = {}
NPC.BaseUnit = FourCC('hfoo')
Group = CreateGroup()
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

        end
    end

    ---@return boolexpr
    function RegisterUnitInRangeFilter()
        local boolean = {
            [1] = GetOwningPlayer(GetTriggerUnit()) ~= Player(0),
            [2] = NPC[GetTriggerUnit()].State == "Walk",
            [3] = NPC[GetTriggerUnit()].State == "Iddle"
        }
        return boolean[1] and boolean[2] and boolean[3]
    end

    ---@param unit unit
    function RegisterUnitInRange(unit)
        local trigger = CreateTrigger()
        TriggerRegisterUnitInRange(trigger, unit, BlzGetUnitRealField(unit,UNIT_RF_SIGHT_RADIUS), RegisterUnitInRangeFilter())
        TriggerAddAction(trigger, RegisterUnitInRangeActions())
    end
end