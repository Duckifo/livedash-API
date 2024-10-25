--[[		NOTE:
	It is not recommended to use allot of panels because the panels don't have focus rn in (v-0.01)
	For a better multi panel experience enable (~\Configuration\.experementalRenderStepped)
	(Might break something idk)
]]

local panels = 10 	--amount of panels

--		componentID | amount
local components = {
		["slider"] 	= 	10,	--amount of sliders on each panel
		["toggle"] 	= 	00,	--amount of toggles on each panel
		["button"] 	= 	00	--amount of buttons on each panel
		-- more...
}

--	construct everything
local devpanelConstructor = require(script.Parent["Duckie's devpanel tool"].devpanel)
for i=1, panels do
	local devpanel = devpanelConstructor.new("title")
	for componentID, amount in components do
		for componentIndex=1, amount do
			devpanel:newComponent(componentID)
		end
	end
end