NPC = {
    State = {
        Pathfind = false,
        Walk = false,
        Busy = false,
        Idle = false,
        Attack = false,
        Sleep = false,
        Dead = false
    },
    Fraction = {
        Aggressive = false,
        Negative = false,
        Neutral = false,
        Positive = false,
        Friendly = false
    },
    Character = {
        Sex = {
            Male = false,
            Female = true
        }
        Age = {},
        Class = {
            Assassin = {
                Id = FourCC(''),
                Boolean = true,
            }false,
            Bandit = false,
            Bard = false,
            Barmen = false,
            Blacksmith = false,
            Butcher = false,
            Cook = false,
            Captain = false,
            Courtesan = false,
            Doctor = false,
            Farmer = false,
            Fisherman = false,
            Gravedigger = false,
            Governor = false,
            Innkeeper = false,
            Jailer = false,
            Knight = false,
            Logger = false,
            Mercenary = false,
            Merchant = false,
            Monk = false,
            Rifleman = false,
            Traveller = false,
            Villager = false
        }
    }
}

---@param x real
---@param y real
---@param fraction integer
---@param sex integer
---@param age integer
---@param class integer
---
function CreateNPC(x, y, fraction, sex, age, class)
    local unit = CreateUnit(GetPlayerId(),FourCC(''),x,y,0)
    local data = NPC[UnitId(unit)]
    data.Character.Sex.sex = true
    data.Character.Age.age
end

CreateNPC(0, 0, 1, 1,1, 1)
