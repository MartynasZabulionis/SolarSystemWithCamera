class Star
{
        int x, y, z;
        float angle;
        float angPerFrame;
        float radius;
        String name;
        PImage texture;
        PShape shape;
        PMatrix3D matrix = null;
        
        Star(int x, int y, int z, float ang, float rad, String name, String textureStr)
        {
                this.x = x;
                this.y = y;
                this.z = z;
                
                angle = 0;
                angPerFrame = ang;
                radius = rad;
                this.name = name;
                texture = loadImage(textureStr);
                
                shape = createShape(SPHERE, rad);
                beginShape();
                shape.setTexture(texture); 
                endShape();
        }
        
        void Rotate()
        {
                translate(x, y, z);
                matrix = getMatrix(matrix);
                
                textSize(radius / 2);
                text(name, 0, -radius * 1.5);
                
                rotateY(radians(angle));
                shape(shape);
                
                angle = angle + angPerFrame;
                if (angle > 360)
                        angle = 0;
                else if (angle < 0)
                        angle = 360;
        }
        public PMatrix3D getMatrix2()
        {
                return matrix;
        }
}
