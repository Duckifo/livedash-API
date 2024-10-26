# Mouse - lib

mouse lib is used by for example the ``slider & window`` components for 
checking if the cursor is being used by other components (occupied).

Its good to use if your module requires sliding / holding.

## How to use

The lib uses layers for its "checking", so you would want to have layer
"slider" if you want to enable mouse occupation. This makes it easier to
not stop the component that occupies the mouse.

### functions
| function              | Description                                                            |
| --------------------- | ---------------------------------------------------------------------- |
| IsOccupiedOnLayer     | Checks if occupied on layer                                            |
| IsOccupiedExeptLayer  | Checks if there is occupation on any other layer than the layer passed |
| ToggleOccupiedOnLayer | Set occupation on layer                                                |

you can also access `AnyOccupied` which is a bool value.

### example

> script 1
```lua
local OccupiedByThisComponent = true

-- occupy the layer "component ID"
mouse_LIB.ToggleOccupiedOnLayer("component ID", OccupiedByThisComponent)

-- Check if any layer is occupied
-- (true)
local OccupiedByAny = mouse_LIB.AnyOccupied

-- Check if any layer is occupied except "component ID"
-- (false)
local OccupiedByAnyExceptId = mouse_LIB.IsOccupiedExeptLayer("component ID")
```

> script 2 (runs after)
```lua
-- Check if any layer is occupied
-- (true)
local OccupiedByAny = mouse_LIB.AnyOccupied

-- Check if any layer is occupied except this components ID
-- (true)
local OccupiedByAnyExceptId = mouse_LIB.IsOccupiedExeptLayer("Another Component ID")

-- do something...
--[[
    for example
]]
if OccupiedByAnyExceptId then return end 
```