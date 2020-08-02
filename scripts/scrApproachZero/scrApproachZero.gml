// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @function                 scrApproachZero(number,increment);
/// @param {int}  number	  The number approaching zero
/// @param {int}  inc 	      The increment to approach zero by
/// @description              This function increments a number towards zero
function scrApproachZero(number, inc) {
	if (number > -inc && number < inc) {
		return 0;
	}
	if (number < 0) {
		number += inc;
		return number;
	} else {
		number -= inc;
		return number
	}
}