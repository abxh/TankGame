/// @description 

audio_stop_all();

nameCharList = ds_list_create();
nameCharList_selected = 0;
nameSize = 10;

for (i=0; i < nameSize; i++) {
	ds_list_add(nameCharList, "_")
}

alphabetCharList = ds_list_create();
rowMaxSize = 16;
for (i=97; i < 97+26; i++) {
	ds_list_add(alphabetCharList, chr(i));
}
// 26-16 = 10 + x => x=6
for (i=0; i < 6; i++) {
	ds_list_add(alphabetCharList, " ");
}
for (i=65; i < 65+26; i++) {
	ds_list_add(alphabetCharList, chr(i));
}
for (i=0; i < 6; i++) {
	ds_list_add(alphabetCharList, " ");
}

selected = 0;
selected_row = 0;
selectables = ds_list_size(alphabetCharList);
rows = ceil(selectables / rowMaxSize);