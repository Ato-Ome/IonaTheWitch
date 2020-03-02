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
        print("Currenttype"..currenttype)
        local currenttime = Weather.Current.Time
        print("Currenttime"..currenttime)
        local nexttime = Weather.Current.Time + 6
        print("nextime"..nexttime)
        local currentdaycycle = Weather.DayCycle[currenttime]
        print("current daycycle"..currentdaycycle)
        local nextdaycycle  = Weather.DayCycle[nexttime]
        print("next daycycle"..nextdaycycle)
        local progress = (GetTimeOfDay() - currenttime) / (nexttime - currenttime)
        print("progress"..progress)
        local red =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Red + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Red - Weather.Type[currenttype][currentdaycycle].Fog.Color.Red) * progress
        print("red"..red)
        local green =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Green + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Green - Weather.Type[currenttype][currentdaycycle].Fog.Color.Green) * progress
        print("green"..green)
        local blue =  Weather.Type[currenttype][currentdaycycle].Fog.Color.Blue + (Weather.Type[currenttype][nextdaycycle].Fog.Color.Blue - Weather.Type[currenttype][currentdaycycle].Fog.Color.Blue) * progress
        print("blue"..blue)
        local fogstart =  Weather.Type[currenttype][currentdaycycle].Fog.Start + (Weather.Type[currenttype][nextdaycycle].Fog.Start - Weather.Type[currenttype][currentdaycycle].Fog.Start) * progress
        print("fogstart"..fogstart)
        local fogend =  Weather.Type[currenttype][currentdaycycle].Fog.End + (Weather.Type[currenttype][nextdaycycle].Fog.End - Weather.Type[currenttype][currentdaycycle].Fog.End) * progress
        print("fogend"..fogend)
        SetTerrainFogEx(0,fogstart,fogend,0.5,red,green,blue)
        print("fog seted")
    end
end