event_inherited();

nearestEnemy = Obj_Player

//Programação da IA do Inimigo 1
if Obj_Player.sprite_index != Spr_Player_Die
{
	if place_meeting(x - 15,y,Obj_Player)
	{
		left = false
		right = false
		attackTimer--
		
		//Atacar
		if attackTimer <= 0
		{
			if lastAttckType = 4
			{
				attackType = int64(random_range(1,4))
			}
			else
			{
				attackType = int64(random_range(1,5))
			}
			 lastAttckType = attackType
			
			mouse2 = false
			mouse1 = true
			
			if attackType = 4
			{
				attackTimer = attackTimerValue * 1.5
			}
			else
			{
				attackTimer = attackTimerValue
			}
		}
		else
		{
			mouse1 = false
			mouse2 = true
		}
	}
	//Correr em direção do Player
	else
	{
		mouse1 = false
		mouse2 = false
		
		if nearestEnemyDirection = -1 //and !place_meeting(x+50,y,Obj_Enemy1)
		{
			right = true
			left = false
		}
		else if nearestEnemyDirection = 1 //and !place_meeting(x-50,y,Obj_Enemy1)
		{
			left = true
			right = false
		}
		else
		{
			right = false
			left = false
		}
	}
}
else
{
	mouse1 = false
	mouse2 = false
	space = false
	left = false
	right = false
}