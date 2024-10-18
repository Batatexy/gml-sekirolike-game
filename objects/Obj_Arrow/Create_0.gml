nearestObject = instance_nearest(x,y,Obj_Enemy2)
speedValue = 5
speed = speedValue
direction = point_direction(x,y,Obj_Player.x,Obj_Player.y-15)
image_angle = direction

timer = 2
trigger = 0

stamina = 1

imageXscale = nearestObject.image_xscale