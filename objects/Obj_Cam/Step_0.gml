if !instance_exists(Obj_Player) exit

var camWidth = camera_get_view_width(view_camera[0])
var camHeight = camera_get_view_height(view_camera[0])

var camX = global.camFollowX - camWidth/2
var camY = global.camFollowY - camHeight/1.3

global.finalCamX += (camX - global.finalCamX) * camTrailSpeed
global.finalCamY += (camY - global.finalCamY) * camTrailSpeed

camera_set_view_pos(view_camera[0], global.finalCamX, global.finalCamY)

//Deixar em fullscreen com alt + enter
var alt = keyboard_check(vk_alt) 
var enter = keyboard_check_pressed(vk_enter)

if alt and enter
{
	window_set_fullscreen(!window_get_fullscreen())
} 