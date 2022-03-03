import 'package:bloc_mvvm_hwa/feature/home/model/product_model.dart';
import 'package:bloc_mvvm_hwa/feature/home/service/IHomeService.dart';
import 'package:bloc_mvvm_hwa/product/query/product_query.dart';
import 'package:vexana/vexana.dart';

enum _HomeServicePath { products, categories }

class HomeService extends IHomeService {
  HomeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> fetchAllProducts({int count = 5}) async {
    final response = await networkManager.send<ProductModel, List<ProductModel>>(_HomeServicePath.products.name,
        parseModel: ProductModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([ProductQueries.limit.toMapEntry('$count')]));

    return response.data;
  }

  @override
  Future<List<String>?> fetchAllCategories() async {
    final response =
        await networkManager.sendPrimitive('${_HomeServicePath.products.name}/${_HomeServicePath.categories.name}');
    return response is List ? response.map((e) => e.toString()).toList() : null;
  }
}
