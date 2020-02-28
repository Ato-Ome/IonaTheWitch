NPC = {
    state = {
        pathfind = false,
        walk = false,
        busy = false,
        idle = false,
        attack = false,
        sleep = false,
        dead = false
    },
    fraction = {
        aggressive = false,
        negative = false,
        neutral = false,
        positive = false,
        friendly = false
    },
    character = {
        sex = {
            male = false,
        },
        age = {
            child = false,
            adult = false,
            old = false
        },
        class = {
            assassin = false,
            bard = false,
            barmen = false,
            blacksmith = false,
            cook = false,
            captain = false,

        }
    }
}

BlzGetTriggerFrameText(ORIGIN_FRAME_TOOLTIP)