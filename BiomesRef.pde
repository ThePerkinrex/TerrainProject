/*

 
 Biomes reference
 
 0 - Mountains
 1 - Desert
 
 
 */

static class Biomes {

  static final int MOUNTAINS = 0;
  static final int DESERT = 1;
  static final int FIELDS = 2;
  static final int NUM_BIOMES = 2;

  public static int randomBiome(int x, int y) {
    int result;
    if (!(x == 0) && !(y == 0)) {
      int selector = Utils.randomInt(-0.4, 2.4);
      if (selector == 0) {
        result = biomes[x-1][y];
      } else if (selector == 1){
        result = biomes[x][y-1];
      } else {
        result = Utils.randomInt(0,NUM_BIOMES);
      }
    } else if(y != 0 && x == 0){
      int selector = Utils.randomInt(-0.4, 1.4);
      if (selector == 0) {
        result = biomes[x][y-1];
      } else {
        result = Utils.randomInt(0,NUM_BIOMES);
      }
    } else if (x != 0 && y == 0){
      int selector = Utils.randomInt(-0.4, 1.4);
      if (selector == 0) {
        result = biomes[x-1][y];
      } else {
        result = Utils.randomInt(0,NUM_BIOMES);
      }
    } else {
      result = Utils.randomInt(0,NUM_BIOMES);
    }
    return result;
  }
}