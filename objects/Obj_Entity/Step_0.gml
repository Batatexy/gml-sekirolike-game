if global.pause = 0
{

x += horizontalSpeed
y += verticalSpeed

RGBChange()

nearestGrapplingHook = instance_nearest(x,y,Obj_GrapplingHookTarget)
nearestGrapplingHookDirection = point_direction(x,0,nearestGrapplingHook.x,0)

//Parte de movimentação, desenvolvida por: Peyton Burnham
//Força Horizontais
horizontalSpeed = (moveDirection * moveSpeed) + forceMove

if place_meeting(x + horizontalSpeed, y, Obj_Wall)
{
	var pixelCheck = global.subPixel * sign(horizontalSpeed)
	while !place_meeting(x + pixelCheck, y, Obj_Wall)
	{
		x += pixelCheck
	}

	horizontalSpeed = 0
}

//Força Verticais
verticalSpeed += gravitySpeed

if place_meeting(x,y + verticalSpeed, Obj_Wall)
{
	var pixelCheck = global.subPixel * sign(verticalSpeed)
	while !place_meeting(x , y + pixelCheck, Obj_Wall)
	{
		y += pixelCheck
	}
	verticalSpeed = 0
}

//Impedir que ultrapasse do limite
if stamina >= staminaValue
{
	stamina = staminaValue
	recoverMaxStamina = 0
}

if life >= lifeValue
{
	life = lifeValue
}

//Definir a direção que o inimigo está olhando
if instance_exists(nearestEnemy)
{
	nearestEnemyDirection = nearestEnemy.image_xscale
}
else
{
	nearestEnemyDirection = false
}

//Todos os comandos que são impedidos ao zerar a vida
if life > 0
{
	//Iniciar o deflect
	if mouse2 and attack = 0 and dash = 0 and grapplingHook = 0
	{
		if deflect = 0
		{
			switch object_index
			{
				case Obj_Player:
				{
					FootSteps()
					sprite_index = Spr_Player_Deflect
					break
				}
			
				case Obj_Enemy1:
				{
					sprite_index = Spr_Enemy1_Deflect
					break
				}
			}
			deflect = 1
		}
	}
	//Finalizar após ser realizado algo
	else if (deflect != 0)
	{
		//resetar a janela de parry ao acertar parrys
		if tackingHitTimer >= tackingHitTimerValue -1
		{
			deflectTimer = -deflectTimerValue/2
		}
		deflect = 0
	}
	//Esse algo é realizado aqui
	if deflect = 1
	{
		if deflectTimer < deflectTimerValue/2
		{
			deflect = 2
			deflectTimer = -deflectTimerValue/2
		}
		else
		{
			//resetar a janela de parry ao acertar parrys
			if tackingHitTimer >= tackingHitTimerValue -1
			{
				deflectTimer--
			}
		}
	}

	if dash = 1
	{
		dashTimer--
		
		moveSpeed = 0
		forceMove = 3.25 * image_xscale
		
		switch object_index
		{
			case Obj_Player:
			{
				sprite_index = Spr_Player_Running
				image_index = 2
				break
			}
			
			case Obj_Enemy1:
			{
				sprite_index = Spr_Enemy1_Running
				image_index = 1
				break
			}
		}
		
		if dashTimer < 0
		{
			dashTimer = dashTimerValue
			dash = 0
		}
	}
	
	if grapplingHook = 1
	{
		moveSpeed = 0
		forceMove = 5 * image_xscale
		
		if nearestGrapplingHookDirection = 180
		{
			image_xscale = -1
		}
		else
		{
			image_xscale = 1
		}
		
		if y > nearestGrapplingHook.y - 10
		{
			verticalSpeed = jumpSpeed / 1.25
		}
		
		if  x > nearestGrapplingHook.x - 5 and  x < nearestGrapplingHook.x + 5
		{
			forceMove = 0
			grapplingHook = 2
		}
	}
	
	if grapplingHook = 2
	{
		if verticalSpeed = 0
		{
			grapplingHook = 0
		}
	}
	
	//O personagem sempre leva o golpe, mas a partir disso, algumas ações podem ser executadas, como defender, parry ou tomar o hit
	//Para o Player os inimigos são Inimigos1 por exemplo, para os inimigos o inimigo é o Player
	if instance_exists(Obj_Enemy1)
	{
		if nearestEnemy.sprite_index != Spr_Enemy1_Deflect and
		//Enemy1
		(nearestEnemy.sprite_index = Spr_Enemy1_Attack1 and nearestEnemy.image_index > 3) or
		(nearestEnemy.sprite_index = Spr_Enemy1_Attack2 and nearestEnemy.image_index > 3) or
		(nearestEnemy.sprite_index = Spr_Enemy1_Attack3 and nearestEnemy.image_index > 3) or
		(nearestEnemy.sprite_index = Spr_Enemy1_Attack4 and nearestEnemy.image_index > 7 and nearestEnemy.image_index < 10) or

		//Player
		(nearestEnemy.sprite_index = Spr_Player_Attack1 and nearestEnemy.image_index > 0) or
		(nearestEnemy.sprite_index = Spr_Player_Attack2 and nearestEnemy.image_index > 0)
		{
			tackingHitFunction()
		}
		else
		{
			if dash = 0 and grapplingHook = 0
			{
				forceMove = 0
			}
		}
	}
	
	//Tempo de invencibilidade restaurando
	if tackingHit != 0
	{
		tackingHitTimer--
				
		if tackingHitTimer < 0
		{
			tackingHitTimer = tackingHitTimerValue
			tackingHit = 0
		}
	}
		
	//Timer da vida subindo aos poucos
	if isHealing = 1
	{
		isHealingTimer--
		life += healValue
	
		if isHealingTimer < 0
		{
			isHealing = 0
			isHealingTimer = isHealingTimerValue
		}
	}
	
	//Recarregar o timer do parry quando não estiver defendendo
	if deflect = 0
	{	
		if deflectTimer <= deflectTimerValue
		{
			deflectTimer++
		}
	}
	
	//Ter Stamina > 0 para realizar ações a seguir:
	if stamina > 0
	{
		//Flipar o personagem
		if moveDirection != 0
		{
			image_xscale = moveDirection
		}
			
		//Aumentar stamina bem de pouquinho
		if stamina > 0
		{
			stamina += 0.0025
		}

		//Sobrepror o inimigo quando atacar
		if attack = 0
		{
			switch object_index
			{
				case Obj_Player:
				{
					layer = layer_get_id("InstancesPlayer")
				}
		
				case Obj_Enemy1:
				{
					layer = layer_get_id("InstancesEnemies")
				}
			}
		}
		else
		{
			switch object_index
			{
				case Obj_Player:
				{
					layer = layer_get_id("UpInstancePlayer")
				}
		
				case Obj_Enemy1:
				{
					layer = layer_get_id("UpInstanceEnemies")
				}
			}
		}

		//No Chão
		if verticalSpeed = 0
		{
			if buttonDash and attack = 0 and deflect = 0 and grapplingHook = 0
			{
				dash = 1
			}
			
			
			if (nearestGrapplingHookDirection = 180 and image_xscale = -1) or  (nearestGrapplingHookDirection = 0 and image_xscale = 1)
			{
				if !instance_exists(Obj_GrapplingHookPoint)
				{
					instance_create_layer(nearestGrapplingHook.x, nearestGrapplingHook.y, "UI" , Obj_GrapplingHookPoint)
				}
				
				if buttonHook and attack = 0 and deflect = 0 and dash = 0 and place_meeting(x,y,nearestGrapplingHook)
				{
					grapplingHook = 1
					//Emitir som de grappling hook
				}
			}
			else
			{
				if instance_exists(Obj_GrapplingHookPoint)
				{
					instance_destroy(Obj_GrapplingHookPoint)
				}
			}
			
			//Iniciar o Ataque/ verificar qual objeto que é e o tipo de ataque 
			if mouse1 and attack = 0 and deflect = 0 and dash = 0 and grapplingHook = 0
			{
				switch object_index
				{
					case Obj_Player:
					{
						switch attackType
						{
							case 1:
							{
								sprite_index = Spr_Player_Attack1
								break
							}
						
							case 2:
							{
								sprite_index = Spr_Player_Attack2
								break
							}
						}
						break
					}
						
					case Obj_Enemy1:
					{
						switch attackType
						{
							case 1:
							{
								sprite_index = Spr_Enemy1_Attack1
								break
							}
						
							case 2:
							{
								sprite_index = Spr_Enemy1_Attack2
								break
							}
			
							case 3:
							{
								sprite_index = Spr_Enemy1_Attack3
								break
							}
			
							case 4:
							{
								sprite_index = Spr_Enemy1_Attack4
								audio_play_sound(Danger, 20, false, 1, 0);
								break
							}
						}
						break
					}
				}
				Attacks()
				image_index = 0
				attack = 1
			}

			//Executar o ataque
			if attack = 1
			{		
				if image_index >= image_number - 1
				{
					if object_index = Obj_Player
					{
						FootSteps()
					}
		
					attack = 2
				}
			}
			//Resetar o ataque
			if attack = 2
			{
				if object_index =  Obj_Player
				{
					attackType++
	
					if attackType >= 3
					{
						attackType = 1
					}
				}
	
				attack = 0
			}
			
		//Curar Vida
		if buttonHeal and attack = 0 and deflect = 0 and dash = 0 and grapplingHook = 0
		{
			if things > 0
			{
				if heal = 0
				{
					moveSpeed = defaultMoveSpeed / 2
					image_speed = 0.5
					heal = 1
				}
			}
			else
			{
				green = 115
				blue = 115
			}
		}

		//Timer para beber a cura
		if heal = 1 and attack = 0 and deflect = 0 and dash = 0 and grapplingHook = 0
		{
			healTimer--
	
			if healTimer < 0
			{
				healTimer = healTimerValue
				
				moveSpeed = defaultMoveSpeed
				image_speed = 1
				
				red = 5
				blue = 5
				
				things--
		
				isHealing = 1
				heal = 0
			}
		}
		else
		{
			healTimer = healTimerValue
			
			if dash = 0 and grapplingHook = 0
			{
				moveSpeed = defaultMoveSpeed
			}
			
			image_speed = 1
			heal = 0
		}
			
			if deflect =0 and attack = 0 and dash = 0 and grapplingHook = 0
			{
				//Pular
				if space and place_meeting(x,y +1, Obj_Wall)
				{
					verticalSpeed = jumpSpeed
	
					if object_index = Obj_Player
					{
						FootSteps()
					}
				}
				
				//Desenvolvido por: Peyton Burnham, Direção que o personagem anda
				moveDirection = right - left
				
				//Correndo
				if horizontalSpeed != 0 and moveDirection != 0
				{
					switch object_index 
					{
						case Obj_Player:
						{
							sprite_index = Spr_Player_Running
							break
						}
						
						case Obj_Enemy1:
						{
							sprite_index = Spr_Enemy1_Running
							break
						}
					}
				}
				//Parado
				else
				{
					switch object_index
					{
						case Obj_Player:
						{
							sprite_index = Spr_Player_Idle
							break
						}
						
						case Obj_Enemy1:
						{
							sprite_index = Spr_Enemy1_Idle
							break
						}
					
					}
				}
			}
			else if dash != 0 or grapplingHook != 0
			{
				//Programar algo
			}
			else
			{
				moveDirection = 0
			}
			
			
			
		}
		
		//No Ar
		
		else
		{
			ElseThings()
			
			//Pular
			switch object_index
			{
				case Obj_Player:
				{
					sprite_index = Spr_Player_Running
					break
				}
					
				case Obj_Enemy1:
				{
					sprite_index = Spr_Enemy1_Running
					break
				}
			}
			//Pulando
			if verticalSpeed < 0
			{
				switch object_index
				{
					case Obj_Player:
					{
						image_index = 1
						break
					}
					
					case Obj_Enemy1:
					{
						image_index = 0
						break
					}
				}
				
			}
			//Caindo
			else if verticalSpeed > 0
			{
				switch object_index
				{
					case Obj_Player:
					{
						image_index = 2
						break
					}
					
					case Obj_Enemy1:
					{
						image_index = 1
						break
					}
				}
			}
		//Fim verticalSpeed = 0
		}
	}
	//Stamina <= 0
	else
	{
		ElseThings()
		stamina = 0
		
		//Quebra de Defesa
		if verticalSpeed = 0 and horizontalSpeed = 0
		{
			switch object_index
			{
				case Obj_Player:
				{
					if sprite_index != Spr_Player_Crouch
					{
						sprite_index = Spr_Player_Crouch
						image_index = 0
					}
					break
				}
					
				case Obj_Enemy1:
				{
					if sprite_index != Spr_Enemy1_Crouch
					{
						sprite_index = Spr_Enemy1_Crouch
						image_index = 0
					}
					break
				}
			}
			
			if image_index >= image_number - 1
			{
				stamina = staminaValue
			}
		}
	//End if stamina > 0
	}
}
//Life <= 0
else
{
	ElseThings()
	life = 0
	
	if lifeValue <= 0
	{
		lifeValue = 0
	}
	
	if staminaValue <= 0
	{
		staminaValue = 0
	}
		
	//Morreu
	if verticalSpeed = 0
	{
		horizontalSpeed = 0
		forceMove = 0
		
		switch object_index
		{
			case Obj_Player:
			{
				if sprite_index != Spr_Player_Die
				{
					Deaths()
					sprite_index = Spr_Player_Die
					
					if stamina <= 0
					{
						image_index = 7
					}
				}
				
				lifeValue -= 0.2
				staminaValue -=0.25
				break
			}
			
			case Obj_Enemy1:
			{
				if sprite_index != Spr_Enemy1_Die
				{
					Deaths()
					sprite_index = Spr_Enemy1_Die
				}
				
				lifeValue -= 1.25
				staminaValue -=1.25
								
				if lifeValue <= 0
				{
					instance_destroy()
				}
				break
			}
		}
		
		if image_index > image_number - 1
		{
			image_index = image_number - 1
		}
	}
//End if life > 0
}

}
else
{
	image_speed = 0
}