class ImageConstants {
  static ImageConstants _instance = ImageConstants._init();
  static ImageConstants get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get logo => toPng("Emre");

  String toPng(String name) => "assets/image/$name";
}
