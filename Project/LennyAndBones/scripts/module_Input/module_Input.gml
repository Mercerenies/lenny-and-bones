
#macro Input global.__module_Input

Input = {}

Input.getDirection = function() {
  if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    return InputKey.Right;
  } else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    return InputKey.Down;
  } else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    return InputKey.Left;
  } else if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    return InputKey.Up;
  } else {
    return InputKey.None;
  }
}
