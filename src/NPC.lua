do
    function InitGlobals()
        NPC = {}
        NPC.BaseUnit = FourCC('hfoo')
    end

    ---@param id integer
    function CharacterSet(id)
        print("Char Set Func Starter")
        NPC[id] = {
            State = { PathFind = false; Walk = false; Busy = false; Idle = false; Attack = false; Sleep = false; Death = false; },
            Faction = { Aggressive = false; Negative = false; Neutral = false; Positive = false; Friendly = false },
            Sex = { Male = false; Female = false },
            Age = { Child = false; Adult = false; Old = false },
            Class = {
                Assassin = {
                    Status = false;
                    Skin = {
                        Male = { Child = FourCC('nass'); Adult = FourCC('nass'); Old = FourCC('nass') },
                        Female = { Child = FourCC('nass'); Adult = FourCC('nass'); Old = FourCC('nass')}
                    },
                    Name = {
                        Male = { Child = "Маленький убийца"; Adult = "Взрослый убийца"; Old = "Пожилой убийца" },
                        Female = { Child = "Маленькая убийца"; Adult = "Взрослая убийца"; Old = "Пожилая убийца" }
                    },
                    Damage = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    AttackRate = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    Defence = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    Range = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    MoveSpeed = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    HP = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    HPRegen = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    MP = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    MPRegen = {
                        Male = {Child = 0; Adult = 0; Old = 0};
                        Female = {Child = 0; Adult = 0; Old = 0}
                    },
                    AbilityCount = {
                        Child = 1; Adult = 2; Old = 3
                    }
                }
            }
        }
        print("NPC.State Complete")
        -- ["Assassin"] = false;
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
    end
end