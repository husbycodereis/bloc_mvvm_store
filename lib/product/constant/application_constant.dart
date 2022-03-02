class ApplicationConstant {
  static ApplicationConstant? _instance;
  static ApplicationConstant get instance {
    return _instance ??= ApplicationConstant.init();
  }

  ApplicationConstant.init();
  final String baseUrl = 'https://fakestoreapi.com/';
  final String dummyImage = 'https://picsum.photos/200/300';
}

double kZero = 0;
double kOne = 1;
