
#macro Blocks global.__module_Blocks

Blocks = {};

// Image index on spr_Tetromino.
Blocks.fromIndex = function(idx) {
  switch (idx) {
  case 0:
    return Blocks.shapeO();
  case 1:
    return Blocks.shapeL();
  case 2:
    return Blocks.shapeJ();
  case 3:
    return Blocks.shapeT();
  case 4:
    return Blocks.shapeI();
  case 5:
    return Blocks.shapeS();
  case 6:
    return Blocks.shapeZ();
  }
  return Blocks.shapeO();
}

Blocks.shapeO = function() {
  return new Tetromino([
    new Point(0, 0), new Point(1, 0),
    new Point(0, 1), new Point(1, 1),
  ]);
};

Blocks.shapeL = function() {
  return new Tetromino([
    new Point(0, -1),
    new Point(0,  0),
    new Point(0,  1), new Point(1, 1),
  ]);
};

Blocks.shapeJ = function() {
  return new Tetromino([
                      new Point(0, -1),
                      new Point(0,  0),
    new Point(-1, 1), new Point(0,  1),
  ]);
};

Blocks.shapeT = function() {
  return new Tetromino([
    new Point(0, -1),
    new Point(0,  0), new Point(1, 0),
    new Point(0,  1),
  ]);
};

Blocks.shapeI = function() {
  return new Tetromino([
    new Point(0, -1),
    new Point(0,  0),
    new Point(0,  1),
    new Point(0,  2),
  ]);
};

Blocks.shapeS = function() {
  return new Tetromino([
    new Point(0, -1),
    new Point(0,  0), new Point(1, 0),
                      new Point(1, 1),
  ]);
};


Blocks.shapeZ = function() {
  return new Tetromino([
                      new Point(0, -1),
    new Point(-1, 0), new Point(0,  0),
    new Point(-1, 1),
  ]);
};
