--[[		setup			]]
local Camera = workspace.CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable

local player = game.Players.LocalPlayer
local character: Model = player.Character

for i, inst in character:GetChildren() do
	if inst:IsA("Accessory") then inst:Destroy() end
	if not inst:IsA("BasePart") then continue end
	inst.Transparency = 1
end

local raycastParam = RaycastParams.new()
raycastParam.FilterDescendantsInstances = {workspace}
raycastParam.FilterType = Enum.RaycastFilterType.Include

local a = Instance.new("Part", workspace)
a.Anchored = true
a.Transparency = 1

local at0 = Instance.new("Attachment", a)
local at1 = Instance.new("Attachment", a)

local beam = Instance.new("Beam", workspace)
beam.Attachment0 = at0
beam.Attachment1 = at1


--[[		setup gui		]]
local dashboardConstructor = require(script.Parent["Duckie's dashboard tool"].dashboard)
local rs = game:GetService("RunService")

local StartingPointA = Vector3.zero + 		(Vector3.yAxis * 3)
local StartingPointB = Vector3.new(3,0,0) + (Vector3.yAxis * 3)

local pointA = StartingPointA
local pointB = StartingPointB

local dashboard = dashboardConstructor.new()
local MoveCameraEnabled = dashboard:newComponent("toggle", {label="mv cam", data=true})

dashboard:newComponent("divider", {height=12})

local slider_param = {data=1, range=NumberRange.new(0, 5)}
local A_X = dashboard:newComponent("slider", setmetatable(slider_param, {__index = {label = "pointA X"}}) )
local A_Y = dashboard:newComponent("slider", setmetatable(slider_param, {__index = {label = "pointA Y"}}) )
local A_Z = dashboard:newComponent("slider", setmetatable(slider_param, {__index = {label = "pointA Z"}}) )

dashboard:newComponent("divider", {height=12})

local B_X = dashboard:newComponent("slider", setmetatable(slider_param, {__index = {label = "pointB X"}}) )
local B_Y = dashboard:newComponent("slider", setmetatable(slider_param, {__index = {label = "pointB Y"}}) )
local B_Z = dashboard:newComponent("slider", setmetatable(slider_param, {__index = {label = "pointB Z"}}) )

dashboard:newComponent("divider", {height=15})

local raycast = dashboard:newComponent("button", {label="raycast"} )


--[[		functions		]]
function avrageVec3(vec1: Vector3, vec2: Vector3): Vector3
	return Vector3.new(
		(vec1.X + vec2.X) / 2,
		(vec1.Y + vec2.Y) / 2,
		(vec1.Z + vec2.Z) / 2
	)
end

rs.RenderStepped:Connect(function()
	local Vec3_A = Vector3.new(A_X.data, A_Y.data, A_Z.data)
	local Vec3_B = Vector3.new(B_X.data, B_Y.data, B_Z.data)
	
	local A = StartingPointA + Vec3_A
	local B = StartingPointB + Vec3_B
	
	pointA = A
	pointB = B
	
	local avrageVector = avrageVec3(A, B)
	
	at0.Position = A
	at1.Position = B
	
	if not MoveCameraEnabled.data then return end
	
	Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, avrageVector, Vector3.new(0, 1, 0))
end)

-- raycast
raycast.onClicked = function()
	local direction = (pointB - pointA).unit
	local distance = (pointB - pointA).magnitude
	
	local result = workspace:Raycast(pointA, direction * distance, raycastParam)
	if result then
		print("instance colided: ", result.Instance)
	else
		print("no instance found!")
	end
end