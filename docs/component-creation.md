# Component Creation (0.01)

Components are created in two steeps [`metadata`](#metadata) & [`component`](#component-construction--functionality) module scripts.

***

## metadata

metadata template source code can be found [here](/src/componentMetadataTemp-1.lua) 
or in roblox *(~/dialogComponents/metadata/.componentMetadataTemplate)*


So the metadata is what the panel reads from when :newComponent() is called.
Its used for assigning `config, componentID, module (component)` mostly but also
includes `version, publisher, lastUpdated` these are not used for the construction
components.


The `componentID & module` is very **important**, the componentID is the string
that you will pass in the API for that component, for example: **toggle** would have **componentID of "toggle"**
While the **Module** is the **moduleStript** with the constructor and functionality (update)

**Config** is also important it has two parts `line & custom` the line is set configs passed to the panel instance. While 
custom is a table that you can put your own config values that will be passed att the construction of 
a component.

### line config table
| line config | description                                                         |
| ----------- | ------------------------------------------------------------------- |
| stack       | if the components gui ("button") stacks horizontally                |
| maxStack    | The max horizontal components (of the same) that can be on one line |
| lineHeight  | How much vertical space (px) the line should take                   |

***

## component (construction & functionality)

component template source can be found ([here](/src/componentTemp.lua))
or in roblox *(~/dialogComponents/Components/.componentTemplate)*

the *"component module script"* (as i will be referring to) constructs and updates the component 

- [construction of component](#component-construction-template-file)
- [functionality of component](#component-construction--functionality)


### component construction (template file)

In the template you will find a constructor at the bottom.  
The constructor accepts 2 parameters `ARGs & config`. ARGs can be added to
a type at the top of the template. While config is passed from the metadata.
| Parameter | Description                                                       |
| --------- | ----------------------------------------------------------------- |
| Args      | The parameters passed at ``:newComponent( -- id, -- parameter )`` |
| config    | The config table assigned in the components metadata              |


>! you have to reference
the gui instance (frame?) often stored as a child of the component module script.

>! you have to pass the correct identifier for your component (toggle would be : "toggle")

#### component construction 
```lua
export type component = baseComponent & {
	update: (self, dt: number) -> (),
    someValue: string
	
	-- more...
}

type constructorARGs = {
	label: string,
    someValueArgument: string
	-- more...
}

-- ! update & other code here in template file

--[[		component constructor		]]
local componentConstructor: {new: () -> component} = {}
componentConstructor.new = function(ARGs: constructorARGs, Config: baseConfig)
    
    -- reference your gui (frame?) here
	local ComponentInstance = script:FindFirstChild("GuiName"):Clone()
	
	local self: component = setmetatable( 
		baseComponent.new( true, ComponentInstance, Config, "component ID" ), 
		componentFunctions
	)

	local CustomConfig = Config["custom"]
	-- do something...
	--[[
		function runs when Dialog:newComponent() and the right Id is passed
		config is passed from the metadataConfig
	]]

    -- for instance do...
    --                  argument data | if nil then | config data
    self.someValue = ARGs.someValueArgument or CustomConfig["defaultValue"]

	return self
end

return componentConstructor
```

***

### component functionality (template file)

The component functionality is up to you to do, but in the template file theres a function
called ``:update()`` this runs each frame.

some LIBs used often are:
| LIB   | Description                                                                         | Documentation              |
| ----- | ----------------------------------------------------------------------------------- | -------------------------- |
| AABB  | Another choice for using buttons (if mouse is overlapping a collision box)          | [here](/docs/AABB.md)      |
| mouse | To check if mouse is occupied by other component or register that mouse is occupied | [here](/docs/mouse-lib.md) |



```lua
--[[		component functions		]]
local componentFunctions = {}
componentFunctions.__index = componentFunctions

function componentFunctions:update(dt: number)
	local self: component = self
	local config = self.config
	local gui = self.gui
	
	-- do something...
	-- update function is called each frame
	-- AABB is an important LIB check docs
	
	-- for example check if mouse is over gui
	--[[
		local guiFrame = gui:FindFirstChild("some frame")
		local guiFrameSize = guiFrame.AbsolutePosition
		local guiFramePosition = guiFrame.AbsolutePosition

		local guiFrame_AABB:AABB = {pos=guiFramePosition,size=guiFrameSize}::AABB

		local IsMouseOverGuiFrame AABB_LIB.AABB_Mouse_Overlap(guiFrame_AABB)

		if IsMouseOverGuiFrame then
			print("mouse if over gui component: ", self.ComponentID)
		end
	]]
end
```

>! I recommend looking at how other components are structured, one of the most simple
is the divider component and can be found *(~/dialogComponents/components/divider)*