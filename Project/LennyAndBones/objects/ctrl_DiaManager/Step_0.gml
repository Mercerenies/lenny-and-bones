
layer_set_visible(tiles_dia, isActive());

if (isActive()) {
  var curr = getCurrent();
  var text = curr.text;

  display_text = string_copy(text, 1, string_length(display_text) + 1);

  if (Input.confirmPressed()) {
    if (display_text != text) {
      display_text = text;
    } else {
      advance();
    }
  }

} else {

  if (ctrl_RoomManager.acceptingInput()) {
    if (Input.helpPressed()) {
      reset();
    }
  }

}
