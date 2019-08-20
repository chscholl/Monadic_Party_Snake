# Monadic Party Snake

This repository contains the skeleton code for making a snake game as shown at [Monadic Party](https://www.youtube.com/watch?v=6yYchqXbMhA). I also made a step-by-step exercise program for the same project on a platform called [dodona](https://dodona.ugent.be/nl/sign_in/). If you would like to do the exercises on dodona please let me know and I will provide you with a login. 

## How to get started

```
cd Monadic_Party_Snake
stack setup
stack build
stack exec snake
```

This will give you the following errors:

```
snake: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries/base/GHC/Err.hs:78:14 in base:GHC.Err
  undefined, called at src/Main.hs:264:19 in main:Main
```

The reason you get this error is because the project file under `src/Main.hs` contains several exercises which you need to solve in order to get a working snake game. For example the first exercise is to define the different directions in which a player can move.

```
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

```



Happy codeing !
