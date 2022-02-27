
if (canRotate) {
  if (Input.wheelDown()) {
    globalBlockRot = (globalBlockRot + 1) % 4;
  } else if (Input.wheelUp()) {
    globalBlockRot = (globalBlockRot + 3) % 4;
  }
}

with (obj_TetrominoCounter) {
  image_angle = - other.globalBlockRot * 90;
}

if (Input.mouseDown()) {
  var highlighted = getHighlightedTetromino();
  if (instance_exists(highlighted)) {
    draggingTetromino = highlighted.image_index;
    draggingX = mouse_x - highlighted.x;
    draggingY = mouse_y - highlighted.y;
  }
}

if (Input.mouseUp()) {

  if ((acceptingInput()) && (!is_undefined(draggingTetromino))) {
    var tetromino = toTetromino();
    var target = getMouseTarget();
    if (!is_undefined(target)) {

      ctrl_UndoManager.pushStack(UndoCut);

      with (instance_create_layer(obj_Player.x + GRID_SIZE / 2, obj_Player.y + GRID_SIZE / 2, "Instances_UI", obj_ThrowingAnim)) {
        dest_x = target.xx + GRID_SIZE / 2;
        dest_y = target.yy + GRID_SIZE / 2;
        image_index = other.draggingTetromino;
        on_arrive = {
          "tetromino": tetromino,
          "target": target,
          "call": function() {
            tetromino.placeAt(target.xx, target.yy);
            ctrl_ParticleManager.puffOfClouds(target.xx + GRID_SIZE / 2, target.yy + GRID_SIZE / 2);
            with (obj_BombTile) {
              checkPoisonRelease();
            }
          }
        };
      }
      with (obj_TetrominoCounter) {
        if (other.draggingTetromino == image_index) {
          count -= 1;
          ctrl_UndoManager.pushStack(new DecrementCounterEvent(self));
        }
      }

    }
  }

  draggingTetromino = undefined;
  draggingX = 0;
  draggingY = 0;
}

if (Input.escPressed()) {
  if (!ctrl_DiaManager.isActive()) {
    global.hideDialogue = true;
    room_restart();
  }
}

if ((Input.backspacePressed()) && (canUndo())) {
  ctrl_UndoManager.backtrack();
}

if (Input.escDown()) {
  _escTimer += 1;
  if (_escTimer > 180) {
    // DEBUG CODE (Change to title page)
    room_goto(rm_Stage1);
  }
} else {
  _escTimer = 0;
}

// Sand particle effects
ctrl_ParticleManager.sandyWinds();
