part of gamelayer;

/**
 * The manager of gameLayers.
 * Contains the main canvas on which the layers will be drawn.
 *
 *   +-----------------------------------------+
 *    |                                         |
 *    |     +------------------+                |
 *    |     |                  |                | A MainLayer contains GameLayers.
 *    |     |                  |--------+       |
 *    |     |                  |        |       |
 *    |     |                  |        |       |  
 *    |     +------------------+        |       |
 *    |                |                |       |
 *    |                +----------------+       |
 *    |                                         |
 *    | +------------------------------------+  |
 *    | |                                    |  |
 *    | +------------------------------------+  |
 *    +-----------------------------------------+
 *    
 * MainLayer contains GameLayer's. It is a GameLoop, whereas the layers are GameLayer's.
 * When it updates, it invoke onUpdate() or all layers. The same for onRender.
 * LayerMan [element] is the mainCanvas. Layers have their canvas too, but is a subcanvas (think of this as offscreen canvas).
 * 
 * thanh 4 sept 2013.
 */
class MainLayer extends GameLoopHtml {
  
  final List<GameLayer> layers = new List<GameLayer>();
  CanvasElement get canvas => this.element as CanvasElement;
  
  /**
   * Ctor.
   * [element] is the main canvas on which the layers will be drawn.
   */
  MainLayer(element) : super(element) {
    this.pointerLock.lockOnClick = false;// https://github.com/johnmccutchan/game_loop/issues/28
    this.onUpdate = onUpdateImpl;
    this.onRender = onRenderImpl;
    
    this.onPointerLockChange = myOnPointerLockChange;
  }
  
  
  void myOnPointerLockChange(GameLoop gameLoop) {
    GameLoopHtml gameh = gameLoop;
    
    print("yinvoked: " + gameh.pointerLock.locked.toString());
    if (gameh.pointerLock.locked) {
      gameh.pointerLock.requestUnlock();
    }
 }
  
  /**
   * onUpdate.
   */
  void onUpdateImpl(GameLoop game) {
    
    for (GameLayer layer in layers) {
      
      //print('${game.frame}: ${game.gameTime} [dt = ${game.dt}].');
      layer.onUpdate(game);
    }
  }
  
  /**
   * onRender.
   */
  void onRenderImpl(GameLoop game) {
    canvas.context2D.clearRect(0, 0, canvas.width, canvas.height);
        
    for (GameLayer layer in layers) {
      layer.onRender(game);
      canvas.context2D.drawImage(layer.canvas, layer.posX, layer.posY);
    }
  }
  
  toString() => "LayerMan[${canvas.width}X${canvas.height}]";
  
}