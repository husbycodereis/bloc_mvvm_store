// ignore_for_file: implementation_imports

import 'package:bloc_mvvm_hwa/feature/home/model/product_model.dart';
import 'package:bloc_mvvm_hwa/product/padding/page_padding.dart';
import 'package:bloc_mvvm_hwa/product/utility/image/product_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? model;
  const ProductCard({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model != null) const SizedBox.shrink();
    return Padding(
      padding: const PagePadding.all(),
      child: Card(
        child: ListTile(
          contentPadding: const PagePadding.all(),
          title: ProjectNetworkImage.network(src: model?.image),
          subtitle: Text(
            model.toString(),
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
