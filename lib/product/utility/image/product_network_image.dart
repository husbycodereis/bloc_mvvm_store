import 'package:bloc_mvvm_hwa/product/constant/application_constant.dart';
import 'package:flutter/material.dart';

class ProjectNetworkImage extends Image {
  //ProjectNetworkImage.network(String? src) : super.network(src ?? dummyImage);
  ProjectNetworkImage.network({Key? key, String? src})
      : super.network(src ?? ApplicationConstant.instance.dummyImage, key: key);
}
