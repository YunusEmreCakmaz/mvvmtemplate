class ImageConstants {
  static ImageConstants _instance = ImageConstants._init();
  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get logo => toPng('Emre');
  String get hotDog => toPng('hotdogs');

  String toPng(String name) => 'assets/image/$name.png';
}
