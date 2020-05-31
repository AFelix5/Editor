
int width_old = 0;
int height_old = 0;

ArrayList<Integer> list = new ArrayList<Integer>();

int scroll = 0;
int big = 20;
int look = 0;

boolean keyboard = false;

int mouseYold;
int scrollold;

void setup(){
  
  /*
  fullScreen();

  /*/
  size(500,700);
  surface.setTitle("Editor");
  surface.setResizable(true);
  //*/
  
  list.add(-13);
  for(int i=0;i<20;i++)
    list.add(i);
  list.add(-13);
    
  draw_list();
}

void draw(){
  if(width_old==0&&height_old==0)
    draw_list();
  if(width!=width_old||height!=height_old){
    width_old = width;
    height_old = height;
    draw_list();
  }
}

void draw_list(){
  line(width/50,width/50+0.5*big,width-width/50,width/50+0.5*big);
  big = int((width-width/25)/max(1,(5*(0.5+0.25*ceil(log(list.size())))+4)));
  if(scroll>ceil(list.size()/4)-floor((height-width/25)/big))scroll = ceil(list.size()/4)-floor((height-width/25)/big);
  if(scroll<0)scroll=0;
  background(20);
  strokeWeight(width/100);
  textSize(big*0.9);
  stroke(204, 102, 0);
  line(width-width/50,width/50+scroll*(height-width/25)/max(1,1+ceil(list.size()/4)-floor((height-width/25)/big)), width-width/50,width/50+(1+scroll)*(height-width/25)/max(1,1+ceil(list.size()/4)-floor((height-width/25)/big)));
  
  for(int i=0; i<list.size();i+=4){
    if((1+i/4-scroll)*big>0&&(1+i/4-scroll)*big<height){
      textSize(big*0.9);
      fill(255);
      text(i,width/50,width/50+(1+i/4-scroll)*big-big/20);
      textSize(big*0.8);
      strokeWeight(width/200); 
      stroke(204, 102, 0);
      if(i+0<list.size()){
        if(list.get(solve(look))<0&&solve(list.get(solve(look)))<list.size()&&list.get(solve(list.get(solve(look))))<0&&solve(list.get(solve(list.get(solve(look)))))==i+0)
          fill(4,233,108);
        else if(list.get(solve(look))<0&&solve(list.get(solve(look)))==i+0)
          fill(255,4,64);
        else if(i+0==solve(look))
          fill(222, 150, 55);
        else
          fill(255);
        rect(width/50+big*(0.5+0.25*ceil(log(list.size())))+big/10,width/50+(i/4-scroll)*big+big/10,big*(0.5+0.25*ceil(log(list.size()))),big*0.9,big/5);
        fill(0);
        text(solve(list.get(i+0)),width/50+big*(0.5+0.25*ceil(log(list.size())))+big/10+0.125*big,width/50+(i/4-scroll)*big+big*0.85);
      }
      if(i+1<list.size()){
        if(list.get(solve(look))<0&&solve(list.get(solve(look)))<list.size()&&list.get(solve(list.get(solve(look))))<0&&solve(list.get(solve(list.get(solve(look)))))==i+1)
          fill(4,233,108);
        else if(list.get(solve(look))<0&&solve(list.get(solve(look)))==i+1)
          fill(255,4,64);
        else if(i+1==solve(look))
          fill(222, 150, 55);
        else
          fill(255);
        rect(width/50+2*big*(0.5+0.25*ceil(log(list.size())))+2*big/10,width/50+(i/4-scroll)*big+big/10,big*(0.5+0.25*ceil(log(list.size()))),big*0.9,big/5);
        fill(0);
        text(solve(list.get(i+1)),width/50+2*big*(0.5+0.25*ceil(log(list.size())))+2*big/10+0.125*big,width/50+(i/4-scroll)*big+big*0.85);
      } 
      if(i+2<list.size()){
        if(list.get(solve(look))<0&&solve(list.get(solve(look)))<list.size()&&list.get(solve(list.get(solve(look))))<0&&solve(list.get(solve(list.get(solve(look)))))==i+2)
          fill(4,233,108);
        else if(list.get(solve(look))<0&&solve(list.get(solve(look)))==i+2)
          fill(255,4,64);
        else if(i+2==solve(look))
          fill(222, 150, 55);
        else
          fill(255);
        rect(width/50+3*big*(0.5+0.25*ceil(log(list.size())))+3*big/10,width/50+(i/4-scroll)*big+big/10,big*(0.5+0.25*ceil(log(list.size()))),big*0.9,big/5);
        fill(0);
        text(solve(list.get(i+2)),width/50+3*big*(0.5+0.25*ceil(log(list.size())))+3*big/10+0.125*big,width/50+(i/4-scroll)*big+big*0.85);
      } 
      if(i+3<list.size()){
        if(list.get(solve(look))<0&&solve(list.get(solve(look)))<list.size()&&list.get(solve(list.get(solve(look))))<0&&solve(list.get(solve(list.get(solve(look)))))==i+3)
          fill(4,233,108);
        else if(list.get(solve(look))<0&&solve(list.get(solve(look)))==i+3)
          fill(255,4,64);
        else if(i+3==solve(look))
          fill(222, 150, 55);
        else
          fill(255);
        rect(width/50+4*big*(0.5+0.25*ceil(log(list.size())))+4*big/10,width/50+(i/4-scroll)*big+big/10,big*(0.5+0.25*ceil(log(list.size()))),big*0.9,big/5);
        fill(0);
        text(solve(list.get(i+3)),width/50+4*big*(0.5+0.25*ceil(log(list.size())))+4*big/10+0.125*big,width/50+(i/4-scroll)*big+big*0.85);
        fill(204, 102, 0);
        ellipse(width-width/25-big*1.5,width/50+(i/4-scroll)*big+big*0.5,big*0.8,big*0.8);
        stroke(255);
        strokeWeight(width/150);
        rect(width-width/25-big*1.7,width/50+(i/4-scroll+0.35)*big,big*0.4,big*0.3);
      } 
      stroke(204, 102, 0);
      fill(204, 102, 0);
      ellipse(width-width/25-big*0.5,width/50+(i/4-scroll)*big+big*0.5,big*0.8,big*0.8);
      ellipse(width-width/25-big*2.5,width/50+(i/4-scroll)*big+big*0.5,big*0.8,big*0.8);
      stroke(255);
      strokeWeight(width/150);
      line(width-width/25-big*0.7,width/50+(i/4-scroll+0.5)*big,width-width/25-big*0.3,width/50+(i/4-scroll+0.5)*big);
      line(width-width/25-big*0.5,width/50+(i/4-scroll+0.7)*big,width-width/25-big*0.5,width/50+(i/4-scroll+0.3)*big);
      line(width-width/25-big*2.7,width/50+(i/4-scroll+0.5)*big,width-width/25-big*2.3,width/50+(i/4-scroll+0.5)*big);
    }
  }
  if(list.isEmpty()){
    stroke(204, 102, 0);
    fill(204, 102, 0);
    ellipse(width-width/25-big*0.5,width/50+big*0.5,big*0.8,big*0.8);
    stroke(255);
    strokeWeight(width/150);
    line(width-width/25-big*0.7,width/50+(0.5)*big,width-width/25-big*0.3,width/50+(0.5)*big);
    line(width-width/25-big*0.5,width/50+(0.7)*big,width-width/25-big*0.5,width/50+(0.3)*big);
  } 
}
  
//*
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scroll += int(e);
  draw_list();
}
//*/

void mouseDragged() {
  scroll = scrollold+(mouseY-mouseYold)/big;
  draw_list();
}

void mousePressed() {
  mouseYold = mouseY;
  scrollold = scroll;
  int i = int((mouseY-width/50)/big+scroll)*4;
  if(i<list.size()&&i+0<list.size()&&width/50+big*(0.5+0.25*ceil(log(list.size())))+big/10<mouseX&&mouseX<width/50+big*(0.5+0.25*ceil(log(list.size())))+big/10+big*(0.5+0.25*ceil(log(list.size())))&&(mouseY-width/50)%big>0.1*big&&(mouseY-width/50)%big<0.9*big)
    look = (i+0+(look<0?1:0))*(look<0?-1:+1);
  else if(i<list.size()&&i+0<list.size()&&width/50+2*big*(0.5+0.25*ceil(log(list.size())))+2*big/10<mouseX&&mouseX<width/50+2*big*(0.5+0.25*ceil(log(list.size())))+2*big/10+big*(0.5+0.25*ceil(log(list.size())))&&(mouseY-width/50)%big>0.1*big&&(mouseY-width/50)%big<0.9*big)
    look = (i+1+(look<0?1:0))*(look<0?-1:+1);
  else if(i<list.size()&&i+0<list.size()&&width/50+3*big*(0.5+0.25*ceil(log(list.size())))+3*big/10<mouseX&&mouseX<width/50+3*big*(0.5+0.25*ceil(log(list.size())))+3*big/10+big*(0.5+0.25*ceil(log(list.size())))&&(mouseY-width/50)%big>0.1*big&&(mouseY-width/50)%big<0.9*big)
    look = (i+2+(look<0?1:0))*(look<0?-1:+1);
  else if(i<list.size()&&i+0<list.size()&&width/50+4*big*(0.5+0.25*ceil(log(list.size())))+4*big/10<mouseX&&mouseX<width/50+4*big*(0.5+0.25*ceil(log(list.size())))+4*big/10+big*(0.5+0.25*ceil(log(list.size())))&&(mouseY-width/50)%big>0.1*big&&(mouseY-width/50)%big<0.9*big)
    look = (i+3+(look<0?1:0))*(look<0?-1:+1);
  else if(pow((mouseY-width/50)%big-0.5*big,2)+pow(mouseX-width+width/25+big*0.5,2)<pow(big*0.4,2)){
    if(i<list.size()||list.isEmpty()){
      list.add(i,0);
      for(int j=0; j<list.size();j++)
        if(list.get(j)<0&&solve(list.get(j))>=i)
          list.set(j,list.get(j)-1);
    } 
  }
  else if(pow((mouseY-width/50)%big-0.5*big,2)+pow(mouseX-width+width/25+big*1.5,2)<pow(big*0.4,2)){
    if(i+4<=list.size()){
      for(int j=0;j<4;j++)
        list.add(i+4,0);
      for(int j=0; j<list.size();j++)
        if(list.get(j)<0&&solve(list.get(j))>=i+4)
          list.set(j,list.get(j)-4);
    } 
  }
  else if(pow((mouseY-width/50)%big-0.5*big,2)+pow(mouseX-width+width/25+big*2.5,2)<pow(big*0.4,2)){
    if(i<list.size()){
      list.remove(i);
      if(solve(look)>=list.size()&&!list.isEmpty())look = (list.size()-1)*(look<0?-1:1)+(look<0?-1:0);
      for(int j=0; j<list.size();j++)
        if(list.get(j)<0&&solve(list.get(j))>=i)
          list.set(j,list.get(j)+1);
    } 
  }
  else if(i>=list.size()||mouseX<width/50+big*(0.5+0.25*ceil(log(list.size())))+big/10){
    /*
    if (!keyboard) {
      openKeyboard();
      keyboard = true;
    } else {
      closeKeyboard();
      keyboard = false;
    }
    //*/
  }  
  draw_list();
}

int solve(int in){
  return in<0?-in-1:in;
}

void keyPressed() {
  if(key=='p'){
    PrintWriter output = createWriter("a.out"); 
    for(int i=0; i<list.size();i+=4){
      if(i+0<list.size())
        output.print(solve(list.get(i+0))+",");
      if(i+1<list.size())
        output.print(solve(list.get(i+1))+",");
      if(i+2<list.size())
        output.print(solve(list.get(i+2))+",");
      if(i+3<list.size())
        output.print(solve(list.get(i+3))+",");
      output.println();
    }
    output.flush();
    output.close();
  }
  if(key=='s'){
    PrintWriter output = createWriter("s.save"); 
    for(int i=0; i<list.size();i+=4){
      if(i+0<list.size())
        output.print(list.get(i+0)+",");
      if(i+1<list.size())
        output.print(list.get(i+1)+",");
      if(i+2<list.size())
        output.print(list.get(i+2)+",");
      if(i+3<list.size())
        output.print(list.get(i+3)+",");
      output.println();
    }
    output.flush();
    output.close();
  }
  if(key=='l'){
    list = new ArrayList<Integer>();
    BufferedReader reader = createReader("s.save");
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line,',');
        for(int i=0;i<pieces.length-1;i++){
          list.add(int(pieces[i]));
        }
      }
      reader.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  if(key=='d')
    print("help");
  if(keyCode==40) scroll++;
  if(keyCode==37&&solve(look)>0) look -= (look<0?-1:+1);
  if(keyCode==38) scroll--;
  if(keyCode==39&&solve(look)<list.size()-1) look += (look<0?-1:+1);
  if(key=='-'){
    look = -solve(look)-1;
    list.set(solve(look),-1);
  }
  if(key=='+'){
    look = solve(look);
    list.set(solve(look),0);
  }
  if(key<='9'&&key>='0')
    list.set(solve(look),(solve(list.get(solve(look)))*10+int(key+""))*(look<0?-1:+1)+(look<0?-1:0));
  if(keyCode==8)//67
    list.set(solve(look),list.get(solve(look))/10+(list.get(solve(look))<0?-1:0));
  if(key=='x'){
    int op1 = list.get(look = solve(look)); 
    int op2 = list.get(look = (look+1) % (list.size()));
    int op3 = list.get(look = (look+1) % (list.size()));
    int op4 = list.get(look = (look+1) % (list.size()));
    int data1 = list.get(solve(op1));
    int data2 = list.get(solve(op2));
    //System.out.println("index:"+i+"op1:"+op1+"op2:"+op2+"op3:"+op3+"op4:"+op4+"data1:"+data1+"data2:"+data2);
    look = solve(data1)-solve(data2) >= 0 ? (look+1) % (list.size()) : solve(op4);
    list.set(solve(op3),((solve(data1)-solve(data2)+list.size()) % (list.size()))*(data1<0?-1:1));
  }
  draw_list();
  //print(keyCode);
}
