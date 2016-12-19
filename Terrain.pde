static class Terrain {

  private static PApplet pa = new PApplet();

  public static void generateTerrain() {
    println("Started generating terrain.");
    float yoff = 0;
    for (int ty = 0; ty < rows-1; ty++) {
      yoff += 0.1;
      float xoff = 0;
      for (int tx = 0; tx < cols; tx++) {
        xoff += 0.1;
        biomes[tx][ty] = Biomes.randomBiome(tx, ty);
        calculateZValues(biomes[tx][ty], tx, ty, xoff, yoff);
        calculateCValues(biomes[tx][ty], tx, ty);
        println(str(Utils.calcPercent(tx + (cols * ty), cols + (cols * rows)))+"%");
      }
    }
    println("Finished generating terrain.");
  }

  public static void drawTerrain() {
    pa.background(51);

    pa.translate(pa.width/2, pa.height);
    pa.rotateX(PI/2);
    pa.translate(-pa.width-1000, -pa.height-2500);

    for (int y = 0; y < rows-1; y++) {
      pa.beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        if (fillBool) {
          pa.fill(colors[x][y]);
        }
        pa.vertex(x * scl, y * scl, terrain[x][y] + 100);
        pa.vertex(x * scl, (y + 1) * scl, terrain[x][y + 1] + 100);
      }
      pa.endShape();
    }
  }

  public static void calculateZValues(int biome, int x, int y, float xoff, float yoff) {
    if (biome == 0) {
      terrain[x][y] = map(pa.noise(xoff, yoff), 0, 1, -50, 100);
    } else if (biome == 1 || biome == 2) {
      terrain[x][y] = map(pa.noise(xoff, yoff), 0, 1, -50, 50);
    }
  }

  public static void calculateCValues(int biome, int x, int y) {

    if (biome == 0) {
      colors[x][y] = pa.color(Utils.randomInt(40, 150));
    } else if (biome == 1) {
      colors[x][y] = pa.color(255, 255, Utils.randomInt(0, 200));
    } else if (biome == 2) {
      colors[x][y] = pa.color(0, Utils.randomInt(100, 200), 0);
    }
  }
}