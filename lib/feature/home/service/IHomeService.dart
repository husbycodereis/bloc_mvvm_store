// ignore_for_file: file_names

import 'package:bloc_mvvm_hwa/feature/home/model/product_model.dart';
import 'package:vexana/vexana.dart';

abstract class IHomeService {
  final INetworkManager networkManager;

  IHomeService(this.networkManager);

  Future<List<ProductModel>?> fetchAllProducts({int count = 5});
  Future<List<String>?> fetchAllCategories();
}
