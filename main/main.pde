Board board;

  int g;

String gameState = "game";

void setup() {
  size(400, 400);

  board = new Board();
  
  float r = random(1);
  
  if(r < 0.5){
    board.turn = false;
  } else {
    board.turn = true;
  }
}

void draw() {


  switch(gameState) {
  case "game":
    background(255);
    println(board.cross, board.circle);
    board.display();
    board.winCondition();
    break;
  case "win":
    background(255);
    fill(200, 50, 50);
    textSize(60);
    
    if(keyPressed){
      if(keyCode == UP ) {
        for(int i = 0; i < 9; i++){
          board.squares[i] = 0;
        }
        g = 0;
        board.circle = false;
        board.cross = false;
        
        gameState = "game";
        keyPressed = false;        
      }
    }
    
    
      text(board.won+" wins", 50, 200);
    break;
  }
}

void mouseClicked() {

  board.input();
  board.turn = !board.turn;
  g++;
}
