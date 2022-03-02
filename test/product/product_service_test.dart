import 'package:bloc_mvvm_hwa/feature/home/service/IHomeService.dart';
import 'package:bloc_mvvm_hwa/feature/home/service/home_service.dart';
import 'package:bloc_mvvm_hwa/product/network/product_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IHomeService homeService;
  setUp(() {
    homeService = HomeService(ProductNetworkManager());
  });
  test('fetchAllProducts test five elements ', () async {
    final response = await homeService.fetchAllProducts();

    expect(response!.length, 5);
  });
  test('fetchAllProducts all categories ', () async {
    final response = await homeService.fetchAllCategories();

    expect(response, isNotEmpty);
  });
}
