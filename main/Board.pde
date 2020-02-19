class Board {

  int[] squares = new int[9];

  boolean circle, cross;

  PVector location;
  int size = 50;
  int gsec;
  
  String won;
  
  boolean turn, state;

  Board() {

    location = new PVector(width/2, height/2);
  }

  void display() {
    stroke(200);
    strokeWeight(5);

    line(width*1/3, 0, width*1/3, height);
    line(width*2/3, 0, width*2/3, height);
    line(0, height*1/3, width, height*1/3);
    line(0, height*2/3, width, height*2/3);



    if ((mouseX > size) && (mouseX < width-size) && (mouseY > size) && (mouseY < height-size)) {
      location.x = mouseX;
      location.y = mouseY;
    }

    fill(255);
    stroke(0);
    strokeWeight(10);


    for (int i = 1; i < 10; i++) {
      if ((i > 0) && (i < 4)) {
        if (squares[i-1] == 1) {
          line(width*(i*2-1)/6-size, height*1/6-size, width*(i*2-1)/6+size, height*1/6+size);
          line(width*(i*2-1)/6-size, height*1/6+size, width*(i*2-1)/6+size, height*1/6-size);
        } else if (squares[i-1] == 5) {
          ellipse(width*(i*2-1)/6, height*1/6, size*2, size*2);
        }
      } else if ((i > 3) && (i < 7)) {
        if (squares[i-1] == 1) {
          line(width*((i-3)*2-1)/6-size, height*3/6-size, width*((i-3)*2-1)/6+size, height*3/6+size);
          line(width*((i-3)*2-1)/6-size, height*3/6+size, width*((i-3)*2-1)/6+size, height*3/6-size);
        } else if (squares[i-1] == 5) {
          ellipse(width*((i-3)*2-1)/6, height*3/6, size*2, size*2);
        }
      } else if ((i > 6) && (i < 10)) {
        if (squares[i-1] == 1) {
          line(width*((i-6)*2-1)/6-size, height*5/6-size, width*((i-6)*2-1)/6+size, height*5/6+size);
          line(width*((i-6)*2-1)/6-size, height*5/6+size, width*((i-6)*2-1)/6+size, height*5/6-size);
        } else if (squares[i-1] == 5) {
          ellipse(width*((i-6)*2-1)/6, height*5/6, size*2, size*2);
        }
      }
    }
    if (turn) {
      line(location.x-size, location.y-size, location.x+size, location.y+size);
      line(location.x-size, location.y+size, location.x+size, location.y-size);
    } else {
      ellipse(location.x, location.y, size*2, size*2);
    }

   
  }

  void input() {
    
    
    if ((mouseX > 0) && (mouseX < width*1/3) && (mouseY > 0) && (mouseY < height*1/3)) {
      if (turn) {
        squares[0] = 1;
      } else {
        squares[0] = 5;
      }
      println(squares[0]);
    } else if ((mouseX > width*1/3) && (mouseX < width*2/3) && (mouseY > 0) && (mouseY < height*1/3)) {
      if (turn) {
        squares[1] = 1;
      } else {
        squares[1] = 5;
      }
      println(squares[1]);
    } else if ((mouseX > width*2/3) && (mouseX < width) && (mouseY > 0) && (mouseY < height*1/3)) {
      if (turn) {
        squares[2] = 1;
      } else {
        squares[2] = 5;
      }
      println(squares[2]);
    } else if ((mouseX > 0) && (mouseX < width*1/3) && (mouseY > height*1/3) && (mouseY < height*2/3)) {
      if (turn) {
        squares[3] = 1;
      } else {
        squares[3] = 5;
      }
      println(squares[3]);
    } else if ((mouseX > width*1/3) && (mouseX < width*2/3) && (mouseY > height*1/3) && (mouseY < height*2/3)) {
      if (turn) {
        squares[4] = 1;
      } else {
        squares[4] = 5;
      }
      println(squares[4]);
    } else if ((mouseX > width*2/3) && (mouseX < width) && (mouseY > height*1/3) && (mouseY < height*2/3)) {
      if (turn) {
        squares[5] = 1;
      } else {
        squares[5] = 5;
      }
      println(squares[5]);
    }
    if ((mouseX > 0) && (mouseX < width*1/3) && (mouseY > height*2/3) && (mouseY < height)) {
      if (turn) {
        squares[6] = 1;
      } else {
        squares[6] = 5;
      }
      println(squares[6]);
    }
    if ((mouseX > width*1/3) && (mouseX < width*2/3) && (mouseY > height*2/3) && (mouseY < height)) {
      if (turn) {
        squares[7] = 1;
      } else {
        squares[7] = 5;
      }
      println(squares[7]);
    }
    if ((mouseX > width*2/3) && (mouseX < width) && (mouseY > height*2/3) && (mouseY < height)) {
      if (turn) {
        squares[8] = 1;
      } else {
        squares[8] = 5;
      }
      println(squares[8]);
    }
  }

  void winCondition() {
    
    
    // Vandret række 1
    if (squares[0] + squares[1] + squares[2] == 3) {
      cross = true;
    } else if (squares[0] + squares[1] + squares[2] == 15) {
      circle = true;
    }
    // Vandret række 2
    if (squares[3] + squares[4] + squares[5] == 3) {
      cross = true;
    } else if (squares[3] + squares[4] + squares[5] == 15) {
      circle = true;
    }
    // Vandret række 3
    if (squares[6] + squares[7] + squares[8] == 3) {
      cross = true;
    } else if (squares[6] + squares[7] + squares[8] == 15) {
      circle = true;
    }
    // Lodret række 1
    if (squares[0] + squares[3] + squares[6] == 3) {
      cross = true;
    } else if (squares[0] + squares[3] + squares[6] == 15) {
      circle = true;
    }
    // Lodret række 2
    if (squares[1] + squares[4] + squares[7] == 3) {
      cross = true;
    } else if (squares[1] + squares[4] + squares[7] == 15) {
      circle = true;
    }
    // Lodret række 3
    if (squares[2] + squares[5] + squares[8] == 3) {
      cross = true;
    } else if (squares[2] + squares[5] + squares[8] == 15) {
      circle = true;
    }
    // Skrå række 1
    if (squares[0] + squares[4] + squares[8] == 3) {
      cross = true;
    } else if (squares[0] + squares[4] + squares[8] == 15) {
      circle = true;
    }
    // Skrå række 2
    if (squares[2] + squares[4] + squares[6] == 3) {
      cross = true;
    } else if (squares[2] + squares[4] + squares[6] == 15) {
      circle = true;
    }
    
    
    if((cross) || (circle)){
      gameState = "win";
      
      if (cross){
        won = "Cross";
      } else if (circle ) {
        won = "Circle";
      }
    }
    
    if(g == 9){
      won = "Tied";
      gameState = "win";
      
    }
  }
}
