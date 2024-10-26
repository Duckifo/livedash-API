# AABB - lib

AABB is a common collision detection in this case for detecting if client 
has its cursor over the mouse

## How to use

the function that will check if mouse is over a "AABB" (collision box) is
the *``.AABB_Mouse_Overlap()``*
and it takes an AABB

### create an AABB

to create an AABB you optionally import the AABB type from the AABB-lib
then in a table you assign ``size:vector2 & pos: vector2``

```lua
type AABB = AABB_LIB.AABB

local AABB_Box: AABB = {
    size = vector2.zero,        -- assign your vec2
    pos = vector2.zero          -- ...    
}::AABB

local cursor_overlapping: boolean = AABB_LIB.AABB_Mouse_Overlap(AABB_Box)
```

## more

there is also a function to pass tow AABBs and 
check if they overlap *``.AABB_Overlap()``*