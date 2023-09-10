import controlP5.*;
Setting setting;
Simulating simulating;
  ControlP5 cp5;
  ControlP5 cp52;
int mode,temp;
void setup() {
  size(800,800);
  cp5=new ControlP5(this);
  cp5.setAutoDraw(false);
  cp52=new ControlP5(this);
  cp52.setAutoDraw(false);
  mode=1;
  temp=0;
  cp5.addRadioButton("type")
     .setPosition(60,80)
     .setSize(25,25)
     .setFont(createFont("arial",22))
     .addItem("  asexual",0)
     .addItem("  sexual",1)
     .addItem("  parthenogenesis",2)
     .activate(0);
     ;
     cp5.addSlider("fecundity")
     .setPosition(60,270)
     .setSize(640,50)
     .setRange(1,20)
     .setNumberOfTickMarks(20)
     ;
     cp5.addSlider("generations")
     .setPosition(60,440)
     .setSize(630,50)
     .setRange(0,2.5)
     ;
     cp5.addButton("Start")
     .setValue(100)
     .setPosition(300,650)
     .setSize(200,50)
     ;
   cp52.addButton("Back")
     .setValue(150)
     .setPosition(50,150)
     .setSize(200,50)
     ;
  setting=new Setting(0,2,1.0);
}
void draw() {
  if(mode==1)
    setting.run();
  else
    simulating.run();
}
public void Start(int theValue) {
  temp++;
  if(temp==1){
    mode=2;
    temp=0;
    simulating=new Simulating(int(cp5.getGroup("type").getValue()),int(cp5.getController("fecundity").getValue()),cp5.getController("generations").getValue());
  }
}
public void Back(int theValue) {
  temp++;
  if(temp==1){
    mode=1;
    temp=0;
    setting=new Setting(int(cp5.getGroup("type").getValue()),int(cp5.getController("fecundity").getValue()),cp5.getController("generations").getValue());
  }
}
