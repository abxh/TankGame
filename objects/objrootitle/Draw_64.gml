/// @description

draw_set_font(fntClearSansLargeLarge);
draw_text(280,300,"Nature's Revenge");

draw_set_font(fntClearSansMedium);
if (LOADINGSTATE == 0) {
	draw_text(680,500,"Click any key to start.");
} else {
	draw_text(680,500,"Click any key to restart.");
}