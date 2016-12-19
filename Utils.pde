static class Utils {
  private static PApplet pa = new PApplet();

  public static void init() {
    cols = w / scl;
    rows = h / scl;
    TerrainGen tG = new TerrainGen();
    terrainArray = tG.new TerrainData(new float[cols][rows]);
    colorsArray = tG.new ColorData(new color[cols][rows]);
    biomesArray = tG.new BiomeData(new int[cols][rows]);
  }

  public static int mappedNoise(float xoff, float yoff, int mappingStart, int mappingEnd) {
    return round(map(pa.noise(xoff, yoff), 0, 1, 
      mappingStart * 2, mappingEnd * 2));
  }

  public static int randomInt(float start, float end) {
    return round(pa.random(start, end));
  }

  public static float calcPercent(int val, int total) {
    if (val != 0) {
      return ((val*100)/total);
    } else {
      return 0;
    }
  }
}