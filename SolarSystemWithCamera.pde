PShape ring, ring2, spaceship; //<>//
PImage background;

Star sun;
Planet[] planet;
Satelite moon;

int z = -500;
Boolean firstPerson = false;

/*final float[] ANGLES_AXIS = {0.25, 0.25, 0.25, 0.36, 0.25, 0.25};
final float[] ANGLES_AROUND = {3, 2.5, 2, 1.5, 1, 0.5};
final float[] RADIUS = {width / 45.5, width / 39, width / 27.32, width / 34.15, width / width / 15.17, width / 19};
final int[] ROTATED_ANGLE = {0, 0, 30, 0, 0, 45};
final float[] DISTANCE = {width / 4, width / 2.8, width / 2.1, width / 1.6, width / 1.25, width / 0.9};
final String[] TEXTURE = {"mercury.jpg", "venus.jpg", "earth.jpg", "mars.jpg", "jupiter.jpg", "saturn.jpg"};*/

void setup()
{
        //size(1200, 700, P3D);
        fullScreen(P3D);
        background = loadImage("cosmos.jpg");
        background.resize(width, height);
  
        noStroke();
  
        ring = createShape();
        ring.beginShape(TRIANGLE_STRIP);
        ring.fill(149, 124, 108);
        ring.noStroke();
  
        ring2 = createShape();
        ring2.beginShape(TRIANGLE_STRIP);
        ring2.fill(122, 96, 77);
        ring2.noStroke();
  
        float radian;
        for (int i = 0; i < 37; ++i)
        {
                radian = radians(i * 10);
                ring.vertex(width / 13.66 * cos(radian), 0, width / 13.66 * sin(radian));
                ring.vertex(width / 9.1 * cos(radian), 0, width / 9.1 * sin(radian));
                
                ring2.vertex(width / 8.53 * cos(radian), 0, width / 8.53 * sin(radian));
                ring2.vertex(width / 6.5 * cos(radian), 0, width / 6.5 * sin(radian));
        }
        ring.endShape();
        ring2.endShape();
  
        spaceship = createShape();
        spaceship.beginShape(TRIANGLE_STRIP);
        spaceship.fill(255, 120, 0);
        spaceship.noStroke();
  
        for (int i = 0; i < 37; ++i)
        {
                radian = radians(i * 10);
                spaceship.vertex(0, -30, 0);
                spaceship.vertex(13 * cos(radian), 10, 13 * sin(radian));
        }
        spaceship.fill(255);
        for (int i = 0; i < 37; ++i)
        {
                radian = radians(i * 10);
                spaceship.vertex(13 * cos(radian), 10, 13 * sin(radian));
                spaceship.vertex(30 * cos(radian), 0, 30 * sin(radian));
        }
        for (int i = 0; i < 37; ++i)
        {
                radian = radians(i * 10);
                spaceship.vertex(30 * cos(radian), 0, 30 * sin(radian));
                spaceship.vertex(15 * cos(radian), 15, 15 * sin(radian));
        }
        for (int i = 0; i < 37; ++i)
        {
                radian = radians(i * 10);
                spaceship.vertex(15 * cos(radian), 15, 15 * sin(radian));
                spaceship.vertex(20 * cos(radian), 70, 20 * sin(radian));
      
        }
        spaceship.fill(100, 100, 100);
        for (int i = 0; i < 37; ++i)
        {
                radian = radians(i * 10);
                spaceship.vertex(20 * cos(radian), 70, 20 * sin(radian));
                spaceship.vertex(0, 100, 0);
        }
        spaceship.endShape();
  
        textAlign(CENTER, CENTER);
  
        sun = new Star(0, 0, 0, -0.25, width / 6.83, "Sun", "sun.jpg");
        planet = new Planet[6];
  
  /*for (int i = 0; i < 6; ++i)
  {
          planet[i] = new Planet(ANGLES_AXIS[i], ANGLES_AROUND[i], RADIUS[i], ROTATED_ANGLE[i], DISTANCE[i], TEXTURE[i], sun);
  }*/
        planet[0] = new Planet(0.25, 1.5, width / 45.5, 0, width / 4, "mercury.jpg", sun);
        planet[1] = new Planet(0.25, 1.25, width / 39, 0, width / 2.8, "venus.jpg", sun);
        planet[2] = new Planet(-4.25, 1, width / 27.32, 30, width / 2.1, "earth.jpg", sun);
        planet[3] = new Planet(0.36, 0.75, width / 34.15, 0, width / 1.6, "mars.jpg", sun);
        planet[4] = new Planet(0.25, 0.5, width / 15.17, 0, width / 1.25, "jupiter.jpg", sun);
        planet[5] = new Planet(0.25, 0.25, width / 19, 30, width / 0.9, "saturn.jpg", sun);
  
        moon = new Satelite(0, 4, width / 68.3, 0, width / 15.17, "moon.jpg", planet[2]);
}
void draw()
{
        background(background);
        
        if (!firstPerson)
        {
                pushMatrix();
                translate(mouseX + (mouseX - width/2), mouseY + (mouseY - height / 2), z);
                rotateX(radians(-90));
                shape(spaceship);
                popMatrix();
        }
        translate(width / 2, height / 2, -800);
        //rotateX(radians(z));
        pushMatrix();
  
        // Rotate the sun
        sun.Rotate();
        
        // Rotate the planets
        for (int i = 0; i < 6; ++i)
        {
                planet[i].Rotate();
        }
        
        // Add rings to the Saturn
        setMatrix(planet[5].getMatrix2());
        rotateY(radians(360 - planet[5].getAngleAround()));  
        rotateZ(radians(30));
        shape(ring);
        shape(ring2);

        // Rotate the moon
        moon.Rotate();
        popMatrix();
        
        if (firstPerson)
                camera(mouseX + (mouseX - width/2), mouseY + (mouseY - height / 2), z + 50,
                mouseX + (mouseX - width/2), mouseY + (mouseY - height / 2), z, 0, 1, 0);
        else 
                camera();
}
void mouseWheel(MouseEvent event)
{
        z += 50 * event.getCount();
}
void keyPressed()
{
        if (key == ' ')
                firstPerson = !firstPerson;
}
