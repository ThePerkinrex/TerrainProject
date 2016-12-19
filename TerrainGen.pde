import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

static int cols, rows;
static int scl = 50;
static boolean fillBool = true;
static boolean noStro = false;
static int w = 3200;
static int h = 3200;
static float[][] terrain;
static color[][] colors;
static int[][] biomes;
static PApplet pa = new PApplet();
PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  Utils.init();
  Terrain.generateTerrain();
}

void draw() {
  Terrain.drawTerrain();
}