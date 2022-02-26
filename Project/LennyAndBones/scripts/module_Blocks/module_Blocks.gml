
#macro Blocks global.__module_Blocks

Blocks = {};

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
                      new PoinT(1, 1),
  ]);
};


Blocks.shapeZ = function() {
  return new Tetromino([
                      new Point(0, -1),
    new Point(-1, 0), new Point(0,  0),
    new Point(-1, 1),
  ]);
};
