class TerrainUtils {
  public void calculateZValues(TerrainData terrain,BiomeData biome, int x, int y,
              float xoff, float yoff) {
    if (biome.biomes[x][y] == 0) {
      terrain.terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 100);
    } else if (biome.biomes[x][y] == 1 || biome.biomes[x][y] == 2) {
      terrain.terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
    }
  }

  public void calculateCValues(ColorData colors, BiomeData biome, int x, int y) {

    if (biome.biomes[x][y] == 0) {
      colors.colors[x][y] = color(Utils.randomInt(40, 150));
    } else if (biome.biomes[x][y] == 1) {
      colors.colors[x][y] = color(255, 255, Utils.randomInt(0, 200));
    } else if (biome.biomes[x][y] == 2) {
      colors.colors[x][y] = color(0, Utils.randomInt(100, 200), 0);
    }
  }
}