import processing.xml.*;
import processing.opengl.*;
import geomerative.*;

RGroup grp;

RGroup polyGrp;

void setup(){
  size(600, 600);
  smooth();
  g.smooth = true;

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);

  grp = RG.loadSVG("pirata.svg");
  grp.centerIn(g);
} 

void draw(){
  background(255);

  // We decided the separation between the polygon points dependent of the mouseX
  float pointSeparation = map(constrain(mouseX, 200, width-200), 200, width-200, 5, 300);
  
  // We create the polygonized version
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(pointSeparation);
  polyGrp = new RGroup(grp);
  polyGrp.polygonize();
  
  // We move ourselves to the mouse position
  translate(mouseX, mouseY);
  
  // We draw the polygonized group with the SVG styles
  polyGrp.draw();
}
