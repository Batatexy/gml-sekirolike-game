//Código feito por: Peyton Burnham
if !instance_exists(Obj_Player) exit

if global.pause = 0
{
	var camWidth = camera_get_view_width(view_camera[0])
	var camHeight = camera_get_view_height(view_camera[0])

	var camX = global.camFollowX - camWidth/2
	var camY = global.camFollowY - camHeight/1.3

	global.finalCamX += (camX - global.finalCamX) * camTrailSpeed
	global.finalCamY += (camY - global.finalCamY) * camTrailSpeed

	camera_set_view_pos(view_camera[0], global.finalCamX, global.finalCamY)
}