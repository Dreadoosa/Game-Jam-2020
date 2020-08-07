/// @description Insert description here
// You can write your code in this editor
timer++;
if (!place_meeting(x,y+grav,objWall)) {
	y+=grav;
} else {
	while(!place_meeting(x,y+sign(grav),objWall)) {
		y+=sign(grav);
	}
}
if (place_meeting(x,y+3,objWall)) {
	instance_destroy();
	var hb = instance_create_layer(x,y,"Instances_1",objEnemyHitBox);
	hb.sprite_index = sprFlyerBody;
	hb.image_alpha = 0;
	hb.timer = 5;
	hitSpark(x,y,spark_boom,1);
	cam_shake(5);
}
if (grav < 6) {
	grav += .5;
}