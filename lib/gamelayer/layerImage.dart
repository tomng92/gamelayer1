
part of gamelayer;

class LayerImage extends GameLayer {
 
  int width;
  int height;

  LayerImage(id, canvas, bgColor) : super(id, canvas, bgColor) {
    
   
    /** Called once per game logic frame. */
    this.onUpdate = onUpdateImpl;    
    this.onRender = onRenderImpl; 
  }
  
  /**
   * onUpdate.
   */
  void onUpdateImpl(GameLoop game) {
    onUpdateBase(game);
  }
  
  /**
   * onRenderImpl
   * .
   */
  void onRenderImpl(GameLoop game) {
    
    onRenderBase(game);
    
    ctx.beginPath();
    ctx.rect(44, 66, width, height);
    ctx.fillStyle = 'yellow';
    ctx.fill();
    ctx.lineWidth = 7;
    ctx.strokeStyle = 'black';
    ctx.stroke();
  }

}