/// @description Insert description here
// You can write your code in this editor
global.LM = load_csv("localization.csv")
global.english = ds_map_create();
global.spanish = ds_map_create();
for (var i = ds_grid_width(global.LM)-1; i >= 0; i--) {
	for (var j = ds_grid_height(global.LM)-1; j >= 0; j--) {
		if (i == 1) {
			global.english[? global.LM[# 0,j]] = global.LM[# 1,j];
		}
		if (i == 2) {
			global.spanish[? global.LM[# 0,j]] = global.LM[# 2,j]
		}
	}
}
log(global.english[? "MENU"])