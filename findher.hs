import Data.List

leftOpenBetween lower upper x = lower <= x && upper > x

adjacentRooms n i = filter (leftOpenBetween 0 n) [pred i, succ i]

notEq x y = x /= y

possibleRooms :: Int -> [Int] -> [Int]
possibleRooms n moves = possibleRoomsI n moves [0..n]

possibleRoomsI :: Int -> [Int] -> [Int] -> [Int]
possibleRoomsI n [] priorRooms = priorRooms
possibleRoomsI n (m:ms) priorRooms = 
  possibleRoomsI n ms (((filter (notEq m)) . nub . concat . (map (adjacentRooms n))) priorRooms)
