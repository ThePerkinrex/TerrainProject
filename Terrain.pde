static class Terrain {

  private static PApplet pa = new PApplet();
  private static TerrainUtils TUtils;

  public static void generateTerrain(BiomeData biomes, TerrainData terrain, ColorData colors) {
    println("Started generating terrain.");
    float yoff = 0;
    for (int ty = 0; ty < rows-1; ty++) {
      yoff += 0.1;
      float xoff = 0;
      for (int tx = 0; tx < cols; tx++) {
        xoff += 0.1;
        biomes.biomes[tx][ty] = Biomes.randomBiome(biomes, tx, ty);
        TUtils.calculateZValues(terrain, biomes, tx, ty, xoff, yoff);
        TUtils.calculateCValues(colors, biomes, tx, ty);
        println(str(Utils.calcPercent(tx + (cols * ty), cols + (cols * rows)))+"%");
      }
    }
    println("Finished generating terrain.");
  }

  public static void drawTerrain(TerrainData terrain, ColorData colors) {
    pa.background(51);

    pa.translate(pa.width/2, pa.height);
    pa.rotateX(PI/2);
    pa.translate(-pa.width-1000, -pa.height-2500);

    for (int y = 0; y < rows-1; y++) {
      pa.beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        if (fillBool) {
          pa.fill(colors.colors[x][y]);
        }
        pa.vertex(x * scl, y * scl, terrain.terrain[x][y] + 100);
        pa.vertex(x * scl, (y + 1) * scl, terrain.terrain[x][y + 1] + 100);
      }
      pa.endShape();
    }
  }
}