class Bar1 {
  float x;
  float y;
  float a1;
  float d;
  float t;
  int bar1_tag;
  int next1;
  
  Bar1(int y_) {
    bar1_tag = 1;
    y = y_;
    x = TOP_XL * 3 / 4;
    a1 = (atan2(BOT_Y - TOP_Y, BOT_XL - TOP_XL) 
          + atan2(BOT_Y - TOP_Y, BOT_XL*3/4 - TOP_XL*3/4)) / 2;
  }
  
  void move() {
    y += speed;
    d = map(y, TOP_Y, BOT_Y, TOP_XL - TOP_XL/2, BOT_XL - BOT_XL / 2);
    t = map(y, TOP_Y, BOT_Y, 5, 18);
    if (y >= TOP_Y) {
      x += speed * tan(PI/2 - a1) + 0.3 + correction;
    }
  }
  
  void draw() {
    noStroke();
    fill(0, 200, 255);
    if (TOP_Y <= y && y <= BOT_Y && bar1_tag == 1) {
      ellipse(x, y, d, t);
      if (pushY + bad/2 <= y && bar1_tag == 1) {
        textSize(30);
        fill(255);
        text("Miss…", pushXL+100, pushY-30);
        if (maxCombo < combo) {
          maxCombo = combo;
        }
        combo = 0;
      }
    }
  }

  void vanish() {
    if (pushY - great/2 <= y && y < pushY + great/2 && bar1_tag== 1) {
      bar1_tag = 0;
      combo++;
      score += gscore;
      ngreat++;
      textSize(30);
      fill(40, 255, 255);
      text("Great!", pushXL+100, pushY - 20);
    } else if (pushY - safe/2 <= y && y < pushY + safe/2 && bar1_tag == 1) {
      bar1_tag = 0;
      combo++;
      score += sscore;
      nsafe++;
      textSize(30);
      fill(100, 255, 255);
      text("Safe", pushXL+100, pushY - 20);      
    } else if (pushY - bad/2 <= y && y < pushY + bad/2 && bar1_tag == 1) {
      bar1_tag = 0;
      if (maxCombo < combo) {
        maxCombo = combo;
      }
      combo = 0;
      textSize(30);
      fill(255);
      text("Miss…", pushXL+100, pushY - 20);
    }
  }
}
