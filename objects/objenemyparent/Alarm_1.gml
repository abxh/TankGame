/// @description Calculate new path

var path = path_add();
if(mp_grid_path(GRID, path, x, y, objPlayer.x, objPlayer.y, true)){
	path_start(path, spd, path_action_continue, false);
	status = "move";
}