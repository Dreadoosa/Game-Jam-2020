/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (other.active && invuln == 0) {
	if(!self.disabled) {
		repeat(8) {
		var gear = instance_create_layer(x+irandom_range(-5,5),y+irandom_range(-5,5),"Instances_1",objGear)
		gear.grav = irandom_range(-3,-6)
		gear.dir = -other.image_xscale * 5;
		var gear = instance_create_layer(x+irandom_range(-5,5),y+irandom_range(-5,5),"Instances_1",objGear1)
		gear.grav = irandom_range(-3,-6)
		gear.dir = -other.image_xscale * 5;
		}
		hitSpark(x + irandom_range(-3,3),y-16 + irandom_range(-3,3),spark_hit,1);
	}
	if (self.disabled) {
		hitSpark(x + irandom_range(-3,3),y-16 + irandom_range(-3,3),spark_blocked_red,1);
	}
	knockx = other.force * other.dir;
	knocky = -other.force
	invuln = 10;
	hp--;
	cam_shake(3);
	audio_sound(sfx_hit);
}