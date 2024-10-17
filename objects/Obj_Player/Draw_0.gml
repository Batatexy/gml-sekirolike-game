event_inherited();

//Barra de Vida e Stamina
draw_set_alpha(0.75)
draw_rectangle_colour(global.finalCamX + 1, global.finalCamY + 1, global.finalCamX + lifeValue / 1.5, global.finalCamY + 5, 100, 100, 100, 100, false);
draw_rectangle_colour(global.finalCamX + 1, global.finalCamY + 7, global.finalCamX + staminaValue / 1.5, global.finalCamY + 11, 100, 100, 100, 100, false);

draw_set_alpha(1)
draw_rectangle_colour(global.finalCamX + 1, global.finalCamY + 1, global.finalCamX + life / 1.5, global.finalCamY + 5, c_red, c_red, c_red, c_red, false);
draw_rectangle_colour(global.finalCamX + 1, global.finalCamY + 7, global.finalCamX + stamina / 1.5, global.finalCamY + 11, c_green, c_green, c_green, c_green, false);




//Desenhar uma cordinha ao usar o grappling hook
if grapplingHook = 1 
{
	if x > nearestGrapplingHook.x + 5
	{
		draw_line_width_color(x-8,y-15,nearestGrapplingHook.x,nearestGrapplingHook.y, 1, global.c_brown, global.c_brown)
	}
	
	if x < nearestGrapplingHook.x - 5
	{
		draw_line_width_color(x+6,y-15,nearestGrapplingHook.x,nearestGrapplingHook.y, 1, global.c_brown, global.c_brown)
	}
}



