/// @description left right

if (key_left and selected > selected_row * rowMaxSize) {
	selected-=1;
}
if (key_right and selected < (selected_row+1) * rowMaxSize - 1) {
	selected+=1;
}