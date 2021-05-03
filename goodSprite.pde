class goodSprite{
  //variables
  int x;
  int y;
  int w; //width
  int c; //color
  //bounds of platforms
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;
  //boolean
  boolean isRendered;
  boolean isTouched;
  //constructor
  goodSprite(int tempX, int tempY, int tempW, int tempC){
    x=tempX;
    y=tempY;
    w=tempW;
    c=tempC;
    topBound=y;
    bottomBound=y+w;
    leftBound=x;
    rightBound=x+w;
    isRendered=true;
    isTouched=false;
  }
  //renders sprite
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
  //detects if sprite is touched and removes render
  void touchDetection(){
     if(player1.bottomBound>=topBound&&player1.leftBound<=rightBound&&player1.rightBound>=leftBound&&player1.topBound<=bottomBound){
     // println("good Sprite Touched");
      isTouched=true;
    }
  }
  
}//end of class
