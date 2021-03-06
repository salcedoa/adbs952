class Plane {
  int meshSize, sqrSize;
  float[][] heights; // will store all z coordinates

  Plane() {
    meshSize = 61; // size of the grid
    sqrSize = 10; // width of each individual square
  }

  void draw(color colour) {
    noStroke();
    fill(colour);

    for (int y = 0; y < meshSize-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < meshSize; x++) {
        // each strip shares a common line of z values so that the mesh connects
        vertex(0+(sqrSize*x), sqrSize+(sqrSize*y), heights[x][y+1]);
        vertex(sqrSize*x, sqrSize*y, heights[x][y]);
      }
      endShape();
    }
  }
  
  // Generates z values using noise() and stores them in a 2d array
  void createSurface(float lowerLimit, float upperLimit) {
    heights = new float[meshSize][meshSize];
    for (int y = 0; y < meshSize; y++) {
      for (int x = 0; x < meshSize; x++) {
        heights[x][y] = map(noise(x*0.1, y*0.1), 0, 1, lowerLimit, upperLimit);
      }
    }
  }
}
