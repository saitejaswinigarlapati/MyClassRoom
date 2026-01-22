--1
mytake :: Int -> [a] ->[a]
mytake _ []=[]
mytake 0 _=[]
mytake n (x:xs) = x : mytake (n-1) xs

--2
mysum :: Num a => [a] ->a
mysum [] =0
mysum (x:xs)=x+ mysum xs

--3
myproduct :: Num a => [a] -> a
myproduct []=1
myproduct (x:xs)=x * myproduct xs

--4
myzip :: [a] -> [b] -> [(a,b)]
myzip [] _ =[]
myzip _ []=[]
myzip (x:xs) (y:ys) =(x,y) : myzip xs ys

--5
mylength ::[a] ->Int
mylength [] =0
mylength (x:xs)=1+ mylength xs

--6
mymax :: Ord a => [a] -> a
mymax []=error "Empty list"
mymax [x]=x
mymax (x:xs)= max x (mymax xs)

--7
mymin :: Ord a => [a] ->a
mymin [] =error "Empty list"
mymin [x] =x
mymin (x:xs) = min x (mymin xs)


--8
myelem :: Eq a => [a] -> a ->Bool
myelem [] _=False
myelem (x:xs) y
    |y==x =True
    |otherwise =myelem xs y

--9
mydrop :: [a] ->Int -> [a]
mydrop [] _ =[]
mydrop xs 0=xs
mydrop (_:xs) n =mydrop xs (n-1)

--10
myconcat :: [[a]] -> [a]
myconcat [] =[]
myconcat (xs:xss) =xs ++ myconcat xss

--11
countelement :: Eq a => [a] -> a ->Int
countelement [] _ =0
countelement (x:xs) y
    |y == x = 1+countelement xs y
    |otherwise =countelement xs y

--12
removeconsecutivedupes :: Eq a => [a] ->[a]
removeconsecutivedupes []=[]
removeconsecutivedupes [x] =[x]
removeconsecutivedupes (x:y:xs)
    |x ==y =removeconsecutivedupes(y:xs)
    |otherwise =x : removeconsecutivedupes(y:xs)


--13
sumofdigits :: Int ->Int
sumofdigits 0=0
sumofdigits n=(mod n 10) + sumofdigits (div n 10)

--14
issubsequences ::Eq a => [a] ->[a]->Bool
issubsequences _ [] =False
issubsequences [] _ =False
issubsequences (x:xs) (y:ys)
    |x==y =issubsequences xs ys
    |otherwise =issubsequences (x:xs) ys

--18
josephus :: Int -> Int -> Int
josephus 1 _ = 1
josephus n k = ((josephus (n - 1) k + k - 1) `mod` n) + 1
