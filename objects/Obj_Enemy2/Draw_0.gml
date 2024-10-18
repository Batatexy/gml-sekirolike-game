event_inherited();


var redColor = 0
var greenColor = 200
var blueColor = 200

image_blend = make_color_rgb(red - redColor,green - greenColor,blue - blueColor)

var varX = -12
var varY = -38

//Barra de Vida
draw_set_alpha(0.75)
draw_rectangle_colour(x + 1 + varX, y + 1 + varY, x + lifeValue / 5 + varX, y + 3 + varY, 100, 100, 100, 100, false);

draw_set_alpha(1)
draw_rectangle_colour(x + 1 + varX, y + 1 + varY, x + life / 5 + varX, y + 3 + varY, c_red, c_red, c_red, c_red, false);

