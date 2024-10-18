//Deixar em fullscreen com alt + enter
var alt = keyboard_check(vk_alt) 
var enter = keyboard_check_pressed(vk_enter)

if alt and enter
{
	window_set_fullscreen(!window_get_fullscreen())
}

if global.pause = 0
{
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
}


if keyboard_check_pressed(vk_escape)
{
	global.pause = !global.pause
}

if global.restartLevel = 1
{
	FadeOut(0.01)
	if global.alpha = 0
	{
		global.pause = 0
		global.restartLevel = 2
	}
	else
	{
		global.pause = 1
	}
}