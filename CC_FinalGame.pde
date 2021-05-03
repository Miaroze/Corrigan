//adding sound library
import processing.sound.*;
SoundFile backgroundMusic;
SoundFile jumpSound;
//ints for point system
int score;
//int for switching states 
int switchVal;
//setting up player1 class
player player1;
//platform platform1;
//goodSprite gSprite;
//badSprite bSprite;
//making array lists
ArrayList<platform>somePlatforms;
ArrayList<badSprite>someBSprites;
ArrayList<goodSprite>someGSprites;

ArrayList<platform>somePlatforms3;
ArrayList<badSprite>someBSprites3;
ArrayList<goodSprite>someGSprites3;

ArrayList<platform>somePlatforms4;
ArrayList<badSprite>someBSprites4;
ArrayList<goodSprite>someGSprites4;
//making animation image arrays
PImage jumpImage; //initialize image int
PImage [] jumpImages; //makes it an array w/ square brackets
animation jumpAnimation;
//making animation for falling
PImage fallImage;
PImage [] fallImages;
animation fallAnimation;
//animation for bad sprite idol
PImage bSpriteImage;
PImage [] bSpriteImages;
animation bSpriteAnimation;
//animation for bad sprite death
PImage bSDeathImage;
PImage [] bSDeathImages;
animation bSDeathAnimation;
//animation for good sprite idol
PImage gSpriteImage;
PImage [] gSpriteImages;
animation gSpriteAnimation;
//animation for good sprite release
PImage gSReleaseImage;
PImage [] gSReleaseImages;
animation gSReleaseAnimation;
//animation for character walking
PImage walkingImage;
PImage [] walkingImages;
animation walkingAnimation;
//animation for character walking left
PImage walkingLeftImage;
PImage [] walkingLeftImages;
animation walkingLeftAnimation;
//animation for character releasing spirits
PImage releasingImage;
PImage [] releasingImages;
animation releasingAnimation;
//animation for character idol
PImage characterImage;
PImage [] characterImages;
animation characterAnimation;
//images for start, death, and levels
PImage startScreen;
PImage deathScreen;
PImage controlScreen;
PImage winScreen;
PImage background1;
PImage background2;
PImage background3;
PImage platformImage1;
PImage platformImage2;
PImage platformImage3;
//booleans
boolean isSwitching = false;
void setup() {
  size(540, 715);
  //calling variables
  score=0;
  //adding music
  backgroundMusic=new SoundFile(this, "backgroundMusic.mp3");
  if(!/*not*/backgroundMusic.isPlaying()){
    backgroundMusic.play();
  }
  jumpSound=new SoundFile(this, "jumpSound.wav");
    //changing sound rate
  jumpSound.rate(1.5);
  //adding images
  startScreen=loadImage("startScreen.png");
  deathScreen=loadImage("deathScreen.png");
  controlScreen=loadImage("controlScreen.PNG");
  winScreen=loadImage("winScreen.PNG");
  background1=loadImage("background1.PNG");
  background2=loadImage("background2.png");
  background3=loadImage("background3.png");
  platformImage1=loadImage("platform1.png");
  platformImage2=loadImage("platform2.png");
  platformImage3=loadImage("platform3.png");
  player1=new player(14, 30, 30, 100, 500, 135, 80);
  //initializing array list
  somePlatforms=new ArrayList<platform>();
                           // x    y    w    h     c
  platform p1 = new platform(200, 200, 200, 10, color(0, 255, 0));
  somePlatforms.add(p1);
  platform p2 = new platform(50, 380, 200, 10, color(0, 255, 0));
  somePlatforms.add(p2);
  platform p3 = new platform(370, 550, 200, 10, color(0, 255, 0));
  somePlatforms.add(p3);
  platform p4 = new platform(250, 20, 200, 10, color(0, 255, 0));
  somePlatforms.add(p4);
  someBSprites=new ArrayList<badSprite>();
  someBSprites.add(new badSprite(325, 175, 30, #FF0000, 1, p1));
  someGSprites=new ArrayList<goodSprite>();
  someGSprites.add(new goodSprite(250, 175, 30, #46FFFD));
  someGSprites.add(new goodSprite(420, 525, 30, #46FFFD));

  somePlatforms3=new ArrayList<platform>();
                           // x    y    w    h     c
  platform p5 = new platform(400, 200, 200, 10, color(0, 0, 0));
  somePlatforms3.add(p5);
  platform p6 = new platform(50, 400, 200, 10, color(0, 0, 0));
  somePlatforms3.add(p6);
  platform p7 = new platform(370, 580, 200, 10, color(0, 0, 0));
  somePlatforms3.add(p7);
  platform p8 = new platform(50, 50, 200, 10, color(0, 0, 0));
  somePlatforms3.add(p8);
  someBSprites3=new ArrayList<badSprite>();
  someBSprites3.add(new badSprite(40, 375, 30, #FF0000, 2, p6));
  someGSprites3=new ArrayList<goodSprite>();
  someGSprites3.add(new goodSprite(60, 375, 30, #46FFFD));
  someGSprites3.add(new goodSprite(500, 555, 30, #46FFFD));
  someGSprites3.add(new goodSprite(100, 25, 30, #46FFFD));

  somePlatforms4=new ArrayList<platform>();
                           // x    y    w    h     c
  platform p9 = new platform(300, 200, 200, 10, color(255, 0, 0));
  somePlatforms4.add(p9);
  platform p10 = new platform(50, 350, 200, 10, color(255, 0, 0));
  somePlatforms4.add(p10);
  platform p11 = new platform(200, 575, 200, 10, color(255, 0, 0));
  somePlatforms4.add(p11);
  platform p12 = new platform(250, 20, 200, 10, color(255, 0, 0));
  somePlatforms4.add(p12);
  someBSprites4=new ArrayList<badSprite>();
  someBSprites4.add(new badSprite(45, 325, 30, #FF0000, 2, p10));
  someBSprites4.add(new badSprite(450, 175, 30, #FF0000, 3, p9));
  someGSprites4=new ArrayList<goodSprite>();
  someGSprites4.add(new goodSprite(400, 175, 30, #46FFFD));
  someGSprites4.add(new goodSprite(75, 325, 30, #46FFFD));

  //making animation for jump
  jumpImages=new PImage[8];
  //for loop for jumping animation
  for (int i=0; i<jumpImages.length; i++) {
    jumpImages[i]=loadImage("Character_Jumping "+i+".png");
  }
  jumpAnimation=new animation(jumpImages, 0.05, .5);
  //making animation for character falling
  fallImages=new PImage[8];
  //for loop for falling animation
  for (int i=0; i<jumpImages.length; i++){
    fallImages[i]=loadImage("falling "+i+".png");
  }
  fallAnimation=new animation(fallImages, 0.05, .5);
  //for loop for good sprite idle animation
  gSpriteImages=new PImage[10];
  for (int i=0; i<gSpriteImages.length; i++) {
    gSpriteImages[i]=loadImage("gSprite "+i+".png");
  }
  gSpriteAnimation=new animation(gSpriteImages, 0.45, .25);
  //for loop for bad sprite idle animation
  bSpriteImages=new PImage[9];
  for (int i=0; i<bSpriteImages.length; i++) {
    bSpriteImages[i]=loadImage("bSprite "+i+".png");
  }
  bSpriteAnimation=new animation(bSpriteImages, 0.4, .25);
  //idle animation for character for loop
  characterImages=new PImage[6];
  for (int i=0; i<characterImages.length; i++) {
    characterImages[i]=loadImage("Character_Idle "+i+".png");
  }
  characterAnimation=new animation(characterImages, 0.4, .35);
  //for loop for character walking
  walkingImages=new PImage[12];
  for (int i=0; i<walkingImages.length; i++) {
    walkingImages[i]=loadImage("walking "+i+".png");
  }
  walkingAnimation=new animation(walkingImages, 1, .33);
  //for loop for character walking left
  walkingLeftImages=new PImage[12];
  for (int i=0; i<walkingLeftImages.length; i++) {
    walkingLeftImages[i]=loadImage("walkingLeft "+i+".png");
  }
  walkingLeftAnimation=new animation(walkingLeftImages, 1, .33);
  //for loop for release of good sprite
  gSReleaseImages=new PImage[9];
  for (int i=0; i<gSReleaseImages.length; i++) {
    gSReleaseImages[i]=loadImage("gSpriteRelease "+i+".png");
  }
  gSReleaseAnimation=new animation(gSReleaseImages, 0.1, .25);
  //for loop for death of bad sprite
  bSDeathImages=new PImage[9];
  for (int i=0; i<bSDeathImages.length; i++) {
    bSDeathImages[i]=loadImage("bSpriteDeath "+i+".png");
  }
  bSDeathAnimation=new animation(bSDeathImages, 0.2, .25);
  //for loop for character releasing sprite
  releasingImages=new PImage[9];
  for (int i=0; i<releasingImages.length; i++) {
    releasingImages[i]=loadImage("characterReleasingSprite "+i+".png");
  }
  releasingAnimation=new animation(releasingImages, 0.2, .35);
}//end of setup

void draw() {
  background(#6A205A);
  switch(switchVal) {
    //start screen
  case 0:
    image(startScreen, 0, 0, 540, 715);
    textSize(20);
    fill(#FF05A8);
    text("'i' for controls",210,35);
    break;
    //game screen
  case 1:
    image(background1, width/2, height/2, 540, 715);
    image(platformImage1, 300, 280, 240, 225);
    image(platformImage2, 150, 430, 240, 200);
    image(platformImage3, 480, 600, 270, 200);
    image(platformImage3, 360, 75, 290, 200);
    player1.moveLeft();
    player1.moveRight();
    //player1.render();
    player1.jump();
    player1.reachedTopOfJump();
    player1.fall();
    player1.land();
    player1.resetBoundaries();
    player1.fallOffPlatform(somePlatforms);  
    for (platform platform1 : somePlatforms) {
      platform1.boundaries();
      platform1.landedOn();
      //platform1.render();
    }
    //bad sprite things
    for (badSprite bSprite : someBSprites) {
      //bSprite.render();
      bSprite.boundaries();
      bSprite.touchDetection();
      bSprite.move(); //moves sprite back and forth
      bSprite.platformDetection();

      //making animation for bad sprite idle 
      bSpriteAnimation.display(bSprite.x, bSprite.y-20);
      bSpriteAnimation.isAnimating=true;
      if (switchVal==1&&bSprite.isTouched==true) {
        switchVal=5;
        bSprite.isTouched=false;
        player1.x=width/2;
        player1.y=height-player1.h;
        player1.isJumping=false;
      }
      if (bSprite.isTouched==true) {
        bSpriteAnimation.isAnimating=false;
        bSDeathAnimation.isAnimating=true;
      }
    }//end of bad sprite things      
    //good sprite things
    for (goodSprite gSprite : someGSprites) {
      //gSprite.render();
      gSprite.boundaries();
      gSprite.touchDetection();
      //gSprite.isRendered = true;
      //making animation for good sprite idle
      if (gSprite.isTouched==false) {
        gSpriteAnimation.display(gSprite.x, gSprite.y-20);
        gSpriteAnimation.isAnimating=true;
      }
    }
    //forloop for removing good sprites
    for (int i=someGSprites.size()-1; i>=0; i--) {
      if (someGSprites.get(i).isTouched==true) {
        someGSprites.remove(i);
        score=score+1;
 //test print of scores
        println("first time:", score);
      }
    }//end of good sprite things
    //player animation things
    if (player1.movingRight == true) {
      //making animation for character walking
      walkingAnimation.display(player1.x+40, player1.y+70);
      walkingAnimation.isAnimating=true;
    } else if (player1.isJumping == true) {
      //making animation for jump 
      jumpAnimation.isAnimating=true;
      jumpAnimation.display(player1.x+45, player1.y+60);
    } else if (player1.movingLeft ==true) {
      walkingLeftAnimation.display(player1.x+40, player1.y+70);
      walkingLeftAnimation.isAnimating=true;
    } else if (player1.isFalling == true){
      fallAnimation.isAnimating=true;
      fallAnimation.display(player1.x+45, player1.y+60);
    }
    else {
      //making animation for character idle
      characterAnimation.display(player1.x+40, player1.y+73);
    } 
    if (player1.isJumping==false&&player1.isFalling==false&&player1.movingRight==false&&player1.movingLeft==false) {
      characterAnimation.isAnimating=true;
      jumpAnimation.isAnimating=false;
      jumpAnimation.isRendered=false;
    }
    //adding score
    textSize(40);
    fill(#FF05A8);
    text(score,500,50);
    //switch to second level
    if (switchVal==1&&player1.y<0-player1.h) {
      switchVal=3;
      player1.y=height-player1.h;
      isSwitching=true;
    }
    //switching to win screen
    if (switchVal==1&&score==7){
      switchVal=6;
    }
    break;
  case 2: //controls
  image(controlScreen, 0, 0, 540, 715);
    break;
  case 3:
    if (player1.y<400&&isSwitching==true) {
      player1.isJumping=false;
      player1.isFalling=true;
      isSwitching=false;
    }
    image(background2, width/2, height/2, 540, 715);
    //adding images to platforms
    image(platformImage2, 505, 250, 260, 225);
    image(platformImage1, 150, 470, 240, 200);
    image(platformImage3, 460, 640, 270, 200);
    image(platformImage2, 150, 100, 290, 200);
    player1.moveLeft();
    player1.moveRight();
    //player1.render();
    player1.jump();
    player1.reachedTopOfJump();
    player1.fall();
    player1.land();
    player1.resetBoundaries();
    player1.fallOffPlatform(somePlatforms3);  
    for (platform platform1 : somePlatforms3) {
      platform1.boundaries();
      platform1.landedOn();
      //platform1.render();
    }
    //bad sprite things
    for (badSprite bSprite : someBSprites3) {
      //bSprite.render();
      bSprite.boundaries();
      bSprite.touchDetection();
      bSprite.move(); //moves sprite back and forth
      bSprite.platformDetection();

      //making animation for bad sprite idle 
      bSpriteAnimation.display(bSprite.x, bSprite.y-20);
      bSpriteAnimation.isAnimating=true;
      if (switchVal==3&&bSprite.isTouched==true) {
        switchVal=5;
        bSprite.isTouched=false;
        player1.x=width/2;
        player1.y=height-player1.h;
        player1.isJumping=false;
        // isAlive=true;
      }
      if (bSprite.isTouched==true) {
        bSpriteAnimation.isAnimating=false;
        bSDeathAnimation.isAnimating=true;
      }
    }//end of bad sprite things      
    //good sprite things
    for (goodSprite gSprite : someGSprites3) {
      //gSprite.render();
      gSprite.boundaries();
      gSprite.touchDetection();
      gSprite.isRendered = true;
      //making animation for good sprite idle
      if (gSprite.isTouched==false) {
        gSpriteAnimation.display(gSprite.x, gSprite.y-20);
        gSpriteAnimation.isAnimating=true;
      }
    }
    //forloop for removing good sprites
    for (int i=someGSprites3.size()-1; i>=0; i--) {
      if (someGSprites3.get(i).isTouched==true) {
        someGSprites3.remove(i);
        score=score+1;
        //test print of scores
        println("second time:", score);
      }
    }//end of good sprite things
    //player animation things
    if (player1.movingRight == true) {
      //making animation for character walking
      walkingAnimation.display(player1.x+40, player1.y+70);
      walkingAnimation.isAnimating=true;
    } else if (player1.isJumping == true) {
      //making animation for jump
      jumpAnimation.isAnimating=true;
      jumpAnimation.display(player1.x+45, player1.y+60);
    } else if (player1.movingLeft ==true) {
      walkingLeftAnimation.display(player1.x+40, player1.y+70);
      walkingLeftAnimation.isAnimating=true;
    } 
    else if (player1.isFalling == true){
      fallAnimation.isAnimating=true;
      fallAnimation.display(player1.x+45, player1.y+60);
    }
    else {
      //making animation for character idle
      characterAnimation.display(player1.x+40, player1.y+73);
    }
    if (player1.isJumping==false&&player1.isFalling==false&&player1.movingRight==false&&player1.movingLeft==false) {
      characterAnimation.isAnimating=true;
      jumpAnimation.isAnimating=false;
      jumpAnimation.isRendered=false;
    }
    //making character fall back down
    if (switchVal==3&&player1.y+player1.h>=height) {
      switchVal=1;
      player1.y=0-player1.h;
    }
        //adding score
    textSize(40);
    fill(#FF05A8);
    text(score,500,50);
    //switch to third level
    if (switchVal==3&&player1.y<0-player1.h) {
      switchVal=4;
      player1.y=height-player1.h;
      isSwitching=true;
    }
        //switching to win screen
    if (switchVal==3&&score==7){
      switchVal=6;
    }
    break;
  case 4:
    image(background3, width/2, height/2, 540, 715);
    //adding in platform images
    image(platformImage1, 400, 280, 260, 225);
    image(platformImage3, 160, 400, 300, 200);
    image(platformImage2, 300, 630, 270, 200);
    image(platformImage1, 350, 90, 270, 200);
    if (player1.y<400&&isSwitching==true) {
      player1.isJumping=false;
      player1.isFalling=true;
      isSwitching=false;
    }
    player1.moveLeft();
    player1.moveRight();
    //player1.render();
    player1.jump();
    player1.reachedTopOfJump();
    player1.fall();
    player1.land();
    player1.resetBoundaries();
    player1.fallOffPlatform(somePlatforms4);  
    for (platform platform1 : somePlatforms4) {
      platform1.boundaries();
      platform1.landedOn();
      //platform1.render();
    }
    //bad sprite things
    for (badSprite bSprite : someBSprites4) {
      //bSprite.render();
      bSprite.boundaries();
      bSprite.touchDetection();
      bSprite.move(); //moves sprite back and forth
      bSprite.platformDetection();

      //making animation for bad sprite idle 
      bSpriteAnimation.display(bSprite.x, bSprite.y-20);
      bSpriteAnimation.isAnimating=true;
      if (switchVal==4&&bSprite.isTouched==true) {
        switchVal=5;
        bSprite.isTouched=false;
        player1.x=width/2;
        player1.y=height-player1.h;
        player1.isJumping=false;
      }
      if (bSprite.isTouched==true) {
        bSpriteAnimation.isAnimating=false;
        bSDeathAnimation.isAnimating=true;
      }
    }//end of bad sprite things      
    //good sprite things
    for (goodSprite gSprite : someGSprites4) {
      //gSprite.render();
      gSprite.boundaries();
      gSprite.touchDetection();
      gSprite.isRendered = true;
      //making animation for good sprite idle
      if (gSprite.isTouched==false) {
        gSpriteAnimation.display(gSprite.x, gSprite.y-20);
        gSpriteAnimation.isAnimating=true;
      } 
    }
    //forloop for removing good sprites
    for (int i=someGSprites4.size()-1; i>=0; i--) {
      if (someGSprites4.get(i).isTouched==true) {
        someGSprites4.remove(i);
        score=score+1;
        //test print of scores
        println("third time:", score);
      }
    }//end of good sprite things
    //player animation things
    if (player1.movingRight == true) {
      //making animation for character walking
      walkingAnimation.display(player1.x+40, player1.y+70);
      walkingAnimation.isAnimating=true;
    } else if (player1.isJumping == true) {
      //making animation for jump
      jumpAnimation.isAnimating=true;
      jumpAnimation.display(player1.x+45, player1.y+60);
    } else if (player1.movingLeft ==true) {
      walkingLeftAnimation.display(player1.x+40, player1.y+70);
      walkingLeftAnimation.isAnimating=true;
    }else if (player1.isFalling == true){
      fallAnimation.isAnimating=true;
      fallAnimation.display(player1.x+45, player1.y+60);
    }   
    else {
      //making animation for character idle
      characterAnimation.display(player1.x+40, player1.y+73);
    }
    if (player1.isJumping==false&&player1.isFalling==false&&player1.movingRight==false&&player1.movingLeft==false) {
      characterAnimation.isAnimating=true;
      jumpAnimation.isAnimating=false;
      jumpAnimation.isRendered=false;
    }
    //making character fall back down
    if (switchVal==4&&player1.y+player1.h>=height) {
      switchVal=3;
      player1.y=0-player1.h;
    }
        //adding score
    textSize(40);
    fill(#FF05A8);
    text(score,500,50);
    //switching to win screen
    if (switchVal==4&&score==7){
      switchVal=6;
    }
    break;
    //death screen
  case 5:
    image(deathScreen, width/2, height/2, 540, 715);
    break;
  case 6:
  image(winScreen, width/2, height/2, 540, 715);
  break;
  }
} //end of draw

//making keys move player
void keyPressed() {
  if (key==' '&&switchVal==0) {
    switchVal=1;
  }
  if (key==' '&&switchVal==5) {
    switchVal=1;
    setup();
  }
  if (key==' '&&switchVal==6) {
    switchVal=1;
    setup();
  }
  if (key=='i'&&switchVal==0) {
    switchVal=2;
  }
  if (key==' '&&switchVal==2) {
    switchVal=1;
  }  
  if (key=='a') {
    player1.movingLeft=true;     
    player1.movingRight=false;
  }
  if (key=='d') {
    player1.movingRight=true; 
    player1.movingLeft=false;
  }
  if (key=='w'&&player1.isJumping==false&&player1.isFalling==false) {
    player1.isJumping=true;
    player1.jumpHeight=player1.y-200;
    jumpAnimation.isAnimating=true;
      if (jumpSound.isPlaying()){
    jumpSound.stop();
  }
  //plays sound every time mouse is pressed
  jumpSound.play();
  }
}
void keyReleased() {
  if (key=='a') {
    player1.movingLeft=false;
  }
  if (key=='d') {
    player1.movingRight=false;
  }
}//end of keypressed
