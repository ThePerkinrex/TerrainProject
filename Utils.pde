static class Utils {
  private static PApplet pa = new PApplet();

  public static void init() {
    cols = w / scl;
    rows = h / scl;
    terrain = new float[cols][rows];
    colors = new color[cols][rows];
    biomes = new int[cols][rows];
    pa.stroke(255);
    if (!fillBool) {
      pa.noFill();
    }
    if (noStro) {
      pa.noStroke();
    }
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