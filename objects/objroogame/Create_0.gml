globalvar GRID;

var cell_size = 20;
GRID = mp_grid_create(0,0, room_width/cell_size, room_height/cell_size, cell_size , cell_size);
mp_grid_add_instances(GRID, objForest, true);
