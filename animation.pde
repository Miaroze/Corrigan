class animation {
  //variables
  PImage[] images;
  float speed; //speed of animation
  float scale; //size of animation

  float index; //position of array or the index of which image to display
  boolean isAnimating; //if true= full animation ,, if false=no animation
  boolean isRendered;

  //constructor
  animation(PImage[] tempImages, float tempSpeed, float tempScale) {
    images=tempImages;
    speed=tempSpeed;
    scale=tempScale;

    index=0;
    isAnimating=false;
    isRendered=true;
  }
  //updates index for animation
  void next() {
    index+=speed;
    if (index>=images.length) {
      index=0;
      isAnimating=false;
    }
  }
  void display(int x, int y) {
    imageMode(CENTER);
    //if (isRendered == true) {
      if (isAnimating) {
        int imageIndex=int(index);
        PImage img=images[imageIndex];
        image(img, x, y, img.width*scale, img.height*scale);

        // increment the index of the images to display
        next();
      } else {
        PImage img = images[0];
        image(img, x, y, img.width*scale, img.height*scale);
      }
  //  }
    if (isRendered==false) {
      isAnimating=false;
    }
  }
}
