function tackingHitFunction()
{
	if place_meeting(x,y,nearestEnemy)
	{
		if tackingHit = 0
		{
			//Parry ou defender
			if deflect != 0 and stamina > 0
			{
				//Parry
				if deflect = 1
				{
					//MegaParrys
					if nearestEnemy.sprite_index = Spr_Enemy1_Attack4
					{
						MegaParrys()
					}
					else
					{
						Parrys()
					}
					
					nearestEnemy.stamina -= 15
							
					//resetar a janela de parry ao acertar parrys
					deflectTimer = deflectTimerValue
					stamina -= 2.5
				}
				//Defendeu
				else if deflect = 2
				{
					Deflects()
					nearestEnemy.stamina -= 5
					stamina -= 10
					
					//Ataque forte
					if nearestEnemy.sprite_index = Spr_Enemy1_Attack4
					{
						stamina -= staminaValue
						
						if nearestEnemyDirection = 1
						{
							forceMove = 2
						}
						else if nearestEnemyDirection = -1
						{
							forceMove = -2
						}
					}
					//Ataques comuns
					else
					{
						if nearestEnemyDirection = 1
						{
							forceMove = 0.1
						}
						else if nearestEnemyDirection = -1
						{
							forceMove = -0.1
						}
					}
				}
				else
				{
					forceMove = 0
				}
			}
			//Tomou dano
			else
			{
				green = 55
				blue = 55
					
				if sprite_index != Spr_Player_Die and sprite_index != Spr_Enemy1_Die
				{
					Moans()
				}
				
				//Ataque forte
				if nearestEnemy.sprite_index = Spr_Enemy1_Attack4
				{
					life -= global.damageDefault * 2
					stamina -= staminaValue
				
					if nearestEnemyDirection = 1
					{
						forceMove = 4
							
					}
					else if nearestEnemyDirection = -1
					{
						forceMove = -4
					}
				}
				//Ataque comum
				else
				{
					life -= global.damageDefault
				}
			}
				
			tackingHit = 1
		}
	}
}