do
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
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 4500 }
                },
                Day = {
                    EffectId = FourCC('LRaa'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 0;}, Start = 1500; End = 5000 }
                },
                Evening = {
                    EffectId = FourCC('LRaa'),
                    Fog = { Color = {Red = 0.85; Green = 0.35; Blue = 0.2;}, Start = 1000; End = 4000 }
                },
                Night = {
                    EffectId = FourCC('LRma'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 500; End = 3000 }
                }
            },
            Rainy = {
                Morning = {
                    EffectId = FourCC('RLlr'),
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 500; End = 3500 }
                },
                Day = {
                    EffectId = FourCC('RLhr'),
                    Fog = { Color = {Red = 0.7; Green = 0.7; Blue = 0.7;}, Start = 1000; End = 4000 }
                },
                Evening = {
                    EffectId = FourCC('RLlr'),
                    Fog = { Color = {Red = 0.6; Green = 0.35; Blue = 0.2;}, Start = 500; End = 3000 }
                },
                Night = {
                    EffectId = FourCC('RLhr'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 0; End = 2000 }
                }
            },
            Snowy = {
                Morning = {
                    EffectId = FourCC('SNls'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 4000 }
                },
                Day = {
                    EffectId = FourCC('SNhs'),
                    Fog = { Color = {Red = 0.8; Green = 0.8; Blue = 0.8;}, Start = 500; End = 3500 }
                },
                Evening = {
                    EffectId = FourCC('SNhs'),
                    Fog = { Color = {Red = 0.8; Green = 0.5; Blue = 0.4;}, Start = 500; End = 3000 }
                },
                Night = {
                    EffectId = FourCC('SNls'),
                    Fog = { Color = {Red = 0.4; Green = 0.2; Blue = 0.4;}, Start = 0; End = 2000 }
                }
            },
            Windy = {
                Morning = {
                    EffectId = FourCC('WOlw'),
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 500; End = 3500 }
                },
                Day = {
                    EffectId = FourCC('WOhw'),
                    Fog = { Color = {Red = 0.7; Green = 0.7; Blue = 0.7;}, Start = 1000; End = 4000 }
                },
                Evening = {
                    EffectId = FourCC('WOhw'),
                    Fog = { Color = {Red = 0.6; Green = 0.35; Blue = 0.2;}, Start = 500; End = 3000 }
                },
                Night = {
                    EffectId = FourCC('WOlw'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 0; End = 2000 }
                }
            },
            Cloudy = {
                Morning = {
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 1000; End = 3000 }
                },
                Day = {
                    Fog = { Color = {Red = 1; Green = 1; Blue = 0.5;}, Start = 1500; End = 4500 }
                },
                Evening = {
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 1000; End = 3500 }
                },
                Night = {
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 500; End = 4000 }
                }
            },
            Foggy = {
                Morning = {
                    EffectId = FourCC('FDwh'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 0; End = 2000 }
                },
                Day = {
                    EffectId = FourCC('FDwl'),
                    Fog = { Color = {Red = 1; Green = 1; Blue = 1;}, Start = 0; End = 2500 }
                },
                Evening = {
                    EffectId = FourCC('FDwl'),
                    Fog = { Color = {Red = 0.5; Green = 0.5; Blue = 0.5;}, Start = 1000; End = 3500 }
                },
                Night = {
                    EffectId = FourCC('FDbl'),
                    Fog = { Color = {Red = 0.3; Green = 0; Blue = 0.4;}, Start = 500; End = 4000 }
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