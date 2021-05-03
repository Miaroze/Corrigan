class badSprite{
  //variables
  int x;
  int y;
  int w; //width
  int h; //height
  int c; //color
  int speed;
  //bounds of platforms
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;
  //boolean
  boolean isRendered;
  boolean isTouched;
  // platform
  platform bSPlatform;
  //constructor
  badSprite(int tempX, int tempY, int tempW, int tempC, int tempSpeed, platform tempPlatform){
    x=tempX;
    y=tempY;
    w=tempW;
    c=tempC;
    speed=tempSpeed;
    topBound=y;
    bottomBound=y+w;
    leftBound=x;
    rightBound=x+w;
    isRendered=true;
    isTouched=false;
    bSPlatform = tempPlatform;
  }
  void render(){
    if(isRendered==true){
     circle(x,y,w);
     fill(c);
    }
  }
  //gives boundaries
  void boundaries(){
    topBound=y-w/2;
    bottomBound=y+w/2;
    leftBound=x-w/2;
    rightBound=x+w/2;
  }
  //detects if bad sprite is touched
  void touchDetection(){
     if(player1.bottomBound>=topBound&&player1.leftBound<=rightBound&&player1.rightBound>=leftBound&&player1.topBound<=bottomBound){
     // println("bad Sprite Touched");
      isTouched=true;
      player1.isRendered=false; //takes out character as they have died
      isRendered=false;
      jumpAnimation.isAnimating=false;
    }
  }
  //moves sprite back and forth
  void move(){
    if(bSPlatform.leftBound<=rightBound&&bSPlatform.rightBound>=leftBound&&bSPlatform.topBound<=bottomBound){
      x=x+speed;
    }
  }
  //detects platform
  void platformDetection(){
    x=x+speed;
     if(bSPlatform.leftBound>=rightBound-w){
        speed=abs(speed);
      }
      if(bSPlatform.rightBound<=leftBound+w){
        speed=-abs(speed);
      }
  }
  
}//end of class
