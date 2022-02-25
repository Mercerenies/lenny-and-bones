
#macro Movement global.__module_Movement

Movement = {}

Movement.magnetAt = function(xx, yy) {
  return position_meeting(xx, yy, obj_Wall);
}

Movement.magnetsAdjacentTo = function(xx, yy) {
  var count = 0;
  for (var x1 = xx - GRID_SIZE; x1 <= xx + GRID_SIZE; x1 += GRID_SIZE) {
    for (var y1 = yy - GRID_SIZE; y1 <= yy + GRID_SIZE; y1 += GRID_SIZE) {
      if ((x1 == xx) && (y1 == yy)) {
        continue;
      }
      if (position_meeting(x1, y1, obj_Wall)) {
        count += 1;
      }
    }
  }
  return count;
};

// A bitmask of the walls adjacent to our current position, starting
// to the right and going clockwise. (Diagonals are included)
//
// The nth bit corresponds to the following.
//
// 5 6 7
// 4 . 0
// 3 2 1
Movement.sidemask = function(xx, yy) {
  var bitmask = 0;
  if (position_meeting(xx + GRID_SIZE, yy, obj_Wall)) {
    bitmask |= 1;
  }
  if (position_meeting(xx + GRID_SIZE, yy + GRID_SIZE, obj_Wall)) {
    bitmask |= 2;
  }
  if (position_meeting(xx, yy + GRID_SIZE, obj_Wall)) {
    bitmask |= 4;
  }
  if (position_meeting(xx - GRID_SIZE, yy + GRID_SIZE, obj_Wall)) {
    bitmask |= 8;
  }
  if (position_meeting(xx - GRID_SIZE, yy, obj_Wall)) {
    bitmask |= 16;
  }
  if (position_meeting(xx - GRID_SIZE, yy - GRID_SIZE, obj_Wall)) {
    bitmask |= 32;
  }
  if (position_meeting(xx, yy - GRID_SIZE, obj_Wall)) {
    bitmask |= 64;
  }
  if (position_meeting(xx + GRID_SIZE, yy - GRID_SIZE, obj_Wall)) {
    bitmask |= 128;
  }
  return bitmask;
};

// Hand arrangements work on a precedence ruleset. The first of the
// below rules to match determines where the player's hands should go.
// All of these rules have rotational symmetry, so a rotation by 90,
// 180, or 270 degrees of the diagrams below still matches.
//
// The player is at the ., a - is a wildcard, and X is a wall.
//
// Cardinal Opposite
//
// - - -
// X . X
// - - -
//
// Cardinal Corner
//
// - X -
// X . -
// - - -
//
// Cardinal Adjacent
//
// - - -
// X . -
// - - -
//
// Diagonal Opposite
//
// - - X
// - . -
// X - -
//
// Diagonal Corner
//
// X - X
// - . -
// - - -
//
// Diagonal Adjacent
//
// X - -
// - . -
// - - -
//
// Open (or Flying)
//
// - - -
// - . -
// - - -
//

enum HandDrawRule {
  CardinalOppositeNS, CardinalOppositeEW,
  CardinalCornerNW, CardinalCornerNE, CardinalCornerSW, CardinalCornerSE,
  CardinalAdjacentN, CardinalAdjacentS, CardinalAdjacentE, CardinalAdjacentW,
  DiagonalOppositeNW_SE, DiagonalOppositeNE_SW,
  DiagonalCornerN, DiagonalCornerS, DiagonalCornerE, DiagonalCornerW,
  DiagonalAdjacentNW, DiagonalAdjacentNE, DiagonalAdjacentSW, DiagonalAdjacentSE,
  Open,
}

Movement.sidemaskRule = function(sidemask) {
  show_debug_message(sidemask);
  if (sidemask & 68 == 68) {
    return HandDrawRule.CardinalOppositeNS;
  } else if (sidemask & 17 == 17) {
    return HandDrawRule.CardinalOppositeEW;
  } else if (sidemask & 80 == 80) {
    return HandDrawRule.CardinalCornerNW;
  } else if (sidemask & 65 == 65) {
    return HandDrawRule.CardinalCornerNE;
  } else if (sidemask & 20 == 20) {
    return HandDrawRule.CardinalCornerSW;
  } else if (sidemask & 5 == 5) {
    return HandDrawRule.CardinalCornerSE;
  } else if (sidemask & 64 == 64) {
    return HandDrawRule.CardinalAdjacentN;
  } else if (sidemask & 4 == 4) {
    return HandDrawRule.CardinalAdjacentS;
  } else if (sidemask & 1 == 1) {
    return HandDrawRule.CardinalAdjacentE;
  } else if (sidemask & 16 == 16) {
    return HandDrawRule.CardinalAdjacentW;
  // Decided these don't look very intuitive, so skipping them (a lower rule will match instead)
  //} else if (sidemask & 34 == 34) {
  //  return HandDrawRule.DiagonalOppositeNW_SE;
  //} else if (sidemask & 136 == 136) {
  //  return HandDrawRule.DiagonalOppositeNE_SW;
  } else if (sidemask & 160 == 160) {
    return HandDrawRule.DiagonalCornerN;
  } else if (sidemask & 10 == 10) {
    return HandDrawRule.DiagonalCornerS;
  } else if (sidemask & 130 == 130) {
    return HandDrawRule.DiagonalCornerE;
  } else if (sidemask & 40 == 40) {
    return HandDrawRule.DiagonalCornerW;
  } else if (sidemask & 32 == 32) {
    return HandDrawRule.DiagonalAdjacentNW;
  } else if (sidemask & 128 == 128) {
    return HandDrawRule.DiagonalAdjacentNE;
  } else if (sidemask & 8 == 8) {
    return HandDrawRule.DiagonalAdjacentSW;
  } else if (sidemask & 2 == 2) {
    return HandDrawRule.DiagonalAdjacentSE;
  } else {
    return HandDrawRule.Open;
  }
};

// Returns [lhs_x, lhs_y, lhs_rot, rhs_x, rhs_y, rhs_rot]. X and Y
// coordinates are normalized from 0 (top/left) to 1 (bottom/right).
// Rotation is given in the usual counterclockwise degrees.
Movement.playerHands = function(handrule) {
  switch (handrule) {
  case HandDrawRule.CardinalOppositeNS:
    return [0.5, 0, 90, 0.5, 1, 270];
  case HandDrawRule.CardinalOppositeEW:
    return [0, 0.5, 180, 1, 0.5, 0];
  case HandDrawRule.CardinalCornerNW:
    return [0, 0.5, 180, 0.5, 0, 90];
  case HandDrawRule.CardinalCornerNE:
    return [0.5, 0, 90, 1, 0.5, 0];
  case HandDrawRule.CardinalCornerSW:
    return [0.5, 1, 270, 0, 0.5, 180];
  case HandDrawRule.CardinalCornerSE:
    return [1, 0.5, 0, 0.5, 1, 270];
  case HandDrawRule.CardinalAdjacentN:
    return [0.25, 0, 90, 0.75, 0, 90];
  case HandDrawRule.CardinalAdjacentS:
    return [0.75, 1, 270, 0.25, 1, 270];
  case HandDrawRule.CardinalAdjacentE:
    return [1, 0.25, 0, 1, 0.75, 0];
  case HandDrawRule.CardinalAdjacentW:
    return [0, 0.75, 180, 0, 0.25, 180];
  case HandDrawRule.DiagonalOppositeNW_SE:
    return [1.5, 1, 270, 0, -0.5, 180];
  case HandDrawRule.DiagonalOppositeNE_SW:
    return [1, -0.5, 0, -0.5, 1, 270];
  case HandDrawRule.DiagonalCornerN:
    return [-0.5, 0, 90, 1.5, 0, 90];
  case HandDrawRule.DiagonalCornerS:
    return [1.5, 1, 270, -0.5, 1, 270];
  case HandDrawRule.DiagonalCornerE:
    return [1, -0.5, 0, 1, 1.5, 0];
  case HandDrawRule.DiagonalCornerW:
    return [0, 1.5, 180, 0, -0.5, 180];
  case HandDrawRule.DiagonalAdjacentNW:
    return [-0.5, 0, 90, 0, -0.5, 180];
  case HandDrawRule.DiagonalAdjacentNE:
    return [1, -0.5, 0, 1.5, 0, 90];
  case HandDrawRule.DiagonalAdjacentSW:
    return [0, 1.5, 180, -0.5, 1, 270];
  case HandDrawRule.DiagonalAdjacentSE:
    return [1.5, 1, 270, 1, 1.5, 0];
  case HandDrawRule.Open:
    // Special case; will be handled by the player object specifically
    // with a different animation.
    return [0, 0, 0, 0, 0, 0];
  }
}
