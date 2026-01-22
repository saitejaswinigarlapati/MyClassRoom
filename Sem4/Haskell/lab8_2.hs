--Q1
myLookup :: Eq a => a ->[(a,b)] -> Maybe b
myLookup _ [] =Nothing
myLookup key ((k,v):xs)
    |key == k =Just v
    |otherwise = myLookup key xs
    
--Q2
lookupE :: Eq a =>a -> [(a,b)] -> Either String b
lookupE _ [] = Left "Key not found"
lookupE key ((k,v):xs)
    |key == k = Right v
    |otherwise = lookupE key xs

--Q3

validateAge :: Int -> Either String String
validateAge age
    |age >=0 && age <=120 =Right "valid age"
    |otherwise = Left "Invalid age"

--Q4
-- safeHead :: [a] -> Maybe a
-- safeHead [] = Nothing
-- safeHead xs = Just  (head xs)

--Q5
checkPositive :: Int -> Either String Int
checkPositive n
    |n>0 =Right n
    |otherwise =Left "Not positive"

checkEven :: Int -> Either String Int
checkEven n
    |even n=Right n
    |otherwise =Left "Not even"

validateNumber :: Int -> Either String Int

validateNumber x = do
    pos <- checkPositive x
    checkEven pos

--Q6

type Point = (Float, Float)

data Move = LeftM | RightM | UpM | DownM deriving Show
data Quadrant = Q1 | Q2 | Q3 | Q4 deriving Show

getQuadrant :: Point -> Maybe Quadrant
getQuadrant (x, y)
    | x > 0 && y > 0 = Just Q1
    | x < 0 && y > 0 = Just Q2
    | x < 0 && y < 0 = Just Q3
    | x > 0 && y < 0 = Just Q4
    | otherwise      = Nothing

movePoint :: Point -> Move -> Float -> Point
movePoint (x, y) dir step =
    case dir of
        LeftM  -> (x - step, y)
        RightM -> (x + step, y)
        UpM    -> (x, y + step)
        DownM  -> (x, y - step)
distance :: Point -> Point -> Float
distance (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

offsetPoint :: Point -> (Float, Float) -> Point
offsetPoint (x, y) (dx, dy) = (x + dx, y + dy)

midpoint :: Point -> Point -> Maybe Point
midpoint (x1, y1) (x2, y2)
    | x1 == x2  = Nothing
    | otherwise = Just ((x1 + x2) / 2, (y1 + y2) / 2)

--Q7
-- Define AccountType with Savings and Current
data AccountType = Savings | Current deriving Show

-- Define Account record
data Account = Account {
    accNumber :: Int,
    accType :: AccountType,
    balance :: Float } deriving Show

-- a. Deposit function: Adds amount to balance
deposit :: Float -> Account -> Account
deposit amt acc = acc { balance = balance acc + amt }

-- b. Withdraw function: Checks if at least ₹100 will remain after withdrawal
withdraw :: Float -> Account -> Maybe Account
withdraw amt acc
    | balance acc - amt >= 100 = Just acc { balance = balance acc - amt }
    | otherwise = Nothing

-- c. Compute interest (only for Savings accounts)
computeInterest :: Account -> Float
computeInterest acc =
    case accType acc of
        Savings -> balance acc * 0.04
        Current -> 0


--Q8
data Queue a = Queue [a] [a] deriving Show

-- a. Enqueue (add to back)
enqueue :: a -> Queue a -> Queue a
enqueue x (Queue front back) = Queue front (x:back)

-- b. Dequeue (remove from front)
dequeue :: Queue a -> Maybe (a, Queue a)
dequeue (Queue [] []) = Nothing
dequeue (Queue [] back) = dequeue (Queue (reverse back) [])
dequeue (Queue (x:xs) back) = Just (x, Queue xs back)

--Q9
data KVPair k v = KVPair k v deriving Show

-- a. getKey
getKey :: KVPair k v -> k
getKey (KVPair k _) = k

-- b. getValue
getValue :: KVPair k v -> v
getValue (KVPair _ v) = v

-- c. mapValue
mapValue :: (v -> v') -> KVPair k v -> KVPair k v'
mapValue f (KVPair k v) = KVPair k (f v)

--Q10
data MyList a = Null | Cons a (MyList a) deriving Show
myLength :: MyList a -> Int
myLength Null = 0
myLength (Cons _ xs) = 1 + myLength xs

myMap :: (a -> b) -> MyList a -> MyList b
myMap _ Null = Null
myMap f (Cons x xs) = Cons (f x) (myMap f xs)

myAppend :: MyList a -> MyList a -> MyList a
myAppend Null ys = ys
myAppend (Cons x xs) ys = Cons x (myAppend xs ys)

myToList :: MyList a -> [a]
myToList Null = []
myToList (Cons x xs) = x : myToList xs

fromList :: [a] -> MyList a
fromList [] = Null
fromList (x:xs) = Cons x (fromList xs)


--Q11
data Expr = Val Int | Add Expr Expr | Mul Expr Expr deriving Show
eval :: Expr -> Int
eval (Val n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2
showExpr :: Expr -> String
showExpr (Val n) = show n
showExpr (Add e1 e2) = "(" ++ showExpr e1 ++ "+" ++ showExpr e2 ++ ")"
showExpr (Mul e1 e2) = "(" ++ showExpr e1 ++ "*" ++ showExpr e2 ++ ")"

--Q12
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)
applySafeDivList :: [Int] -> Int -> [Maybe Int]
applySafeDivList xs d = map (`safeDiv` d) xs
extractJusts :: [Maybe Int] -> [Int]
extractJusts xs = [x | Just x <- xs]


--Q13
-- a. safeSqrt
safeSqrt :: Float -> Either String Float
safeSqrt x
    | x < 0 = Left "Negative Number"
    | otherwise = Right (sqrt x)
-- b. mapSqrtList
mapSqrtList :: [Float] -> [Either String Float]
mapSqrtList = map safeSqrt


--Q14
data Result a = Success a | Error String deriving Show

safeHead []     = Error "Empty list"
safeHead (x:_)  = Success x

safeIndex xs i
    | i < 0            = Error "Negative index"
    | i >= length xs   = Error "Index out of bounds"
    | otherwise        = Success (xs !! i)

resultToString (Success x) = "Success: " ++ show x
resultToString (Error msg) = "Error: " ++ msg

--Q15
data BTree a = Empty | Node (BTree a) a (BTree a) deriving Show

insert x Empty = Node Empty x Empty
insert x (Node left val right)
    | x < val   = Node (insert x left) val right
    | x > val   = Node left val (insert x right)
    | otherwise = Node left val right  -- No duplicates

search _ Empty = False
search x (Node left val right)
    | x == val  = True
    | x < val   = search x left
    | otherwise = search x right

inOrder Empty = []
inOrder (Node left val right) = inOrder left ++ [val] ++ inOrder right

treeHeight Empty = 0
treeHeight (Node left _ right) = 1 + max (treeHeight left) (treeHeight right)

countNodes Empty = 0
countNodes (Node left _ right) = 1 + countNodes left + countNodes right
