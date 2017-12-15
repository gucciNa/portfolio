/**
 *　ゲーセンにあるアレを真似した音ゲーもどきです。
 *　もどきなので音は無いです。<p>
 *
 *  ____________________________<p>
 *  操作方法<p>
 *　最初に難易度を選択<p>
 *　　easyはホントに簡単なんであんまりオススメできないです(笑)<p>
 *　•AかJキーで左端をたたく<p>
 *　•SかKキーで左から２番目をたたく<p>
 *　•DかLキーで右から２番目をたたく<p>
 *　•Fか：キーで右端をたたく<p>
 *  ____________________________<p>
 *  <p>
 *　scoreが75％超えたらクリア。<p>
 *　フルコンボ狙っちゃってくださいmm<p>
 *　譜面は毎回ランダムで作ってます。<p>
 *　個人的にはすごく楽しいです。<p>
 */

float correction;
int interval = -100;
int speed;
int n;
final int N = 40;
final int TOP_XL = -75;
final int TOP_XR = 75;
final int BOT_XL = -450;
final int BOT_XR = 450;
final int TOP_Y = 250;
final int BOT_Y = 700;
final int pushXL = -375;
final int pushXR = 375;
final int pushY = 600;
final int great = 30;
final int safe = 50;
final int bad = 70;
final int gscore = 100;
final int sscore = 50;


PImage bg;

int state = 0;
int combo = 0;
int maxCombo = 0;
int score = 0;
int ngreat = 0;
int nsafe = 0;
int nmiss = 0;
float wi;

Bar1[] bar1 = new Bar1[N];
Bar2[] bar2 = new Bar2[N];
Bar3[] bar3 = new Bar3[N];
Bar4[] bar4 = new Bar4[N];

float d1 = 0;
float d2 = 0;
float d3 = 0;
float d4 = 0;

void setup() {
  size(1000, 800);
  bg = loadImage("bg.jpg");
  moon1 = loadImage("moon1.png");
  moon2 = loadImage("moon2.png");
  colorMode(HSB);
  //translate(width/2, 0);
  textAlign(CENTER);
}

void draw() {
//translate(width/2, 0);
  if (state == 0) {
    //translate(width/2, 0);
    title();
    score = 0;
    combo = 0;
    maxCombo = 0;
    ngreat = 0;
    nsafe = 0;
    nmiss = 0;
  } else if (state == 1) { 
    game();
  } else if (state == 2) {
    result();
  }
}

void title() {
  background(0);
  translate(width/2, 0);
  fill(255);
  textAlign(CENTER); 
  textSize(150);
  
  fill(128);
  text("Hello!", -200, 250);
  textSize(70);
  text("Select Game Level!", 150, 750);
  textSize(60);
  //fill(0);
  //rect(-100, 300, 200, 400);
  fill(255);
  text("EASY", 0, 400);
  text("NORMAL", 0, 500);
  text("HARD", 0 , 600);
  image(moon1, -490, 450, 300, 300);
  image(moon2, 100, 100, 350, 200);
}

void result() {
  //translate(width/2, 0);
  background(0);
  image(moon1, 150, 350, 350, 350);
  textSize(60);
  if (n * 4 * gscore * 0.75 <= score) {
    fill(40, 255, 255);
    text("CLEAR", 0, 200);
  } else {
    fill(128);
    text("FAILED", 0, 200);
  }
  fill(255);
  textSize(30);
  text("Score : " + score, 0, 300);
  text("MaxCombo : " + maxCombo, 0, 350);
  if (maxCombo == n * 4) {
    fill(0, 255, 255);
    textSize(45);
    text("Full Combo !", 300, 350);
  }
  fill(255);
  text("Great : " + ngreat, 0, 450);
  text("Safe : " + nsafe, 0, 500);
  nmiss = n * 4 - (nsafe + ngreat);
  text("Miss : " + nmiss, 0, 550);
  textSize(60);
  fill(255);
  text("Go To Title", 0, 750);
}


void mousePressed() {
  switch(state) {
    case 0:
      if (375 <= mouseX && mouseX <= 625 && 350 <= mouseY && mouseY <= 400) {
        translate(width/2, 0);
        image(bg, -width/2, 0, width, height);
        textSize(60);
        fill(255, 150);
        noStroke();
        rect(BOT_XL, BOT_Y + 20, BOT_XR * 2, 70);
        fill(0);
        text("A/J", BOT_XL*3/4, BOT_Y + 75);
        text("S/K", BOT_XL/4, BOT_Y + 75);
        text("D/L", BOT_XR/4, BOT_Y + 75);
        text("F/:", BOT_XR*3/4, BOT_Y + 75);
        state = 1;
        speed = 3;
        n = 15;
        correction = 0;
        drawClass();
      } else if (-375 <= mouseX && mouseX <= 625 && 450 <= mouseY && mouseY <= 500) {
        translate(width/2, 0);
        image(bg, -width/2, 0, width, height);
        textSize(60);
        fill(255, 150);
        noStroke();
        rect(BOT_XL, BOT_Y + 20, BOT_XR * 2, 70);
        fill(0);
        text("A/J", BOT_XL*3/4, BOT_Y + 75);
        text("S/K", BOT_XL/4, BOT_Y + 75);
        text("D/L", BOT_XR/4, BOT_Y + 75);
        text("F/:", BOT_XR*3/4, BOT_Y + 75);
        state = 1;
        speed = 4;
        n = 25;
        correction = 0.1;
        drawClass();
      } else if (-375 <= mouseX && mouseX <= 625 && 550 <= mouseY && mouseY <= 600) {
        translate(width/2, 0);
        image(bg, -width/2, 0, width, height);
        textSize(60);
        fill(255, 150);
        noStroke();
        rect(BOT_XL, BOT_Y + 20, BOT_XR * 2, 70);
        fill(0);
        text("A/J", BOT_XL*3/4, BOT_Y + 75);
        text("S/K", BOT_XL/4, BOT_Y + 75);
        text("D/L", BOT_XR/4, BOT_Y + 75);
        text("F/:", BOT_XR*3/4, BOT_Y + 75);
        state = 1;
        speed = 5;
        n = 40;
        correction = 0.2;
        drawClass();
      }
      break;
    
    case 2:
      //translate(width/2, 0);
      if (400 <= mouseX && mouseX <= 600 && 700 <= mouseY && mouseY <= 800) {
        translate(-width/2, 0);
        state = 0;
      } 
      break;
  }
}

void game() {
  //translate(width/2, 0);
  drawField();
  drawBar();
  drawRipple();
  drawCombo();
  drawScore();
  if (searchEnd()) {
    state = 2;
  }
}

void keyPressed() {
  if (key == 'A' || key == 'a' || key == 'J' || key == 'j') {
    d1 = 1;
  } 
  if (key == 'S' || key == 's' || key == 'K' || key == 'k') {
    d2 = 1;
  }
  if (key == 'D' || key == 'd' || key == 'L' || key == 'l') {
    d3 = 1;
  }
  if (key == 'F' || key == 'f' || key == ':' || key == ';') {
    d4 = 1;
  }  
  if (state == 2) {
    state = 0;
    translate(-width/2, 0);
  }
}

void drawBar() {
  for (int i = 0; i < n; i++) {
    bar1[i].move();
    bar1[i].draw();
  }
  for (int i = 0; i < n; i++) {
    bar2[i].move();
    bar2[i].draw();
  }
  for (int i = 0; i < n; i++) {
    bar3[i].move();
    bar3[i].draw();
  }
  for (int i = 0; i < n; i++) {
    bar4[i].move();
    bar4[i].draw();
  }
}

void drawRipple() {
  if (d1 > 0) {
    d1 += speed;
    if (d1 < 20) {   //受付時間
      for (int i = 0; i < n; i++) {
        bar1[i].vanish();
      } 
    }
    if (d1 < 150) {
      noFill();
      stroke(40, 255, 255);
      ellipse(pushXL*3/4, pushY, d1, d1);
    }
    if (d1 > 150) {
      d1 =0;
    }
  }
  if (d2 > 0) {
    d2 += speed;
    if (d2 < 20) {
      for (int i = 0; i < n; i++) {
        bar2[i].vanish();
      }
    }
    if (d2 < 150) {
      noFill();
      stroke(40, 255, 255);
      ellipse(pushXL/4, pushY, d2, d2);
    }
    if (d2 > 150) {
      d2 = 0;
    }
  }
  if (d3 > 0) {
    d3 += speed;
    if (d3 < 20) {
      for (int i = 0; i < n; i++) {
        bar3[i].vanish();
      }
    }
    if (d3 < 150) {
      noFill();
      stroke(40, 255, 255);
      ellipse(pushXR/4, pushY, d3, d3);
    }
    if (d3 > 150) {
      d3 = 0;
    }
  }
  if (d4 > 0) {
    d4 += speed;
    if (d4 < 20) {
      for (int i = 0; i < n; i++) {
        bar4[i].vanish();
      }
    }
    if (d4 < 150) {
      noFill();
      stroke(40, 255, 255);
      ellipse(pushXR*3/4, pushY, d4, d4);
    }
    if (d4 > 150) {
      d4 = 0;
    }
  }
}

void drawField() {
  //translate(width/2, 0);
  smooth();
  
  noStroke();
  fill(80, 60);
  quad(TOP_XL-1, TOP_Y-3, TOP_XR+1, TOP_Y-3, BOT_XR+25, BOT_Y+10, BOT_XL-25, BOT_Y+10);  //field

  fill(40, 255, 255);
  triangle(TOP_XL-1, TOP_Y-3, BOT_XL-10, BOT_Y+10, BOT_XL - 25, BOT_Y+10);  //左
  triangle(TOP_XR+1, TOP_Y-3, BOT_XR+10, BOT_Y+10, BOT_XR + 25, BOT_Y+10);  //右
  
  stroke(40, 255, 255);
  strokeWeight(5);
  line(pushXL, pushY, pushXR, pushY);
  
  stroke(40, 255, 255);
  strokeWeight(1);
  line(0, TOP_Y-3, 0, BOT_Y+10);    //中央
  line(TOP_XL / 2, TOP_Y-3, BOT_XL / 2-3, BOT_Y+10); 
  line(TOP_XR / 2, TOP_Y-3, BOT_XR / 2+3, BOT_Y+10); 
}

void drawClass() {
  int i1 = 0;
  while (i1 < n) {
    int r = floor(random(-300-interval));
    bar1[i1] = new Bar1(70 * (r));
    int daburi = 0;
    for (int j = 0; j < i1; j++) {
      if (bar1[i1] == bar1[j]) {
        daburi += 1;
      }
    }
    if (daburi == 0) {
      i1++;
    }
  }
  
  int i2 = 0;
  while (i2 < n) {
    int r = floor(random(-300-interval));
    bar2[i2] = new Bar2(70 * (r));
    int daburi = 0;
    for (int j = 0; j < i2; j++) {
      if (bar2[i2] == bar2[j]) {
        daburi += 1;
      }
    }
    if (daburi == 0) {
      i2++;
    }
  }
  
  int i3 = 0;
  while (i3 < n) {
    int r = floor(random(-300-interval));
    bar3[i3] = new Bar3(70 * (r));
    int daburi = 0;
    for (int j = 0; j < i3; j++) {
      if (bar3[i3] == bar3[j]) {
        daburi += 1;
      }
    }
    if (daburi == 0) {
      i3++;
    }
  }
  
  int i4 = 0;
  while (i4 < n) {
    int r = floor(random(-300-interval));
    bar4[i4] = new Bar4(70 * (r));
    int daburi = 0;
    for (int j = 0; j < i4; j++) {
      if (bar4[i4] == bar4[j]) {
        daburi += 1;
      }
    }
    if (daburi == 0) {
      i4++;
    }
    /*shorter4 = ;
    if (shorter4 < bar4[i4]) {
      shorter4 = bar4[i4];
    }*/
  }
}

void drawCombo() {
  noStroke();
  fill(255);
  rect(-150, 0, 150, 100);
  fill(0);
  textSize(60);
  text(combo, -75, 65);
  textSize(30);
  text("combo", -75, 95);
}

void drawScore() {
  noStroke();
  fill(255);
  rect(0, 0, 150, 100);
  fill(0);
  textSize(40);
  text(score, 75, 70);
  stroke(0);
  fill(255);
  rect(-150, 100, 300, 100);
  noStroke();
  wi = map(score, 0, n * 4 * gscore, 0, 298);
  if (n * 4 * gscore * 0.75 <= score){
    fill(60, 255, 255);
  } else {
    fill(30, 255, 255);
  }
  rect(-149, 101, wi, 99);
  stroke(0);
  strokeWeight(5);
  line(75, 100, 75, 200);
}

boolean searchEnd() {
  for (int i = 0; i< n; i++) {
    if (bar1[i].y < height + 10) {
      return false;
    } else if (bar2[i].y < height + 10) {
      return false;
    } else if (bar3[i].y < height + 10) {
      return false;
    } else if (bar4[i].y < height + 10) {
      return false;
    }
  } 
  if (maxCombo < combo) {
    maxCombo = combo;
  }
  return true;
}
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
class Bar2 {
  float x;
  float y;
  float a2;
  float d;
  float t;
  int bar2_tag;
  
  Bar2(int y_) {
    bar2_tag = 1;
    y = y_;
    x = TOP_XL/4;
    a2 = (atan2(BOT_Y - TOP_Y, BOT_XL*3/4 - TOP_XL*3/4) 
          + atan2(BOT_Y - TOP_Y, 0)) / 2;
  }
  
  void move() {
    y += speed;
    d = map(y, TOP_Y, BOT_Y, TOP_XL/2, BOT_XL/2);
    t = map(y, TOP_Y, BOT_Y, 5, 18);
    if (y >= TOP_Y) {
      x += speed * tan(PI/2 - a2) + 0.22 + correction;
    }
  }
  
  void draw() {
    noStroke();
    fill(70, 200, 255);
    if (TOP_Y <= y && y <= BOT_Y && bar2_tag == 1) {
      ellipse(x, y, d, t);
      if (pushY + bad/2 <= y && bar2_tag == 1) {
        textSize(30);
        fill(255);
        text("Miss…", pushXL+300, pushY-30);
        if (maxCombo < combo) {
          maxCombo = combo;
        }
        combo = 0;
      }
    }
  }

  void vanish() {
    if (pushY - great/2 <= y && y < pushY + great/2 && bar2_tag== 1) {
      bar2_tag = 0;
      combo++;
      score += gscore;
      ngreat++;
      textSize(30);
      fill(40, 255, 255);
      text("Great!", pushXL+300, pushY - 20);
    } else if (pushY - safe/2 <= y && y < pushY + safe/2 && bar2_tag == 1) {
      bar2_tag = 0;
      combo++;
      score += sscore;
      nsafe++;
      textSize(30);
      fill(100, 255, 255);
      text("Safe", pushXL+300, pushY - 20);      
    } else if (pushY - bad/2 <= y && y < pushY + bad/2 && bar2_tag == 1) {
      bar2_tag = 0;
      if (maxCombo < combo) {
        maxCombo = combo;
      }
      combo = 0;
      textSize(30);
      fill(255);
      text("Miss…", pushXL+300, pushY - 20);
    }
  } 
}
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
class Bar4 {
  float x;
  float y;
  float a4;
  float d;
  float t;
  int bar4_tag;
  
  Bar4(int y_) {
    bar4_tag = 1;
    y = y_;
    x = TOP_XR * 3 / 4;
    a4 = (atan2(BOT_Y - TOP_Y, BOT_XR - TOP_XR) 
          + atan2(BOT_Y - TOP_Y, BOT_XR*3/4 - TOP_XR*3/4)) / 2;
  }
  
  void move() {
    y += speed;
    d = map(y, TOP_Y, BOT_Y, TOP_XL - TOP_XL/2, BOT_XL - BOT_XL / 2);
    t = map(y, TOP_Y, BOT_Y, 5, 18);
    if (y >= TOP_Y) {
      x += speed * tan(PI/2 - a4) - 0.3 - correction;
    }
  }
  
  void draw() {
    noStroke();
    fill(210, 200, 255);
    if (TOP_Y <= y && y <= BOT_Y && bar4_tag == 1) {
      ellipse(x, y, d, t);
      if (pushY + bad/2 <= y && bar4_tag == 1) {
        textSize(30);
        fill(255);
        text("Miss…", pushXR-100, pushY-30);
        if (maxCombo < combo) {
          maxCombo = combo;
        }
        combo = 0;
      }
    }
  }
  
  void vanish() {
    if (pushY - great/2 <= y && y < pushY + great/2 && bar4_tag== 1) {
      bar4_tag = 0;
      combo++;
      score += gscore;
      ngreat++;
      textSize(30);
      fill(40, 255, 255);
      text("Great!", pushXR-100, pushY - 20);
    } else if (pushY - safe/2 <= y && y < pushY + safe/2 && bar4_tag == 1) {
      bar4_tag = 0;
      combo++;
      score += sscore;
      nsafe++;
      textSize(30);
      fill(100, 255, 255);
      text("Safe", pushXR-100, pushY - 20);      
    } else if (pushY - bad/2 <= y && y < pushY + bad/2 && bar4_tag == 1) {
      bar4_tag = 0;
      if (maxCombo < combo) {
        maxCombo = combo;
      }
      combo = 0;
      textSize(30);
      fill(255);
      text("Miss…", pushXR-100, pushY - 20);
    }
  }
}

