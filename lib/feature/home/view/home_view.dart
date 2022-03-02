import 'package:bloc_mvvm_hwa/feature/home/cubit/home_cubit.dart';
import 'package:bloc_mvvm_hwa/feature/home/service/home_service.dart';
import 'package:bloc_mvvm_hwa/product/constant/application_constant.dart';
import 'package:bloc_mvvm_hwa/product/network/product_network_manager.dart';
import 'package:bloc_mvvm_hwa/product/widget/loading_center.dart';
import 'package:bloc_mvvm_hwa/product/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeService(ProductNetworkManager())),
      child: Scaffold(
          appBar: AppBar(
            leading: DropdownButton(items: const [
              DropdownMenuItem<String>(
                child: Text('data'),
                value: '',
              )
            ], onChanged: (value) {}),
            actions: [_loadingCenter()],
          ),
          body: buildListView()),
    );
  }

  Widget buildListView() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.items?.length ?? kZero.toInt(),
            itemBuilder: (context, index) {
              return ProductCard(model: state.items?[index]);
            });
      },
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? kOne : kZero,
          duration: context.durationLow,
          child: const LoadingCenter(),
        );
      },
    );
  }
}
