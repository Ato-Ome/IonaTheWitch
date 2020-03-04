Group = CreateGroup()
NPC = {}
NPC.BaseUnit = FourCC('hfoo')
State = { Trigger = { Create = CreateTrigger() } }
Group = {
    Ally = CreateGroup();
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
                PathFind = false;
                Walk = false;
                Dialogue = false;
                Escape = false;
                Busy = false;
                Work = false;
                Idle = false;
                Attack = false;
                Sleep = false;
                Death = false;
            },
            Attitude = { Aggressive = false; Negative = false; Neutral = false; Positive = false; Friendly = false; },
            Faction = { Bandit = false; Inquisition = false; Army = false; Player = false, Villagers = false; },
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
            },
            Current = {
                Attitude = "Neutral";
                State = "Idle";
                Faction = "";
                Sex = "";
                Age = "";
                Class = ""
            }
        }

        Classes = {
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
        }
    end

    ---@param player player
    ---@param x real
    ---@param y real
    ---@param sex string
    ---@param age string
    ---@param class string
    ---@param faction string
    ---@param attitude string
    ---@param name string
    function CreateNPC(player, x, y, sex, age, class, faction, attitude, name)
        local unit = CreateUnit(player, NPC.BaseUnit, x, y, 0)
        local id = GetHandleId(unit)
        CharacterSet(id)
        local data = NPC[id]
        data.Sex[sex] = true
        data.Age[age] = true
        data.Faction[faction] = true
        data.Attitude[attitude] = true
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
        CreateNPC(Player(0), 0, 0, sex[GetRandomInt(1,2)], age[GetRandomInt(1,3)], "Assassin", "Bandit", "Neutral", "Jack")
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
        local group = {enemy = CreateGroup(); ally = CreateGroup()}
        local faction = NPC[unit].Current.Faction
        local stateunit = GetTriggerUnit()
        local firstofgroup
        local unit = { life = {enemy = 0; ally = 0}, damage = {enemy = 0; ally = 0}, attackrate = {enemy = 0; ally = 0}, armor = {enemy = 0; ally = 0} }
        local power = {enemy = 0; ally = 0 ; result = 0}
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