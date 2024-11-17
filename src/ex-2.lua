-- create the dashboard
local dashboardConstructor = require(script.Parent["livedash-API"].dashboard)
local dashboard = dashboardConstructor.new()

-- create and add all components
local anchord_toggle = dashboard:newComponent("toggle", {label="anchor"})
local transparent_toggle = dashboard:newComponent("toggle", {label="transp"})
local size_slider = dashboard:newComponent("slider", {data=3, range=NumberRange.new(0, 10), label="size"})
local create_button = dashboard:newComponent("button", {label="create"})

print(transparent_toggle)
print(size_slider)

-- bind the .onClicked to a function
create_button.onClicked = function()
	local part = Instance.new("Part")
	
	part.Anchored = anchord_toggle.data
	part.Transparency = transparent_toggle.data and 0.5 or 0
	part.Size = Vector3.new(size_slider.data, size_slider.data, size_slider.data)
	
	part.Parent = workspace
end




