event_inherited();

space = keyboard_check_pressed(vk_space)
right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))
mouse1 = mouse_check_button_pressed(mb_left)
mouse2 = mouse_check_button(mb_right)
buttonHeal = keyboard_check_pressed(ord("E"))
buttonDash = keyboard_check_pressed(vk_shift)
buttonHook = keyboard_check_pressed(ord("F"))

if global.pause = 0
{
	//Inimigos:
	enemys = [instance_nearest(x,y,Obj_Arrow), instance_nearest(x,y,Obj_Enemy1), instance_nearest(x,y,Obj_Enemy2)]

	//Verificar entre todos os inimigos proximos, quem é o MAIS PROXIMO
	for (var i = 1; i < array_length(enemys); i ++)
	{
		if distance_to_object(enemys[i-1]) < distance_to_object(enemys[i])
		{
			nearestEnemy = enemys[i-1]
		}
	}

	//Sons de passo
	if horizontalSpeed != 0 and verticalSpeed=0
	{
		stepTimer--
	
		if stepTimer > stepTimerValue - 2
		{
			FootSteps()
		}
	
		if stepTimer < 0
		{
			stepTimer = stepTimerValue
		}
	}
	else
	{
		stepTimer = stepTimerValue
	}
}