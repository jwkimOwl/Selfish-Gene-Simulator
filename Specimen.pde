class Specimen {
  int type,childmax, childnum,selfishness;
  float retire,age;
  boolean sterility;
  int[] gene;
  Specimen(int t,int c, float r,float a,int s,int[] g,boolean st) {
    type=t;
    childmax=c;
    childnum=0;
    retire=-0.4;
    age=a;
    selfishness=s;
    gene=g;
    sterility=st;
  }
  void draw(float px,float py) {
    noStroke();
    if(0<=selfishness||selfishness<=255)
      fill(color(selfishness,0,0));
    else if(0>selfishness)
      fill(0);
    else
      fill(color(255,0,0));
    triangle(px,py-20,px-10,py-10,px+10,py-10);
    fill(color(gene[0],gene[1],gene[2]));
    rect(px-10,py-10,10,10);
    fill(color(gene[3],gene[4],gene[5]));
    rect(px,py-10,10,10);
    fill(color(gene[6],gene[7],gene[8]));
    rect(px-10,py,10,10);
    fill(color(gene[9],gene[10],gene[11]));
    rect(px,py,10,10);
    fill(100,100,100);
    rect(px-10,py-30,20,5);
    fill(0,255,0);
    rect(px-10,py-30,20*age/(1+retire),5);
    if(sterility==false) {
      strokeWeight(3);
      stroke(0);
      line(px-10,py-10,px+10,py+10);
      line(px-10,py+10,px+10,py-10);
      noStroke();
    }
  }
  void run(float px,float py) {
    draw(px,py);
    age+=0.002;
  }
  float altruism(Specimen other) {
    float ans=0;
    for(int i=0;i<12;i++){
      ans+=max(1000-(gene[i]-other.gene[i])*(gene[i]-other.gene[i]),0);
    }
    ans/=2000.0;
    return ans;
  }
}
