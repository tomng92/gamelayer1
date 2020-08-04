part of gamelayer;


/**
 * Abstract class representing a game layer.
 * I could have used GameLoop itself, but for the moment it carries too many stuff I do not need.
 * 
 * GameLayer is a canvas with some size.
 * 
 * thanh sept 2, 2013 
 */

abstract class GameLayer {
  String id;
  String bgColor;
  CanvasElement canvas;
  
  bool ready; // ready after all assets loaded.
  int posX;
  int posY;
  int rot;
  int incX = 1, incY = 1;
  
  CanvasRenderingContext2D get ctx => canvas.context2D;
  
  GameLayer(this.id, this.canvas, this.bgColor);
  
  /** Called once per game logic frame. */
  GameLoopUpdateFunction onUpdate;
  GameLoopRenderFunction onRender;
  
  toString() => "'$id'[${canvas.width}X${canvas.height}]";
  
  /**
   * onRender.
   */
  void onRenderBase(GameLoop game) {
    if (bgColor != null) {
      ctx.rect(0, 0, this.canvas.width, this.canvas.height);
      ctx.fillStyle = bgColor;
      ctx.fill();
    }
  }
  
  /**
   * onUpdateBaseStart and End() to sandwich.
   */
  void onUpdateBase(GameLoop game) {
    incX = (incX < 0 ? incX-1: incX+1);
    incY = (incY < 0 ? incY-1: incY+1);
     
    incX = incX*2 ~/ 3;// temper down movement
    incY = incY*2 ~/ 3;

    
    if (posX + incX > (game as MainLayer).canvas.width || posX + incX < 0) {
      var random = new Math.Random();
      incX = random.nextBool() ? 1:-1;     
    }
    
    if (posY + incY > (game as MainLayer).canvas.height || posY + incY < 0) {
      var random = new Math.Random();
      incY = random.nextBool() ? 1:-1;     
    }
    

    // We want to translate then
    posX = (posX + incX);
    posY = (posY + incY);
    
    //print(posX.toString() + "x" + posY.toString());
  }

}