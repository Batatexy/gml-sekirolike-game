if global.pause = 0
{
	speed = speedValue
	
	if place_meeting(x,y,Obj_Player) and trigger = 0
	{
		//Emitir som de flecha
		trigger = 1
	
		if Obj_Player.sprite_index = Spr_Player_Deflect
		{
			if stamina < 0
			{
				instance_destroy()
			}
		}
	}

	if place_meeting(x,y,Obj_Wall)
	{
		trigger = 1
	}

	if trigger = 1
	{
		timer--
	
		if timer = 0
		{
			if place_meeting(x,y,Obj_Wall)
			{
				instance_create_layer(x,y,"UpInstancePlayer", Obj_Arrow_Prop)
			}
			instance_destroy()
		}
	}
}
else
{
	speed = 0
}