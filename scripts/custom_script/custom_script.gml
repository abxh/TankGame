// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Calculate speed from acceleration and current velocity.
// Accounts also for negative direction.

function distance_covered(a, v_current, v_max) {
	if (abs(v_current) < v_max) {
		v_current += a;
	}
	return v_current;
}