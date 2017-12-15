class Bar3 {
  float x;
  float y;
  float a3;
  float d;
  float t;
  int bar3_tag;
  
  Bar3(int y_) {
    bar3_tag = 1;
    y = y_;
    x = TOP_XR / 4;
    a3 = (atan2(BOT_Y - TOP_Y, BOT_XR*3/4 - TOP_XR*3/4) 
          + atan2(BOT_Y - TOP_Y, 0)) / 2;
  }
  
  void move() {
    y += speed;
    d = map(y, TOP_Y, BOT_Y, TOP_XL - TOP_XL/2, BOT_XL - BOT_XL / 2);
    t = map(y, TOP_Y, BOT_Y, 5, 18);
    if (y >= TOP_Y) {
      x += speed * tan(PI/2 - a3) - 0.22 - correction;
    }
  }
  
  void draw() {
    noStroke();
    fill(140, 200, 255);
    if (TOP_Y <= y && y <= BOT_Y && bar3_tag == 1) {
      ellipse(x, y, d, t);
      if (pushY + bad/2 <= y && bar3_tag == 1) {
        textSize(30);
        fill(255);
        text("Miss…", pushXR-300, pushY-30);
        if (maxCombo < combo) {
          maxCombo = combo;
        }
        combo = 0;
      }
    }
  }
  
  void vanish() {
    if (pushY - great/2 <= y && y < pushY + great/2 && bar3_tag== 1) {
      bar3_tag = 0;
      combo++;
      score += gscore;
      ngreat++;
      textSize(30);
      fill(40, 255, 255);
      text("Great!", pushXR-300, pushY - 20);
    } else if (pushY - safe/2 <= y && y < pushY + safe/2 && bar3_tag == 1) {
      bar3_tag = 0;
      combo++;
      score += sscore;
      nsafe++;
      textSize(30);
      fill(100, 255, 255);
      text("Safe", pushXR-300, pushY - 20);      
    } else if (pushY - bad/2 <= y && y < pushY + bad/2 && bar3_tag == 1) {
      bar3_tag = 0;
      if (maxCombo < combo) {
        maxCombo = combo;
      }
      combo = 0;
      textSize(30);
      fill(255);
      text("Miss…", pushXR-300, pushY - 20);
    }
  }
}
