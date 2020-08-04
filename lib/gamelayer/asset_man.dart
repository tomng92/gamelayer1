part of gamelayer;

/**
 * Load images, for use later. They are accessed via the [cache] map.
 * 
 * From badAliens, thanh aug 26 2013.
 */
class AssetManager {
  int successCount = 0;
  int errorCount = 0;
  Map<String, ImageElement> cache = {};// Element instead of ImageElement ?
  List downloadQueue = [];

  void queueDownload(String path) {
    downloadQueue.add(path);
  }

  /**
   * Load all images and invokes [downloadCallback] once finished.
   */
  void downloadAll(downloadCallback) {
    if (downloadQueue.length == 0) {
      downloadCallback();
    }

    for (final path in downloadQueue) {
      var img = new ImageElement();
      
      img.onLoad.listen((event) {
        print('Asset ${img.src} is loaded');
        successCount += 1;
        if (isDone()) {
            downloadCallback();
        }
      });
      
      img.onError.listen((event) {
        errorCount += 1;
        if (isDone()) {
            downloadCallback();
        }
      });
      
      img.src = path;
      cache[path] = img;
    }
  }

  /**
   * Return the image via its path (eg. 'img/explosion.png').
   */
 ImageElement getAsset(path) {
    return cache[path];
  }

  bool isDone() {
    return (downloadQueue.length == successCount + errorCount);
  }

}
