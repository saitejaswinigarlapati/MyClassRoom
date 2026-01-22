--1
largestofthree :: Int -> Int -> Int -> Int
largestofthree a b c =
    if (a >= b && a >= c) then a
    else if (b >= a && b >= c) then b
    else c

--2
isleapyear :: Int -> Bool
isleapyear y =
    if(y `mod` 400 ==0) then True
    else if(y `mod` 100 ==0) then False
    else if(y `mod` 4 ==0) then True
    else False


--3
bmicategory :: Float ->Float -> String
bmicategory w h=
