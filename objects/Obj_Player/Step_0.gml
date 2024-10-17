event_inherited();

space = keyboard_check_pressed(vk_space)
right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))
mouse1 = mouse_check_button_pressed(mb_left)
mouse2 = mouse_check_button(mb_right)
buttonHeal = keyboard_check_pressed(ord("E"))
buttonDash = keyboard_check_pressed(vk_shift)
buttonHook = keyboard_check_pressed(ord("F"))

//Definir quem é o inimigo mais próximo
if instance_exists(Obj_Enemy1)
{
	nearestEnemy = instance_nearest(x,y,Obj_Enemy1)
}
else
{
	nearestEnemy = false
	nearestEnemyDirection = false
}

if global.pause = 0
{
	//Sons de 
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