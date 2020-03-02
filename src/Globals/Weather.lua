do
    Weather = {
        Type = {
            Sunny = {
                Morning = {
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 3500 }
                },
                Day = {
                    Fog = { Color = {Red = 1; Green = 1; Blue = 0;}, Start = 1500; End = 5000 }
                },
                Evening = {
                    Fog = { Color = {Red = 0.85; Green = 0.35; Blue = 0.2;}, Start = 1000; End = 3500 }
                },
                Night = {
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 800; End = 2500 }
                }
            },
            Rainy = {
                Morning = {
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 800; End = 1500 }
                },
                Day = {
                    Fog = { Color = {Red = 0.7; Green = 0.7; Blue = 0.7;}, Start = 900; End = 2500 }
                },
                Evening = {
                    Fog = { Color = {Red = 0.6; Green = 0.35; Blue = 0.2;}, Start = 900; End = 2500 }
                },
                Night = {
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 700; End = 1500 }
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
        local progress = (GetTimeOfDay() - currenttime) / (nexttime - currenttime)
        local red =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Red + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Red - Weather.Type[currenttype][currentdaycycle].Fog.Color.Red) * progress
        local green =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Green + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Green - Weather.Type[currenttype][currentdaycycle].Fog.Color.Green) * progress
        local blue =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Blue + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Blue - Weather.Type[currenttype][currentdaycycle].Fog.Color.Blue) * progress
        local fogstart =  Weather.Type[currenttype][currentdaycycle].Fog.Start + (Weather.Type[currenttype][nextdaycycle].Fog.Start - Weather.Type[currenttype][currentdaycycle].Fog.Start) * progress
        local fogend =  Weather.Type[currenttype][currentdaycycle].Fog.End + (Weather.Type[currenttype][nextdaycycle].Fog.End - Weather.Type[currenttype][currentdaycycle].Fog.End) * progress
        SetTerrainFogEx(0, fogstart, fogend,0.5, red, green, blue)
    end
end