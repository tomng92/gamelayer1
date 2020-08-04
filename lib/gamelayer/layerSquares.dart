
part of gamelayer;

class LayerSquare extends GameLayer {
  
  int width;
  int height;

  LayerSquare(id, canvas, bgColor) : super(id, canvas, bgColor) {
    
   
    /** Called once per game logic frame. */
    this.onUpdate = onUpdateImpl;    
    this.onRender = onRenderImpl; 
  }
  
  /**
   * onUpdate.
   */
  void onUpdateImpl(GameLoop game) {
    //onUpdateBase(game); thanh was here
  }
  
  
  void onRenderImpl(GameLoop _) {
    
    onRenderBase(_);
    
    ctx.beginPath();
    ctx.rect(44, 66, width, height);
    ctx.fillStyle = 'yellow';
    ctx.fill();
    ctx.lineWidth = 7;
    ctx.strokeStyle = 'black';
    ctx.stroke();
  }

}