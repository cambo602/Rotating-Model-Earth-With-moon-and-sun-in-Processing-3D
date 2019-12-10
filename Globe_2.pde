PImage earth;
PShape globe;
PVector cameraLocation;
PVector changePos;


void setup() {
  size(1000, 1000, P3D);
  directionalLight(51, 102, 126, 0, 0, 1);
  cameraLocation = new PVector(-200, -300, height+500 + tan(radians(30)));
  changePos = new PVector(0, 0, 0);
  earth = loadImage("eart.jpg");
  globe = createShape(SPHERE, 90); 
  globe.setStrokeWeight(0);
  globe.setTexture(earth);
}

void keyPressed() {
  //  println(cameraLocation.x);
  //println(cameraLocation.y);
  //println(cameraLocation.z);
  print(keyCode);
  if (keyCode == LEFT) {
    changePos.x -= 10;
  }
  if (keyCode == RIGHT) {
    changePos.x += 10;
  }
  if (keyCode == UP) {
    changePos.y -= 10;
  }
  if (keyCode == DOWN) {
    changePos.y += 10;
  }
}

void keyReleased() {
  //  println(cameraLocation.x);
  //println(cameraLocation.y);
  //println(cameraLocation.z);
  print(keyCode);
  if (keyCode == LEFT) {
    changePos.x = 0;
  }
  if (keyCode == RIGHT) {
    changePos.x = 0;
  }
  if (keyCode == UP) {
    changePos.y = 0;
  }
  if (keyCode == DOWN) {
    changePos.y = 0;
  }
}

void draw() {
    noStroke();
  background(0);
    
  pointLight(255, 255, 255, 0, 0, 0);

  cameraLocation.x += changePos.x;
  cameraLocation.y += changePos.y;
  cameraLocation.z += changePos.z;

  camera(cameraLocation.x, cameraLocation.y, cameraLocation.z, 0, 0, 0, 0, 1, 0);

  lights();
  // Earth
  pushMatrix();
  rotateY(radians(frameCount*1.5));
    pushMatrix();
      translate(width-200, 0);
      pushMatrix();
        // rotateX(radians(frameCount*3));
        rotateY(radians(frameCount*1.5));
        sphereDetail(100);
        noStroke();
        shape(globe);
      popMatrix();

      // Moon
      fill(230, 255, 230);
      pushMatrix();
        rotateY(radians(frameCount*1.5));
        translate(-300, 0);
        sphereDetail(30);
        sphere(30);
      popMatrix();
    popMatrix();
  popMatrix();

  // Sun
  fill(255, 230, 0);
  sphereDetail(30);
  sphere(100);
}
