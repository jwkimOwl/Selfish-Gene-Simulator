class Predator {
  float timer;
  int generation;
  Predator() {
    generation=1;
  }
  void run() {
      timer+=0.2;
      fill(255,0,0);
    rect(550,60,200,80);
    textFont(createFont("arial",60));
    fill(0);
    text(timer,540,120);
  }
}
