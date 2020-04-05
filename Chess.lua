Board = {
    MinX = -512,
    MinY = -512,
    MaxX = 512,
    MaxY = 512,
    Unit = {
      [1] = {
          [1] = FourCC('hfoo'),
          [2] = FourCC('hkni'),
          [3] = FourCC('hsor'),
          [8] = FourCC('hfoo'),
          [7] = FourCC('hkni'),
          [6] = FourCC('hsor'),
          [4] = FourCC('Hart'),
          [5] = FourCC('Hjai')
      },
      [2] = {
          [1] = FourCC('hmil'),
          [2] = FourCC('hmil'),
          [3] = FourCC('hmil'),
          [4] = FourCC('hmil'),
          [5] = FourCC('hmil'),
          [6] = FourCC('hmil'),
          [7] = FourCC('hmil'),
          [8] = FourCC('hmil')
      },
      [8] = {
          [1] = FourCC('hfoo'),
          [2] = FourCC('hkni'),
          [3] = FourCC('hsor'),
          [8] = FourCC('hfoo'),
          [7] = FourCC('hkni'),
          [6] = FourCC('hsor'),
          [4] = FourCC('Hart'),
          [5] = FourCC('Hjai')
      },
      [7] = {
          [1] = FourCC('hmil'),
          [2] = FourCC('hmil'),
          [3] = FourCC('hmil'),
          [4] = FourCC('hmil'),
          [5] = FourCC('hmil'),
          [6] = FourCC('hmil'),
          [7] = FourCC('hmil'),
          [8] = FourCC('hmil')
      }
    },
    [1] = {
      [1] = "",
      [2] = "",
      [3] = "",
      [4] = "",
      [5] = "",
      [6] = "",
      [7] = "",
      [8] = ""
    },
    [2] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    [3] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    [4] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    [5] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    [6] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    [7] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    [8] = {
        [1] = "",
        [2] = "",
        [3] = "",
        [4] = "",
        [5] = "",
        [6] = "",
        [7] = "",
        [8] = ""
    },
    Figure ={
        King = "",
        Queen = "",
        Rook = "",
        Bishop = "",
        Knight = "",
        Pawn = ""
    }
}
Start = CreateTrigger()


do
    function Move()

    end
    function Initialization_Actions()
        local x = BlzGetTriggerPlayerMouseX()
        local y = BlzGetTriggerPlayerMouseY()
        for j = 1,8 do
            for i = 1,8 do
                if RectContainsCoords(Board[j][i], x,y) then
                    print("Rect "..j.." "..i)
                end
            end
        end
    end

    function Initialization_Conditions()
        return BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT
    end


    function Initialization()
        TriggerRegisterPlayerMouseEventBJ(Start, Player(0), bj_MOUSEEVENTTYPE_DOWN)
        TriggerAddCondition(Start, Condition(Initialization_Conditions))
        TriggerAddAction(Start, Initialization_Actions)
        for j = 1,8 do
            for i = 1,8 do
                Board[j][i] = Rect(Board.MinX + (j-1)*128,Board.MinY + (i-1)*128, Board.MinX + j*128, Board.MinY + i*128)
                print("init created")
            end
        end
        for i = 1,2 do
            for j = 1,8 do
                CreateUnit(Player(21), Board.Unit[i][j], GetRectCenterX(Board[j][i]),GetRectCenterY(Board[j][i]),90)
            end
        end
        for i = 7,8 do
            for j = 1,8 do
                CreateUnit(Player(11), Board.Unit[i][j], GetRectCenterX(Board[j][i]),GetRectCenterY(Board[j][i]),270)
            end
        end
    end
end