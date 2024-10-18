event_inherited();

nearestEnemy = Obj_Player

attackTimer --

//Programação da IA do Inimigo 1
if global.pause = 0
{
	if Obj_Player.sprite_index != Spr_Player_Die
	{
		if attackTimer < 0
		{
			instance_create_layer(x,y-15,"UpInstancePlayer", Obj_Arrow)
			attackTimer = attackTimerValue
		}
	}
	else
	{
		disableCommands()
	}
}
else
{
	disableCommands()
}