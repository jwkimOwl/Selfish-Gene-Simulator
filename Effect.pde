class Effect {
  float age,px,py;
  Effect(float x,float y) {
    px=x;
    py=y;
  }
  void run() {
    noFill();
    stroke(color(255,255,100));
    strokeWeight(3);
    ellipse(px,py,20,7);
    noStroke();
    age+=0.1;
    py-=0.1;
  }
}
