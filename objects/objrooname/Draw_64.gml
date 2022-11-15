/// @description

var x_ref = 500;
var y_ref = 200;
var row_height = 64;
draw_set_font(fntClearSansMediumLarge);

var name = "";
for (i=0; i < nameSize; i++) {
	name+=ds_list_find_value(nameCharList, i)+" ";
}
draw_text(x_ref + 130, y_ref, name);


for (i=0; i < rows; i++) {	
	var row = "";
	for (j=0 + rowMaxSize * i; j < rowMaxSize * (i+1); j++) {
		var val = ds_list_find_value(alphabetCharList, j);
		if (is_undefined(val)) break; // Terminate for loop at undefined element.
		
		if (j == selected) {
			row+="["+val+"]";
		} else {
			if (j==rowMaxSize*i) row+=" "; // Start of row.
			row+=val+" ";
		}
	}
	if (i >= 2) padding = row_height else padding = 0
	
	draw_text(x_ref, y_ref + 30 + row_height * (i+1) + padding, row);
}

draw_set_font(fntClearSansMedium);
draw_text(x_ref -30, y_ref + 30 + row_height * (rows + 3),
	    "Press Circle/Spacebar to insert, Triangle/Shift to delete."
	 +"\n"
	 +"\nFill the rest of the name with spaces to confirm name."
	 +"\n(Spaces comes after the alphabets.)");