class Setting{
  Setting(int t,int c, float r) {
    cp5.getGroup("type").setValue(t);
    cp5.getController("fecundity").setValue(c);
    cp5.getController("generations").setValue(r);
  }
  void run() {
    background(255);
    fill(0);
    textFont(createFont("arial", 25));
    text("Choose how to reproduct.",55,60);
    text("Choose fecundity.",55,250);
    text("Choose how long to survive after reproduction.",55,420);
    fill(100);
    rect(50,70,700,100);
    rect(50,260,700,80);
    rect(50,430,700,70);
    cp5.draw();
  }
  /**/
}
