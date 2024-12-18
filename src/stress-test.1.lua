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
local dashboardConstructor = require(script.Parent["Duckie's dashboard tool"].dashboard)
for i=1, panels do
	local dashboard = dashboardConstructor.new("title")
	for componentID, amount in components do
		for componentIndex=1, amount do
			dashboard:newComponent(componentID)
		end
	end
end