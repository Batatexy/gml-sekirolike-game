global.finalCamX = 0
global.finalCamY = 0

global.camFollowX = 0
global.camFollowY = 0

if instance_exists(Obj_Player)
{
	global.camFollowX = Obj_Player.x
	global.camFollowY = Obj_Player.y
}

camTrailSpeed = global.quarterPixel
