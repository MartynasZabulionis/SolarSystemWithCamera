class Satelite
{
        float angle;
        float angPerFrame;
        float angleAround;
        float angAroundPerFrame;
        float radius;
        float distance;
        int rotatedAng;
        PImage texture;
        PShape shape;
        Planet planet;
        
        
        Satelite(float ang, float angAr, float rad, int rotatedAng, float distance, String textureStr, Planet planet)
        {
                angle = angleAround = 0;
                angPerFrame = ang;
                angAroundPerFrame = angAr;
                radius = rad;
                this.rotatedAng = rotatedAng;
                this.distance = distance;
                texture = loadImage(textureStr);
                this.planet = planet;
                
                shape = createShape(SPHERE, rad);
                beginShape();
                shape.setTexture(texture);
                endShape();
        }
        
        void Rotate()
        {
                setMatrix(planet.getMatrix2());

                rotateY(radians(angleAround));
                translate(distance, 0, 0);
                
                if (rotatedAng != 0)
                {
                        rotateY(radians(360 - angleAround));  
                        rotateZ(radians(rotatedAng));
                }
                rotateY(radians(angle));
                shape(shape);
                
                angle = angle + angPerFrame;
                if (angle > 360)
                        angle = 0;
                else if (angle < 0)
                        angle = 360;
                        
                angleAround = angleAround + angAroundPerFrame;
                if (angleAround > 360)
                        angleAround = 0;
                else if (angleAround < 0)
                        angleAround = 360;
        }
}
