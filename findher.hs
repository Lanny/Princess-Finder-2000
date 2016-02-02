import Data.List

leftOpenBetween lower upper x = lower <= x && upper > x

adjacentRooms n i = filter (leftOpenBetween 0 n) [pred i, succ i]

notEq x y = x /= y

possibleRooms :: Int -> [Int] -> [Int]
possibleRooms n moves = possibleRoomsI n moves [0..n]

possibleRoomsI :: Int -> [Int] -> [Int] -> [Int]
possibleRoomsI n [] priorRooms = priorRooms
possibleRoomsI n (m:ms) priorRooms = 
  let newRooms = (filter (notEq m)) . nub . concat . (map (adjacentRooms n)) $ priorRooms
  in possibleRoomsI n ms newRooms

allOfLen :: Int -> Int -> [[Int]]
allOfLen n 0 = []
allOfLen n 1 = [[d] | d <- [0..n]]
allOfLen n l =
  let priors = allOfLen n (pred l)
  in concat [[n : p | n <- [0..n]] | p <- priors]

allMoveSets n = concat [allOfLen n l | l <- [0..]]

proc n (x:xs) = if null (possibleRooms n x) then x else proc n xs

minimalSolution n = proc n (allMoveSets n)
