# Princess Finder 2000
For finding princesses. My Haskell learning project.

## The Problem
There exist N doors in a row. Behind one of them is a princess. You get to
open one door every day. Every night the princess moves to one of the adjacent
rooms. She may not move from room 0 to room N-1. Find the minimal number of
days it will take to find the princess with absolute certainty (i.e. assuming
the princess will avoid being found for as long as possible given your
selection of doors) given there are N doors.


## Usage
```
$ ghci                                                                
GHCi, version 7.10.2: http://www.haskell.org/ghc/  :? for help
Prelude> :l findher.hs
[1 of 1] Compiling Main             ( findher.hs, interpreted )
Ok, modules loaded: Main.
*Main> minimalSolution 4
[1,2,2,1]
*Main> minimalSolution 5
[3,2,1,3,2,1]
*Main> 
```

## Todo
- Keep track of prior possible room states to abort branches of the search tree
  early
- Create visual output of move set/possible princess positions
