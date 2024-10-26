export type component = baseComponent & {
	update: (self) -> (),

	data: boolean,	-- depends if its data or input
	onEvent: () -> (),

	mouseReleased: boolean,
	lastMB1State: boolean,
	
	-- more...
}

type constructorARGs = {
	label: string,
	-- more...
}
	
--[[			Base paths			]]
local LOCAL_ROOT = script.Parent.Parent
local ROOT = LOCAL_ROOT.Parent
local LIB = ROOT:FindFirstChild("lib")


--[[		vars && imorted types	]]
local baseComponent = require(LOCAL_ROOT:FindFirstChild("baseComponent"))
local metadataTypes = require(LOCAL_ROOT:FindFirstChild("MetadataTypes"))
local TweenWrapper = require(LIB.tweenWrapper)
local mouseLib = require(LIB.Mouse)
local AABB = require(LIB.AABB)
type baseComponent = baseComponent.baseComponent
type baseConfig = metadataTypes.baseConfig
type AABB = AABB.AABB

local UIS = game:GetService("UserInputService")
local Anim = TweenWrapper(
	--			 time,		easing type,		   easing direction
	TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)	
)

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
	
end

--[[		component constructor		]]
local componentConstructor: {new: () -> component} = {}
componentConstructor.new = function(ARGs: constructorARGs, Config: baseConfig)
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

	return self
end

return componentConstructor
