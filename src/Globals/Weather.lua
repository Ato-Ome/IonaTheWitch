Weather = {
    Type = {
        Sunny = {
            Morning = {
                Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 8500 }
            },
            Day = {
                Fog = { Color = {Red = 1; Green = 1; Blue = 0;}, Start = 1500; End = 10000 }
            },
            Evening = {
                Fog = { Color = {Red = 0.85; Green = 0.35; Blue = 0.2;}, Start = 1000; End = 8500 }
            },
            Night = {
                Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 800; End = 7500 }
            }
        },
        Rainy = {
            Morning = {
                Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 800; End = 6500 }
            },
            Day = {
                Fog = { Color = {Red = 0.7; Green = 0.7; Blue = 0.7;}, Start = 900; End = 7500 }
            },
            Evening = {
                Fog = { Color = {Red = 0.6; Green = 0.35; Blue = 0.2;}, Start = 900; End = 7500 }
            },
            Night = {
                Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 700; End = 6500 }
            }
        },
        Snowy ={

        },
        Windy = {

        },
        Cloudy = {

        },
        Foggy = {

        }
    },
    DayCycle = {
        [6] = "Morning";
        [12] = "Day";
        [18] = "Evening";
        [24] = "Night";
        [0] = "Night"
    },
    Current = {
        Type = "Sunny";
        Time = 6;
    }
}

function WeatherSystem()
    local currenttype = Weather.Current.Type
    local currenttime = Weather.Current.Time
    local nexttime = Weather.Current.Time + 6
    local currentdaycycle = Weather.DayCycle[currenttime]
    local nextdaycycle  = Weather.DayCycle[nexttime]
    local progress = ( nexttime - currenttime ) / ( nexttime - GetTimeOfDay() )
    local current = Weather.Type[currenttype][currentdaycycle]
    local next = Weather.Type[currenttype][nextdaycycle].Fog.Color.Red
    local red = ( next.Fog.Color.Red - current.Fog.Color.Red) * progress
    local green = ( next.Fog.Color.Green - current.Fog.Color.Green) * progress
    local blue = ( next.Fog.Color.Blue - current.Fog.Color.Blue) * progress
    local fogstart = ( next.Fog.Start - current.Fog.Start) * progress
    local fogend = ( next.Fog.End - current.Fog.End) * progress

    SetTerrainFogEx(0,fogstart,fogend,0.5,red,green,blue)
end

TimerStart(CreateTimer(),0.05,true, WeatherSystem())
