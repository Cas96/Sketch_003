PImage img;
int n;
float q;
float x;
float y;
float r;
int c = -1;
float[]r0 = {0, 0.5, 1, 1.5};
float[]r1 = {0.5, 1}; 
float[]r2 = {0, 1.5};
float[]rex;
int i;
float t;

void setup() {
  size(1000, 1000);
  frameRate(1000);
  background(0);
  imageMode(CENTER);
  img = loadImage("img6.jpg");
  n = 10;
  q = width / n;
  x = (0.5*q);
  y = (0.5*q);
  rex = new float[(n*n) + 1];
}

void draw() {    

  if (c < (n*n) + 1) {                          
    c++;
  }

  if (c > -1 && c < (n*n) + 1) {

    if (i >= -1 && i < rex.length-1) {
      rex[i] = r;
      i++;
    }

    int index0 = int(random(r0.length));  
    int index1 = int(random(r1.length));  
    int index2 = int(random(r2.length));

    if (c > -1 && c < n) { 
      if (c == 0) {                          
        r = (r0[index0]);
      } else if (rex[i-1] == 0 || rex[i-1] == 1.5) {
        r = (r1[index1]);
      } else if (rex[i-1]== 0.5 || rex[i-1] == 1) { 
        r = (r2[index2]);
      }
    } else if (c > n - 1) {
      if (rex[i-1] == 0.5 && rex[i-n] == 1) {
        r = 0;
      } else if (rex[i-1] == 0.5 && rex[i-n] == 1.5) {
        r = 0;
      } else if (rex[i-1] == 1 && rex[i-n] == 1) {
        r = 0;
      } else if (rex[i-1] == 1 && rex[i-n] == 1.5) {
        r = 0;
      } else if (rex[i-1] == 0 && rex[i-n] == 1) {
        r = 0.5;
      } else if (rex[i-1] == 0 && rex[i-n] == 1.5) {
        r = 0.5;
      } else if (rex[i-1] == 1.5 && rex[i-n] == 1) {
        r = 0.5;
      } else if (rex[i-1] == 1.5 && rex[i-n] == 1.5) {
        r = 0.5;
      } else if (rex[i-1] == 0 && rex[i-n] == 0) {
        r = 1;
      } else if (rex[i-1] == 0 && rex[i-n] == 0.5) {
        r = 1;
      } else if (rex[i-1] == 1.5 && rex[i-n] == 0) {
        r = 1;
      } else if (rex[i-1] == 1.5 && rex[i-n] == 0.5) {
        r = 1;
      } else if (rex[i-1] == 0.5 && rex[i-n] == 0) {
        r = 1.5;
      } else if (rex[i-1] == 0.5 && rex[i-n] == 0.5) {
        r = 1.5;
      } else if (rex[i-1] == 1 && rex[i-n] == 0) {
        r = 1.5;
      } else if (rex[i-1] == 1 && rex[i-n] == 0.5) {
        r = 1.5;
      }
    }


    if (c > 0 && x < (q*n) && x > 0) {
      x = x + q;
    }
    if (x > q*n) {
      x = 0.5*q;
      y = y + q;
    }

    t = floor(random(75, 255));
    tint(0, t, t);
    translate(x, y);
    rotate(r*PI);  
    image(img, 0, 0, q, q);


    print("Image ");
    println(floor(c));
    print("    x = ");
    println(x);
    print("    y = ");
    println(y);
    print("    r = ");
    println(r);
    print("    t = ");
    println(t);

    if (c > n - 1) {
      print("  r-1 = ");
      println(rex[i-1]);
      print("  r-");
      print(n);
      print(" = ");
      println(rex[i-n]);
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("######.jpg");
  }
  if (key == 'r') {
    c = - 1;
    i = 0;
    setup();
  }
}
