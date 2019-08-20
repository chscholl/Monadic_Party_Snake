{- 

  _________              __           
 /   _____/ ____ _____  |  | __ ____  
 \_____  \ /    \\__  \ |  |/ // __ \ 
 /        \   |  \/ __ \|    <\  ___/ 
/_______  /___|  (____  /__|_ \\___  >
        \/     \/     \/     \/    \/ 

Monadic Party Challenge 1 
 
-- This is the skeleton code for making a Snake game
-- Please read all the code comments as they give hints
-- towards solving the exercises. To incrementally test 
-- your solutions please make use of Dodona. 

-- Each exercise has a difficulty level which should 
-- give you an faint idea about how difficult 
-- the exercise is.  

-- Single line comments start with "--"
-- Multiline comments follow this scheme: 
-- "{-" <multi-line comment> "-}"

-- In the game we will need to convert numbers. 
-- Read all about converting numbers here: 
-- https://wiki.haskell.org/Converting_numbers


-- Want to read upon some of the Haskell concepts ? 
-- http://learnyouahaskell.com


-- Questions, remarks or just happy about finishing
-- the snake game.  
-- Let me know at Christophe.Scholliers@UGent.be

-}

{-
=================================================================
Imports
=================================================================
-}

-- In this first challenge we will use a graphical library 
-- called gloss. The following imports make sure that 
-- we can access all the needed functions and data structures
-- from that library. 
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Bitmap
-- In order to put the apple at a random position on the field 
-- we need to make use of a random generator. This random 
-- generator needs to be imported . 
import System.Random

{-
=================================================================
Type and Data Definitions 
=================================================================
-}

-- We first define a number of type synonyms. 
-- This makes that we refer to a certain type 
-- by a name. In our case we define two type 
-- synonyms Coordinate and Direction. 
type Coordinate = (Int,Int) 
type Direction   = (Int,Int)

-- Our next type synonym represents the snake
-- We represent it as a list of coordinates 
type Snake      = [Coordinate]

-- We make an algebraic data type to keep 
-- track whether the player is alive or dead
--
-- This would be a good place to keep track of 
-- a score in case you want to extend the game
data Status     = Alive | Dead
                  deriving (Show,Eq)

-- An apple is a coordinate together 
-- with a random number generator 
type Apple = (Coordinate,StdGen)

-- Finally, we define an algebraic data type to  
-- represent the whole state of the game which we 
-- call the "World"
--
-- This World consist of:
-- 1) The Snake 
-- 2) The Direction that the Snake is moving 
-- 3) The time since the last update 
-- 4) The status of the player 
-- 5) The Apple 
--
-- Note that there is a "World" on the left 
-- and on the right. The World on the left of the definition 
-- is a Type the World on the right is the constructor 
-- Please ask if this doesn't make sense to you yet. 
data World     = World Snake Direction Float Status Apple 
                  deriving (Show)

{-
=================================================================
Constants
=================================================================
-}

-- The directions a player can move
-- (* Difficulty 1 *)
left :: Direction
left = undefined

right :: Direction 
right = undefined

up :: Direction
up = undefined

under :: Direction
under = (0, 1)

-- The width and the height of the board 
width :: Int
width = 64
height  :: Int 
height  = 64
-- The size of each square of the snake 
snake_scale  :: Int
snake_scale  = 10

-- Background color 
backgroundColor   = makeColor 0 0 0 1

-- The initial position of the Snake
initialPosition :: Snake 
initialPosition = [(width `div` 2, height `div` 2)]

-- The seed of the number random generator 
seed = 42

-- The initial world 
startWorld :: World 
startWorld = World initialPosition 
                     right 
                     0 
                     Alive 
                     ((width `div` 3, height `div` 3), mkStdGen seed)

--
-- The gloss window to draw on
--
window :: Display
window = InWindow "Monadic Party: Snake " 
                   (width *snake_scale, snake_scale * height) 
                   (0,0)

{-
=================================================================
Game Logic
=================================================================
-}
              
-- inBox is a function which takes a coordinate and 
-- returns a Bool indicating whether the coordinate is within 
-- the bounds of the board. 
-- (* Difficulty 1 *)
inBox :: Coordinate -> Bool
inBox (x,y) = undefined

-- Extends the Snake in the given direction 
-- HINT: Checkout "@" and make use of pattern matching
-- (* Difficulty 1 *)
extend :: Snake -> Direction -> Snake
extend = undefined

-- Move the snake in the given direction.  
-- This is different from just extending the snake as
-- the tail of the snake needs to be "shortened" 
-- Recommendation: Try to solve this one without pattern matching
-- (* Difficulty 2 *)
move :: Snake -> Direction -> Snake
move = undefined

-- Given a Snake and a Direction determine whether the 
-- coordinate lies on the Snake, i.e. whether they collide 
-- (* Difficulty 1 *)
collides :: Snake -> Coordinate -> Bool
collides = undefined

-- Generate the next apple. 
-- Hint: lookup random 
-- (* Difficulty 3 *)
nextApple :: Apple -> Apple
nextApple = undefined

--
-- Check whether the apple and the snake collide
-- If they collide make a new apple otherwise 
-- return the old apple
--
-- (* Difficulty 2 *)
collidesApple :: Snake -> Apple -> Apple 
collidesApple = undefined


-- Disclaimer: This function alone looks rather weird 
-- take a look at the step function below to see how this function 
-- fits into the rest of the program. 
-- The point is that this function can be used both when 
-- the snake is extended and when the snake has moved. 
--
-- nextWorld converts a world to a new world but checks 
-- whether the head of the snake:
-- 1) is still within the board 
-- 2) is not colliding with itself. 
-- Otherwise the status needs to be changed to dead
-- (* Difficulty 2 *) 
-- Hint: Make use of guards  
nextWorld :: World -> World
nextWorld =  undefined

-- Take one step: 
-- 1) move the snake at each call 
-- 2) extend the snake after one second
-- (* Difficulty 3 *)
step ::  Float -> World -> World
step = undefined

{-
=================================================================
Game Graphics
=================================================================
-}

--
-- Make a square picture 
-- 
-- HINT: Lookup the snake_scale and rectangleSolid
-- (* Difficulty 1 *)
squarePicture :: Picture 
squarePicture  = undefined


-- coordToPicture takes a "Snake coordinate" and makes a 
-- squarePicture for it.  We need to do some conversion here 
-- because the coordinate system of Gloss and our coordinates 
-- for Snake are not the same. 
-- In Gloss the coordinate (0,0) is the center of the screen
-- In Snake the coordinate (0,0) represent the upper left square 
--  | (0,0) | (1,0) | (2,0) | ...
--  |       |       |       | ...         
-- Read more about the gloss library here:
-- http://hackage.haskell.org/package/gloss
--
-- HINTS: 
-- 1) make use of the functions "translate","fromIntegral" and "squarePicture" 
-- 2) make use of the constants snake_scale, width and height 
-- 
-- (* Difficulty 4 *)
coordToPicture :: Coordinate -> Picture
coordToPicture  = undefined

-- Convert a *list* of coordinates to pictures 
-- (* Difficulty 1 *)
-- Hint: Lookup list operations
coordinatesToPicture :: [Coordinate] -> [Picture] 
coordinatesToPicture = undefined                            

-- backgroundColor snake achtergrond  
box =  Color backgroundColor (rectangleSolid snake_scaleb  snake_scaleh) 
       where snake_scaleb = fromIntegral (snake_scale * width)
             snake_scaleh = fromIntegral (snake_scale * height)

-- Converts a world to a figure
makePictures :: World -> Picture
makePictures (World s d _ _ a) =  
     pictures $ box:apple:coordinatesToPicture s
     where apple = Color ((dark . dark) red) $ coordToPicture (fst a)

{-
=================================================================
Game Input 
=================================================================
-}

-- Auxiliary function which checks whether an event is a certain 
-- Key Down event 
-- Example:
-- isKey KeyUP (EventKey (SpecialKey KeyUp) Down  _ _ )  = True 
--
isKey k1 (EventKey (SpecialKey k2)    Down  _ _ )  = k1 == k2 
isKey _  _  = False

-- Complete the processInput function such that:
-- 1) The Snake moves by pressing the arrow keys 
-- 2) The game restarts when the player presses the enter key  
-- Hint: use isKey and make use of pattern matching
-- (* Difficulty 3 *)
processInput :: Event -> World -> World 
processInput e w@(World s d t l a)    
  | isKey KeyUp    e = World s up  t l a
  | isKey KeyDown  e = undefined
  | isKey KeyLeft  e = undefined
  | isKey KeyRight e = undefined
  | isKey KeyEnter e = undefined
  | otherwise        = w

{-
=================================================================
Main 
=================================================================
-}  
-- 
-- Start of the game  
--
main :: IO ()
main =  play window        white 
             20            startWorld
             makePictures  processInput
             step
