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
            Fraction = { Aggressive = false; Negative = false; Neutral = false; Positive = false; Friendly = false },
            Name = "",
            Sex = { Male = false; Female = false },
            Age = { Child = false; Adult = false; Old = false },
            Class = {
                Assassin = {
                    Status = false;
                    Skin = {
                        Male = { Child = FourCC('nass'); Adult = FourCC('nass'); Old = FourCC('nass') },
                        Female = { Child = FourCC('nass'); Adult = FourCC('nass'); Old = FourCC('nass')}
                    },
                    SunName = {
                        Male = { Child = ""; Adult = ""; Old = "" },
                        Female = { Child = ""; Adult = ""; Old = "" }
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
    ---@param fraction string
    ---@param name string
    function CreateNPC(player, x, y, sex, age, class, fraction, name)
        local unit = CreateUnit(player, NPC.BaseUnit, x, y, 0)
        local id = GetHandleId(unit)
        CharacterSet(id)
        local data = NPC[id]
        data.Sex[sex] = true
        data.Age[age] = true
        data.Fraction[fraction] = true
        data.Name = name
        data.Class[class].Status = true
        BlzSetUnitSkin(unit, data.Class[class].Skin[sex][age])
        BlzSetUnitName(unit, name)
    end
end