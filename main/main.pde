Board board;

void setup() {
  size(400, 400);
  
  board = new Board();
}

void draw() {
  background(255);
  println(board.cross, board.circle);
  board.display();
  board.winCondition();
  
}

void mouseClicked(){

    board.input();
    board.turn = !board.turn;
    
    
    
  }
