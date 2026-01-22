import Data.Char (isDigit)

--2
lastbutone :: [a] -> a
lastbutone l = l !! (length(l)-2)

--3
kthelement ::[a] -> Int -> a
kthelement l k =l !! k

--4
isPalindrome ::(Eq a) =>  [a] -> Bool
isPalindrome l = l == reverse l

--5
duplicate :: [a] -> [a]
duplicate l =take(3*length l) (cycle l)

--6
split :: [a] -> Int -> ([a],[a])
split l k = splitAt k l

--7
getrange :: [a] -> Int -> Int -> [a]
getrange list left right = take (right-left +1) (drop left list)

--8
removeEle :: [a] -> Int -> [a]
removeEle list k = take k list ++ drop (k+1) list

--9
insert :: [a] -> Int -> a -> [a]
insert list index ele = take index list ++ [ele] ++ drop(index) list

--10
createlist :: Int -> a ->[a]
createlist n v =take n (cycle [v])

--12
checkDigits :: String -> [Bool]
checkDigits str = map isDigit str


--13
firstLastTuple :: [a] -> (a,a)
firstLastTuple list = (head list ,last list )

--14
firstLast :: [a] -> (a,a)
firstLast list = (head list ,last list )

--15
reverseConcat ::[a] -> [a] ->[a]
reverseConcat list1 list2 =list2 ++ list1

--16
dropTake :: [a] -> Int ->Int ->[a]
dropTake list n m = take m (drop n list)

--17
firstHalf ::Eq a => [a] -> a -> Bool
firstHalf list k = elem k (take (div (length list) 2) list)


--18
trimList :: [a] -> Int -> Int ->[a]
trimList list n m = take (length list - m-n) (drop n list)

--19
removeEdge :: [a] ->[a]
removeEdge list = tail(init list)

--20
sumMiddle :: Num a => [a] -> a
sumMiddle list =sum (tail(init list))