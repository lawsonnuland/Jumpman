
void setup(){
  size( 650, 400 );
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
  this.img = loadImage("images/player_standing.png");
};



Jumpman.prototype.draw = function() {
    fill(255, 255, 0);
    image(this.img, this.x, this.y);
};


Jumpman.prototype.move = function() {
  if (keyPressed && keyCode == RIGHT) {
    if (this.xspeed <= 7) {
      this.xspeed += 1.25;
    } else {
      this.xspeed = 7;
    }

  }
  if (keyPressed && keyCode == LEFT) {
    if (this.xspeed >= -7) {
      this.xspeed -= 1.25;
    } else {
      this.xspeed = -7;
    }
  }
   this.x = this.x + this.xspeed;

   if (this.xspeed > 0 && this.jumping == false) {
     this.xspeed -=.5;
   } else if (this.xspeed < 0 && this.jumping==false) {
     this.xspeed += .5;
   }


   if (keyPressed && keyCode == UP && this.jumping==false) {
       this.yspeed = -15;
       this.jumping = true;
     }
   this.y = this.y +this.yspeed;

   /*
   if (this.yspeed == 0) {
      this.jumping = false;
   } else {
     this.jumping = true;
   }
*/
   if (this.jumping == true) {
     this.yspeed += 1;
   }

};


Jumpman.prototype.collider = function(platform) {
    if (this.y >= platform.y - 50 && (this.x >= platform.x || this.x <= platform.x + platform.length)) {
        this.yspeed = 0;
        this.jumping = false;
    } else {

        this.jumping = true;
    }

};


var man = new Jumpman(100,300);

man.jumping=false;

var platform = function(x, y, length, depth) {
  this.x = x;
  this.y = y;
  this.length = length;
  this.depth = depth;
};


platform.prototype.draw = function() {
  fill(0,255,0);
  rect(this.x, this.y, this.length, this.depth);
};

var level1 = [];
level1.push(new platform(0, 350, 1000, 40));
//level1.push(new platform(300, 325, 100, 40));
// Main draw loop
void draw(){
  background(227, 254, 255);
  man.draw();
  man.move();
  for (var i = 0; i < level1.length; i++) {
        level1[i].draw();
        man.collider(level1[i]);

    }
  rect(10, 10, 60, 30);
  fill(0,0,0);
  text("Lives: " + man.lives, 15,25);

};
