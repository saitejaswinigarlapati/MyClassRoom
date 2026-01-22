import Data.Char (toLower)

-- 1
square :: Num a => [a] -> [a]
square [] = []
square (x:xs) = x*x : square xs

-- 2
evennums :: Int -> Int -> [Int]
evennums m n = [x | x <- [m..n], even x]

-- 3
oddnums :: Int -> [Int]
oddnums n = [x | x <- [0..n], odd x]

-- 4
divisibleby3 :: Int -> Int -> [Int]
divisibleby3 m n = [x | x <- [m..n], x `mod` 3 == 0]

-- 5
orderedpairs :: [Int] -> [Int] -> [(Int, Int)]
orderedpairs list1 list2 = [(x, y) | x <- list1, y <- list2]

-- 6
evenpairs :: [Int] -> [Int] -> [(Int, Int)]
evenpairs list1 list2 = [(x, y) | x <- list1, y <- list2, even (x + y)]

-- 7
flatlist :: [[Int]] -> [Int]
flatlist [] = []
flatlist (x:xs) = x ++ flatlist xs

-- 8
pythagorespairs :: Int -> Int -> [(Int, Int, Int)]
pythagorespairs m n = [(a, b, c) | a <- [m..n], b <- [m..n], c <- [m..n], (a*a + b*b) == c*c]

-- 9





-- 10
extractDigits :: String -> String
extractDigits s = [c | c <- s, c >= '0', c <= '9']

-- 11
sublistsum :: [[Int]] -> [Int]
sublistsum list = [sum x | x <- list]

sublistsum1 :: [[Int]] -> [Int]
sublistsum1 [] = []
sublistsum1 (x:xs) = sum x : sublistsum1 xs

sum1 :: [Int] -> Int
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs

sublistsum2 :: [[Int]] -> [Int]
sublistsum2 list = [sum1 x | x <- list]

-- 12
triplets :: [Int] -> Int -> [(Int, Int, Int)]
triplets list s = [(x, y, z) | x <- list, y <- list, z <- list, (x + y + z) == s]

-- 13
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]

--14

factors n = [x | x <- [2..n], n `mod` x == 0, isPrime x]

--15
isPrime :: Int -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = null [x | x <- [2..floor (sqrt (fromIntegral n))], n `mod` x == 0]


-- 16
extractvowels :: [String] -> [String]
extractvowels list = [[y | y <- x, toLower y `elem` "aeiou"] | x <- list]

--17
cartesianProduct :: Int -> Int -> [(Int, Int)]
cartesianProduct m n = [(x, y) | x <- [1..m], y <- [1..n]]

-- 18
multiplicationtable :: Int -> [Int]
multiplicationtable n = [x * n | x <- [1..10]]

-- 19
triangularnumbers :: Int -> [Int]
triangularnumbers n = [(x * (x + 1)) `div` 2 | x <- [1..n]]

-- 20
commonelements :: [Int] -> [Int] -> [Int]
commonelements list1 list2 = [x | x <- list1, x `elem` list2]

-- 21
sumpairs :: [Int] -> [Int] -> [Int]
sumpairs list1 list2 = [x + y | (x, y) <- zip list1 list2]

-- 23
pairconsecutive :: [Int] -> [(Int, Int)]
pairconsecutive list = zip list (tail list)

-- 24
differences :: Num a => [a] -> [a]
differences xs = [abs (x - y) | (x, y) <- zip xs (tail xs)]

-- 25
reversePairs :: [Int] -> [(Int, Int)]
reversePairs xs = zip xs (reverse xs)
