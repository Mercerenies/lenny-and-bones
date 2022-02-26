
display_text = "";

dia = [];
dia_pos = 0;

tiles_dia = layer_get_id("Tiles_Dia");

if (global.hideDialogue) {
  global.hideDialogue = false;
  dia_pos = 999;
}

isActive = function() {
  return (dia_pos >= 0) && (dia_pos < array_length(dia));
}

getCurrent = function() {
  return dia[dia_pos];
}

advance = function() {
  dia_pos++;
  display_text = "";
}

reset = function() {
  dia_pos = 0;
  display_text = "";
}
