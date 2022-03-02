import 'package:bloc_mvvm_hwa/product/constant/application_constant.dart';
import 'package:vexana/vexana.dart';

class ProductNetworkManager extends NetworkManager {
  ProductNetworkManager() : super(options: BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl));
}
