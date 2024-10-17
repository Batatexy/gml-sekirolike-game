if keyboard_check_pressed(ord("Q"))
{
	trigger = !trigger
	
	if trigger
	{
		global.camFollowX = Obj_Player.x
		global.camFollowY = Obj_Player.y
	}
}

if !trigger
{
	global.camFollowX = Obj_Player.x
	global.camFollowY = Obj_Player.y
}


if keyboard_check_pressed(vk_escape)
{
	global.pause = !global.pause
}