--1
data Shape = Circle Float | Rectangle Float Float deriving Show
area :: Shape -> Float
area (Circle r) = pi *r *r
area (Rectangle l b)=l * b

newtype Celsius = Celsius Float
toFahrenheti :: Celsius -> Float
toFahrenheti (Celsius c) =(c *9/5) +32

data TrafficLight = Red |Yellow | Green deriving Show
nextLight :: TrafficLight -> TrafficLight
nextLight Red =Yellow
nextLight Yellow =Green
nextLight Green =Red

data Person = Person String Int deriving Show
isAdult :: Person ->Bool
isAdult (Person _ age) = age >=18

data Person1 =Person1 {name :: String , ag :: Int}
isAdult1 :: Person1 ->Bool
isAdult1 (Person1 _ a)=a>=18

data Grade = A|B|C|D|F deriving (Eq,Show)
isPass :: Grade ->Bool
isPass g
    |g==F =False
    |otherwise =True

data Coordinates = Coordinates Float Float deriving Show
distanceBetween :: Coordinates -> Coordinates ->Float
distanceBetween (Coordinates x1 y1) (Coordinates x2 y2) =sqrt ((x1-x2)^2 + (y1-y2)^2)

data Vehicle =Car String Int| Bike String Int
vehicleAge :: Vehicle ->Int
vehicleAge (Car _ year) =2025-year
vehicleAge (Bike _ year) =2025-year

data LoginInfo = LoginInfo {
    username :: String,
    isAdmin :: Bool,
    lastLogin :: (Int ,Int,Int)
} deriving (Eq,Show)

isRecentAdmin :: LoginInfo ->Bool 
isRecentAdmin info = isAdmin info && year >=2024
    where (_ ,_ ,year) = lastLogin info

data Book =Book {
    title :: String,
    price ::Float,
    inStock :: Bool
}
affordableAvalibleBooks :: [Book] -> [String]
affordableAvalibleBooks list = [title b | b<-list ,price b <500,inStock b]

data IntStack = Stack [Int] deriving Show
push :: Int ->IntStack ->IntStack
push x (Stack xs) =Stack (x:xs)

pop :: IntStack ->(Maybe Int ,IntStack)
pop (Stack []) =(Nothing,Stack [])
pop (Stack (x:xs))=(Just x ,Stack xs)

top :: IntStack ->Maybe Int
top (Stack []) =Nothing
top (Stack (x:_)) =Just x