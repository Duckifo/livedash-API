local LOCAL_ROOT = script.Parent.Parent
local COMPONENTS = LOCAL_ROOT:FindFirstChild("Components")

local MetadataTypes = require(LOCAL_ROOT.MetadataTypes)
type baseComponentMetadata = MetadataTypes.baseComponentMetadata
type baseConfig = MetadataTypes.baseConfig

local config:baseConfig = {
	["line"] = {
		["stack"] = true,
		["maxStack"] = 3
	},
	["custom"] = {
		-- you can add custom variable passed in the component update (color?, formating?)
	}
}::baseConfig

return {
	version="0.01",
	lastUpdated="19/09/2024",
	publisher="duckifo",
	
	componentID = "***** template id *****",
	
	module=COMPONENTS:FindFirstChild("componentName"),
	config = config
}::baseComponentMetadata