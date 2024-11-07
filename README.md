# Duckie's devpanel tool (0.01)
![ex-1](videos/ex-1.gif)

## Overview
This library for roblox luau that allows developers to quickly create simple GUI panels to tweak values 
while running. For instance you can use it for quickly tweaking movement values in game.
while also being relatively expandable with you being able to [create custom components](docs/component-creation.md). As of October 2024 
there are currently 3 "official" modules `(toggle, button, slider)` but 
Im planing on adding more in the future like `(input_field, number_field)`
***
# API Usage

## table of built in components
these are "built in" components that you can access with this library without adding 
any user made components. More info on how to use these are in the [API examples](#api-examples)

#### static
| component ID | Description                     | Parameters                                                               |
| ------------ | ------------------------------- | ------------------------------------------------------------------------ |
| title        | A static text label             | `{ data: string, font: Enum.Font, size: int, bold: bool, italic: bool }` |
| divider      | A free space between components | `{ height: int }`                                                        |

#### read-only
| component ID | Description                | Parameters                            | returns                                  |
| ------------ | -------------------------- | ------------------------------------- | ---------------------------------------- |
| toggle       | Toggle / switch            | `{ data: bool }`                      | `{data: bool, onToggled: BindableEvent}` |
| slider       | Gives a value from a range | `{ data: float, range: NumberRange }` | `{data: float, onSlid: BindableEvent}`   |

#### input
| component ID | Description                | Parameters                            | returns                                  |
| ------------ | -------------------------- | ------------------------------------- | ---------------------------------------- |
| toggle       | Toggle / switch            | `{ data: bool }`                      | `{data: bool, onToggled: BindableEvent}` |
| slider       | Gives a value from a range | `{ data: float, range: NumberRange }` | `{data: float, onSlid: BindableEvent}`   |


## API examples
I would recommend looking at the [table of components](#table-of-built-in-components) before reading more about the examples

### create a devpanel instance
```lua
--  get the devpanel Constructor
local devpanelConstructor = require(script.Parent["Duckie's devpanel tool"].devpanel)

--  construct a devpanel 
local devpanel = devpanelConstructor.new()
```
### creating and adding components to devpanel
```lua
--  create and add component
--  (toggle button) :newComponent takes firstly ID then a parameter
local toggle_button = devpanel:newComponent("toggle", {label="toggle"})
```
### read data from components
```lua
--  read data
--  returns a bool, look at "table of built in components" if your unsure of what it returns
local toggle_button_state = toggle_button.data
```

### bind callbacks (events)
```lua
-- create and add button to devpanel
local button = devpanel:newComponent("button", {label="button"})

-- bind function to .onClicked
button.onClicked = function()
    print("Button was just pressed")
end)
```

### Use of Parameters
```lua
-- OBS: the parameters do not need to be passed, if not passed it will default to another value

-- When creating a component you can pass a parameter
-- There are some "Global" parameters like (data, label)
-- component specific params can be found in "table of built in components"
local slider_param = {
    label="slider",                 -- The label will be "slider"
    data=1,                         -- The slider will start at 1
    range=NumberRange.new(0, 10)    -- The slider will display & return a value between (0 - 10)
}


-- create the slider and pass the parameter
local slider = devpanel:newComponent("slider", slider_param)
```

### general example
this example show a simple devpanel setup to create a part with some customizability
```lua
-- create the devpanel
local devpanelConstructor = require(script.Parent["Duckie's devpanel tool"].devpanel)
local devpanel = devpanelConstructor.new()

-- create and add all components
local anchord_toggle = devpanel:newComponent("toggle", {label="anchor"})
local transparent_toggle = devpanel:newComponent("toggle", {label="transp"})
local size_slider = devpanel:newComponent("slider", {data=3, range=NumberRange.new(0, 10)})
local create_button = devpanel:newComponent("button", {label="create"})

-- bind the .onClicked to a function
create_button.onClicked = function()
	local part = Instance.new("Part")
	
	part.Anchored = anchord_toggle.data
	part.Transparency = transparent_toggle.data and 0.5 or 0
	part.Size = Vector3.new(size_slider.data, size_slider.data, size_slider.data)
	
	part.Parent = workspace
end

```

## more API examples

some examples not made to showoff how to use the API but how I use it. Might give some
clarity to some regions.

>pointA to pointB raycast ([source](src/ex-1.lua)) /
([video example](#debugging))


>stress test ([source](src/stress-test.1.lua))


***

# Use Cases

It can be used for allot of stuff that would normally take much longer, thats because
you don't need quit your already running instance and relaunch. 

## examples

### debugging

> raycast vectorA to vectorB ([source](src/ex-1.lua))
![e](videos/dbug.ex-1.gif)

***

> rip monke, will be missed. removed from store :(
