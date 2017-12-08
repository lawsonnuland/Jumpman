
void setup(){
  size( 650, 400);
}

void initialize () {
  frameRate(30);
}

//player Character
var Jumpman = function(x, y) {
  this.x = x;
  this.y = y;
  this.xspeed = 0;
  this.yspeed = 0;
  this.alive = true;
  this.lives = 3;
  this.jumping =false;
  this.facingright = loadImage("images/player_standing.png");
  this.facingleft = loadImage("images/left.png");
  this.img = this.facingright;
  this.coins = 0;
};

Jumpman.prototype.draw = function() {
    fill(255, 255, 0);
    image(this.img, this.x, this.y);
};

Jumpman.prototype.move = function() {

   if (keyPressed && keyCode == UP && this.jumping==false) {
       this.yspeed = -15;
       this.jumping = true;
     }
   this.y = this.y +this.yspeed;

   if (keyPressed && keyCode == RIGHT) {
     this.img = this.facingright;
     if (this.xspeed <= 7) {
       this.xspeed += 1.25;
     } else {
       this.xspeed = 7;
     }

   }
   if (keyPressed && keyCode == LEFT) {
     this.img = this.facingleft;
     if (this.xspeed >= -7) {
       this.xspeed -= 1.25;
     } else {
       this.xspeed = -7;
     }
   }
    this.x = this.x + this.xspeed;

    if (this.xspeed > 0 && this.jumping == false) {
      this.xspeed -=.5;
    } else if (this.xspeed < 0 && this.jumping == false) {
      this.xspeed += .5;
    }

   if (this.y == 300) {
      this.jumping = false;
   } else {
     this.jumping = true;
   }

   if (this.jumping == true) {
     this.yspeed += 1;
   }

   if (this.x < 0) {
     this.x = 0;
     this.xspeed = 0;
   }

   if (this.x > 625) {
     this.x = 625;
     this.xspeed = 0;
   }

};


Jumpman.prototype.collider = function(platform) {
    if (this.y >= platform.y - 50) {
        this.yspeed = 0;
        this.jumping = false;
    } else {

        this.jumping = true;
    }

};

Jumpman.prototype.checkforcoins=function(coin) {
    if ((coin.x >= this.x && coin.x <= (this.x + 40)) &&
        (coin.y >= this.y && coin.y <= (this.y + 40))) {
        coin.y = 20;
        coin.x = 20;
        coin.xspeed = 0;
        coin.yspeed = 0;
        this.coins++;
    }
};

Jumpman.prototype.checkforspikes=function(spike) {
    if ((spike.x >= this.x && spike.x <= (this.x + 40)) &&
        (spike.y >= this.y && spike.y <= (this.y + 40))) {
        this.alive = false;
    }
};

var man = new Jumpman(100,300);

man.jumping=false;

var Platform = function(x, y, length, depth) {
  this.x = x;
  this.y = y;
  this.length = length;
  this.depth = depth;
};


Platform.prototype.draw = function() {
  fill(0,255,50);
  rect(this.x, this.y, this.length, this.depth);
};


var level1 = [];
level1.push(new Platform(0, 350, 1000, 40));
//level1.push(new platform(random(0,600), 350, 1000, 40));
var start = new Platform(-10, 350, 1000, 40);

var coin = function ( x, y, xspeed, yspeed) {
  this.x = x;
  this.y = y;
  this.xspeed = xspeed;
  this.yspeed = yspeed;
};

coin.prototype.draw=function(){
    fill(242, 255, 0);
    ellipse(this.x,this.y,10,10);
    if (this.xspeed > 10) {
      this.xspeed = 10;
    }

    if (this.xspeed < -10) {
      this.xspeed = -10;
    }

    if (this.yspeed > 10) {
      this.yspeed = 10;
    }

    if (this.xspeed < -10) {
      this.yspeed = -10;
    }

};

coin.prototype.bounce = function () {
  if (this.x < 0) {
    this.x = 0;
    this.xspeed = - this.xspeed;
  }

  if (this.x > 650) {
    this.x = 650;
    this.xspeed = - this.xspeed;

  }

  if (this.y < 9) {
    this.y = 9;
    this.yspeed = - this.yspeed;
  }

  if (this.y > 350) {
    this.y = 350;
    this.yspeed = - this.yspeed;

  }


};

var coins=[];

for(var j=0;j<100;j++){
    coins.push(new coin(random(30, 600), 10, random(-3,3), random(1,3)));
}


var spike = function ( x, y, xspeed, yspeed) {
  this.x = x;
  this.y = y;
  this.xspeed = xspeed;
  this.yspeed = yspeed;
};

spike.prototype.draw=function(){
    fill(242, 0, 0);
    rect(this.x,this.y,10,10);
    if (this.xspeed > 10) {
      this.xspeed = 10;
    }

    if (this.xspeed < -10) {
      this.xspeed = -10;
    }

    if (this.yspeed > 10) {
      this.yspeed = 10;
    }

    if (this.xspeed < -10) {
      this.yspeed = -10;
    }

};

spike.prototype.bounce = function () {
  if (this.x < 0) {
    this.x = 0;
    this.xspeed = - this.xspeed;
  }

  if (this.x > 650) {
    this.x = 650;
    this.xspeed = - this.xspeed;

  }

  if (this.y < 9) {
    this.y = 9;
    this.yspeed = - this.yspeed;
  }

  if (this.y > 350) {
    this.y = 350;
    this.yspeed = - this.yspeed;

  }


};

var spikey = [];

for(var j=0;j<2;j++){
    spikey.push(new spike(random(30, 600), 10, random(-1,1), 1));
}

var face = 0;

void draw(){

  background(227, 254, 255);
  fill(130, 79, 43);
  rectMode(CORNER);
  rect(0, height*0.90, width, height*0.15);
  man.draw();
  man.move();
  for (var i = 0; i < level1.length; i++) {
        man.collider(level1[i]);
        level1[i].draw();
    }
  start.draw();

  for (var j=0;j<coins.length;j++){
        strokeWeight(1);
        coins[j].draw();
        coins[j].bounce();
        coins[j].x += coins[j].xspeed;
        coins[j].y += coins[j].yspeed;
        man.checkforcoins(coins[j]);
    }

for (var j=0;j<spikey.length;j++){
        spikey[j].draw();
        spikey[j].bounce();
        spikey[j].x += spikey[j].xspeed;
        spikey[j].y += spikey[j].yspeed;
        man.checkforspikes(spikey[j]);
    }
  man.collider(start);
  fill(255,255,255);
  rect(10, 10, 70, 30);
  fill(0,0,0);
  text("Coins: " + man.coins, 15,25);

  if (man.coins == 100) {
    background(255,255,255);
    text("You got all the coins!", 300, 200);
  }

  if (man.alive == false) {
    background(0,0,0);
    fill(255,255,0);
    text("You died. Try again?");

  }
//}

};
