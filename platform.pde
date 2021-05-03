class platform{
  //variables
  int x;
  int y;
  int w; //width
  int h; //height
  int c; //color
  //bounds of platforms
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;
  
  //constructor 
  platform(int tempX, int tempY, int tempW, int tempH, int tempC){
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    c=tempC;
    topBound=y;
    bottomBound=y+h;
    leftBound=x;
    rightBound=x+w;
  }
  void render(){
    rect(x,y,w,h);
    fill(c);
  }
  //gives platform boundaries
  void boundaries(){
    topBound=y;
    bottomBound=y+h;
    leftBound=x;
    rightBound=x+w;
  }
  //detects if player has landed on platform
  void landedOn(){
    if(player1.isFalling==true&&player1.bottomBound>=topBound&&player1.leftBound<=rightBound&&player1.rightBound>=leftBound&&player1.topBound<=bottomBound){
      player1.isFalling=false;
      player1.y=y-player1.h;
    }
  }

}
