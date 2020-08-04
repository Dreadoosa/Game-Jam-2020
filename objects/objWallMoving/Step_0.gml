/// @description Insert description here
// You can write your code in this editor
log(dir);
if (dir == 1) {
	x += 2;
	#region move player
	var p = instance_place(x,y-1,objPlayer)
	if (p != noone && !action_script_left()) {
		p.x+=2;
	}
	var p = instance_place(x+3,y,objPlayer)
	if (p != noone) {
		p.x+=3;
	}
	#endregion
	#region move enemy
	var p = instance_place(x,y-1,objEnemy)
	if (p != noone) {
		p.x+=2;
	}
	var p = instance_place(x+3,y,objEnemy)
	if (p != noone) {
		p.x+=3;
	}
	#endregion	
} else if (dir == 3) {
	x-=2;
	#region move player
	var p = instance_place(x,y-1,objPlayer)
	if (p != noone && !action_script_right()) {
		p.x-=2;
	}
	var p = instance_place(x-3,y,objPlayer)
	if (p != noone) {
		p.x-=3;
	}
	#endregion
	#region move enemy
	var p = instance_place(x,y-1,objEnemy)
	if (p != noone) {
		p.x-=2;
	}
	var p = instance_place(x-3,y,objEnemy)
	if (p != noone) {
		p.x-=3;
	}
	#endregion
}
