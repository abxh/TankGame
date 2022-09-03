/// @description up down

if (key_up and (selected_row-1) >= 0) {
	selected-=rowMaxSize;
	selected_row-=1;
}
if (key_down and (selected_row+1) < rows) {
	selected+=rowMaxSize;
	selected_row+=1;
}