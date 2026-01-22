import Data.Char (toUpper)

--Q1
addtuple :: [(Int,Int)] -> [Int]
addtuple list =[fst(x) + snd(x) | x<-list]


--Q2
replace  :: [Int] -> [Int]
replace list = [if x <0 then 0 else x | x <- list]


--Q3
addlist :: [Int] -> [Int] ->[Int]
addlist list1 list2 =[fst(x)+snd(x) | x <- zip list1 list2]


--Q4
shortWords :: [String] -> [String]
shortWords list = [x | x<- list , length x <=5]


--Q5
score :: [(String,Int)] -> [(String,Int)]
score list = filter (\x -> snd(x)>50 ) list


--Q6
capitalize :: [String] -> [String]
capitalize list = map (map toUpper) ( filter (\x -> length x <= 5 ) list )


--Q7
names :: [(String,Int)] -> [String]
names list = map (map toUpper . fst) (filter (\x -> snd x >18) list )


--Q8
-- countElements :: [Int] -> Int

sublist xs = foldl (+) 0 xs


--Q20
dropVowels :: String ->String
dropVowels =filter (`notElem` "aeiouAEIOU")

--Q21
longWord :: [String] ->Maybe String
longWord [] =Nothing
longWord (x:xs)
    | length x >5 =Just x
    | otherwise = longWord xs


--Q22
factorial :: Integer ->Integer
factorial 0=1
factorial n =n* factorial (n-1)

factorialList :: [Integer]->[Integer]
factorialList l =map factorial l

--Q24
fibList :: Int -> [Int]
fibList n =take n (fib 0 1) 
    where 
        fib a b = a : fib b (a+b)