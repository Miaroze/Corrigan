class player {
  //variables
  int x;
  int y;
  int w; //size of player
  int h;
  color c; //color of player
  int runSpeed; //speed of player
  int jumpSpeed; //speed of jump for player
  int fallSpeed; //speed of fall for player
  int topBound; //top boundary of player
  int bottomBound; //bottom boundary of player
  int leftBound; //left boundary of player
  int rightBound; //right bound of player
  int jumpHeight; //height of jump for player
  float peakY; //highest y point player can reach
  //booleans
  boolean movingLeft; //if true, player moves left
  boolean movingRight; //if true, player moves right
  boolean isJumping; //when true player rises
  boolean isFalling; //when true player fall from jump
  boolean isRendered; //makes character appear and dissapear depending on failure

  //constructor
  player (int tempRunSpeed, int tempJumpSpeed, int tempFallSpeed, int tempX, int tempY, int tempH, int tempW) {
    runSpeed=tempRunSpeed;
    jumpSpeed=tempJumpSpeed;
    fallSpeed=tempFallSpeed;
    //giving other variables values
    x=tempX;
    y=tempY;
    h=tempH;
    w=tempW;
    c=#26586A;
    topBound=y;
    bottomBound=y+h;
    leftBound=x;
    rightBound=x+w;
    jumpHeight=y-50;
    peakY=y-300;   
    //making booleans false
    movingLeft=false;
    movingRight=false;
    isJumping=false;
    isFalling=false;
    isRendered=true;
  }
  //rendering player
  void render() {
    if(isRendered==true){
     rect(x, y, w, h);
     fill(#F752E2);
     stroke(#F752E2);
     //tint();
    }
  }
  //movement for player
  void moveRight() {
    if (movingRight==true) {
      x=x+runSpeed; 
      movingLeft=false;
    }
  }
  void moveLeft() {
    if (movingLeft==true) {
      x=x-runSpeed; 
      movingRight=false;
    }
  }
  //jumping
  void jump() {
    if (isJumping==true&&isFalling==false) {
      y=y-jumpSpeed; 

    }
    if (isJumping==true) {
      isFalling=false;
    }
    //if(y<0){
    //  jumpHeight=690;
    //}
  }
  //detects top of jump
  void reachedTopOfJump() {
    if (isJumping==true&&y<jumpHeight) {
      isJumping=false;
      isFalling=true;
    }
  }
  //gives fall speed and fall booleans
  void fall() {
    if (isJumping==false&&isFalling==true) {
      y=y+fallSpeed;
    }
    if (isFalling==true) {
      isJumping=false;
    }
  }
  //detects if player has landed
  void land() {
    if (y>=height-h) {
      isFalling=false;
      y=height-h;
    }
  }
  void resetBoundaries() {
    topBound=y;
    bottomBound=y+h;
    leftBound=x;
    rightBound=x+w;
  }
  //detects if player has fallen off of the platform
  void fallOffPlatform(ArrayList<platform>localPlatforms) {
    if (isJumping==false&&bottomBound<height) {
      boolean onPlatform=false;  

      for (platform aPlatform : localPlatforms) {
        if(aPlatform.bottomBound>=topBound&&aPlatform.leftBound<=rightBound&&aPlatform.rightBound>=leftBound&&aPlatform.topBound<=bottomBound){
          onPlatform=true;
        }
      }
      if(onPlatform==false){
        isFalling=true;
      }
    }
  }
}//end of class
