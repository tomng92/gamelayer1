
part of gamelayer;

class LayerCircle extends GameLayer {

  int radius;
  
  LayerCircle(id, canvas, borderColor) : super(id, canvas, borderColor) {
      
    /** Called once per game logic frame. */
    this.onUpdate = onUpdateImpl;
    
    this.onRender = onRenderImpl;
  }
  
  /**
   * onUpdate.
   */
  void onUpdateImpl(GameLoop game) {
    //onUpdateBase(game);
  }
  
  
  /**
   * onRender
   */
  void onRenderImpl(GameLoop game) {

    onRenderBase(game); // this draws the background.
    
    ctx.beginPath();
    ctx.arc(10, 20, radius, 0, Math.PI*2, true);
    ctx.lineWidth = 15;

    // line color
    ctx.strokeStyle = 'dotted';
    ctx.stroke();

    ctx.closePath();
    ctx.setFillColorRgb(244, 0, 88, 10);
    ctx.fill(); 
  }


}