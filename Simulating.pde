class Simulating {
  ArrayList<Specimen> specimens;
  ArrayList<Effect> effects;
  Predator predator;
  int[] temp;
  float average,low,high,retire;
  boolean printed;
  Simulating(int t,int c, float r) {
    specimens=new ArrayList<Specimen>();
    effects=new ArrayList<Effect>();
    retire=r;
    printed=false;
    for(int j=0;j<50;j++) {
    temp=new int[12];
      for(int i=0;i<12;i++) {
        temp[i]=int(random(255)); }
      if(t!=2||random(1)<0.5)
        specimens.add(new Specimen(t,c,r,random(0.49),int(random(255)),temp,true));
      else {
        specimens.add(new Specimen(t,c,r,random(0.49),int(random(255)),temp,false));
        //println("l");
      }
    }
    predator=new Predator();
  }
  void run() {
    background(255);
    cp52.draw();
    int num=0;
    average=0;
    low=10000;
    high=0;
    for(;num<specimens.size();num++) {
      Specimen runner=specimens.get(num);
      runner.run((50+50*(num%15)),(300+50*(num/15)));
      average+=runner.selfishness;
      high=max(high,runner.selfishness);
      low=min(low,runner.selfishness);
      if(runner.age>1+runner.retire)
        specimens.remove(num);
      if(runner.age>(0.5+(0.5/runner.childmax)*runner.childnum)&&runner.childnum<runner.childmax&&runner.age<1&&runner.sterility) {
        makeOffspring(runner);
        runner.childnum++;
      }
      float altruismsum=0;
      for(Specimen others:specimens){
         altruismsum+=runner.altruism(others);
      }
      if(runner.sterility==false||runner.childmax<=runner.childnum)
        altruismsum*=2;
      if(altruismsum>runner.selfishness) {
        sacrifice(num);
        specimens.remove(num);
      }
    }
    predator.run();
    if(predator.timer>=100)
      dalek();
    fill(0);
    textFont(createFont("arial",30));
    average/=specimens.size();
    text("selfishness: "+average+" ("+low+", "+high+")",50,50);
    text("population: "+specimens.size(),50,100);
    if(predator.generation>=7&&predator.generation<=10&&predator.timer>=50.0&&printed==false) {
      println(predator.generation+" : "+average+" ("+low+", "+high+")");
      printed=true;
    }
    int effectnum=0;
    for(;effectnum<effects.size();effectnum++) {
      effects.get(effectnum).run();
      if(effects.get(effectnum).age>10)
        effects.remove(effectnum);
    }
  }
  void makeOffspring(Specimen runner) {
    if(runner.type==0) {
      temp=new int[12];
      for(int i=0;i<12;i++) {
        if(random(1)<0.1)
          temp[i]=int(random(255));
        else
          temp[i]=runner.gene[i];
      }
      int newself=runner.selfishness+int(3*randomGaussian());
      specimens.add(new Specimen(runner.type,runner.childmax,runner.retire,0,newself,temp,true));
    }
    else if(runner.type==1) {
      temp=new int[12];
      for(Specimen mate:specimens)
        if(mate.age>(0.5+(0.5/mate.childmax)*mate.childnum)&&mate.childnum<mate.childmax&&mate.age<1) {
          for(int i=0;i<12;i++) {
            if(random(1)<0.1)
              temp[i]=int(random(255));
            else
              temp[i]=(runner.gene[i]+mate.gene[i])/2;
          }
          int newself=(runner.selfishness+mate.selfishness)/2+int(3*randomGaussian());
          specimens.add(new Specimen(runner.type,runner.childmax,runner.retire,0,newself,temp,true));
          return;
        }
      return;
    }
    if(runner.type==2) {
      temp=new int[12];
      for(int i=0;i<12;i++) {
        if(random(1)<0.1)
          temp[i]=int(random(255));
        else
          temp[i]=runner.gene[i];
      }
      int newself=runner.selfishness+int(3*randomGaussian());
      if(random(1)<0.5)
        specimens.add(new Specimen(runner.type,runner.childmax,runner.retire,0,newself,temp,true));
      else
        specimens.add(new Specimen(runner.type,runner.childmax,runner.retire,0,newself,temp,false));
    }
  }
  void dalek() {
    int until=min(specimens.size(),5);
    for(int i=0;i<until||specimens.size()>50;i++) {
      specimens.remove(int(random(specimens.size())));
    }
    predator.timer=0;
    predator.generation++;
    printed=false;
  }
  void sacrifice(int num) {
    effects.add(new Effect(50+50*(num%15),290+50*(num/15)));
    //println(specimens.get(num).selfishness);
    for(int j=0;j<specimens.size();j++){
         if(num!=j&&specimens.get(num).altruism(specimens.get(j))>5) {
             specimens.get(j).retire=min(specimens.get(j).retire+retire,retire+1);
             //println("l");
         }
     }
    //predator.until=frameCount+30;
  }
}
